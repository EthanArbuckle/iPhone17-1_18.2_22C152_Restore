@interface HMHomeManager
+ (BOOL)dataSyncInProgressFromDataSyncState:(unint64_t)a3;
+ (id)instanceTracker;
+ (id)logCategory;
+ (id)sharedEventStore;
+ (void)fetchSetupModeWithCompletion:(id)a3;
- (BOOL)_isValidCachedHomeConfiguration:(id)a3;
- (BOOL)_shouldWeMergeLatestHomeGraphFromDaemonResponse:(id)a3;
- (BOOL)accessoryInfoDataProvider:(id)a3 transformHomeUUID:(id)a4 accessoryUUID:(id)a5 toClientHomeIdentifier:(id *)a6 clientAccessoryIdentifier:(id *)a7;
- (BOOL)accessorySettingsDataSource:(id)a3 transformHomeUUID:(id)a4 accessoryUUID:(id)a5 toClientHomeIdentifier:(id *)a6 clientAccessoryIdentifier:(id *)a7;
- (BOOL)accessorySettingsDataSource:(id)a3 transformHomeUUID:(id)a4 mediaSystemUUID:(id)a5 toClientHomeIdentifier:(id *)a6 clientMediaSystemIdentifier:(id *)a7;
- (BOOL)deviceUnlockedSinceBootForUserActionPredictionProvider:(id)a3;
- (BOOL)hasOptedToHH2;
- (BOOL)homeSafetySecurityEnabled;
- (BOOL)isAccessAllowedWhenLocked;
- (BOOL)isDaemonRunningWithROARFramework;
- (BOOL)isDataSyncInProgress;
- (BOOL)isHH2MigrationAvailable;
- (BOOL)isHH2MigrationInProgress;
- (BOOL)isHomeRemovedPermanently:(id)a3;
- (BOOL)isInitialMergeComplete;
- (BOOL)isResidentEnabledForThisDevice;
- (BOOL)isThisDeviceResidentCapable;
- (BOOL)isViewServiceActive;
- (BOOL)isiPhoneOnlyPairingSupportedForMatterAccessories;
- (BOOL)needsOSUpdateToRunHH2;
- (BOOL)removeAllHomeKitPairingIdentities;
- (BOOL)shouldConnect;
- (HMAccessory)currentAccessory;
- (HMAccessorySettingsMetricsDispatcher)accessorySettingsMetricsDispatcher;
- (HMAccessorySetupCoordinator)accessorySetupCoordinator;
- (HMApplicationData)applicationData;
- (HMCacheManager)cacheManager;
- (HMCameraClipsQuotaMessenger)cameraClipsQuotaMessenger;
- (HMCoreAnalyticsMetricEventDispatcher)coreAnalyticsMetricEventDispatcher;
- (HMDarwinNotificationProvider)darwinNotificationProvider;
- (HMELastEventStore)lastEventStore;
- (HMHome)currentHome;
- (HMHome)primaryHome;
- (HMHomeManager)init;
- (HMHomeManager)initWithConfiguration:(id)a3;
- (HMHomeManager)initWithOptions:(unint64_t)a3;
- (HMHomeManager)initWithUUID:(id)a3 configuration:(id)a4 context:(id)a5 xpcEventRouterClient:(id)a6 lastEventStore:(id)a7 timerFactory:(id)a8 darwinNotificationProvider:(id)a9 privacySettingsProvider:(id)a10;
- (HMHomeManagerAuthorizationStatus)authorizationStatus;
- (HMHomeManagerConfiguration)configuration;
- (HMMigrationBoost)migrationBoost;
- (HMMutableArray)currentHomes;
- (HMMutableArray)homeInvitations;
- (HMNetworkRouterFirewallRuleManager)firewallRuleManager;
- (HMSoftwareUpdateDocumentationManager)softwareUpdateDocumentationManager;
- (HMUserActionPredictionProvider)predictionProvider;
- (HMUserCloudShareManager)userCloudShareManager;
- (HMWidgetManager)widgetManager;
- (HMXPCEventRouterClient)xpcEventRouterClient;
- (NSArray)homes;
- (NSArray)incomingHomeInvitations;
- (NSArray)sharedHomeUUIDsNotYetMigrated;
- (NSError)hh2MigrationFailedError;
- (NSOperationQueue)syncOperationQueue;
- (NSString)homeCacheDir;
- (NSString)homeDataCache;
- (NSString)metadataCache;
- (NSUUID)lastRemovedCurrentAccessoryUUID;
- (NSUUID)uuid;
- (_HMContext)context;
- (_HMPrivacySettingsProvider)privacySettingsProvider;
- (double)homeManagerCreationTimeStamp;
- (id)_beginActiveAssertionWithReason:(id)a3;
- (id)_homeWithUUID:(id)a3;
- (id)_loadHH2MigrationInfoFromHMCache:(id)a3;
- (id)_privateDelegate;
- (id)_refreshBeforeDate:(id)a3 completionHandler:(id)a4;
- (id)accessoryInfoDataProvider:(id)a3 homeWithHomeIdentifier:(id)a4;
- (id)accessorySettingsController:(id)a3 homeWithHomeIdentifier:(id)a4;
- (id)accessorySettingsDataSource:(id)a3 homeWithHomeIdentifier:(id)a4;
- (id)allPairingIdentitiesInRankOrderWithError:(id *)a3;
- (id)createAccessoryInfoDataProvider;
- (id)createAccessorySettingsController;
- (id)createAccessorySettingsDataSource;
- (id)createAccessorySettingsMessengerWithHomeUUID:(id)a3;
- (id)createAccessorySettingsMetricsDispatcherWithCoreAnalyticsMetricDispatcher:(id)a3;
- (id)createCoreAnalyticsMetricEventDispatcher;
- (id)createMultiuserSettingsMessenger;
- (id)delegate;
- (id)eventRouter;
- (id)homeWithUniqueIdentifier:(id)a3;
- (id)logIdentifier;
- (id)shareManager:(id)a3 homeWithUUID:(id)a4;
- (id)timerFactory;
- (int)serverGenerationCounterDelayedConnectionToken;
- (int)serverGenerationCounterToken;
- (int64_t)multiUserStatus;
- (unint64_t)_dataSyncStateFromPayload:(id)a3;
- (unint64_t)dataSyncState;
- (unint64_t)generationCounter;
- (unint64_t)generationCounterPostHomeGraphUpdate;
- (unint64_t)metadataVersion;
- (unint64_t)options;
- (unint64_t)residentProvisioningStatus;
- (unint64_t)serverGenerationCounter;
- (unint64_t)status;
- (void)__handleHomeManagerState:(id)a3;
- (void)__preconfigure;
- (void)__processSyncResponse:(id)a3 refreshRequested:(BOOL)a4 completionHandler:(id)a5;
- (void)__removeAccountWithHandle:(id)a3 completionHandler:(id)a4;
- (void)__removeAccountWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)__resolveAccountHandle:(id)a3 completionHandler:(id)a4;
- (void)__start;
- (void)_acceptInvitation:(id)a3 completionHandler:(id)a4;
- (void)_acceptInvitation:(id)a3 presenceAuthStatus:(unint64_t)a4 completionHandler:(id)a5;
- (void)_addKeysToRepairListIfUnique:(id)a3 includePrivateKeys:(BOOL)a4 repairList:(id)a5;
- (void)_declineInvitation:(id)a3 completionHandler:(id)a4;
- (void)_determineCacheFiles;
- (void)_dumpCaches:(id)a3 metadata:(id)a4;
- (void)_endActiveAssertion:(id)a3;
- (void)_fetchHomeConfigurationWithRefreshRequested:(BOOL)a3;
- (void)_forceBatchNotificationsEnd;
- (void)_handleAccessAllowedWhenLockedUpdatedNotification:(id)a3;
- (void)_handleCurrentHomeChangedNotification:(id)a3;
- (void)_handleDevicesUpdatedMessage:(id)a3;
- (void)_handleHH2ManualMigrationEnabledStateWithPayload:(id)a3;
- (void)_handleHH2MigrationProgressStateWithPayload:(id)a3;
- (void)_handleHH2StateWithPayload:(id)a3;
- (void)_handleHomeSafetySecurityEnabledStateWithPayload:(id)a3;
- (void)_handleHomesDidUpdateNotification:(id)a3;
- (void)_handleMetadataUpdatedNotification:(id)a3;
- (void)_handleQueryHomeKitUsageStateResponse:(id)a3 completionHandler:(id)a4;
- (void)_handleResidentDeviceCapableUpdatedNotification:(id)a3;
- (void)_handleResidentEnabledForThisDeviceUpdatedNotification:(id)a3;
- (void)_handleResidentProvisioningStatusChanged:(id)a3;
- (void)_handleRuntimeStateUpdateNotification:(id)a3;
- (void)_handleRuntimeStateUpdatePayload:(id)a3 reason:(id)a4;
- (void)_handleSetupModeMessageResponse:(id)a3 error:(id)a4;
- (void)_handleStatusUpdated:(id)a3;
- (void)_handleUserInvitationsUpdatedNotification:(id)a3;
- (void)_ignoreInvitation:(id)a3 completionHandler:(id)a4;
- (void)_mergeCurrentHomesWithNewHomes:(id)a3 newPrimaryHome:(id)a4 newCurrentHome:(id)a5 newInvitations:(id)a6 newAppData:(id)a7 refreshRequested:(BOOL)a8;
- (void)_mergeHomeInvitations:(id)a3;
- (void)_mergeNewAppData:(id)a3;
- (void)_notifyAccessAllowedWhenLockedUpdated:(BOOL)a3;
- (void)_notifyDelegateOfAppDataUpdate;
- (void)_pingDeviceWithUUID:(id)a3 monitor:(BOOL)a4 secure:(BOOL)a5 restrictToLocalNetwork:(BOOL)a6 completionHandler:(id)a7;
- (void)_processHomeAddedPayload:(id)a3 completionHandler:(id)a4;
- (void)_processHomeConfigurationResponse:(id)a3 refreshRequested:(BOOL)a4;
- (void)_recomputeAssistantIdentifiers;
- (void)_registerNotificationHandlers;
- (void)_removeCacheFileAtPath:(id)a3;
- (void)_removeCacheFiles;
- (void)_reportJunkInvitation:(id)a3 completionHandler:(id)a4;
- (void)_requestRefresh;
- (void)_requestRuntimeUpdate:(id)a3;
- (void)_saveMigrationProgressToHMCache:(BOOL)a3 error:(id)a4;
- (void)_setInitialHomes:(id)a3;
- (void)_setResidentProvisioningStatus:(unint64_t)a3;
- (void)_setShouldConnectToDaemon;
- (void)_testHH2MigrationWithCompletionHandler:(id)a3 payload:(id)a4;
- (void)_updateAppData:(id)a3;
- (void)_updateCurrentHome:(id)a3;
- (void)_updateDataSyncState:(id)a3;
- (void)_updateInvitation:(id)a3 presenceAuthStatus:(unint64_t)a4 invitationState:(int64_t)a5 invitationOptions:(int64_t)a6 completionHandler:(id)a7;
- (void)_updatePrimaryHome:(id)a3 notifyDelegate:(BOOL)a4;
- (void)_updateStatusWithPayload:(id)a3;
- (void)_updateStatusWithPayload:(id)a3 sourceIsFetch:(BOOL)a4;
- (void)_upgradeToHH2WithCompletionHandler:(id)a3 payload:(id)a4;
- (void)_writeCaches:(id)a3 homeData:(BOOL)a4 metadata:(BOOL)a5;
- (void)addAndSetupAccessoriesWithPayload:(id)a3 completionHandler:(id)a4;
- (void)addEphemeralContainerWithName:(id)a3 completion:(id)a4;
- (void)addHomeWithName:(NSString *)homeName completionHandler:(void *)completion;
- (void)attemptHH2AutoMigrationWithCompletionHandler:(id)a3;
- (void)checkAndLogMultipleInstanceWarning;
- (void)checkIsUsingProductionObjectModelWithCompletion:(id)a3;
- (void)checkName:(id)a3 inHome:(id)a4 withValidationOptions:(unint64_t)a5 completionHandler:(id)a6;
- (void)clearMobileAssetsLocalInfoWithCompletion:(id)a3;
- (void)configureAccessorySettingsMetricsDispatcherWithFactory:(id)a3;
- (void)configureCoreAnalyticsMetricEventDispatcherWithFactory:(id)a3;
- (void)createAutoAddWalletKeySupressionAssertionWithIncomingInvitation:(id)a3 completion:(id)a4;
- (void)currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:(id)a3 completionHandler:(id)a4;
- (void)deactivateEphemeralContainerWithName:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteCountersBeforeDate:(id)a3 afterDate:(id)a4 completion:(id)a5;
- (void)deleteDatabaseEntityWithModelID:(id)a3 completion:(id)a4;
- (void)deleteEphemeralContainerWithName:(id)a3 completion:(id)a4;
- (void)dumpCloudDatabase:(BOOL)a3 localDatabase:(BOOL)a4 workingDatabase:(BOOL)a5 fakeCloudModels:(BOOL)a6 completion:(id)a7;
- (void)dumpState:(id)a3 payload:(id)a4 completion:(id)a5;
- (void)enableUARPPacketCapture:(BOOL)a3 capturePath:(id)a4 completionHandler:(id)a5;
- (void)eraseHomeDataAndDeleteMetadata:(BOOL)a3 completionHandler:(id)a4;
- (void)eraseHomeDataWithCompletionHandler:(id)a3;
- (void)fetchAllPairingIdentitiesForRepairFlowWithCompletionHandler:(id)a3;
- (void)fetchAppleMediaAccesoryDiagnosticInfo:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)fetchCachedWiFiInfosForHomesWithCompletionHandler:(id)a3;
- (void)fetchDevicesWithCompletionHandler:(id)a3;
- (void)fetchDiagnosticInfoWithCompletionHandler:(id)a3;
- (void)fetchEventCounters:(id)a3;
- (void)fetchNetworkMismatchInfoWithCompletionHandler:(id)a3;
- (void)fetchWiFiInfosForHomesWithTimeout:(double)a3 partialResultHandler:(id)a4 completion:(id)a5;
- (void)generateFirewallRuleTLVsFromNetworkDeclarations:(id)a3 completionHandler:(id)a4;
- (void)handleDaemonReconnectedNotification:(id)a3;
- (void)handleInstanceCreated;
- (void)handleInstanceDestroyed;
- (void)launchHomeUIServiceToResumeSetupWithUserInfo:(id)a3 completionHandler:(id)a4;
- (void)listEphemeralContainersWithCompletion:(id)a3;
- (void)notifyDelegateOfBatchNotificationsEndWithReason:(id)a3;
- (void)notifyDelegateOfBatchNotificationsStartWithReason:(id)a3;
- (void)notifyResidentCapableUpdated:(BOOL)a3;
- (void)notifyResidentEnabledUpdated:(BOOL)a3;
- (void)pairingIdentityForAccessoryWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)prepareForDiagnosticExtensionWithCompletion:(id)a3;
- (void)presentTTRDialog:(id)a3 completionHandler:(id)a4;
- (void)queryHomeKitUsageStateWithCompletionHandler:(id)a3;
- (void)queryMetadata:(id)a3 completionHandler:(id)a4;
- (void)queryVersionWithCompletionHandler:(id)a3;
- (void)queryiCloudSwitchStateWithCompletionHandler:(id)a3;
- (void)readCountersForGroup:(id)a3 homeUUIDString:(id)a4 accessoryUUIDString:(id)a5 counter:(id)a6 statistics:(id)a7 datePartition:(id)a8 ephemeralContainerName:(id)a9 completion:(id)a10;
- (void)removeHome:(HMHome *)home completionHandler:(void *)completion;
- (void)requestLogEventDailySchedulerStatusWithCompletion:(id)a3;
- (void)resetConfiguration:(BOOL)a3 withoutPopup:(BOOL)a4 completionHandler:(id)a5;
- (void)resetEventCounters:(id)a3;
- (void)resetLastTTRTimeWithCompletionHandler:(id)a3;
- (void)saveCountersWithCompletion:(id)a3;
- (void)sendSetupModeMessage:(unint64_t)a3;
- (void)setAccessAllowedWhenLocked:(BOOL)a3;
- (void)setAccessorySettingsMetricsDispatcher:(id)a3;
- (void)setApplicationData:(id)a3;
- (void)setCacheManager:(id)a3;
- (void)setCoreAnalyticsMetricEventDispatcher:(id)a3;
- (void)setCurrentHome:(id)a3;
- (void)setDaemonRunningWithROARFramework:(BOOL)a3;
- (void)setDataSyncState:(unint64_t)a3;
- (void)setDelegate:(id)delegate;
- (void)setGenerationCounter:(unint64_t)a3;
- (void)setGenerationCounterPostHomeGraphUpdate:(unint64_t)a3;
- (void)setHasOptedToHH2:(BOOL)a3;
- (void)setHh2MigrationFailedError:(id)a3;
- (void)setHh2MigrationInProgress:(BOOL)a3;
- (void)setHomeDataCache:(id)a3;
- (void)setHomeInvitations:(id)a3;
- (void)setHomeManagerCreationTimeStamp:(double)a3;
- (void)setHomeSafetySecurityEnabled:(BOOL)a3;
- (void)setInitialMergeComplete:(BOOL)a3;
- (void)setIsHH2MigrationAvailable:(BOOL)a3;
- (void)setMetadata:(id)a3 completionHandler:(id)a4;
- (void)setMetadataCache:(id)a3;
- (void)setMetadataVersion:(unint64_t)a3;
- (void)setMigrationBoost:(id)a3;
- (void)setMultiUserStatus:(int64_t)a3;
- (void)setPredictionProvider:(id)a3;
- (void)setPrimaryHome:(id)a3;
- (void)setResidentEnabledForThisDevice:(BOOL)a3;
- (void)setResidentProvisioningStatus:(unint64_t)a3;
- (void)setServerGenerationCounterDelayedConnectionToken:(int)a3;
- (void)setServerGenerationCounterToken:(int)a3;
- (void)setSetupMode:(unint64_t)a3 completion:(id)a4;
- (void)setSharedHomeUUIDsNotYetMigrated:(id)a3;
- (void)setShouldConnect:(BOOL)a3;
- (void)setSoftwareUpdateDocumentationManager:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setThisDeviceResidentCapable:(BOOL)a3;
- (void)setViewServiceActive:(BOOL)a3;
- (void)setXpcEventRouterClient:(id)a3;
- (void)startupEphemeralContainerWithName:(id)a3 completion:(id)a4;
- (void)submitLogEventDailySchedulerRegisteredBlocksWithCompletion:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateAccessAllowedWhenLocked:(BOOL)a3 completionHandler:(id)a4;
- (void)updateApplicationData:(id)a3 completionHandler:(id)a4;
- (void)updateMobileAssetsAndForce:(BOOL)a3 completion:(id)a4;
- (void)updatePrimaryHome:(HMHome *)home completionHandler:(void *)completion;
- (void)updateResidentEnabledForThisDevice:(BOOL)a3 completionHandler:(id)a4;
- (void)updateiCloudSwitchState:(BOOL)a3 completionHandler:(id)a4;
- (void)upgradeToROARWithCompletionHandler:(id)a3;
@end

@implementation HMHomeManager

uint64_t __50__HMHomeManager_InstanceTracking__instanceTracker__block_invoke()
{
  instanceTracker_instanceTracker = [MEMORY[0x1E4F28D30] weakObjectsHashTable];

  return MEMORY[0x1F41817F8]();
}

- (id)logIdentifier
{
  v2 = [(HMHomeManager *)self context];
  v3 = [v2 xpcClient];
  v4 = [v3 UUID];
  v5 = [v4 UUIDString];

  return v5;
}

- (_HMContext)context
{
  return self->_context;
}

- (id)_homeWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HMHomeManager *)self currentHomes];
  v6 = [v5 firstItemWithUUID:v4];

  return v6;
}

- (NSArray)homes
{
  v2 = [(HMHomeManager *)self currentHomes];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMMutableArray)currentHomes
{
  return self->_currentHomes;
}

- (void)notifyDelegateOfBatchNotificationsEndWithReason:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSCountedSet *)self->_batchNotificationReasons removeObject:v4];
  if ([(NSCountedSet *)self->_batchNotificationReasons count]
    || (batchNotificationEndTimer = self->_batchNotificationEndTimer) == 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    [(HMFTimer *)batchNotificationEndTimer suspend];
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x19F3A64A0]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling batch notification end: %@", buf, 0x16u);
    }
    v10 = [(HMHomeManager *)v7 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(HMHomeManager *)v7 delegate];
      if ([v12 conformsToProtocol:&unk_1EEF6FE30]) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      id v14 = v13;

      v15 = [(HMHomeManager *)v7 context];
      v16 = [v15 delegateCaller];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __65__HMHomeManager_notifyDelegateOfBatchNotificationsEndWithReason___block_invoke;
      v18[3] = &unk_1E5945628;
      id v19 = v14;
      v20 = v7;
      id v17 = v14;
      [v16 invokeBlock:v18];
    }
  }
}

- (void)notifyDelegateOfBatchNotificationsStartWithReason:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMHomeManager *)self context];
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(NSCountedSet *)self->_batchNotificationReasons count];
  [(NSCountedSet *)self->_batchNotificationReasons addObject:v4];
  if (v6)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    batchNotificationEndTimer = self->_batchNotificationEndTimer;
    if (!batchNotificationEndTimer)
    {
      v8 = [(HMHomeManager *)self timerFactory];
      v8[2](v8, 8, 10.0);
      v9 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
      v10 = self->_batchNotificationEndTimer;
      self->_batchNotificationEndTimer = v9;

      [(HMFTimer *)self->_batchNotificationEndTimer setDelegate:self];
      char v11 = self->_batchNotificationEndTimer;
      v12 = [v5 queue];
      [(HMFTimer *)v11 setDelegateQueue:v12];

      batchNotificationEndTimer = self->_batchNotificationEndTimer;
    }
    [(HMFTimer *)batchNotificationEndTimer resume];
    os_unfair_lock_unlock(&self->_lock);
    v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v16;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Calling batch notification start: %@", buf, 0x16u);
    }
    id v17 = [(HMHomeManager *)v14 delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v19 = [(HMHomeManager *)v14 delegate];
      if ([v19 conformsToProtocol:&unk_1EEF6FE30]) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
      id v21 = v20;

      v22 = [(HMHomeManager *)v14 context];
      __int16 v23 = [v22 delegateCaller];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __67__HMHomeManager_notifyDelegateOfBatchNotificationsStartWithReason___block_invoke;
      v25[3] = &unk_1E5945628;
      id v26 = v21;
      v27 = v14;
      id v24 = v21;
      [v23 invokeBlock:v25];
    }
  }
}

- (void)_updateCurrentHome:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMHomeManager *)self _homeWithUUID:v4];
  [(HMHomeManager *)self setCurrentHome:v5];

  uint64_t v6 = [(HMHomeManager *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    v7 = (void *)MEMORY[0x19F3A64A0]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      char v11 = [(HMHomeManager *)v8 currentHome];
      *(_DWORD *)buf = 138543618;
      char v18 = v10;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated current home: %@", buf, 0x16u);
    }
    v12 = [(HMHomeManager *)v8 context];
    v13 = [v12 delegateCaller];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__HMHomeManager__updateCurrentHome___block_invoke;
    v14[3] = &unk_1E5945628;
    id v15 = v6;
    v16 = v8;
    [v13 invokeBlock:v14];
  }
}

- (id)_privateDelegate
{
  v2 = [(HMHomeManager *)self delegate];
  if ([v2 conformsToProtocol:&unk_1EEF6FE30]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return WeakRetained;
}

- (void)setCurrentHome:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_currentHome, a3);
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v6 = (void *)MEMORY[0x19F3A64A0]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = 138543874;
    char v11 = v9;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2048;
    id v15 = v7;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Set current home to: %@ with self: %p", (uint8_t *)&v10, 0x20u);
  }
}

- (HMHome)currentHome
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_currentHome;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_requestRuntimeUpdate:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHomeManager *)self context];
  if (v4)
  {
    v20 = @"options";
    v21[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  v9 = [(HMHomeManager *)self uuid];
  int v10 = (void *)[v8 initWithTarget:v9];
  char v11 = (void *)[v7 initWithName:@"HMHM.rtsur" destination:v10 payload:v6];

  __int16 v12 = NSString;
  id v13 = [v11 name];
  __int16 v14 = [v11 identifier];
  id v15 = [v12 stringWithFormat:@"HomeManager-%@%@", v13, v14];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__HMHomeManager__requestRuntimeUpdate___block_invoke;
  v18[3] = &unk_1E59455E8;
  void v18[4] = self;
  id v19 = v15;
  id v16 = v15;
  [v11 setResponseHandler:v18];
  id v17 = [v5 messageDispatcher];
  [v17 sendMessage:v11];
}

- (void)_handleRuntimeStateUpdatePayload:(id)a3 reason:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  char v18 = objc_msgSend(@"HomeManager-", "stringByAppendingString:");
  -[HMHomeManager notifyDelegateOfBatchNotificationsStartWithReason:](self, "notifyDelegateOfBatchNotificationsStartWithReason:");
  [(HMHomeManager *)self __handleHomeManagerState:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [v6 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
        __int16 v14 = [(HMHomeManager *)self _homeWithUUID:v13];
        uint64_t v15 = objc_msgSend(v6, "hmf_dictionaryForKey:", v12);
        id v16 = (void *)v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17) {
          [v14 handleRuntimeStateUpdate:v15 reason:v19];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  [(HMHomeManager *)self notifyDelegateOfBatchNotificationsEndWithReason:v18];
}

- (HMAccessory)currentAccessory
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v2 = [(HMHomeManager *)self homes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v8 = objc_msgSend(v7, "accessories", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v16 + 1) + 8 * j);
              if ([v13 isCurrentAccessory])
              {
                id v14 = v13;

                goto LABEL_19;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
      id v14 = 0;
    }
    while (v4);
  }
  else
  {
    id v14 = 0;
  }
LABEL_19:

  return (HMAccessory *)v14;
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 256, 1);
}

uint64_t __29__HMHomeManager_setDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManagerDidUpdateHomes:*(void *)(a1 + 40)];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t306 != -1) {
    dispatch_once(&logCategory__hmf_once_t306, &__block_literal_global_790);
  }
  v2 = (void *)logCategory__hmf_once_v307;

  return v2;
}

- (void)_setShouldConnectToDaemon
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (![(HMHomeManager *)self shouldConnect])
  {
    [(HMHomeManager *)self setShouldConnect:1];
    uint64_t v4 = [(HMHomeManager *)self darwinNotificationProvider];
    objc_msgSend(v4, "notifyCancel:", -[HMHomeManager serverGenerationCounterDelayedConnectionToken](self, "serverGenerationCounterDelayedConnectionToken"));

    [(HMHomeManager *)self setServerGenerationCounterDelayedConnectionToken:0xFFFFFFFFLL];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)fetchDevicesWithCompletionHandler:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager fetchDevicesWithCompletionHandler:]", @"completionHandler"];
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v27;
      __int16 v35 = 2112;
      uint64_t v36 = v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  uint64_t v5 = v4;
  id v6 = [(HMHomeManager *)self context];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetching devices"];
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v12 = [v7 identifier];
    id v13 = [v12 shortDescription];
    *(_DWORD *)buf = 138543618;
    v34 = v11;
    __int16 v35 = 2114;
    uint64_t v36 = (uint64_t)v13;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching devices", buf, 0x16u);
  }
  id v14 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  long long v16 = [(HMHomeManager *)v9 uuid];
  long long v17 = (void *)[v15 initWithTarget:v16];
  long long v18 = (void *)[v14 initWithName:@"HMHM.fetchDevices" destination:v17 payload:0];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __51__HMHomeManager_fetchDevicesWithCompletionHandler___block_invoke;
  v29[3] = &unk_1E59441B0;
  v29[4] = v9;
  id v30 = v7;
  id v31 = v6;
  id v32 = v5;
  id v19 = v5;
  id v20 = v6;
  id v21 = v7;
  [v18 setResponseHandler:v29];
  long long v22 = [v20 messageDispatcher];
  [v22 sendMessage:v18];
}

uint64_t __67__HMHomeManager_notifyDelegateOfBatchNotificationsStartWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManagerWillStartBatchNotifications:*(void *)(a1 + 40)];
}

uint64_t __65__HMHomeManager_notifyDelegateOfBatchNotificationsEndWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManagerDidEndBatchNotifications:*(void *)(a1 + 40)];
}

uint64_t __36__HMHomeManager__updateCurrentHome___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManagerDidUpdateCurrentHome:*(void *)(a1 + 40)];
}

uint64_t __32__HMHomeManager__updateAppData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfAppDataUpdate];
}

void __33__HMHomeManager_sharedEventStore__block_invoke()
{
  v0 = NSString;
  v1 = HMCreateFrameworkCacheDirectory();
  id v4 = [v0 stringWithFormat:@"%@/%@", v1, @"EventRouterLastEventStoreCache"];

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F69F50]) initWithFileName:v4];
  uint64_t v3 = (void *)sharedEventStore_eventStore;
  sharedEventStore_eventStore = v2;
}

id __39__HMHomeManager_initWithConfiguration___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a3 options:a1];

  return v3;
}

- (BOOL)deviceUnlockedSinceBootForUserActionPredictionProvider:(id)a3
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (id)_loadHH2MigrationInfoFromHMCache:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHomeManager *)self cacheManager];

  id v6 = 0;
  if (v4 && v5)
  {
    id v7 = [(HMHomeManager *)self cacheManager];
    uint64_t v8 = [v7 cacheWithName:@"HMHM.HH2MigrationCacheName"];

    uint64_t v9 = [v8 numberForKey:@"HMHM.HH2MigrationGenCounterValue"];
    if (v9)
    {
      if ([v4 isEqual:v9])
      {
        id v6 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v10 = [v8 numberForKey:@"HMHM.HH2MigrationInProgress"];
        [v6 setObject:v10 forKeyedSubscript:@"HMHM.HH2MigrationInProgress"];

        uint64_t v11 = [v8 dataForKey:@"HMHM.HH2MigrationFailedError"];
        if (v11)
        {
          id v23 = 0;
          uint64_t v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v23];
          id v13 = v23;
          if (!v12)
          {
            context = (void *)MEMORY[0x19F3A64A0]();
            id v14 = self;
            id v15 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              id v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v25 = v21;
              __int16 v26 = 2112;
              id v27 = v13;
              _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive HH2 migration error from the stored cache. : %@", buf, 0x16u);
            }
          }
          [v6 setObject:v12 forKeyedSubscript:@"HMHM.HH2MigrationFailedError"];
        }
        long long v16 = (void *)MEMORY[0x19F3A64A0]();
        long long v17 = self;
        long long v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v25 = v19;
          __int16 v26 = 2112;
          id v27 = v6;
          _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@HH2 Migration Status: %@", buf, 0x16u);
        }

        goto LABEL_16;
      }
      [v8 removeObjectForKey:@"HMHM.HH2MigrationInProgress"];
      [v8 removeObjectForKey:@"HMHM.HH2MigrationFailedError"];
      [v8 removeObjectForKey:@"HMHM.HH2MigrationGenCounterValue"];
      [v8 removeObjectForKey:@"HMHM.HH2MigrationCacheName"];
    }
    id v6 = 0;
LABEL_16:
  }

  return v6;
}

- (HMCacheManager)cacheManager
{
  return (HMCacheManager *)objc_getProperty(self, a2, 360, 1);
}

- (BOOL)_isValidCachedHomeConfiguration:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_isValidCachedHomeConfiguration__onceToken != -1) {
    dispatch_once(&_isValidCachedHomeConfiguration__onceToken, &__block_literal_global_669);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = (id)_isValidCachedHomeConfiguration__requiredKeys;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v4, "objectForKey:", v10, (void)v24);

        if (!v11)
        {
          id v15 = (void *)MEMORY[0x19F3A64A0]();
          long long v16 = self;
          long long v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            long long v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v29 = v18;
            __int16 v30 = 2112;
            uint64_t v31 = v10;
            _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Cached home configuration does not contain required key '%@' - discarding cache", buf, 0x16u);
          }

          goto LABEL_16;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = objc_msgSend(v4, "hmf_dataForKey:", @"kHomeDataKey");
  uint64_t v13 = [v12 length];

  if (v13)
  {
    BOOL v14 = 1;
  }
  else
  {
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v29 = v23;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Cached home configuration contains zero length Home Data - discarding cache", buf, 0xCu);
    }
LABEL_16:
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_determineCacheFiles
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMHomeManager *)self homeCacheDir];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v5 = [(HMHomeManager *)self homeCacheDir];
    char v6 = [v4 fileExistsAtPath:v5];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v8 = [(HMHomeManager *)self homeCacheDir];
      id v79 = 0;
      char v9 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v79];
      id v10 = v79;

      if ((v9 & 1) == 0)
      {
        v61 = (void *)MEMORY[0x19F3A64A0]();
        v62 = self;
        v63 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v64 = HMFGetLogIdentifier();
          v65 = [(HMHomeManager *)v62 homeCacheDir];
          *(_DWORD *)buf = 138543874;
          v81 = v64;
          __int16 v82 = 2112;
          v83 = v65;
          __int16 v84 = 2112;
          uint64_t v85 = (uint64_t)v10;
          _os_log_impl(&dword_19D1A8000, v63, OS_LOG_TYPE_ERROR, "%{public}@Unable to create directory %@: %@", buf, 0x20u);
        }
LABEL_43:

        return;
      }
    }
    uint64_t v11 = [(HMHomeManager *)self homeCacheDir];
    id v78 = 0;
    uint64_t v12 = [v4 contentsOfDirectoryAtPath:v11 error:&v78];
    id v10 = v78;

    if (v12)
    {
      id v67 = v10;
      v68 = v4;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v66 = v12;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v74 objects:v88 count:16];
      if (!v14) {
        goto LABEL_35;
      }
      uint64_t v15 = v14;
      long long v16 = self;
      uint64_t v17 = *(void *)v75;
      v72 = self;
      id v73 = v13;
      while (1)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v75 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          id v20 = [v19 componentsSeparatedByString:@"."];
          id v21 = [v20 lastObject];
          int v22 = [v21 isEqualToString:@"config"];

          if (v22)
          {
            id v23 = [v20 firstObject];
            int v24 = [v23 isEqualToString:@"homeData"];

            if (v24)
            {
              if ((unint64_t)[v20 count] < 4) {
                goto LABEL_33;
              }
              long long v25 = [v20 objectAtIndexedSubscript:2];
              long long v26 = NSString;
              long long v27 = [(HMHomeManager *)v16 configuration];
              uint64_t v28 = objc_msgSend(v26, "stringWithFormat:", @"%lu", objc_msgSend(v27, "options"));
              int v29 = [v25 isEqualToString:v28];

              if (v29)
              {
                __int16 v30 = [v20 objectAtIndexedSubscript:1];
                uint64_t v31 = [v30 integerValue];
                id v32 = [(HMHomeManager *)v16 homeCacheDir];
                uint64_t v33 = [v32 stringByAppendingPathComponent:v19];
                if (v31 == 5)
                {
                  [(HMHomeManager *)v16 setHomeDataCache:v33];

                  v34 = (void *)MEMORY[0x19F3A64A0]();
                  __int16 v35 = v16;
                  uint64_t v36 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v37 = HMFGetLogIdentifier();
                    [(HMHomeManager *)v35 homeDataCache];
                    v38 = contextb = v34;
                    *(_DWORD *)buf = 138543618;
                    v81 = v37;
                    __int16 v82 = 2112;
                    v83 = v38;
                    _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Determined home data cache file: %@", buf, 0x16u);

                    v34 = contextb;
                    long long v16 = v72;
                  }
                }
                else
                {

                  context = (void *)MEMORY[0x19F3A64A0]();
                  v50 = v16;
                  v51 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                  {
                    v52 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138544130;
                    v81 = v52;
                    __int16 v82 = 2112;
                    v83 = v30;
                    __int16 v84 = 2048;
                    uint64_t v85 = 5;
                    __int16 v86 = 2112;
                    v87 = v33;
                    _os_log_impl(&dword_19D1A8000, v51, OS_LOG_TYPE_INFO, "%{public}@Removing home data cache file with version %@ not equal to current version %ld: %@", buf, 0x2Au);

                    long long v16 = v72;
                  }

                  [(HMHomeManager *)v50 _removeCacheFileAtPath:v33];
                }
              }
              goto LABEL_32;
            }
            v39 = [v20 firstObject];
            int v40 = [v39 isEqualToString:@"metadata"];

            if (v40 && (unint64_t)[v20 count] >= 3)
            {
              long long v25 = [v20 objectAtIndexedSubscript:1];
              v41 = v16;
              uint64_t v42 = [v25 integerValue];
              v43 = [(HMHomeManager *)v41 homeCacheDir];
              v44 = [v43 stringByAppendingPathComponent:v19];
              if (v42 == 5)
              {
                [(HMHomeManager *)v41 setMetadataCache:v44];

                v45 = (void *)MEMORY[0x19F3A64A0]();
                v46 = v41;
                v47 = HMFGetOSLogHandle();
                long long v16 = v41;
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                {
                  v48 = HMFGetLogIdentifier();
                  v49 = [(HMHomeManager *)v46 metadataCache];
                  *(_DWORD *)buf = 138543618;
                  v81 = v48;
                  __int16 v82 = 2112;
                  v83 = v49;
                  _os_log_impl(&dword_19D1A8000, v47, OS_LOG_TYPE_DEBUG, "%{public}@Determined metadata cache file: %@", buf, 0x16u);

                  long long v16 = v72;
                }
              }
              else
              {

                contexta = (void *)MEMORY[0x19F3A64A0]();
                v53 = v41;
                v54 = HMFGetOSLogHandle();
                long long v16 = v41;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  v55 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138544130;
                  v81 = v55;
                  __int16 v82 = 2112;
                  v83 = v25;
                  __int16 v84 = 2048;
                  uint64_t v85 = 5;
                  __int16 v86 = 2112;
                  v87 = v44;
                  _os_log_impl(&dword_19D1A8000, v54, OS_LOG_TYPE_INFO, "%{public}@Removing metadata cache file with version %@ not equal to current version %ld: %@", buf, 0x2Au);

                  long long v16 = v72;
                }

                [(HMHomeManager *)v53 _removeCacheFileAtPath:v44];
              }
LABEL_32:
              id v13 = v73;
            }
          }
LABEL_33:
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v74 objects:v88 count:16];
        if (!v15)
        {
LABEL_35:

          id v10 = v67;
          id v4 = v68;
          uint64_t v12 = v66;
          goto LABEL_39;
        }
      }
    }
    v56 = (void *)MEMORY[0x19F3A64A0]();
    v57 = self;
    v58 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      v59 = HMFGetLogIdentifier();
      v60 = [(HMHomeManager *)v57 homeCacheDir];
      *(_DWORD *)buf = 138543874;
      v81 = v59;
      __int16 v82 = 2112;
      v83 = v60;
      __int16 v84 = 2112;
      uint64_t v85 = (uint64_t)v10;
      _os_log_impl(&dword_19D1A8000, v58, OS_LOG_TYPE_ERROR, "%{public}@Failed to enumerate the contents of cache directory %@: %@", buf, 0x20u);
    }
LABEL_39:

    goto LABEL_43;
  }
}

- (NSString)homeCacheDir
{
  uint64_t v2 = [(HMHomeManager *)self configuration];
  uint64_t v3 = [v2 cacheURL];
  id v4 = [v3 path];

  return (NSString *)v4;
}

- (void)setMetadataCache:(id)a3
{
}

- (void)setHomeDataCache:(id)a3
{
}

- (HMHomeManager)initWithOptions:(unint64_t)a3
{
  id v4 = [[HMHomeManagerConfiguration alloc] initWithOptions:a3 cachePolicy:0];
  id v5 = [(HMHomeManager *)self initWithConfiguration:v4];

  return v5;
}

- (HMHomeManager)initWithConfiguration:(id)a3
{
  v42[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  char v6 = [[HMDelegateCaller alloc] initWithQueue:0];
  uint64_t v7 = [v4 delegateQueue];
  uint64_t v8 = [MEMORY[0x1E4F28F08] mainQueue];
  char v9 = [v7 isEqual:v8];

  v39 = v7;
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = +[HMDelegateCaller delegateCallerWithOperationQueue:v7];

    char v6 = (HMDelegateCaller *)v10;
  }
  uint64_t v11 = [(HMXPCMessageTransportConfiguration *)[HMMutableXPCMessageTransportConfiguration alloc] initWithMachServiceName:@"com.apple.homed.xpc"];
  v38 = self;
  HMDispatchQueueNameString(self, 0);
  id v12 = objc_claimAutoreleasedReturnValue();
  id v13 = (const char *)[v12 UTF8String];
  uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
  [(HMXPCMessageTransportConfiguration *)v11 setQueue:v15];

  v41[0] = @"HMPrincipalClassKey";
  long long v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = NSStringFromClass(v16);
  v42[0] = v17;
  v41[1] = @"inactiveUpdatingLevel";
  long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "inactiveUpdatingLevel"));
  v42[1] = v18;
  v41[2] = @"options";
  id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "options"));
  v42[2] = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];

  uint64_t v37 = v11;
  id v21 = [[HMXPCClient alloc] initWithConfiguration:v11 userInfo:v20];
  int v40 = v6;
  int v22 = [[_HMContext alloc] initWithXPCClient:v21 delegateCaller:v6];
  if (HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken != -1) {
    dispatch_once(&HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken, &__block_literal_global_149);
  }
  if (HMIsCurrentProcessSPIEntitled_spiEntitled)
  {
    if (![v4 canUseCache]) {
      goto LABEL_11;
    }
    if (HMIsCurrentProcessAnExtension_onceToken != -1) {
      dispatch_once(&HMIsCurrentProcessAnExtension_onceToken, &__block_literal_global_162);
    }
    if (HMIsCurrentProcessAnExtension_isCurrentProcessAnExtension
      || ([MEMORY[0x1E4F28B50] mainBundle],
          id v23 = objc_claimAutoreleasedReturnValue(),
          [v23 bundleIdentifier],
          int v24 = objc_claimAutoreleasedReturnValue(),
          char v25 = [v24 isEqualToString:@"com.apple.AssistantServices"],
          v24,
          v23,
          (v25 & 1) != 0))
    {
LABEL_11:
      long long v26 = (void *)[objc_alloc(MEMORY[0x1E4F69F50]) initInMemoryStore];
      char v27 = 0;
    }
    else
    {
      long long v26 = +[HMHomeManager sharedEventStore];
      char v27 = 1;
    }
    uint64_t v28 = [HMXPCEventRouterClient alloc];
    int v29 = [(_HMContext *)v22 queue];
    __int16 v30 = [(_HMContext *)v22 messageDispatcher];
    LOBYTE(v36) = v27;
    uint64_t v31 = [(HMXPCEventRouterClient *)v28 initWithMessageTargetUUID:v5 queue:v29 messageDispatcher:v30 changeRegistrationsMessageName:@"hm.evt.reg.change" updateMessageName:@"hm.evt.updates" storeReadHandle:v26 storeWriteHandle:v26 useBackgroundTaskAssertion:v36];
  }
  else
  {
    long long v26 = 0;
    uint64_t v31 = 0;
  }
  id v32 = objc_alloc_init(HMDarwinNotificationProvider);
  uint64_t v33 = objc_alloc_init(_HMPrivacySettingsProvider);
  v34 = [(HMHomeManager *)v38 initWithUUID:v5 configuration:v4 context:v22 xpcEventRouterClient:v31 lastEventStore:v26 timerFactory:&__block_literal_global_31145 darwinNotificationProvider:v32 privacySettingsProvider:v33];

  return v34;
}

- (unint64_t)options
{
  uint64_t v2 = [(HMHomeManager *)self configuration];
  unint64_t v3 = [v2 options];

  return v3;
}

- (HMHomeManagerConfiguration)configuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(HMHomeManagerConfiguration *)self->_configuration copy];
  os_unfair_lock_unlock(p_lock);

  return (HMHomeManagerConfiguration *)v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMHomeManager)initWithUUID:(id)a3 configuration:(id)a4 context:(id)a5 xpcEventRouterClient:(id)a6 lastEventStore:(id)a7 timerFactory:(id)a8 darwinNotificationProvider:(id)a9 privacySettingsProvider:(id)a10
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v17 = a4;
  id v81 = a5;
  id v79 = a6;
  id v75 = a7;
  id v78 = a7;
  id v18 = a8;
  id v19 = a9;
  id v77 = a10;
  [MEMORY[0x1E4F65510] setClassMappingForNSCoder];
  id v20 = objc_alloc(MEMORY[0x1E4F653F0]);
  id v21 = MEMORY[0x19F3A5D00](self, a2);
  int v22 = (void *)[v20 initWithName:v21];

  v84.receiver = self;
  v84.super_class = (Class)HMHomeManager;
  id v23 = [(HMHomeManager *)&v84 init];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    char v25 = (void *)*((void *)v23 + 20);
    *((void *)v23 + 20) = v24;

    v23[81] = [v17 shouldConnect];
    *(void *)(v23 + 84) = -1;
    long long v26 = (id *)(v23 + 320);
    objc_storeStrong((id *)v23 + 40, a5);
    objc_storeStrong((id *)v23 + 31, a9);
    char v27 = _Block_copy(v18);
    uint64_t v28 = (void *)*((void *)v23 + 32);
    *((void *)v23 + 32) = v27;

    objc_storeStrong((id *)v23 + 27, a10);
    id v73 = v18;
    if (initializeMappingsAndPaths_pred != -1) {
      dispatch_once(&initializeMappingsAndPaths_pred, &__block_literal_global_24447);
    }
    objc_storeStrong((id *)v23 + 39, a3);
    uint64_t v29 = +[HMMutableArray array];
    __int16 v30 = (void *)*((void *)v23 + 37);
    *((void *)v23 + 37) = v29;

    *((void *)v23 + 41) = -1;
    *((void *)v23 + 42) = -1;
    *((_WORD *)v23 + 37) = 0;
    v23[76] = 0;
    *((void *)v23 + 43) = 0;
    uint64_t v31 = +[HMMutableArray array];
    id v32 = (void *)*((void *)v23 + 28);
    *((void *)v23 + 28) = v31;

    v23[82] = 0;
    *(_OWORD *)(v23 + 136) = xmmword_19D47B910;
    id v33 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v34 = (void *)*((void *)v23 + 38);
    *((void *)v23 + 38) = v33;

    [*((id *)v23 + 38) setMaxConcurrentOperationCount:1];
    __int16 v35 = objc_alloc_init(HMApplicationData);
    uint64_t v36 = (void *)*((void *)v23 + 16);
    *((void *)v23 + 16) = v35;

    uint64_t v37 = [[HMNetworkRouterFirewallRuleManager alloc] initWithHomeManager:v23];
    v38 = (void *)*((void *)v23 + 48);
    *((void *)v23 + 48) = v37;

    v39 = [[HMUserCloudShareManager alloc] initWithDataSource:v23];
    int v40 = (void *)*((void *)v23 + 49);
    *((void *)v23 + 49) = v39;

    v41 = objc_alloc_init(HMAccessorySetupCoordinator);
    uint64_t v42 = (void *)*((void *)v23 + 50);
    *((void *)v23 + 50) = v41;

    uint64_t v43 = [MEMORY[0x1E4F28BD0] set];
    v44 = (void *)*((void *)v23 + 5);
    *((void *)v23 + 5) = v43;

    *((void *)v23 + 22) = 0;
    objc_storeStrong((id *)v23 + 33, a6);
    objc_storeStrong((id *)v23 + 8, v75);
    v45 = [HMSoftwareUpdateDocumentationManager alloc];
    v46 = [v23 context];
    uint64_t v47 = [(HMSoftwareUpdateDocumentationManager *)v45 initWithContext:v46];
    v48 = (void *)*((void *)v23 + 47);
    *((void *)v23 + 47) = v47;

    v49 = [[HMWidgetManager alloc] initWithHomeManager:v23 context:v81];
    v50 = (void *)*((void *)v23 + 51);
    *((void *)v23 + 51) = v49;

    if (([v17 canUseCache] & 1) != 0 || objc_msgSend(v17, "canWriteToCache"))
    {
      uint64_t v51 = +[HMFrameworkCacheManager sharedInstance];
      v52 = (void *)*((void *)v23 + 45);
      *((void *)v23 + 45) = v51;
    }
    if (([v17 options] & 0x4000) != 0)
    {
      v53 = [[HMUserActionPredictionDuetDataSource alloc] initWithCacheManager:*((void *)v23 + 45)];
      v54 = [HMUserActionPredictionProvider alloc];
      [*((id *)v23 + 40) queue];
      v55 = id v76 = v17;
      [*((id *)v23 + 40) messageDispatcher];
      v56 = v22;
      v58 = id v57 = v19;
      v59 = objc_alloc_init(HMUserActionPredictionTransformer);
      v60 = [v23 darwinNotificationProvider];
      uint64_t v61 = [(HMUserActionPredictionProvider *)v54 initWithWorkQueue:v55 messageDispatcher:v58 UUID:v80 dataSource:v23 duetDataSource:v53 predictionTransformer:v59 darwinNotificationProvider:v60];
      v62 = (void *)*((void *)v23 + 46);
      *((void *)v23 + 46) = v61;

      id v19 = v57;
      int v22 = v56;
      long long v26 = (id *)(v23 + 320);

      id v17 = v76;
    }
    [v23 handleInstanceCreated];
    objc_msgSend(v23, "__preconfigure");
    if ([*((id *)v23 + 20) isDiscretionary])
    {
      id v63 = v17;
      v64 = (void *)MEMORY[0x19F3A64A0]();
      v65 = v23;
      v66 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v67 = v22;
        v69 = id v68 = v19;
        *(_DWORD *)buf = 138543362;
        __int16 v86 = v69;
        _os_log_impl(&dword_19D1A8000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@Deferring starting for discretionary client", buf, 0xCu);

        id v19 = v68;
        int v22 = v67;
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __152__HMHomeManager_initWithUUID_configuration_context_xpcEventRouterClient_lastEventStore_timerFactory_darwinNotificationProvider_privacySettingsProvider___block_invoke;
      block[3] = &unk_1E59452E8;
      v83 = v65;
      dispatch_block_t v70 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
      v71 = [*v26 queue];
      dispatch_async(v71, v70);

      id v18 = v73;
      id v17 = v63;
    }
    else
    {
      objc_msgSend(v23, "__start");
    }
  }
  [v22 invalidate];

  return (HMHomeManager *)v23;
}

- (void)handleInstanceCreated
{
  if (isInternalBuild())
  {
    os_unfair_lock_lock_with_options();
    unint64_t v3 = [(id)objc_opt_class() instanceTracker];
    [v3 addObject:self];

    id v4 = [MEMORY[0x1E4F1C9C8] now];
    [v4 timeIntervalSince1970];
    -[HMHomeManager setHomeManagerCreationTimeStamp:](self, "setHomeManagerCreationTimeStamp:");

    os_unfair_lock_unlock((os_unfair_lock_t)&instanceTrackerLock);
    [(HMHomeManager *)self checkAndLogMultipleInstanceWarning];
  }
}

- (void)checkAndLogMultipleInstanceWarning
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (isInternalBuild())
  {
    os_unfair_lock_lock_with_options();
    uint64_t v28 = self;
    unint64_t v3 = [(id)objc_opt_class() instanceTracker];
    unint64_t v4 = [v3 count];

    if (v4 >= 2)
    {
      id v32 = (void *)[@"Having multiple HMHomeManager instances will increase your memory usage and possibly jetsam your process. Please use 1 HMHomeManager if possible. Current home managers:\n" mutableCopy];
      uint64_t v31 = (void *)[@"Multiple HMHomeManager instances:" mutableCopy];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v5 = [(id)objc_opt_class() instanceTracker];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v6)
      {
        obuint64_t j = v5;
        uint64_t v30 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v34 != v30) {
              objc_enumerationMutation(obj);
            }
            uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            char v9 = [v8 context];
            uint64_t v10 = [v9 xpcClient];
            uint64_t v11 = [v10 UUID];
            id v12 = NSNumber;
            [v8 homeManagerCreationTimeStamp];
            id v13 = objc_msgSend(v12, "numberWithDouble:");
            uint64_t v14 = [v8 configuration];
            dispatch_queue_t v15 = HMHomeManagerOptionsToString([v14 options]);
            [v32 appendFormat:@"[%@/%@/%@]\n", v11, v13, v15];

            long long v16 = [v8 configuration];
            uint64_t v17 = [v16 options];
            id v18 = NSNumber;
            [v8 homeManagerCreationTimeStamp];
            id v19 = objc_msgSend(v18, "numberWithDouble:");
            objc_msgSend(v31, "appendFormat:", @"[o:0x%lx,t:%ld]", v17, objc_msgSend(v19, "longValue"));
          }
          id v5 = obj;
          uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v6);
      }

      id v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = v28;
      HMFGetOSLogHandle();
      int v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v38 = v23;
        __int16 v39 = 2112;
        int v40 = v32;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@%@", buf, 0x16u);
      }
      uint64_t v24 = (void *)MEMORY[0x19F3A64A0]();
      char v25 = v21;
      HMFGetOSLogHandle();
      long long v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        char v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v38 = v27;
        __int16 v39 = 2112;
        int v40 = v31;
        _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&instanceTrackerLock);
  }
}

+ (id)instanceTracker
{
  if (instanceTracker_onceToken != -1) {
    dispatch_once(&instanceTracker_onceToken, &__block_literal_global_59419);
  }
  uint64_t v2 = (void *)instanceTracker_instanceTracker;

  return v2;
}

- (void)setHomeManagerCreationTimeStamp:(double)a3
{
  self->_homeManagerCreationTimeStamp = a3;
}

- (void)__preconfigure
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  unint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Pre-configuring home manager", (uint8_t *)&v7, 0xCu);
  }
  [(HMHomeManager *)v4 configureCoreAnalyticsMetricEventDispatcherWithFactory:v4];
  [(HMHomeManager *)v4 configureAccessorySettingsMetricsDispatcherWithFactory:v4];
}

- (void)configureCoreAnalyticsMetricEventDispatcherWithFactory:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring core analytics metric event dispatcher", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = [v4 createCoreAnalyticsMetricEventDispatcher];
  [(HMHomeManager *)v6 setCoreAnalyticsMetricEventDispatcher:v9];
}

- (id)createCoreAnalyticsMetricEventDispatcher
{
  uint64_t v2 = objc_alloc_init(HMCoreAnalyticsMetricEventDispatcher);

  return v2;
}

- (void)configureAccessorySettingsMetricsDispatcherWithFactory:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring accessory settings metrics dispatcher", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v9 = [(HMHomeManager *)v6 coreAnalyticsMetricEventDispatcher];
  if (!v9) {
    _HMFPreconditionFailure();
  }
  int v10 = (void *)v9;
  uint64_t v11 = [v4 createAccessorySettingsMetricsDispatcherWithCoreAnalyticsMetricDispatcher:v9];
  [(HMHomeManager *)v6 setAccessorySettingsMetricsDispatcher:v11];
}

- (id)createAccessorySettingsMetricsDispatcherWithCoreAnalyticsMetricDispatcher:(id)a3
{
  id v3 = a3;
  id v4 = [[HMAccessorySettingsMetricsDispatcher alloc] initWithCoreAnalyticsMetricDispatcher:v3];

  return v4;
}

- (void)setCoreAnalyticsMetricEventDispatcher:(id)a3
{
}

- (void)setAccessorySettingsMetricsDispatcher:(id)a3
{
}

- (HMCoreAnalyticsMetricEventDispatcher)coreAnalyticsMetricEventDispatcher
{
  return (HMCoreAnalyticsMetricEventDispatcher *)objc_getProperty(self, a2, 280, 1);
}

+ (id)sharedEventStore
{
  if (sharedEventStore_onceToken != -1) {
    dispatch_once(&sharedEventStore_onceToken, &__block_literal_global_436);
  }
  uint64_t v2 = (void *)sharedEventStore_eventStore;

  return v2;
}

- (HMApplicationData)applicationData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMSoftwareUpdateDocumentationManager)softwareUpdateDocumentationManager
{
  return self->_softwareUpdateDocumentationManager;
}

void __74__HMHomeManager___processSyncResponse_refreshRequested_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", @"kProvisioningStatusKey");
  id v3 = (void *)v2;
  id v4 = &unk_1EEF07F50;
  if (v2) {
    id v4 = (void *)v2;
  }
  id v5 = v4;

  objc_msgSend(*(id *)(a1 + 40), "_setResidentProvisioningStatus:", objc_msgSend(v5, "integerValue"));
  int v6 = objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", @"kCanCacheHomeConfigurationKey");
  int v7 = objc_msgSend(*(id *)(a1 + 32), "hmf_dataForKey:", @"kHomeDataKey");

  if (v7) {
    int v8 = v6;
  }
  else {
    int v8 = 0;
  }
  int v9 = objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", @"kCanCacheHomeConfigurationKey");
  if (([*(id *)(a1 + 40) options] & 0x9701) != 0)
  {
    int v10 = [*(id *)(a1 + 32) valueForKey:@"kHAPMetadataDataKey"];
    if (v10) {
      int v11 = v9;
    }
    else {
      int v11 = 0;
    }
  }
  else
  {
    int v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v15 = HMFGetLogIdentifier();
      long long v16 = HMHomeManagerOptionsToString([*(id *)(a1 + 40) options]);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      uint64_t v30 = v16;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Client has not requested access to HAP accessories (options %@) - not going to write synced metadata to cache", buf, 0x16u);
    }
    int v11 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", @"runtime-update"))
  {
    uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", @"options");
    [*(id *)(a1 + 40) _requestRuntimeUpdate:v17];
  }
  if ((v8 | v11) == 1)
  {
    id v18 = [*(id *)(a1 + 48) queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__HMHomeManager___processSyncResponse_refreshRequested_completionHandler___block_invoke_627;
    block[3] = &unk_1E5941F18;
    int8x16_t v22 = *(int8x16_t *)(a1 + 32);
    id v19 = (id)v22.i64[0];
    int8x16_t v24 = vextq_s8(v22, v22, 8uLL);
    char v25 = v8;
    char v26 = v11;
    dispatch_async(v18, block);
  }
  id v20 = (void *)MEMORY[0x19F3A64A0]();
  [*(id *)(a1 + 40) _processHomeConfigurationResponse:*(void *)(a1 + 32) refreshRequested:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v21 = *(void *)(a1 + 56);
  if (v21) {
    (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
  }
}

- (void)_processHomeConfigurationResponse:(id)a3 refreshRequested:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v195 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v128 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Process home configuration"];
  v131 = v6;
  v135 = objc_msgSend(v6, "hmf_numberForKey:", @"kConfigGenerationCounterKey");
  objc_msgSend(v6, "hmf_numberForKey:", @"kHAPMetadataVersionKey");
  v130 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v6, "hmf_dataForKey:", @"kIdentifierSaltKey");
  if (v135) {
    BOOL v7 = v130 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  char v9 = !v7 && v129 != 0;
  int v10 = (void *)MEMORY[0x19F3A64A0]();
  v136 = self;
  int v11 = HMFGetOSLogHandle();
  int v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v135;
      *(_WORD *)&buf[22] = 2112;
      v193 = v130;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Processing home configuration response with generation counter: %@ metadata version: %@", buf, 0x20u);
    }
    [(HMHomeManager *)v136 _handleHH2StateWithPayload:v131];
    [(HMHomeManager *)v136 _handleHH2ManualMigrationEnabledStateWithPayload:v131];
    [(HMHomeManager *)v136 _handleHomeSafetySecurityEnabledStateWithPayload:v131];
    [(HMHomeManager *)v136 _handleHH2MigrationProgressStateWithPayload:v131];
    objc_msgSend(MEMORY[0x1E4F29128], "hm_setIdentifierSalt:", v129);
    v127 = objc_msgSend(v131, "hmf_dataForKey:", @"HMHM.assistantIdentifier");
    if (v127 && objc_msgSend(MEMORY[0x1E4F29128], "hm_setAssistantIdentifierSalt:", v127))
    {
      uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
      dispatch_queue_t v15 = v136;
      long long v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v127;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Assistant identifier salt changed to %@", buf, 0x16u);
      }
      [(HMHomeManager *)v15 _recomputeAssistantIdentifiers];
    }
    if (([(HMHomeManager *)v136 options] & 0x9701) != 0)
    {
      unint64_t v18 = [v130 unsignedIntegerValue];
      if (v18 > [(HMHomeManager *)v136 metadataVersion])
      {
        -[HMHomeManager setMetadataVersion:](v136, "setMetadataVersion:", [v130 unsignedIntegerValue]);
        id v19 = objc_msgSend(v131, "hmf_dataForKey:", @"kHAPMetadataDataKey");
        if (v19)
        {
          id v20 = +[HMHAPMetadata getSharedInstance];
          [v20 applyProtoBufData:v19];
        }
      }
    }
    else
    {
      int8x16_t v22 = (void *)MEMORY[0x19F3A64A0]();
      id v23 = v136;
      int8x16_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        char v25 = HMFGetLogIdentifier();
        char v26 = HMHomeManagerOptionsToString([(HMHomeManager *)v23 options]);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v26;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@Client has not requested access to HAP accessories (options %@) - dropping synced metadata", buf, 0x16u);
      }
    }
    uint64_t v27 = [v135 unsignedIntegerValue];
    if (v27 == [(HMHomeManager *)v136 generationCounter])
    {
      if (v4) {
        [(HMHomeManager *)v136 _requestRefresh];
      }
    }
    else
    {
      context = (void *)MEMORY[0x19F3A64A0](-[HMHomeManager setGenerationCounter:](v136, "setGenerationCounter:", [v135 unsignedIntegerValue]));
      v125 = objc_msgSend(v131, "hmf_dataForKey:", @"kHomeDataKey");
      v122 = objc_msgSend(v131, "hmf_UUIDForKey:", @"kPrimaryHomeUUIDKey");
      v123 = objc_msgSend(v131, "hmf_UUIDForKey:", @"kCurrentHomeUUIDKey");
      v126 = objc_msgSend(v131, "hmf_UUIDForKey:", @"HMHM.lastRemovedCurrentAccessory");
      if (v125)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v193 = __Block_byref_object_copy__30944;
        *(void *)&long long v194 = __Block_byref_object_dispose__30945;
        *((void *)&v194 + 1) = 0;
        uint64_t v177 = 0;
        v178 = &v177;
        uint64_t v179 = 0x3032000000;
        v180 = __Block_byref_object_copy__30944;
        v181 = __Block_byref_object_dispose__30945;
        id v182 = 0;
        uint64_t v28 = (void *)MEMORY[0x1E4F653F0];
        v172[0] = MEMORY[0x1E4F143A8];
        v172[1] = 3221225472;
        v172[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke;
        v172[3] = &unk_1E5941F90;
        id v29 = v125;
        v175 = &v177;
        v176 = buf;
        id v173 = v29;
        v174 = v136;
        uint64_t v30 = [v28 activityWithName:@"Unarchive homes" block:v172];
        uint64_t v31 = v178[5];
        if (v31)
        {
          id v32 = (void *)MEMORY[0x19F3A64A0](v30);
          long long v33 = v136;
          HMFGetOSLogHandle();
          long long v34 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            long long v35 = HMFGetLogIdentifier();
            uint64_t v36 = v178[5];
            *(_DWORD *)v188 = 138543618;
            v189 = v35;
            __int16 v190 = 2112;
            uint64_t v191 = v36;
            _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize homes from home configuration data: %@", v188, 0x16u);
          }
          id v124 = 0;
        }
        else
        {
          id v37 = *(id *)(*(void *)&buf[8] + 40);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v38 = v37;
          }
          else {
            v38 = 0;
          }
          id v124 = v38;
        }
        _Block_object_dispose(&v177, 8);

        _Block_object_dispose(buf, 8);
        if (v31)
        {

LABEL_122:

          goto LABEL_123;
        }
      }
      else
      {
        id v124 = 0;
      }
      v119 = objc_msgSend(v131, "hmf_dataForKey:", @"kIncomingHomeInvitationsKey");
      if (v119)
      {
        __int16 v39 = (void *)MEMORY[0x1E4F1CAD0];
        v187[0] = objc_opt_class();
        v187[1] = objc_opt_class();
        int v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:2];
        v41 = [v39 setWithArray:v40];

        id v171 = 0;
        uint64_t v42 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v41 fromData:v119 error:&v171];
        id v43 = v171;
        if (!v42)
        {
          v44 = (void *)MEMORY[0x19F3A64A0]();
          v45 = v136;
          v46 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            uint64_t v47 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v47;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v43;
            _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive incoming home invitations from encoded invites data: %@", buf, 0x16u);
          }
        }
        long long v169 = 0u;
        long long v170 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        id v120 = v42;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v48 = v120;
        }
        else {
          v48 = 0;
        }
        id v49 = v48;

        uint64_t v50 = [v49 countByEnumeratingWithState:&v167 objects:v186 count:16];
        if (v50)
        {
          uint64_t v51 = *(void *)v168;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v168 != v51) {
                objc_enumerationMutation(v49);
              }
              v53 = *(void **)(*((void *)&v167 + 1) + 8 * i);
              v54 = [(HMHomeManager *)v136 context];
              objc_msgSend(v53, "__configureWithContext:homeManager:", v54, v136);
            }
            uint64_t v50 = [v49 countByEnumeratingWithState:&v167 objects:v186 count:16];
          }
          while (v50);
        }
      }
      else
      {
        id v120 = 0;
      }
      v117 = objc_msgSend(v131, "hmf_dictionaryForKey:", @"kAppDataInformationKey");
      v116 = [[HMApplicationData alloc] initWithContentsOfDictionary:v117];
      if ([(HMHomeManager *)v136 isInitialMergeComplete])
      {
        if ([(HMHomeManager *)v136 _shouldWeMergeLatestHomeGraphFromDaemonResponse:v131])
        {
          v55 = (void *)MEMORY[0x1E4F653F0];
          v160[0] = MEMORY[0x1E4F143A8];
          v160[1] = 3221225472;
          v160[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_648;
          v160[3] = &unk_1E5941FB8;
          v160[4] = v136;
          id v161 = v124;
          id v162 = v122;
          id v163 = v123;
          id v164 = v120;
          v165 = v116;
          BOOL v166 = v4;
          [v55 activityWithName:@"Merge homes" block:v160];
        }
        else
        {
          uint64_t v61 = (void *)MEMORY[0x19F3A64A0]();
          v62 = v136;
          id v63 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            v64 = HMFGetLogIdentifier();
            v65 = HMHomeManagerDataSyncStateToString([(HMHomeManager *)v62 _dataSyncStateFromPayload:v131]);
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v64;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v65;
            _os_log_impl(&dword_19D1A8000, v63, OS_LOG_TYPE_INFO, "%{public}@Skipping framework merge as data sync state is %@", buf, 0x16u);
          }
        }
      }
      else
      {
        v56 = (void *)MEMORY[0x19F3A64A0]();
        id v57 = v136;
        v58 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v59 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v59;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v124;
          _os_log_impl(&dword_19D1A8000, v58, OS_LOG_TYPE_INFO, "%{public}@Updating homes : %@", buf, 0x16u);
        }
        v60 = (void *)MEMORY[0x1E4F653F0];
        v153[0] = MEMORY[0x1E4F143A8];
        v153[1] = 3221225472;
        v153[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_652;
        v153[3] = &unk_1E5941FE0;
        id v154 = v124;
        id v155 = v122;
        v156 = v57;
        id v157 = v120;
        v158 = v116;
        id v159 = v123;
        [v60 activityWithName:@"Update homes" block:v153];
      }
      v66 = [(HMHomeManager *)v136 predictionProvider];
      [v66 recalculatePredictions];

      [(HMHomeManager *)v136 setGenerationCounterPostHomeGraphUpdate:[(HMHomeManager *)v136 generationCounter]];
      locuint64_t k = &v136->_lock;
      os_unfair_lock_lock_with_options();
      if ([(NSUUID *)v136->_lastRemovedCurrentAccessoryUUID hmf_isEqualToUUID:v126])
      {
        os_unfair_lock_unlock(lock);
      }
      else
      {
        uint64_t v67 = [v126 copy];
        lastRemovedCurrentAccessoryUUID = v136->_lastRemovedCurrentAccessoryUUID;
        v136->_lastRemovedCurrentAccessoryUUID = (NSUUID *)v67;

        v69 = v136->_lastRemovedCurrentAccessoryUUID;
        os_unfair_lock_unlock(lock);
        if (v69)
        {
          dispatch_block_t v70 = (void *)MEMORY[0x19F3A64A0]();
          v71 = v136;
          v72 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            id v73 = HMFGetLogIdentifier();
            long long v74 = [(HMHomeManager *)v71 lastRemovedCurrentAccessoryUUID];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v73;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v74;
            _os_log_impl(&dword_19D1A8000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@Merged current accessory removal %@.", buf, 0x16u);
          }
          id v75 = [(HMHomeManager *)v71 _privateDelegate];
          if (objc_opt_respondsToSelector())
          {
            id v76 = [(HMHomeManager *)v71 context];
            id v77 = [v76 queue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_654;
            block[3] = &unk_1E5945628;
            void block[4] = v71;
            id v152 = v75;
            dispatch_async(v77, block);
          }
        }
      }
      v134 = objc_msgSend(v131, "hmf_arrayForKey:", @"HMHM.SharedHomeUUIDsNotYetMigrated");
      v133 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v136->_sharedHomeUUIDsNotYetMigrated, "count"));
      os_unfair_lock_lock_with_options();
      long long v149 = 0u;
      long long v150 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v78 = v136->_sharedHomeUUIDsNotYetMigrated;
      uint64_t v79 = [(NSArray *)v78 countByEnumeratingWithState:&v147 objects:v185 count:16];
      if (v79)
      {
        uint64_t v80 = *(void *)v148;
        do
        {
          for (uint64_t j = 0; j != v79; ++j)
          {
            if (*(void *)v148 != v80) {
              objc_enumerationMutation(v78);
            }
            uint64_t v82 = *(void *)(*((void *)&v147 + 1) + 8 * j);
            v83 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v82];
            objc_super v84 = [(HMHomeManager *)v136 _homeWithUUID:v83];

            if (v82) {
              BOOL v85 = v84 == 0;
            }
            else {
              BOOL v85 = 0;
            }
            if (v85 && ([v134 containsObject:v82] & 1) == 0)
            {
              __int16 v86 = (void *)MEMORY[0x19F3A64A0]([v133 addObject:v82]);
              uint64_t v87 = v136;
              HMFGetOSLogHandle();
              v88 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
              {
                uint64_t v89 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v89;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v82;
                _os_log_impl(&dword_19D1A8000, v88, OS_LOG_TYPE_INFO, "%{public}@Home %@ has been removed permanently.", buf, 0x16u);
              }
            }
          }
          uint64_t v79 = [(NSArray *)v78 countByEnumeratingWithState:&v147 objects:v185 count:16];
        }
        while (v79);
      }

      uint64_t v90 = [v134 copy];
      sharedHomeUUIDsNotYetMigrated = v136->_sharedHomeUUIDsNotYetMigrated;
      v136->_sharedHomeUUIDsNotYetMigrated = (NSArray *)v90;

      os_unfair_lock_unlock(lock);
      if ([v133 count])
      {
        v92 = [(HMHomeManager *)v136 _privateDelegate];
        if (objc_opt_respondsToSelector())
        {
          long long v145 = 0u;
          long long v146 = 0u;
          long long v143 = 0u;
          long long v144 = 0u;
          obuint64_t j = v133;
          uint64_t v93 = [obj countByEnumeratingWithState:&v143 objects:v184 count:16];
          if (v93)
          {
            uint64_t v94 = *(void *)v144;
            do
            {
              for (uint64_t k = 0; k != v93; ++k)
              {
                if (*(void *)v144 != v94) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v96 = *(void *)(*((void *)&v143 + 1) + 8 * k);
                v97 = [(HMHomeManager *)v136 context];
                v98 = [v97 queue];
                v141[0] = MEMORY[0x1E4F143A8];
                v141[1] = 3221225472;
                v141[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_656;
                v141[3] = &unk_1E5945650;
                v141[4] = v136;
                v141[5] = v96;
                id v142 = v92;
                dispatch_async(v98, v141);
              }
              uint64_t v93 = [obj countByEnumeratingWithState:&v143 objects:v184 count:16];
            }
            while (v93);
          }
        }
      }
    }
    v99 = objc_msgSend(v131, "hmf_numberForKey:", @"status");
    v100 = (void *)MEMORY[0x19F3A64A0]();
    v101 = v136;
    v102 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      v103 = HMFGetLogIdentifier();
      v104 = HMHomeManagerStatusToString([v99 unsignedIntegerValue]);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v103;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v104;
      _os_log_impl(&dword_19D1A8000, v102, OS_LOG_TYPE_DEFAULT, "%{public}@HomeManager status from daemon is %@ after fetch/merge. Marking framework merge completed", buf, 0x16u);
    }
    [v101 _updateStatusWithPayload:v131 sourceIsFetch:1];
    uint64_t v105 = [v101 serverGenerationCounter];
    if ([v135 unsignedIntegerValue] == v105)
    {
      v106 = (void *)MEMORY[0x19F3A64A0]();
      v107 = v101;
      v108 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
      {
        v109 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v109;
        _os_log_impl(&dword_19D1A8000, v108, OS_LOG_TYPE_INFO, "%{public}@The framework is in sync", buf, 0xCu);
      }
    }
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v110 = v101[4];
    uint64_t v111 = [v110 countByEnumeratingWithState:&v137 objects:v183 count:16];
    if (v111)
    {
      uint64_t v112 = *(void *)v138;
      do
      {
        for (uint64_t m = 0; m != v111; ++m)
        {
          if (*(void *)v138 != v112) {
            objc_enumerationMutation(v110);
          }
          v114 = *(void **)(*((void *)&v137 + 1) + 8 * m);
          unint64_t v115 = [v135 unsignedIntegerValue];
          if (v115 >= [v114 generationCounter]) {
            [v114 finish];
          }
        }
        uint64_t v111 = [v110 countByEnumeratingWithState:&v137 objects:v183 count:16];
      }
      while (v111);
    }

    objc_msgSend(v101, "__handleHomeManagerState:", v131);
    [v128 invalidate];

    goto LABEL_122;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v135;
    *(_WORD *)&buf[22] = 2112;
    v193 = v130;
    LOWORD(v194) = 2112;
    *(void *)((char *)&v194 + 2) = v129;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot process home configuration response missing generation counter (%@) or metadata version (%@) or identifier salt (%@)", buf, 0x2Au);
  }
LABEL_123:
}

- (unint64_t)generationCounter
{
  return self->_generationCounter;
}

- (unint64_t)metadataVersion
{
  return self->_metadataVersion;
}

- (void)__handleHomeManagerState:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v18 = 0;
  uint64_t v5 = objc_msgSend(v4, "hmf_BOOLForKey:isPresent:", @"kResidentCapableDeviceKey", &v18);
  if (v18)
  {
    uint64_t v6 = v5;
    if (v5 != [(HMHomeManager *)self isThisDeviceResidentCapable])
    {
      [(HMHomeManager *)self setThisDeviceResidentCapable:v6];
      [(HMHomeManager *)self notifyResidentCapableUpdated:v6];
    }
  }
  char v18 = 0;
  uint64_t v7 = objc_msgSend(v4, "hmf_BOOLForKey:isPresent:", @"kResidentEnabledKey", &v18);
  if (v18)
  {
    uint64_t v8 = v7;
    if (v7 != [(HMHomeManager *)self isResidentEnabledForThisDevice])
    {
      [(HMHomeManager *)self setResidentEnabledForThisDevice:v8];
      [(HMHomeManager *)self notifyResidentEnabledUpdated:v8];
    }
  }
  char v18 = 0;
  uint64_t v9 = objc_msgSend(v4, "hmf_BOOLForKey:isPresent:", @"kAccessAllowedWhenLockedKey", &v18);
  if (v18)
  {
    uint64_t v10 = v9;
    if (v9 != [(HMHomeManager *)self isAccessAllowedWhenLocked])
    {
      [(HMHomeManager *)self setAccessAllowedWhenLocked:v10];
      [(HMHomeManager *)self _notifyAccessAllowedWhenLockedUpdated:v10];
    }
  }
  char v18 = 0;
  int v11 = objc_msgSend(v4, "hmf_UUIDForKey:", @"kCurrentHomeUUIDKey");
  if (v11 || (int v12 = objc_msgSend(v4, "hmf_BOOLForKey:isPresent:", @"kNoCurrentHomeKey", &v18), v18) && v12)
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]([(HMHomeManager *)self _updateCurrentHome:v11]);
    uint64_t v14 = self;
    dispatch_queue_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      long long v16 = HMFGetLogIdentifier();
      uint64_t v17 = [(HMHomeManager *)v14 currentHome];
      *(_DWORD *)buf = 138543618;
      id v20 = v16;
      __int16 v21 = 2112;
      int8x16_t v22 = v17;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Updated current home: %@ due to home manager state", buf, 0x16u);
    }
  }
}

- (BOOL)isThisDeviceResidentCapable
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_thisDeviceResidentCapable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isResidentEnabledForThisDevice
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_residentEnabledForThisDevice;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAccessAllowedWhenLocked
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_accessAllowedWhenLocked;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_handleHomeSafetySecurityEnabledStateWithPayload:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_BOOLForKey:", @"HMHM.homeSafetySecurityEnabled");
  if (v5 != [(HMHomeManager *)self homeSafetySecurityEnabled])
  {
    [(HMHomeManager *)self setHomeSafetySecurityEnabled:v5];
    uint64_t v6 = [(HMHomeManager *)self delegate];
    if ([v6 conformsToProtocol:&unk_1EEF6FE30]) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v10 = self;
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = HMFGetLogIdentifier();
        [(HMHomeManager *)v10 homeSafetySecurityEnabled];
        id v13 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        char v26 = v12;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client about updated Home Safety and Security enablement state : %@", buf, 0x16u);
      }
      uint64_t v14 = [(HMHomeManager *)v10 context];
      dispatch_queue_t v15 = [v14 delegateCaller];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      void v21[2] = __66__HMHomeManager__handleHomeSafetySecurityEnabledStateWithPayload___block_invoke;
      v21[3] = &unk_1E5944D60;
      id v22 = v8;
      uint64_t v23 = v10;
      char v24 = v5;
      [v15 invokeBlock:v21];
    }
    long long v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    char v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      [(HMHomeManager *)v17 homeSafetySecurityEnabled];
      id v20 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      char v26 = v19;
      __int16 v27 = 2112;
      uint64_t v28 = v20;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Daemon Home Safety and Security status: %@", buf, 0x16u);
    }
  }
}

- (BOOL)homeSafetySecurityEnabled
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_homeSafetySecurityEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_handleHH2StateWithPayload:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  -[HMHomeManager setDaemonRunningWithROARFramework:](self, "setDaemonRunningWithROARFramework:", objc_msgSend(v4, "hmf_BOOLForKey:", @"HMHM.daemonROARFramework"));
  uint64_t v5 = objc_msgSend(v4, "hmf_BOOLForKey:", @"HMHM.userOptedToHH2");
  if (v5 != [(HMHomeManager *)self hasOptedToHH2])
  {
    [(HMHomeManager *)self setMigrationBoost:0];
    [(HMHomeManager *)self setHasOptedToHH2:v5];
    uint64_t v6 = [(HMHomeManager *)self delegate];
    if ([v6 conformsToProtocol:&unk_1EEF6FE30]) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v10 = self;
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = HMFGetLogIdentifier();
        [(HMHomeManager *)v10 hasOptedToHH2];
        id v13 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        char v26 = v12;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of HH2 updated status : %@", buf, 0x16u);
      }
      uint64_t v14 = [(HMHomeManager *)v10 context];
      dispatch_queue_t v15 = [v14 delegateCaller];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      void v21[2] = __44__HMHomeManager__handleHH2StateWithPayload___block_invoke;
      v21[3] = &unk_1E5944D60;
      id v22 = v8;
      uint64_t v23 = v10;
      char v24 = v5;
      [v15 invokeBlock:v21];
    }
  }
  long long v16 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v17 = self;
  char v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    [(HMHomeManager *)v17 isDaemonRunningWithROARFramework];
    id v20 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    char v26 = v19;
    __int16 v27 = 2112;
    uint64_t v28 = v20;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Daemon HH2 status: %@", buf, 0x16u);
  }
}

- (BOOL)hasOptedToHH2
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_optedToHH2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isDaemonRunningWithROARFramework
{
  return self->_daemonRunningWithROARFramework;
}

- (void)setDaemonRunningWithROARFramework:(BOOL)a3
{
  self->_daemonRunningWithROARFrameworuint64_t k = a3;
}

- (void)_handleHH2MigrationProgressStateWithPayload:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_BOOLForKey:", @"HMHM.HH2MigrationInProgress");
  uint64_t v6 = objc_msgSend(v4, "hmf_errorForKey:", @"HMHM.HH2MigrationFailedError");
  [(HMHomeManager *)self setHh2MigrationFailedError:v6];

  uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    [(HMHomeManager *)v8 isHH2MigrationInProgress];
    int v11 = HMFBooleanToString();
    int v12 = HMFBooleanToString();
    id v13 = [(HMHomeManager *)v8 hh2MigrationFailedError];
    *(_DWORD *)buf = 138544130;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v11;
    __int16 v32 = 2112;
    long long v33 = v12;
    __int16 v34 = 2112;
    long long v35 = v13;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@>>> MIP: %@, new MIP: %@, error: %@", buf, 0x2Au);
  }
  if (v5 != [(HMHomeManager *)v8 isHH2MigrationInProgress])
  {
    [(HMHomeManager *)v8 setHh2MigrationInProgress:v5];
    uint64_t v14 = [(HMHomeManager *)v8 delegate];
    if ([v14 conformsToProtocol:&unk_1EEF6FE30]) {
      dispatch_queue_t v15 = v14;
    }
    else {
      dispatch_queue_t v15 = 0;
    }
    id v16 = v15;

    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
      char v18 = v8;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        [(HMHomeManager *)v18 isHH2MigrationInProgress];
        __int16 v21 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v20;
        __int16 v30 = 2112;
        uint64_t v31 = v21;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Notifying client of HH2 migration updated status : %@", buf, 0x16u);
      }
      id v22 = [(HMHomeManager *)v18 context];
      uint64_t v23 = [v22 delegateCaller];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __61__HMHomeManager__handleHH2MigrationProgressStateWithPayload___block_invoke;
      v24[3] = &unk_1E5944D60;
      id v25 = v16;
      char v26 = v18;
      char v27 = v5;
      [v23 invokeBlock:v24];
    }
  }
}

- (BOOL)isHH2MigrationInProgress
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hh2MigrationInProgress;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSError)hh2MigrationFailedError
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_hh2MigrationFailedError;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setHh2MigrationFailedError:(id)a3
{
  id v4 = (NSError *)a3;
  os_unfair_lock_lock_with_options();
  hh2MigrationFailedError = self->_hh2MigrationFailedError;
  self->_hh2MigrationFailedError = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_updateStatusWithPayload:(id)a3 sourceIsFetch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "hmf_numberForKey:", @"status");
  id v8 = v7;
  if (v7)
  {
    unint64_t v9 = [v7 unsignedIntegerValue];
    uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    int v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      long long v35 = self;
      uint64_t v14 = v13 = v4;
      dispatch_queue_t v15 = HMHomeManagerStatusToString([(HMHomeManager *)v11 status]);
      id v16 = HMHomeManagerStatusToString(v9);
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v14;
      __int16 v43 = 2112;
      unint64_t v44 = (unint64_t)v15;
      __int16 v45 = 2112;
      uint64_t v46 = (uint64_t)v16;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating status from %@ -> %@", buf, 0x20u);

      BOOL v4 = v13;
      self = v35;
    }

    if ([(HMHomeManager *)v11 status] != v9)
    {
      [(HMHomeManager *)v11 setStatus:v9];
      uint64_t v17 = [(HMHomeManager *)v11 status];
      BOOL v36 = v4;
      if (v17 != v9)
      {
        char v18 = (void *)MEMORY[0x19F3A64A0]();
        id v19 = v11;
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          __int16 v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          uint64_t v42 = v21;
          __int16 v43 = 2048;
          unint64_t v44 = v9;
          __int16 v45 = 2048;
          uint64_t v46 = v17;
          _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Framework merge not completed - overriding the status from daemon %tu with %tu", buf, 0x20u);
        }
        BOOL v4 = v36;
      }
      id v22 = [(HMHomeManager *)v11 delegate];
      if ([v22 conformsToProtocol:&unk_1EEF6FE30]) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
      id v24 = v23;

      if (objc_opt_respondsToSelector())
      {
        id v25 = (void *)MEMORY[0x19F3A64A0]();
        char v26 = v11;
        char v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          uint64_t v29 = HMHomeManagerStatusToString(v9);
          *(_DWORD *)buf = 138543618;
          uint64_t v42 = v28;
          __int16 v43 = 2112;
          unint64_t v44 = (unint64_t)v29;
          _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated status: %@", buf, 0x16u);
        }
        __int16 v30 = [(HMHomeManager *)v26 context];
        uint64_t v31 = [v30 delegateCaller];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __56__HMHomeManager__updateStatusWithPayload_sourceIsFetch___block_invoke;
        v37[3] = &unk_1E5945160;
        id v38 = v24;
        __int16 v39 = v26;
        uint64_t v40 = v17;
        [v31 invokeBlock:v37];

        BOOL v4 = v36;
      }
    }
  }
  [(HMHomeManager *)self _updateDataSyncState:v6];
  __int16 v32 = objc_msgSend(v6, "hmf_numberForKey:", @"multiUserStatus");
  long long v33 = v32;
  if (v32)
  {
    uint64_t v34 = [v32 unsignedIntegerValue];
    if (v4) {
      [(HMHomeManager *)self setMultiUserStatus:v34];
    }
  }
}

- (unint64_t)status
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t status = self->_status;
  os_unfair_lock_unlock(p_lock);
  return status;
}

- (void)setMultiUserStatus:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_multiUserStatus == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_multiUserStatus = a3;
    os_unfair_lock_unlock(p_lock);
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = [NSNumber numberWithInteger:a3];
      *(_DWORD *)char v18 = 138543618;
      *(void *)&void v18[4] = v9;
      *(_WORD *)&v18[12] = 2112;
      *(void *)&v18[14] = v10;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Multi user status changed to %@", v18, 0x16u);
    }
    int v11 = [(HMHomeManager *)v7 _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      int v12 = [(HMHomeManager *)v7 context];
      BOOL v13 = [v12 delegateCaller];
      *(void *)char v18 = MEMORY[0x1E4F143A8];
      *(void *)&v18[8] = 3221225472;
      *(void *)&v18[16] = __53__HMHomeManager__notifyClientOfMultiUserStateChange___block_invoke;
      id v19 = &unk_1E5941EF0;
      id v20 = v7;
      int64_t v23 = a3;
      id v21 = v11;
      id v22 = 0;
      [v13 invokeBlock:v18];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
      dispatch_queue_t v15 = v7;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)char v18 = 138543362;
        *(void *)&void v18[4] = v17;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Registered client does not respond to multi-user state change delegate", v18, 0xCu);
      }
    }
  }
}

- (void)_updateDataSyncState:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(HMHomeManager *)self _dataSyncStateFromPayload:v4];
  if (v5 <= 6)
  {
    unint64_t v6 = v5;
    uint64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = self;
    unint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = HMHomeManagerDataSyncStateToString(v6);
      *(_DWORD *)buf = 138543618;
      id v38 = v10;
      __int16 v39 = 2112;
      uint64_t v40 = v11;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Got data sync state update from daemon: %@", buf, 0x16u);
    }
    if ([(HMHomeManager *)v8 dataSyncState] != v6)
    {
      BOOL v12 = +[HMHomeManager dataSyncInProgressFromDataSyncState:[(HMHomeManager *)v8 dataSyncState]];
      BOOL v13 = (void *)MEMORY[0x19F3A64A0]([(HMHomeManager *)v8 setDataSyncState:v6]);
      uint64_t v14 = v8;
      dispatch_queue_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        uint64_t v17 = HMHomeManagerDataSyncStateToString(v6);
        *(_DWORD *)buf = 138543618;
        id v38 = v16;
        __int16 v39 = 2112;
        uint64_t v40 = v17;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating data sync state to: %@", buf, 0x16u);
      }
      char v18 = [(HMHomeManager *)v14 _privateDelegate];
      if (objc_opt_respondsToSelector())
      {
        id v19 = (void *)MEMORY[0x19F3A64A0]();
        id v20 = v14;
        id v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v38 = v22;
          __int16 v39 = 2112;
          uint64_t v40 = v18;
          _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated data sync state: %@", buf, 0x16u);
        }
        int64_t v23 = [(HMHomeManager *)v20 context];
        uint64_t v24 = [v23 delegateCaller];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __38__HMHomeManager__updateDataSyncState___block_invoke;
        v34[3] = &unk_1E5945628;
        id v35 = v18;
        BOOL v36 = v20;
        [v24 invokeBlock:v34];
      }
      if (v12 != +[HMHomeManager dataSyncInProgressFromDataSyncState:[(HMHomeManager *)v14 dataSyncState]]&& (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v25 = (void *)MEMORY[0x19F3A64A0]();
        char v26 = v14;
        char v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v38 = v28;
          __int16 v39 = 2112;
          uint64_t v40 = v18;
          _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated data sync in progress: %@", buf, 0x16u);
        }
        uint64_t v29 = [(HMHomeManager *)v26 context];
        __int16 v30 = [v29 delegateCaller];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __38__HMHomeManager__updateDataSyncState___block_invoke_450;
        v31[3] = &unk_1E5945628;
        id v32 = v18;
        long long v33 = v26;
        [v30 invokeBlock:v31];
      }
    }
  }
}

- (unint64_t)dataSyncState
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t dataSyncState = self->_dataSyncState;
  os_unfair_lock_unlock(p_lock);
  return dataSyncState;
}

- (unint64_t)_dataSyncStateFromPayload:(id)a3
{
  id v3 = objc_msgSend(a3, "hmf_numberForKey:", @"dataSyncState");
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 integerValue];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)dataSyncInProgressFromDataSyncState:(unint64_t)a3
{
  return a3 > 1;
}

- (void)_handleHH2ManualMigrationEnabledStateWithPayload:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_BOOLForKey:", @"HMHM.hh2ManualMigrationEnabled");
  if (v5 == [(HMHomeManager *)self isHH2MigrationAvailable])
  {
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = self;
    int64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      [(HMHomeManager *)v22 isHH2MigrationAvailable];
      id v25 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v24;
      __int16 v32 = 2112;
      long long v33 = v25;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@isHH2MigrationAvailable didn't change. %@", buf, 0x16u);
    }
  }
  else
  {
    [(HMHomeManager *)self setIsHH2MigrationAvailable:v5];
    unint64_t v6 = [(HMHomeManager *)self delegate];
    if ([v6 conformsToProtocol:&unk_1EEF6FE30]) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    if (objc_opt_respondsToSelector())
    {
      unint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v10 = self;
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        BOOL v12 = HMFGetLogIdentifier();
        [(HMHomeManager *)v10 isHH2MigrationAvailable];
        BOOL v13 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v12;
        __int16 v32 = 2112;
        long long v33 = v13;
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client about updated HH2 migration enablement : %@", buf, 0x16u);
      }
      uint64_t v14 = [(HMHomeManager *)v10 context];
      dispatch_queue_t v15 = [v14 delegateCaller];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __66__HMHomeManager__handleHH2ManualMigrationEnabledStateWithPayload___block_invoke;
      v26[3] = &unk_1E5944D60;
      id v27 = v8;
      uint64_t v28 = v10;
      char v29 = v5;
      [v15 invokeBlock:v26];
    }
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    char v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      [(HMHomeManager *)v17 isHH2MigrationAvailable];
      id v20 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = v19;
      __int16 v32 = 2112;
      long long v33 = v20;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Daemon HH2 migration enabled status: %@", buf, 0x16u);
    }
  }
}

- (BOOL)isHH2MigrationAvailable
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hh2MigrationAvailable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_setResidentProvisioningStatus:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_residentProvisioningStatus = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setStatus:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  BOOL v7 = !self->_initialMergeComplete;
  id v8 = (void *)MEMORY[0x19F3A64A0](v6);
  unint64_t v9 = self;
  HMFGetOSLogHandle();
  unint64_t v10 = v7 | a3;
  int v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    HMHomeManagerStatusToString(v9->_status);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    HMHomeManagerStatusToString(v10);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v15 = HMFBooleanToString();
    int v16 = 138544130;
    id v17 = v12;
    __int16 v18 = 2112;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = v14;
    __int16 v22 = 2112;
    int64_t v23 = v15;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating status from %@ -> %@ (initial merge complete: %@)", (uint8_t *)&v16, 0x2Au);
  }
  v9->_unint64_t status = v10;
  os_unfair_lock_unlock(p_lock);
}

- (void)setMetadataVersion:(unint64_t)a3
{
  self->_metadataVersion = a3;
}

- (void)setIsHH2MigrationAvailable:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hh2MigrationAvailable = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setHomeSafetySecurityEnabled:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_homeSafetySecurityEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setGenerationCounterPostHomeGraphUpdate:(unint64_t)a3
{
  self->_generationCounterPostHomeGraphUpdate = a3;
}

- (void)setGenerationCounter:(unint64_t)a3
{
  self->_generationCounter = a3;
}

- (void)setDataSyncState:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t dataSyncState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInitialMergeComplete
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_initialMergeComplete;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_requestRefresh
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v19 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Refresh requested - re-enabling notifications/media accessory control for client", buf, 0xCu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v7 = [(HMHomeManager *)v4 homes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v12 reEnableNotifications];
        [v12 reRegisterHMMMHandlers];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setAccessAllowedWhenLocked:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_accessAllowedWhenLocked = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)_notifyAccessAllowedWhenLockedUpdated:(BOOL)a3
{
  uint64_t v5 = [(HMHomeManager *)self delegate];
  if ([v5 conformsToProtocol:&unk_1EEF6FE30]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(HMHomeManager *)self context];
    uint64_t v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__HMHomeManager__notifyAccessAllowedWhenLockedUpdated___block_invoke;
    v10[3] = &unk_1E5944D60;
    v10[4] = self;
    BOOL v12 = a3;
    id v11 = v7;
    [v9 invokeBlock:v10];
  }
}

- (id)eventRouter
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_eventStoreStarted)
  {
    lastEventStore = self->_lastEventStore;
    if (lastEventStore)
    {
      if ([(HMELastEventStore *)lastEventStore startup])
      {
        self->_eventStoreStarted = 1;
      }
      else
      {
        uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v9 = self;
        HMFGetOSLogHandle();
        uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = HMFGetLogIdentifier();
          int v12 = 138543362;
          long long v13 = v11;
          _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error starting event store!", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  id v4 = [(HMHomeManager *)self xpcEventRouterClient];
  uint64_t v5 = [v4 eventRouter];

  return v5;
}

- (void)__start
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    id v7 = [(HMHomeManager *)v4 configuration];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting home manager with configuration: %@", buf, 0x16u);
  }
  [(HMUserCloudShareManager *)v4->_userCloudShareManager configure];
  uint64_t v8 = [(HMHomeManager *)v4 accessorySetupCoordinator];
  [v8 configure];

  uint64_t v9 = [(HMHomeManager *)v4 privacySettingsProvider];
  v4->_authorizationStatus = [v9 queryAuthorizationStatus];

  uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = v4;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    long long v13 = HMFGetLogIdentifier();
    uint64_t v14 = [(HMHomeManager *)v11 authorizationStatus];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v14;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Queried initial authorization status: %ld", buf, 0x16u);
  }
  long long v15 = (void *)MEMORY[0x19F3A64A0]();
  long long v16 = v11;
  if (([v16 authorizationStatus] & 5) != 0)
  {
    id v17 = [v16 configuration];
    char v18 = [v17 canUseCache];

    if (v18)
    {
      id v19 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Home Manager Load"];
      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = v16;
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        int64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Loading from cache", buf, 0xCu);
      }
      [v21 _determineCacheFiles];
      if (([v21 options] & 0x9701) != 0)
      {
        [v19 markWithReason:@"Starting metadata load"];
        uint64_t v24 = v21;
        buf[0] = 0;
        id v25 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v26 = [v24 metadataCache];
        int v27 = [v25 fileExistsAtPath:v26 isDirectory:buf];
        int v28 = buf[0];

        char v29 = 0;
        if (v27 && !v28)
        {
          long long v143 = v15;
          __int16 v30 = (void *)MEMORY[0x19F3A64A0]();
          uint64_t v31 = v24;
          __int16 v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            long long v33 = HMFGetLogIdentifier();
            uint64_t v34 = [v31 metadataCache];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v33;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v34;
            _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_DEBUG, "%{public}@Loading metadata from cache file: %@", buf, 0x16u);
          }
          id v35 = (void *)MEMORY[0x1E4F1C9B8];
          BOOL v36 = [v31 metadataCache];
          uint64_t v37 = [v35 dataWithContentsOfFile:v36];

          id v38 = (void *)MEMORY[0x1E4F1CAD0];
          *(void *)buf = objc_opt_class();
          *(void *)&buf[8] = objc_opt_class();
          *(void *)&buf[16] = objc_opt_class();
          uint64_t v169 = objc_opt_class();
          uint64_t v170 = objc_opt_class();
          __int16 v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:5];
          uint64_t v40 = [v38 setWithArray:v39];

          id v161 = 0;
          context = (void *)v40;
          id v154 = (void *)v37;
          uint64_t v41 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v40 fromData:v37 error:&v161];
          id v42 = v161;
          long long v150 = v42;
          if (v41)
          {
            id v43 = v41;
            objc_opt_class();
            int v44 = objc_opt_isKindOfClass() & 1;
            if (v44) {
              __int16 v45 = v43;
            }
            else {
              __int16 v45 = 0;
            }
            id v46 = v45;

            if (v44)
            {
              v156 = objc_msgSend(v43, "hmf_numberForKey:", @"kHAPMetadataVersionKey");
              v141 = objc_msgSend(v43, "hmf_dataForKey:", @"kHAPMetadataDataKey");
              uint64_t v47 = (void *)MEMORY[0x19F3A64A0]();
              v48 = v31;
              id v49 = HMFGetOSLogHandle();
              long long v15 = v143;
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                uint64_t v50 = v140 = v46;
                *(_DWORD *)id v162 = 138543618;
                id v163 = v50;
                __int16 v164 = 2112;
                id v165 = v156;
                _os_log_impl(&dword_19D1A8000, v49, OS_LOG_TYPE_INFO, "%{public}@Loading the cached metadata with version: %@", v162, 0x16u);

                id v46 = v140;
              }

              uint64_t v51 = +[HMHAPMetadata getSharedInstance];
              int v52 = [v51 applyProtoBufData:v141];

              if (v52)
              {
                v53 = (void *)MEMORY[0x19F3A64A0]();
                v54 = v48;
                v55 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v56 = id v140 = v46;
                  *(_DWORD *)id v162 = 138543618;
                  id v163 = v56;
                  __int16 v164 = 2112;
                  id v165 = v156;
                  _os_log_impl(&dword_19D1A8000, v55, OS_LOG_TYPE_INFO, "%{public}@Successfully loaded the cached metadata with version: %@", v162, 0x16u);

                  id v46 = v140;
                }

                objc_msgSend(v54, "setMetadataVersion:", objc_msgSend(v156, "unsignedIntegerValue"));
              }

              char v29 = v156;
            }
            else
            {
              v71 = (void *)MEMORY[0x19F3A64A0]();
              v72 = v31;
              id v73 = HMFGetOSLogHandle();
              long long v15 = v143;
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v157 = id v140 = v46;
                long long v74 = objc_opt_class();
                *(_DWORD *)id v162 = 138543618;
                id v163 = v157;
                __int16 v164 = 2112;
                id v165 = v74;
                id v75 = v71;
                id v76 = v74;
                _os_log_impl(&dword_19D1A8000, v73, OS_LOG_TYPE_ERROR, "%{public}@Cached metadata configuration is not a dictionary but of type %@", v162, 0x16u);

                v71 = v75;
                id v46 = v140;
              }

              char v29 = 0;
            }
          }
          else
          {
            id v66 = v42;
            uint64_t v67 = (void *)MEMORY[0x19F3A64A0]();
            id v68 = v31;
            v69 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              dispatch_block_t v70 = HMFGetLogIdentifier();
              *(_DWORD *)id v162 = 138543618;
              id v163 = v70;
              __int16 v164 = 2112;
              id v165 = v66;
              _os_log_impl(&dword_19D1A8000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive cached metadata configuration from serialized metadata configuration: %@", v162, 0x16u);
            }
            char v29 = 0;
            long long v15 = v143;
          }
        }
        [v19 markWithReason:@"Finished metadata load"];
      }
      else
      {
        v62 = (void *)MEMORY[0x19F3A64A0]();
        id v63 = v21;
        v64 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          v65 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v65;
          _os_log_impl(&dword_19D1A8000, v64, OS_LOG_TYPE_DEBUG, "%{public}@Not loading cached metadata because client has not requested access to HAP accessories", buf, 0xCu);
        }
        char v29 = 0;
      }
      objc_msgSend(v19, "markWithReason:", @"Starting home load", v140);
      id v77 = [v21 homeDataCache];

      if (!v77)
      {
        uint64_t v105 = (void *)MEMORY[0x19F3A64A0]();
        v106 = v21;
        v107 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
        {
          v108 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v108;
          _os_log_impl(&dword_19D1A8000, v107, OS_LOG_TYPE_DEBUG, "%{public}@Not loading from cache: no cache file found", buf, 0xCu);
        }
        goto LABEL_90;
      }
      v158 = v29;
      unsigned __int8 v160 = 0;
      id v78 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v79 = [v21 homeDataCache];
      int v80 = [v78 fileExistsAtPath:v79 isDirectory:&v160];
      int v81 = v160;

      uint64_t v82 = (void *)MEMORY[0x19F3A64A0]();
      v83 = v21;
      objc_super v84 = HMFGetOSLogHandle();
      BOOL v85 = v84;
      if (!v80 || v81)
      {
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          v109 = HMFGetLogIdentifier();
          id v110 = [v83 homeDataCache];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v109;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v110;
          _os_log_impl(&dword_19D1A8000, v85, OS_LOG_TYPE_DEBUG, "%{public}@Not loading from cache: no cache file exists at cache file: %@", buf, 0x16u);
        }
        char v29 = v158;
        goto LABEL_90;
      }
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        __int16 v86 = HMFGetLogIdentifier();
        uint64_t v87 = [v83 homeDataCache];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v86;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v87;
        _os_log_impl(&dword_19D1A8000, v85, OS_LOG_TYPE_INFO, "%{public}@Loading homes from cache file: %@", buf, 0x16u);
      }
      v88 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v89 = [v83 homeDataCache];
      uint64_t v90 = [v88 dataWithContentsOfFile:v89];

      if (!v90)
      {
        uint64_t v111 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v112 = v83;
        v113 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
        {
          v114 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v114;
          _os_log_impl(&dword_19D1A8000, v113, OS_LOG_TYPE_DEBUG, "%{public}@Not loading from cache: no serialized home data exists in cache", buf, 0xCu);
        }
        char v29 = v158;
        goto LABEL_89;
      }
      v91 = (void *)MEMORY[0x1E4F1CAD0];
      *(void *)buf = objc_opt_class();
      *(void *)&buf[8] = objc_opt_class();
      *(void *)&buf[16] = objc_opt_class();
      uint64_t v169 = objc_opt_class();
      uint64_t v170 = objc_opt_class();
      uint64_t v171 = objc_opt_class();
      v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:6];
      uint64_t v93 = [v91 setWithArray:v92];

      id v161 = 0;
      uint64_t v94 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v93 fromData:v90 error:&v161];
      id v155 = v161;
      if (v94)
      {
        id v95 = v94;
        objc_opt_class();
        int v96 = objc_opt_isKindOfClass() & 1;
        if (v96) {
          v97 = v95;
        }
        else {
          v97 = 0;
        }
        id v98 = v97;

        if (v96)
        {
          if ([v83 _isValidCachedHomeConfiguration:v95])
          {
            v99 = objc_msgSend(v95, "hmf_numberForKey:", @"kHAPMetadataVersionKey");
            v151 = v99;
            if (([v83 options] & 0x9701) != 0 && (!v158 || objc_msgSend(v99, "compare:", v158) == 1))
            {
              v100 = (void *)MEMORY[0x19F3A64A0]();
              v101 = v83;
              v102 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v103 = contextb = v100;
                *(_DWORD *)id v162 = 138543874;
                id v163 = v103;
                __int16 v164 = 2112;
                id v165 = v158;
                __int16 v166 = 2112;
                long long v167 = v151;
                _os_log_impl(&dword_19D1A8000, v102, OS_LOG_TYPE_ERROR, "%{public}@Metadata version %@ is lower than home data version: %@", v162, 0x20u);

                v100 = contextb;
              }

              [v101 _removeCacheFiles];
              v104 = v151;
            }
            else
            {
              uint64_t v131 = objc_msgSend(v95, "hmf_numberForKey:", @"kConfigGenerationCounterKey");
              contexta = (void *)MEMORY[0x19F3A64A0]();
              v132 = v83;
              v133 = HMFGetOSLogHandle();
              long long v144 = (void *)v131;
              if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v135 = v134 = v93;
                *(_DWORD *)id v162 = 138543618;
                id v163 = v135;
                __int16 v164 = 2112;
                id v165 = v144;
                _os_log_impl(&dword_19D1A8000, v133, OS_LOG_TYPE_INFO, "%{public}@Loading the cached home with generation counter: %@", v162, 0x16u);

                uint64_t v93 = v134;
                uint64_t v131 = (uint64_t)v144;
              }

              id v142 = (void *)MEMORY[0x19F3A64A0]();
              v136 = [v132 _loadHH2MigrationInfoFromHMCache:v131];
              if (v136)
              {
                contextd = v93;
                long long v137 = (void *)[v95 mutableCopy];
                [v137 addEntriesFromDictionary:v136];
                uint64_t v138 = [v137 copy];

                uint64_t v93 = contextd;
                id v95 = (id)v138;
              }
              v104 = v151;
              [v132 _processHomeConfigurationResponse:v95 refreshRequested:0];
            }
          }
          else
          {
            v126 = (void *)MEMORY[0x19F3A64A0]();
            v127 = v83;
            v128 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v129 = v153 = v126;
              [v95 shortDescription];
              v130 = contextc = v93;
              *(_DWORD *)id v162 = 138543618;
              id v163 = v129;
              __int16 v164 = 2112;
              id v165 = v130;
              _os_log_impl(&dword_19D1A8000, v128, OS_LOG_TYPE_ERROR, "%{public}@Cached home configuration is not valid; removing cache: %@",
                v162,
                0x16u);

              uint64_t v93 = contextc;
              v126 = v153;
            }

            [v127 _removeCacheFiles];
          }

          goto LABEL_88;
        }
        uint64_t v120 = MEMORY[0x19F3A64A0]();
        v116 = v83;
        v121 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v122 = uint64_t v152 = v120;
          v123 = objc_opt_class();
          *(_DWORD *)id v162 = 138543618;
          id v163 = v122;
          __int16 v164 = 2112;
          id v165 = v123;
          id v124 = v93;
          id v125 = v123;
          _os_log_impl(&dword_19D1A8000, v121, OS_LOG_TYPE_ERROR, "%{public}@Cached home configuration is not a dictionary but of type %@", v162, 0x16u);

          uint64_t v93 = v124;
          uint64_t v120 = v152;
        }

        v119 = (void *)v120;
      }
      else
      {
        uint64_t v115 = MEMORY[0x19F3A64A0]();
        v116 = v83;
        v117 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        {
          v118 = HMFGetLogIdentifier();
          *(_DWORD *)id v162 = 138543618;
          id v163 = v118;
          __int16 v164 = 2112;
          id v165 = v155;
          _os_log_impl(&dword_19D1A8000, v117, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive cached home configuration from serialized home configuration data: %@", v162, 0x16u);
        }
        v119 = (void *)v115;
      }
      [v116 _removeCacheFiles];
LABEL_88:
      char v29 = v158;

LABEL_89:
LABEL_90:
      [v19 markWithReason:@"Finished home load"];
      [v19 invalidate];

      goto LABEL_91;
    }
    id v57 = (void *)MEMORY[0x19F3A64A0]();
    v58 = v16;
    v59 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      v60 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v60;
      uint64_t v61 = "%{public}@Not loading from cache: not supported by configuration";
      goto LABEL_30;
    }
  }
  else
  {
    id v57 = (void *)MEMORY[0x19F3A64A0]();
    v58 = v16;
    v59 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
    {
      v60 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v60;
      uint64_t v61 = "%{public}@Not loading from cache: client is not authorized";
LABEL_30:
      _os_log_impl(&dword_19D1A8000, v59, OS_LOG_TYPE_DEBUG, v61, buf, 0xCu);
    }
  }

LABEL_91:

  long long v139 = [v16[40] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__HMHomeManager___start__block_invoke;
  block[3] = &unk_1E59452E8;
  void block[4] = v16;
  dispatch_async(v139, block);
}

- (NSString)homeDataCache
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)_fetchHomeConfigurationWithRefreshRequested:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMHomeManager *)self context];
  uint64_t v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  if (([(HMHomeManager *)self authorizationStatus] & 4) == 0)
  {
    uint64_t v7 = MEMORY[0x19F3A64A0]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v37 = 138543618;
      id v38 = v10;
      __int16 v39 = 2048;
      uint64_t v40 = [(HMHomeManager *)v8 authorizationStatus];
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@This client cannot access home data with current authorization status: %lu", (uint8_t *)&v37, 0x16u);
    }
    id v11 = (void *)v7;
LABEL_25:
    return;
  }
  unint64_t v12 = [(HMHomeManager *)self generationCounter];
  unint64_t v13 = [(HMHomeManager *)self serverGenerationCounter];
  uint64_t v14 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v15 = [v14 qualityOfService];

  uint64_t v16 = 17;
  if (v15 == -1) {
    uint64_t v16 = -1;
  }
  if (v15 == 25) {
    uint64_t v17 = 25;
  }
  else {
    uint64_t v17 = v16;
  }
  if (v12 == v13)
  {
    BOOL v18 = [(HMHomeManager *)self shouldConnect];
    id v19 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (!v18)
    {
      if (v22)
      {
        BOOL v36 = HMFGetLogIdentifier();
        int v37 = 138543618;
        id v38 = v36;
        __int16 v39 = 2048;
        uint64_t v40 = v12;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Deferring configuration request with generation counter: %tu", (uint8_t *)&v37, 0x16u);
      }
      id v11 = v19;
      goto LABEL_25;
    }
    if (v22)
    {
      int64_t v23 = HMFGetLogIdentifier();
      int v37 = 138543362;
      id v38 = v23;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Connecting and requesting configuration from the server", (uint8_t *)&v37, 0xCu);
    }
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x19F3A64A0]();
    id v25 = self;
    char v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v27 = HMFGetLogIdentifier();
      int v37 = 138543874;
      id v38 = v27;
      __int16 v39 = 2048;
      uint64_t v40 = v12;
      __int16 v41 = 2048;
      unint64_t v42 = v13;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@The client generation counter %tu does not match the server generation counter: %tu", (uint8_t *)&v37, 0x20u);
    }
    if (v12 == -1) {
      uint64_t v17 = 25;
    }
  }
  int v28 = [[__HMHomeDataSyncOperation alloc] initWithHomeManager:self];
  [(HMFOperation *)v28 setQualityOfService:v17];
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Fetch home configuration"];
  [(HMFOperation *)v28 setActivity:v29];

  __int16 v30 = (void *)MEMORY[0x19F3A64A0]([(__HMHomeDataSyncOperation *)v28 setRefresh:v3]);
  uint64_t v31 = self;
  __int16 v32 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    long long v33 = HMFGetLogIdentifier();
    uint64_t v34 = HMFQualityOfServiceToString();
    int v37 = 138544386;
    id v38 = v33;
    __int16 v39 = 2048;
    uint64_t v40 = v12;
    __int16 v41 = 2048;
    unint64_t v42 = v13;
    __int16 v43 = 2112;
    int v44 = v34;
    __int16 v45 = 2112;
    id v46 = v28;
    _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting home configuration with client generation counter: %tu, server generation counter: %tu, QoS: %@, operation: %@", (uint8_t *)&v37, 0x34u);
  }
  id v35 = [(HMHomeManager *)v31 syncOperationQueue];
  [v35 addOperation:v28];
}

- (HMHomeManagerAuthorizationStatus)authorizationStatus
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  HMHomeManagerAuthorizationStatus authorizationStatus = self->_authorizationStatus;
  os_unfair_lock_unlock(p_lock);
  return authorizationStatus;
}

- (NSOperationQueue)syncOperationQueue
{
  return self->_syncOperationQueue;
}

void __24__HMHomeManager___start__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = *(id *)(a1 + 32);
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    if (*((void *)v4 + 13) == v3)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
      id WeakRetained = 0;
    }
    else
    {
      *((void *)v4 + 13) = v3;
      id WeakRetained = objc_loadWeakRetained((id *)v4 + 12);
      os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v6 = [v4 context];
        uint64_t v7 = [v6 delegateCaller];
        *(void *)BOOL v36 = MEMORY[0x1E4F143A8];
        *(void *)&v36[8] = 3221225472;
        *(void *)&v36[16] = ____HMHomeManagerSetAuthorizationStatus_block_invoke;
        int v37 = &unk_1E5945160;
        id WeakRetained = WeakRetained;
        id v38 = WeakRetained;
        id v39 = v4;
        uint64_t v40 = v3;
        [v7 invokeBlock:v36];
      }
    }
  }
  uint64_t v8 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  if ([(os_unfair_lock_s *)v8 serverGenerationCounterToken] != -1) {
    goto LABEL_11;
  }
  *(_DWORD *)buf = 0;
  uint64_t v17 = [(os_unfair_lock_s *)v8 darwinNotificationProvider];
  int v18 = [v17 notifyRegisterCheck:"com.apple.HomeKit.generation-counter-updated" outToken:buf];

  if (!v18)
  {
    [(os_unfair_lock_s *)v8 setServerGenerationCounterToken:*(unsigned int *)buf];
LABEL_11:
    if (([(os_unfair_lock_s *)v8 shouldConnect] & 1) == 0
      && [(os_unfair_lock_s *)v8 serverGenerationCounterDelayedConnectionToken] == -1)
    {
      objc_initWeak(&location, v8);
      unsigned int v30 = 0;
      uint64_t v9 = [(os_unfair_lock_s *)v8 darwinNotificationProvider];
      uint64_t v10 = [(os_unfair_lock_s *)v8 context];
      id v11 = [v10 queue];
      *(void *)BOOL v36 = MEMORY[0x1E4F143A8];
      *(void *)&v36[8] = 3221225472;
      *(void *)&v36[16] = ____HMHomeManagerRegisterForGenerationCounterNotifications_block_invoke;
      int v37 = &unk_1E5943C28;
      objc_copyWeak(&v38, &location);
      int v12 = [v9 notifyRegisterDispatch:"com.apple.HomeKit.generation-counter-updated" outToken:&v30 queue:v11 handler:v36];

      if (v12)
      {
        unint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v14 = v8;
        HMFGetOSLogHandle();
        uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v33 = v16;
          __int16 v34 = 1024;
          int v35 = v12;
          _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for generation counter change notifications: %d", buf, 0x12u);
        }
      }
      else
      {
        [(os_unfair_lock_s *)v8 setServerGenerationCounterDelayedConnectionToken:v30];
      }
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
    goto LABEL_24;
  }
  id v19 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v20 = v8;
  HMFGetOSLogHandle();
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    BOOL v22 = HMFGetLogIdentifier();
    *(_DWORD *)BOOL v36 = 138543618;
    *(void *)&v36[4] = v22;
    *(_WORD *)&v36[12] = 1024;
    *(_DWORD *)&v36[14] = v18;
    _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for generation counter state: %d", v36, 0x12u);
  }
LABEL_24:
  os_unfair_lock_unlock(v8 + 2);

  int64_t v23 = (id *)*(id *)(a1 + 32);
  uint64_t v24 = v23;
  if (v23)
  {
    [v23 _registerNotificationHandlers];
    objc_initWeak((id *)buf, v24);
    id v25 = [v24[40] xpcClient];
    *(void *)BOOL v36 = MEMORY[0x1E4F143A8];
    *(void *)&v36[8] = 3221225472;
    *(void *)&v36[16] = ____HMHomeManagerRegisterForNotifications_block_invoke;
    int v37 = &unk_1E59455B8;
    objc_copyWeak(&v38, (id *)buf);
    [v25 registerReconnectionHandler:v36];

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }

  int v27 = *(void **)(a1 + 32);
  char v26 = (id *)(a1 + 32);
  [v27 _fetchHomeConfigurationWithRefreshRequested:0];
  int v28 = [*v26 xpcEventRouterClient];
  [v28 configure];

  char v29 = [*v26 predictionProvider];
  [v29 configure];
}

- (unint64_t)serverGenerationCounter
{
  v33[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  p_locuint64_t k = &v2->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMHomeManager *)v2 serverGenerationCounterToken] != -1)
  {
LABEL_2:
    if (![(HMHomeManager *)v2 shouldConnect]
      && [(HMHomeManager *)v2 serverGenerationCounterDelayedConnectionToken] == -1)
    {
      objc_initWeak(&location, v2);
      unsigned int v26 = 0;
      id v4 = [(HMHomeManager *)v2 darwinNotificationProvider];
      uint64_t v5 = [(HMHomeManager *)v2 context];
      uint64_t v6 = [v5 queue];
      *(void *)uint64_t v31 = MEMORY[0x1E4F143A8];
      *(void *)&v31[8] = 3221225472;
      *(void *)&v31[16] = ____HMHomeManagerRegisterForGenerationCounterNotifications_block_invoke;
      __int16 v32 = &unk_1E5943C28;
      objc_copyWeak(v33, &location);
      int v7 = [v4 notifyRegisterDispatch:"com.apple.HomeKit.generation-counter-updated" outToken:&v26 queue:v6 handler:v31];

      if (v7)
      {
        uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v9 = v2;
        HMFGetOSLogHandle();
        uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v11;
          __int16 v29 = 1024;
          int v30 = v7;
          _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for generation counter change notifications: %d", buf, 0x12u);
        }
      }
      else
      {
        [(HMHomeManager *)v2 setServerGenerationCounterDelayedConnectionToken:v26];
      }
      objc_destroyWeak(v33);
      objc_destroyWeak(&location);
    }
    goto LABEL_15;
  }
  *(_DWORD *)buf = 0;
  int v12 = [(HMHomeManager *)v2 darwinNotificationProvider];
  int v13 = [v12 notifyRegisterCheck:"com.apple.HomeKit.generation-counter-updated" outToken:buf];

  if (!v13)
  {
    [(HMHomeManager *)v2 setServerGenerationCounterToken:*(unsigned int *)buf];
    goto LABEL_2;
  }
  uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v15 = v2;
  HMFGetOSLogHandle();
  uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)uint64_t v31 = 138543618;
    *(void *)&void v31[4] = v17;
    *(_WORD *)&v31[12] = 1024;
    *(_DWORD *)&v31[14] = v13;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for generation counter state: %d", v31, 0x12u);
  }
LABEL_15:
  os_unfair_lock_unlock(p_lock);

  os_unfair_lock_lock_with_options();
  uint64_t v18 = [(HMHomeManager *)v2 serverGenerationCounterToken];
  os_unfair_lock_unlock(p_lock);
  *(void *)buf = 0;
  id v19 = [(HMHomeManager *)v2 darwinNotificationProvider];
  int v20 = [v19 notifyGetState:v18 state:buf];

  if (!v20) {
    return *(void *)buf;
  }
  id v21 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v22 = v2;
  int64_t v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    *(_DWORD *)uint64_t v31 = 138543618;
    *(void *)&void v31[4] = v24;
    *(_WORD *)&v31[12] = 1024;
    *(_DWORD *)&v31[14] = v20;
    _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get state for token: %d", v31, 0x12u);
  }
  return 0;
}

- (int)serverGenerationCounterToken
{
  return self->_serverGenerationCounterToken;
}

- (BOOL)shouldConnect
{
  return self->_shouldConnect;
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return (HMDarwinNotificationProvider *)objc_getProperty(self, a2, 248, 1);
}

- (HMUserActionPredictionProvider)predictionProvider
{
  return (HMUserActionPredictionProvider *)objc_getProperty(self, a2, 368, 1);
}

- (HMXPCEventRouterClient)xpcEventRouterClient
{
  return self->_xpcEventRouterClient;
}

void __24__HMHomeManager___start__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) privacySettingsProvider];
  uint64_t v3 = [*(id *)(a1 + 32) context];
  id v4 = [v3 queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__HMHomeManager___start__block_invoke_2;
  v5[3] = &unk_1E5941F68;
  v5[4] = *(void *)(a1 + 32);
  [v2 requestHomeKitAccessWithQueue:v4 completion:v5];
}

- (_HMPrivacySettingsProvider)privacySettingsProvider
{
  return self->_privacySettingsProvider;
}

- (HMAccessorySetupCoordinator)accessorySetupCoordinator
{
  return (HMAccessorySetupCoordinator *)objc_getProperty(self, a2, 400, 1);
}

- (void)_registerNotificationHandlers
{
  uint64_t v3 = [(HMHomeManager *)self context];
  id v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"kCurrentHomeChangedNotificationKey" receiver:self selector:sel__handleCurrentHomeChangedNotification_];

  uint64_t v5 = [(HMHomeManager *)self context];
  uint64_t v6 = [v5 messageDispatcher];
  [v6 registerForMessage:@"kHomesDidUpdateNotificationKey" receiver:self selector:sel__handleHomesDidUpdateNotification_];

  int v7 = [(HMHomeManager *)self context];
  uint64_t v8 = [v7 messageDispatcher];
  [v8 registerForMessage:@"kMetadataChangedNotificationKey" receiver:self selector:sel__handleMetadataUpdatedNotification_];

  uint64_t v9 = [(HMHomeManager *)self context];
  uint64_t v10 = [v9 messageDispatcher];
  [v10 registerForMessage:@"kUserInvitationsUpdatedNotificationKey" receiver:self selector:sel__handleUserInvitationsUpdatedNotification_];

  id v11 = [(HMHomeManager *)self context];
  int v12 = [v11 messageDispatcher];
  [v12 registerForMessage:@"kResidentDeviceCapableUpdatedNotificationKey" receiver:self selector:sel__handleResidentDeviceCapableUpdatedNotification_];

  int v13 = [(HMHomeManager *)self context];
  uint64_t v14 = [v13 messageDispatcher];
  [v14 registerForMessage:@"kResidentEnabledForThisDeviceUpdatedNotificationKey" receiver:self selector:sel__handleResidentEnabledForThisDeviceUpdatedNotification_];

  uint64_t v15 = [(HMHomeManager *)self context];
  uint64_t v16 = [v15 messageDispatcher];
  [v16 registerForMessage:@"HMHM.devicesUpdated" receiver:self selector:sel__handleDevicesUpdatedMessage_];

  uint64_t v17 = [(HMHomeManager *)self context];
  uint64_t v18 = [v17 messageDispatcher];
  [v18 registerForMessage:@"HM.su" receiver:self selector:sel__handleStatusUpdated_];

  id v19 = [(HMHomeManager *)self context];
  int v20 = [v19 messageDispatcher];
  [v20 registerForMessage:@"kResidentProvisioningStatusChangedNotificationKey" receiver:self selector:sel__handleResidentProvisioningStatusChanged_];

  id v21 = [(HMHomeManager *)self context];
  BOOL v22 = [v21 messageDispatcher];
  [v22 registerForMessage:@"HMHM.rtsun" receiver:self selector:sel__handleRuntimeStateUpdateNotification_];

  int64_t v23 = [(HMHomeManager *)self context];
  uint64_t v24 = [v23 messageDispatcher];
  [v24 registerForMessage:@"HMHM.accessAllowedWhenLockedUpdatedNotificationKey" receiver:self selector:sel__handleAccessAllowedWhenLockedUpdatedNotification_];

  id v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 addObserver:self selector:sel_handleDaemonReconnectedNotification_ name:@"HMDaemonReconnectedNotification" object:0];
}

- (NSString)metadataCache
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setServerGenerationCounterToken:(int)a3
{
  self->_serverGenerationCounterToken = a3;
}

- (void)_writeCaches:(id)a3 homeData:(BOOL)a4 metadata:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v6 && !v5) {
    _HMFPreconditionFailure();
  }
  uint64_t v9 = [(HMHomeManager *)self configuration];
  int v10 = [v9 canWriteToCache];

  if (v10)
  {
    id v11 = [(HMHomeManager *)self homeCacheDir];
    if (v11)
    {
      char v56 = 0;
      int v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v13 = [v12 fileExistsAtPath:v11 isDirectory:&v56];

      if (v13)
      {
        if (!v56)
        {
          uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
          uint64_t v15 = self;
          uint64_t v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v60 = v17;
            __int16 v61 = 2112;
            id v62 = v11;
            _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@The cache location %@ is not a directory", buf, 0x16u);
          }
          goto LABEL_33;
        }
      }
      else
      {
        uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v55 = 0;
        char v19 = [v18 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v55];
        id v20 = v55;

        if ((v19 & 1) == 0)
        {
          id v21 = (void *)MEMORY[0x19F3A64A0]();
          BOOL v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            int64_t v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v60 = v23;
            __int16 v61 = 2112;
            id v62 = v11;
            __int16 v63 = 2112;
            id v64 = v20;
            _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to make directory %@ (%@).", buf, 0x20u);
          }
        }
      }
      if (v6)
      {
        uint64_t v24 = (void *)[v8 mutableCopy];
        [v24 removeObjectForKey:@"kHAPMetadataDataKey"];
        uint64_t v25 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v24 requiringSecureCoding:1 error:0];
        unsigned int v26 = NSString;
        int v27 = [(HMHomeManager *)self configuration];
        int v28 = [v26 stringWithFormat:@"%@/%@.%lu.%lu.%@", v11, @"homeData", 5, objc_msgSend(v27, "options"), @"config"];

        id v54 = 0;
        id v49 = (void *)v25;
        LOBYTE(v25) = [(id)v25 writeToFile:v28 options:1 error:&v54];
        id v51 = v54;
        __int16 v29 = (void *)MEMORY[0x19F3A64A0]();
        int v30 = self;
        uint64_t v31 = HMFGetOSLogHandle();
        __int16 v32 = v31;
        if (v25)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            long long v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v60 = v33;
            __int16 v61 = 2112;
            id v62 = v28;
            _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_INFO, "%{public}@Wrote Home Configuration cache to %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            __int16 v34 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v60 = v34;
            __int16 v61 = 2112;
            id v62 = v51;
            _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to write Home Configuration cache file with error %@", buf, 0x16u);
          }
          [(HMHomeManager *)v30 _removeCacheFiles];
        }
      }
      if (v5)
      {
        uint64_t v35 = objc_msgSend(v8, "hmf_dataForKey:", @"kHAPMetadataDataKey");
        uint64_t v36 = objc_msgSend(v8, "hmf_numberForKey:", @"kHAPMetadataVersionKey");
        v57[0] = @"kHAPMetadataDataKey";
        v57[1] = @"kHAPMetadataVersionKey";
        uint64_t v50 = (void *)v36;
        int v52 = (void *)v35;
        v58[0] = v35;
        v58[1] = v36;
        int v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
        id v38 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v37 requiringSecureCoding:1 error:0];
        id v39 = NSString;
        uint64_t v40 = [(HMHomeManager *)self homeCacheDir];
        uint64_t v41 = [v39 stringWithFormat:@"%@/%@.%lu.%@", v40, @"metadata", 5, @"config"];

        id v53 = 0;
        LOBYTE(v35) = [v38 writeToFile:v41 options:1 error:&v53];
        id v42 = v53;
        __int16 v43 = (void *)MEMORY[0x19F3A64A0]();
        int v44 = self;
        __int16 v45 = HMFGetOSLogHandle();
        id v46 = v45;
        if (v35)
        {
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            uint64_t v47 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v60 = v47;
            __int16 v61 = 2112;
            id v62 = v41;
            _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_INFO, "%{public}@Writing metadata cache to %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v48 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v60 = v48;
            __int16 v61 = 2112;
            id v62 = v42;
            _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to write metadata cache file with error %@", buf, 0x16u);
          }
          [(HMHomeManager *)v44 _removeCacheFiles];
        }
      }
    }
LABEL_33:
  }
}

- (NSArray)incomingHomeInvitations
{
  uint64_t v2 = [(HMHomeManager *)self homeInvitations];
  uint64_t v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMMutableArray)homeInvitations
{
  return self->_homeInvitations;
}

- (void)_updateAppData:(id)a3
{
  [(HMHomeManager *)self setApplicationData:a3];
  id v4 = [(HMHomeManager *)self context];
  BOOL v5 = [v4 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HMHomeManager__updateAppData___block_invoke;
  block[3] = &unk_1E59452E8;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)setApplicationData:(id)a3
{
  id v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_setInitialHomes:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HMHomeManager *)self setPrimaryHome:0];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v11 = [(HMHomeManager *)self context];
        objc_msgSend(v10, "__configureWithContext:homeManager:", v11, self);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v7);
  }

  int v12 = [(HMHomeManager *)self currentHomes];
  [v12 setArray:v5];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        [v18 postConfigure];
        if ([v18 isPrimary]) {
          [(HMHomeManager *)self setPrimaryHome:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v15);
  }

  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  self->_initialMergeComplete = 1;
  os_unfair_lock_unlock(&self->_lock);
  id v20 = (void *)MEMORY[0x19F3A64A0]();
  id v21 = self;
  BOOL v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v23;
    __int16 v42 = 2112;
    id v43 = WeakRetained;
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying client did update homes for delegate: %@", buf, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v24 = [MEMORY[0x1E4F653F0] currentActivity];
    [v24 markWithReason:@"Notifying delegate homes did update"];
    uint64_t v25 = [(HMHomeManager *)v21 context];
    unsigned int v26 = [v25 delegateCaller];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __34__HMHomeManager__setInitialHomes___block_invoke;
    v28[3] = &unk_1E5945650;
    id v29 = WeakRetained;
    int v30 = v21;
    id v31 = v24;
    id v27 = v24;
    [v26 invokeBlock:v28];
  }
}

- (void)setPrimaryHome:(id)a3
{
  id v4 = (HMHome *)a3;
  os_unfair_lock_lock_with_options();
  primaryHome = self->_primaryHome;
  self->_primaryHome = v4;

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __34__HMHomeManager__setInitialHomes___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) homeManagerDidUpdateHomes:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 48);

  return [v2 markWithReason:@"Notified delegate homes did update"];
}

void __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke(uint64_t a1)
{
  v25[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  id v4 = [v2 setWithArray:v3];

  id v5 = objc_alloc(MEMORY[0x1E4F28DC0]);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = (void *)[v5 initForReadingFromData:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  [v8 _allowDecodingCyclesInSecureMode];
  uint64_t v9 = *MEMORY[0x1E4F284E8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v19 = *(id *)(v10 + 40);
  uint64_t v11 = [v8 decodeTopLevelObjectOfClasses:v4 forKey:v9 error:&v19];
  objc_storeStrong((id *)(v10 + 40), v19);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      BOOL v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive homes from home data: %@", buf, 0x16u);
    }
  }
}

- (void)_notifyDelegateOfAppDataUpdate
{
  uint64_t v3 = [(HMHomeManager *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(HMHomeManager *)self context];
    id v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__HMHomeManager__notifyDelegateOfAppDataUpdate__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    uint64_t v8 = self;
    [v5 invokeBlock:v6];
  }
}

- (void)__processSyncResponse:(id)a3 refreshRequested:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager __processSyncResponse:refreshRequested:completionHandler:]", @"completionHandler"];
    uint64_t v17 = v16 = self;
    uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = v16;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v30 = v21;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  uint64_t v10 = v9;
  uint64_t v11 = [(HMHomeManager *)self context];
  uint64_t v12 = [v11 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HMHomeManager___processSyncResponse_refreshRequested_completionHandler___block_invoke;
  block[3] = &unk_1E5941F40;
  id v24 = v8;
  uint64_t v25 = self;
  BOOL v28 = a4;
  id v26 = v11;
  id v27 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v8;
  dispatch_async(v12, block);
}

uint64_t __39__HMHomeManager__requestRuntimeUpdate___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(result + 32) _handleRuntimeStateUpdatePayload:a3 reason:*(void *)(result + 40)];
  }
  return result;
}

void __51__HMHomeManager_fetchDevicesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  id v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMHM.devices", v7);

  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = HMFGetOSLogHandle();
  uint64_t v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [*(id *)(a1 + 40) identifier];
      id v15 = [v14 shortDescription];
      int v24 = 138543874;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      id v27 = v15;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched devices: %@", (uint8_t *)&v24, 0x20u);
    }
    uint64_t v16 = [*(id *)(a1 + 48) delegateCaller];
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)(a1 + 56);
    id v19 = v8;
    id v20 = 0;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [*(id *)(a1 + 40) identifier];
      __int16 v23 = [v22 shortDescription];
      int v24 = 138543874;
      uint64_t v25 = v21;
      __int16 v26 = 2114;
      id v27 = v23;
      __int16 v28 = 2112;
      id v29 = v5;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch devices: %@", (uint8_t *)&v24, 0x20u);
    }
    uint64_t v16 = [*(id *)(a1 + 48) delegateCaller];
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)(a1 + 56);
    id v19 = 0;
    id v20 = v5;
  }
  [v16 callCompletion:v18 obj:v19 error:v20];
}

- (unint64_t)residentProvisioningStatus
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t residentProvisioningStatus = self->_residentProvisioningStatus;
  os_unfair_lock_unlock(p_lock);
  return residentProvisioningStatus;
}

uint64_t __28__HMHomeManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v307;
  logCategory__hmf_once_v307 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)createAccessorySettingsDataSource
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating accessory settings data source", buf, 0xCu);
  }
  uint64_t v7 = [(HMHomeManager *)v4 accessorySettingsMetricsDispatcher];
  if (!v7) {
    _HMFPreconditionFailure();
  }
  id v8 = (void *)v7;
  id v9 = [HMAccessorySettingsDataSource alloc];
  id v10 = [(HMHomeManager *)v4 context];
  uint64_t v11 = +[HMLocalization sharedManager];
  uint64_t v12 = [(HMHomeManager *)v4 eventRouter];
  id v13 = [(HMHomeManager *)v4 lastEventStore];
  id v14 = [(HMHomeManager *)v4 lastEventStore];
  id v15 = [(HMAccessorySettingsDataSource *)v9 initWithContext:v10 localizationManager:v11 messengerFactory:v4 subscriptionProvider:v12 lastEventStoreReadHandle:v13 lastEventStoreWriteHandle:v14 metricsDispatcher:v8];

  [(HMAccessorySettingsDataSource *)v15 setDataSource:v4];

  return v15;
}

- (HMELastEventStore)lastEventStore
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_lastEventStore;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMAccessorySettingsMetricsDispatcher)accessorySettingsMetricsDispatcher
{
  return (HMAccessorySettingsMetricsDispatcher *)objc_getProperty(self, a2, 288, 1);
}

- (int64_t)multiUserStatus
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t multiUserStatus = self->_multiUserStatus;
  os_unfair_lock_unlock(p_lock);
  return multiUserStatus;
}

- (void)setDelegate:(id)delegate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = delegate;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting HMHomeManager delegate to %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);

  if (WeakRetained == v4)
  {
    os_unfair_lock_unlock(&v6->_lock);
  }
  else
  {
    objc_storeWeak((id *)&v6->_delegate, v4);
    BOOL initialMergeComplete = v6->_initialMergeComplete;
    os_unfair_lock_unlock(&v6->_lock);
    if (initialMergeComplete)
    {
      uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v12 = v6;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v21 = v14;
        __int16 v22 = 2112;
        id v23 = v4;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying client did update homes for delegate: %@", buf, 0x16u);
      }
      if (objc_opt_respondsToSelector())
      {
        id v15 = [(HMHomeManager *)v12 context];
        uint64_t v16 = [v15 delegateCaller];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __29__HMHomeManager_setDelegate___block_invoke;
        v17[3] = &unk_1E5945628;
        id v18 = v4;
        uint64_t v19 = v12;
        [v16 invokeBlock:v17];
      }
    }
  }
}

void __49__HMHomeManager__isValidCachedHomeConfiguration___block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"kConfigGenerationCounterKey";
  v2[1] = @"kHAPMetadataVersionKey";
  v2[2] = @"kIdentifierSaltKey";
  v2[3] = @"kAccessAllowedWhenLockedKey";
  v2[4] = @"kHomeCountKey";
  v2[5] = @"kHomeDataKey";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  uint64_t v1 = (void *)_isValidCachedHomeConfiguration__requiredKeys;
  _isValidCachedHomeConfiguration__requiredKeys = v0;
}

- (id)createAccessorySettingsController
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating accessory settings controller", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v7 = [(HMHomeManager *)v4 accessorySettingsMetricsDispatcher];
  if (!v7) {
    _HMFPreconditionFailure();
  }
  id v8 = (void *)v7;
  id v9 = [HMAccessorySettingsController alloc];
  id v10 = [(HMHomeManager *)v4 context];
  uint64_t v11 = [(HMAccessorySettingsController *)v9 initWithContext:v10 messengerFactory:v4 metricsDispatcher:v8];

  [(HMAccessorySettingsController *)v11 setDataSource:v4];

  return v11;
}

- (id)accessorySettingsController:(id)a3 homeWithHomeIdentifier:(id)a4
{
  return [(HMHomeManager *)self homeWithUniqueIdentifier:a4];
}

- (id)createMultiuserSettingsMessenger
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMHomeManager *)self currentAccessory];
  id v4 = [v3 home];
  id v5 = [v4 uuid];

  id v6 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v19 = 138543618;
    id v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v5;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating multiuser settings messenger with home uuid %@", (uint8_t *)&v19, 0x16u);
  }
  if (v5)
  {
    id v10 = [HMMultiuserSettingsMessenger alloc];
    uint64_t v11 = [(HMHomeManager *)v7 context];
    uint64_t v12 = [v11 messageDispatcher];
    int v13 = [(HMMultiuserSettingsMessenger *)v10 initWithMessageDispatcher:v12 messageTargetUUID:v5];
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v15 = v7;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v17;
      __int16 v21 = 2112;
      __int16 v22 = 0;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@No current accessory home for home uuid: %@", (uint8_t *)&v19, 0x16u);
    }
    int v13 = 0;
  }

  return v13;
}

- (id)accessoryInfoDataProvider:(id)a3 homeWithHomeIdentifier:(id)a4
{
  return [(HMHomeManager *)self homeWithUniqueIdentifier:a4];
}

- (BOOL)accessoryInfoDataProvider:(id)a3 transformHomeUUID:(id)a4 accessoryUUID:(id)a5 toClientHomeIdentifier:(id *)a6 clientAccessoryIdentifier:(id *)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [(HMHomeManager *)self currentHomes];
  uint64_t v16 = [v15 firstItemWithUUID:v13];

  if (v16)
  {
    uint64_t v17 = [v16 accessoryWithUUID:v14];
    BOOL v18 = v17 != 0;
    if (v17)
    {
      if (a6)
      {
        *a6 = [v16 uniqueIdentifier];
      }
      if (a7)
      {
        *a7 = [v17 uniqueIdentifier];
      }
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = HMFGetLogIdentifier();
        int v28 = 138543874;
        id v29 = v26;
        __int16 v30 = 2112;
        id v31 = v14;
        __int16 v32 = 2112;
        uint64_t v33 = v16;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no accessory with uuid: %@ home: %@", (uint8_t *)&v28, 0x20u);
      }
    }
  }
  else
  {
    int v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      int v28 = 138543618;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no home with uuid: %@", (uint8_t *)&v28, 0x16u);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (id)createAccessoryInfoDataProvider
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMHomeManager *)self lastEventStore];
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating accessory info provider with last event store: %@", (uint8_t *)&v12, 0x16u);
  }
  id v8 = [HMAccessoryInfoDataProvider alloc];
  id v9 = [(HMHomeManager *)v5 eventRouter];
  id v10 = [(HMAccessoryInfoDataProvider *)v8 initWithEventStoreReadHandle:v3 subscriptionProvider:v9];

  [(HMAccessoryInfoDataProvider *)v10 setDataSource:v5];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetManager, 0);
  objc_storeStrong((id *)&self->_accessorySetupCoordinator, 0);
  objc_storeStrong((id *)&self->_userCloudShareManager, 0);
  objc_storeStrong((id *)&self->_firewallRuleManager, 0);
  objc_storeStrong((id *)&self->_softwareUpdateDocumentationManager, 0);
  objc_storeStrong((id *)&self->_predictionProvider, 0);
  objc_storeStrong((id *)&self->_cacheManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncOperationQueue, 0);
  objc_storeStrong((id *)&self->_currentHomes, 0);
  objc_storeStrong((id *)&self->_accessorySettingsMetricsDispatcher, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsMetricEventDispatcher, 0);
  objc_storeStrong((id *)&self->_migrationBoost, 0);
  objc_storeStrong((id *)&self->_xpcEventRouterClient, 0);
  objc_storeStrong(&self->_timerFactory, 0);
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_homeDataCache, 0);
  objc_storeStrong((id *)&self->_homeInvitations, 0);
  objc_storeStrong((id *)&self->_privacySettingsProvider, 0);
  objc_storeStrong((id *)&self->_cameraClipsQuotaMessenger, 0);
  objc_storeStrong((id *)&self->_sharedHomeUUIDsNotYetMigrated, 0);
  objc_storeStrong((id *)&self->_hh2MigrationFailedError, 0);
  objc_storeStrong((id *)&self->_lastRemovedCurrentAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_currentHome, 0);
  objc_storeStrong((id *)&self->_primaryHome, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastEventStore, 0);
  objc_storeStrong((id *)&self->_batchNotificationEndTimer, 0);
  objc_storeStrong((id *)&self->_batchNotificationReasons, 0);
  objc_storeStrong((id *)&self->_refreshRequests, 0);

  objc_storeStrong(&self->_pendingChangeSetupModeOperation, 0);
}

- (HMWidgetManager)widgetManager
{
  return (HMWidgetManager *)objc_getProperty(self, a2, 408, 1);
}

- (HMUserCloudShareManager)userCloudShareManager
{
  return (HMUserCloudShareManager *)objc_getProperty(self, a2, 392, 1);
}

- (HMNetworkRouterFirewallRuleManager)firewallRuleManager
{
  return self->_firewallRuleManager;
}

- (void)setSoftwareUpdateDocumentationManager:(id)a3
{
}

- (void)setPredictionProvider:(id)a3
{
}

- (void)setCacheManager:(id)a3
{
}

- (void)setViewServiceActive:(BOOL)a3
{
  self->_viewServiceActive = a3;
}

- (BOOL)isViewServiceActive
{
  return self->_viewServiceActive;
}

- (double)homeManagerCreationTimeStamp
{
  return self->_homeManagerCreationTimeStamp;
}

- (unint64_t)generationCounterPostHomeGraphUpdate
{
  return self->_generationCounterPostHomeGraphUpdate;
}

- (void)setMigrationBoost:(id)a3
{
}

- (HMMigrationBoost)migrationBoost
{
  return self->_migrationBoost;
}

- (void)setXpcEventRouterClient:(id)a3
{
}

- (void)setServerGenerationCounterDelayedConnectionToken:(int)a3
{
  self->_serverGenerationCounterDelayedConnectionToken = a3;
}

- (int)serverGenerationCounterDelayedConnectionToken
{
  return self->_serverGenerationCounterDelayedConnectionToken;
}

- (void)setShouldConnect:(BOOL)a3
{
  self->_shouldConnect = a3;
}

- (void)setHomeInvitations:(id)a3
{
}

- (void)setSharedHomeUUIDsNotYetMigrated:(id)a3
{
}

- (NSArray)sharedHomeUUIDsNotYetMigrated
{
  return self->_sharedHomeUUIDsNotYetMigrated;
}

- (NSUUID)lastRemovedCurrentAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 184, 1);
}

- (id)shareManager:(id)a3 homeWithUUID:(id)a4
{
  return [(HMHomeManager *)self _homeWithUUID:a4];
}

- (BOOL)isHomeRemovedPermanently:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(HMHomeManager *)self homes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v21 + 1) + 8 * i) uuid];
        char v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", v4);

        if (v11)
        {

          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v12 = [(HMHomeManager *)self sharedHomeUUIDsNotYetMigrated];
  id v13 = [v4 UUIDString];
  int v14 = [v12 containsObject:v13];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      BOOL v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v18;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Home: %@ is not removed permanently", buf, 0x16u);
    }
LABEL_14:
    BOOL v19 = 0;
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

- (BOOL)needsOSUpdateToRunHH2
{
  return 0;
}

- (void)launchHomeUIServiceToResumeSetupWithUserInfo:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    char v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    int v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Launching HomeUIService with userInfo: %@", (uint8_t *)&v13, 0x16u);
  }
  int v12 = objc_alloc_init(HMAccessorySetupManager);
  [(HMAccessorySetupManager *)v12 resumeAccessorySetupWithUserInfo:v6 completionHandler:v7];
}

- (void)addAndSetupAccessoriesWithPayload:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager addAndSetupAccessoriesWithPayload:completionHandler:]", @"completion"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    long long v21 = self;
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v23;
      __int16 v30 = 2112;
      uint64_t v31 = v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  uint64_t v8 = v7;
  id v9 = [(HMHomeManager *)self context];
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  char v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v29 = v13;
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)v6;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Adding and setting up accessories with setup accessory payload: %@", buf, 0x16u);
  }
  int v14 = objc_alloc_init(HMAccessorySetupRequest);
  __int16 v15 = [[HMAccessorySetupPayload alloc] initWithInternalSetupPayload:v6 ownershipToken:0];
  [(HMAccessorySetupRequest *)v14 setPayload:v15];

  id v16 = objc_alloc_init(HMAccessorySetupManager);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __69__HMHomeManager_addAndSetupAccessoriesWithPayload_completionHandler___block_invoke;
  v25[3] = &unk_1E5942148;
  void v25[4] = v11;
  id v26 = v9;
  id v27 = v8;
  id v17 = v8;
  id v18 = v9;
  [(HMAccessorySetupManager *)v16 performAccessorySetupUsingRequest:v14 completionHandler:v25];
}

void __69__HMHomeManager_addAndSetupAccessoriesWithPayload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 accessoryUniqueIdentifiers];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __69__HMHomeManager_addAndSetupAccessoriesWithPayload_completionHandler___block_invoke_786;
    id v18 = &unk_1E5942120;
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = v5;
    uint64_t v8 = objc_msgSend(v7, "na_map:", &v15);

    id v9 = objc_msgSend(*(id *)(a1 + 40), "delegateCaller", v15, v16, v17, v18, v19);
    [v9 callCompletion:*(void *)(a1 + 48) error:0 array:v8];
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = *(id *)(a1 + 32);
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v22 = v13;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform accessory setup with suggested room name: %@", buf, 0x16u);
    }
    int v14 = [*(id *)(a1 + 40) delegateCaller];
    [v14 callCompletion:*(void *)(a1 + 48) error:v6 array:0];
  }
}

id __69__HMHomeManager_addAndSetupAccessoriesWithPayload_completionHandler___block_invoke_786(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 homeUniqueIdentifier];
  id v6 = [v2 homeWithUniqueIdentifier:v5];

  id v7 = [v6 accessoryWithUniqueIdentifier:v4];

  return v7;
}

- (void)sendSetupModeMessage:(unint64_t)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(HMHomeManager *)self context];
  id v6 = (void *)MEMORY[0x1E4F654B0];
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v8 = [(HMHomeManager *)self uuid];
  id v9 = (void *)[v7 initWithTarget:v8];
  id v17 = @"mode";
  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  v18[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  int v12 = [v6 messageWithName:@"HMHM.setupMode" destination:v9 payload:v11];

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__HMHomeManager_sendSetupModeMessage___block_invoke;
  v14[3] = &unk_1E5943F78;
  objc_copyWeak(&v15, &location);
  [v12 setResponseHandler:v14];
  int v13 = [v5 messageDispatcher];
  [v13 sendMessage:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __38__HMHomeManager_sendSetupModeMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleSetupModeMessageResponse:v5 error:v8];
  }
}

- (void)setSetupMode:(unint64_t)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager setSetupMode:completion:]", @"completion"];
    __int16 v23 = (void *)MEMORY[0x19F3A64A0]();
    id v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v26;
      __int16 v30 = 2112;
      unint64_t v31 = v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v7 = (void (**)(void, void))v6;
  char v8 = _os_feature_enabled_impl();
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  int v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v13;
      __int16 v30 = 2048;
      unint64_t v31 = a3;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Attempt to set setup mode %lu", buf, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    if (v10->_pendingChangeSetupModeOperation)
    {
      os_unfair_lock_unlock(&v10->_lock);
      int v14 = (void *)MEMORY[0x19F3A64A0]();
      id v15 = v10;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v29 = v17;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Can only have one operation in flight", buf, 0xCu);
      }
      id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      ((void (**)(void, void *))v7)[2](v7, v18);
    }
    else
    {
      id v20 = _Block_copy(v7);
      id pendingChangeSetupModeOperation = v10->_pendingChangeSetupModeOperation;
      v10->_id pendingChangeSetupModeOperation = v20;

      v10->_pendingChangeSetupMode = a3;
      os_unfair_lock_unlock(&v10->_lock);
      [(HMHomeManager *)v10 sendSetupModeMessage:a3];
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v19;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Setup mode switch is not enabled short circuiting as success", buf, 0xCu);
    }
    v7[2](v7, 0);
  }
}

- (void)_handleSetupModeMessageResponse:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HMHomeManager *)self context];
  os_unfair_lock_lock_with_options();
  id v9 = _Block_copy(self->_pendingChangeSetupModeOperation);
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    id v10 = objc_msgSend(v6, "hmf_numberForKey:", @"mode");
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    int v12 = self;
    int v13 = HMFGetOSLogHandle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v14)
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v20 = v15;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@A setup mode number was returned", buf, 0xCu);
      }
    }
    else
    {
      if (v14)
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v20 = v18;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Calling setup mode completion", buf, 0xCu);
      }
      uint64_t v16 = [v8 delegateCaller];
      [v16 callCompletion:v9 error:v7];

      os_unfair_lock_lock_with_options();
      id pendingChangeSetupModeOperation = self->_pendingChangeSetupModeOperation;
      self->_id pendingChangeSetupModeOperation = 0;

      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)handleDaemonReconnectedNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v5 = _Block_copy(self->_pendingChangeSetupModeOperation);
  unint64_t pendingChangeSetupMode = self->_pendingChangeSetupMode;
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    char v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v10;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Sending setup mode message on reconnecting", (uint8_t *)&v11, 0xCu);
    }
    [(HMHomeManager *)v8 sendSetupModeMessage:pendingChangeSetupMode];
  }
}

- (void)attemptHH2AutoMigrationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHomeManager *)self context];
  id v6 = (void *)MEMORY[0x1E4F654B0];
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  char v8 = [(HMHomeManager *)self uuid];
  id v9 = (void *)[v7 initWithTarget:v8];
  id v10 = [v6 messageWithName:@"HMHM.attemptHH2AutoMigration" destination:v9 payload:0];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __62__HMHomeManager_attemptHH2AutoMigrationWithCompletionHandler___block_invoke;
  id v17 = &unk_1E5944EF0;
  id v18 = v5;
  id v19 = v4;
  id v11 = v4;
  id v12 = v5;
  [v10 setResponseHandler:&v14];
  uint64_t v13 = objc_msgSend(v12, "messageDispatcher", v14, v15, v16, v17);
  [v13 sendMessage:v10];
}

void __62__HMHomeManager_attemptHH2AutoMigrationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)_saveMigrationProgressToHMCache:(BOOL)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMHomeManager *)self cacheManager];

  if (v7)
  {
    char v8 = [(HMHomeManager *)self cacheManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__HMHomeManager__saveMigrationProgressToHMCache_error___block_invoke;
    v13[3] = &unk_1E59420F8;
    v13[4] = self;
    BOOL v15 = a3;
    id v14 = v6;
    [v8 cacheWithName:@"HMHM.HH2MigrationCacheName" completion:v13];
  }
  else
  {
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v17 = v12;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@This client is not running with cache configuration so not going to store migration info.", buf, 0xCu);
    }
  }
}

void __55__HMHomeManager__saveMigrationProgressToHMCache_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v18 = 138543618;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Got a new cache with [%@]", (uint8_t *)&v18, 0x16u);
  }
  char v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v3 setNumber:v8 forKey:@"HMHM.HH2MigrationInProgress"];

  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "generationCounter"));
  [v3 setNumber:v9 forKey:@"HMHM.HH2MigrationGenCounterValue"];

  id v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = encodeRootObject(v10);
    if (v11)
    {
      id v12 = (void *)MEMORY[0x19F3A64A0]();
      id v13 = *(id *)(a1 + 32);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        BOOL v15 = HMFGetLogIdentifier();
        uint64_t v16 = *(void **)(a1 + 40);
        int v18 = 138543618;
        id v19 = v15;
        __int16 v20 = 2112;
        id v21 = v16;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@HH2 Migration failed error code: %@", (uint8_t *)&v18, 0x16u);
      }
      [v3 setData:v11 forKey:@"HMHM.HH2MigrationFailedError"];
    }
  }
  id v17 = [*(id *)(a1 + 32) cacheManager];
  [v17 forceFlushToDisk];
}

- (void)fetchAppleMediaAccesoryDiagnosticInfo:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    uint64_t v27 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager fetchAppleMediaAccesoryDiagnosticInfo:options:completion:]", @"completionHandler"];
    id v28 = (void *)MEMORY[0x19F3A64A0]();
    id v29 = self;
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      unint64_t v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v39 = v31;
      __int16 v40 = 2112;
      uint64_t v41 = v27;
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
    objc_exception_throw(v32);
  }
  id v10 = v9;
  id v11 = [(HMHomeManager *)self context];
  id v12 = [v8 uuid];
  if (v12)
  {
    id v13 = (void *)MEMORY[0x1E4F654B0];
    id v14 = objc_alloc(MEMORY[0x1E4F65488]);
    BOOL v15 = [(HMHomeManager *)self uuid];
    uint64_t v16 = (void *)[v14 initWithTarget:v15];
    v36[0] = @"options";
    id v17 = [NSNumber numberWithUnsignedInteger:a4];
    v36[1] = @"accessoryUUID";
    v37[0] = v17;
    v37[1] = v12;
    int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    id v19 = [v13 messageWithName:@"HMHM.accessoryDiagnosticInfo" destination:v16 payload:v18];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    id v33[2] = __74__HMHomeManager_fetchAppleMediaAccesoryDiagnosticInfo_options_completion___block_invoke;
    v33[3] = &unk_1E5944EF0;
    id v20 = v11;
    id v34 = v20;
    id v35 = v10;
    [v19 setResponseHandler:v33];
    id v21 = [v20 messageDispatcher];
    [v21 sendMessage:v19 completionHandler:0];

    uint64_t v22 = v34;
  }
  else
  {
    __int16 v23 = (void *)MEMORY[0x19F3A64A0]();
    id v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v39 = v26;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not determine accessory UUID", buf, 0xCu);
    }
    id v19 = [v11 delegateCaller];
    uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v19 callCompletion:v10 obj:0 error:v22];
  }
}

void __74__HMHomeManager_fetchAppleMediaAccesoryDiagnosticInfo_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "hmf_dataForKey:", @"accessoryDiagnosticData");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8) {
    id v6 = [[HMAccessoryDiagnosticInfo alloc] initWithProtoData:v8];
  }
  else {
    id v6 = 0;
  }
  id v7 = [*(id *)(a1 + 32) delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) obj:v6 error:v5];
}

- (void)clearMobileAssetsLocalInfoWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager clearMobileAssetsLocalInfoWithCompletion:]", @"completion"];
    v16 = BOOL v15 = self;
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    int v18 = v15;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v5 = v4;
  id v6 = [(HMHomeManager *)self context];
  id v7 = (void *)MEMORY[0x1E4F654B0];
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  id v9 = [(HMHomeManager *)self uuid];
  id v10 = (void *)[v8 initWithTarget:v9];
  id v11 = [v7 messageWithName:@"HMHM.clearMobileAssetsInfo" destination:v10 payload:0];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__HMHomeManager_clearMobileAssetsLocalInfoWithCompletion___block_invoke;
  v22[3] = &unk_1E5944EF0;
  id v23 = v6;
  id v24 = v5;
  id v12 = v5;
  id v13 = v6;
  [v11 setResponseHandler:v22];
  id v14 = [v13 messageDispatcher];
  [v14 sendMessage:v11 completionHandler:0];
}

void __58__HMHomeManager_clearMobileAssetsLocalInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegateCaller];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HMHomeManager_clearMobileAssetsLocalInfoWithCompletion___block_invoke_2;
  v7[3] = &unk_1E59454E8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 invokeBlock:v7];
}

uint64_t __58__HMHomeManager_clearMobileAssetsLocalInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)updateMobileAssetsAndForce:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager updateMobileAssetsAndForce:completion:]", @"completion"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      unint64_t v31 = v23;
      __int16 v32 = 2112;
      uint64_t v33 = v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  id v7 = v6;
  id v8 = [(HMHomeManager *)self context];
  id v9 = (void *)MEMORY[0x1E4F654B0];
  id v10 = objc_alloc(MEMORY[0x1E4F65488]);
  id v11 = [(HMHomeManager *)self uuid];
  id v12 = (void *)[v10 initWithTarget:v11];
  uint64_t v28 = @"HMHomeManagerForceUpdateMobileAssetMessageKey";
  id v13 = [NSNumber numberWithBool:v4];
  uint64_t v29 = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  BOOL v15 = [v9 messageWithName:@"HMHM.updateMobileAssets" destination:v12 payload:v14];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __55__HMHomeManager_updateMobileAssetsAndForce_completion___block_invoke;
  v25[3] = &unk_1E5944EF0;
  id v26 = v8;
  id v27 = v7;
  id v16 = v7;
  id v17 = v8;
  [v15 setResponseHandler:v25];
  int v18 = [v17 messageDispatcher];
  [v18 sendMessage:v15 completionHandler:0];
}

void __55__HMHomeManager_updateMobileAssetsAndForce_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = a3;
    uint64_t v6 = objc_msgSend(v8, "hmf_integerForKey:error:", @"HMHomeManagerOldVersionMessageKey", 0);
    uint64_t v7 = objc_msgSend(v8, "hmf_integerForKey:error:", @"HMHomeManagerNewVersionMessageKey", 0);
  }
  id v9 = [*(id *)(a1 + 32) delegateCaller];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HMHomeManager_updateMobileAssetsAndForce_completion___block_invoke_2;
  v12[3] = &unk_1E59420D0;
  id v10 = *(id *)(a1 + 40);
  uint64_t v15 = v6;
  uint64_t v16 = v7;
  id v13 = v5;
  id v14 = v10;
  id v11 = v5;
  [v9 invokeBlock:v12];
}

uint64_t __55__HMHomeManager_updateMobileAssetsAndForce_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[7], a1[4]);
}

- (void)fetchWiFiInfosForHomesWithTimeout:(double)a3 partialResultHandler:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void (**)(id, void *))a5;
  id v9 = [(HMHomeManager *)self context];
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
        id v10 = (void *)MEMORY[0x19F3A64A0]();
        id v11 = self;
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v26 = v13;
          _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Not yet implemented", buf, 0xCu);
        }
        id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        v8[2](v8, v14);

        goto LABEL_10;
      }
      uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager fetchWiFiInfosForHomesWithTimeout:partialResultHandler:completion:]", @"completionHandler"];
      id v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_15:

        id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
        objc_exception_throw(v24);
      }
    }
    else
    {
      uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager fetchWiFiInfosForHomesWithTimeout:partialResultHandler:completion:]", @"partialResultHandler"];
      id v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
    }
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v26 = v23;
    __int16 v27 = 2112;
    uint64_t v28 = (const char *)v19;
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    goto LABEL_15;
  }
  uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v26 = v18;
    __int16 v27 = 2080;
    uint64_t v28 = "-[HMHomeManager fetchWiFiInfosForHomesWithTimeout:partialResultHandler:completion:]";
    _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
  }
LABEL_10:
}

- (void)fetchCachedWiFiInfosForHomesWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void, void *))a3;
  id v5 = [(HMHomeManager *)self context];
  if (v5)
  {
    if (!v4)
    {
      uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager fetchCachedWiFiInfosForHomesWithCompletionHandler:]", @"completionHandler"];
      uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
      id v17 = self;
      int v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v19;
        __int16 v23 = 2112;
        id v24 = (const char *)v15;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
      objc_exception_throw(v20);
    }
    uint64_t v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v9;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Not yet implemented", buf, 0xCu);
    }
    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v4[2](v4, MEMORY[0x1E4F1CC08], v10);
  }
  else
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v14;
      __int16 v23 = 2080;
      id v24 = "-[HMHomeManager fetchCachedWiFiInfosForHomesWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)fetchNetworkMismatchInfoWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHomeManager *)self context];
  if (v5)
  {
    if (!v4)
    {
      uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager fetchNetworkMismatchInfoWithCompletionHandler:]", @"completionHandler"];
      int v18 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v19 = self;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v27 = v21;
        __int16 v28 = 2112;
        uint64_t v29 = (const char *)v17;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
      }
      id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
      objc_exception_throw(v22);
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F654B0];
    id v7 = objc_alloc(MEMORY[0x1E4F65488]);
    id v8 = [(HMHomeManager *)self uuid];
    id v9 = (void *)[v7 initWithTarget:v8];
    id v10 = [v6 messageWithName:@"HMHM.networkMismatchInfo" destination:v9 payload:0];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63__HMHomeManager_fetchNetworkMismatchInfoWithCompletionHandler___block_invoke;
    v23[3] = &unk_1E5944EF0;
    id v11 = v5;
    id v24 = v11;
    id v25 = v4;
    [v10 setResponseHandler:v23];
    id v12 = [v11 messageDispatcher];
    [v12 sendMessage:v10 completionHandler:0];
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v16;
      __int16 v28 = 2080;
      uint64_t v29 = "-[HMHomeManager fetchNetworkMismatchInfoWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __63__HMHomeManager_fetchNetworkMismatchInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)fetchDiagnosticInfoWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager fetchDiagnosticInfoWithCompletionHandler:]", @"completionHandler"];
    v16 = uint64_t v15 = self;
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    int v18 = v15;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      uint64_t v28 = v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v5 = v4;
  uint64_t v6 = [(HMHomeManager *)self context];
  id v7 = (void *)MEMORY[0x1E4F654B0];
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  id v9 = [(HMHomeManager *)self uuid];
  id v10 = (void *)[v8 initWithTarget:v9];
  id v11 = [v7 messageWithName:@"HMHM.currentDeviceDiagnosticInfo" destination:v10 payload:0];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__HMHomeManager_fetchDiagnosticInfoWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E5944EF0;
  id v23 = v6;
  id v24 = v5;
  id v12 = v5;
  id v13 = v6;
  [v11 setResponseHandler:v22];
  id v14 = [v13 messageDispatcher];
  [v14 sendMessage:v11 completionHandler:0];
}

void __58__HMHomeManager_fetchDiagnosticInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 delegateCaller];
  [v8 callCompletion:*(void *)(a1 + 40) obj:v6 error:v7];
}

- (void)_testHH2MigrationWithCompletionHandler:(id)a3 payload:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager _testHH2MigrationWithCompletionHandler:payload:]", @"completion"];
    id v23 = (void *)MEMORY[0x19F3A64A0]();
    id v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v32 = v26;
      __int16 v33 = 2112;
      uint64_t v34 = v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v8 = v7;
  id v9 = [(HMHomeManager *)self context];
  if (isInternalBuild())
  {
    id v10 = (void *)MEMORY[0x1E4F654B0];
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    id v12 = [(HMHomeManager *)self uuid];
    id v13 = (void *)[v11 initWithTarget:v12];
    id v14 = [v10 messageWithName:@"HMHM.testHH2Migration" destination:v13 payload:v8];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64__HMHomeManager__testHH2MigrationWithCompletionHandler_payload___block_invoke;
    v28[3] = &unk_1E5944EF0;
    id v15 = v9;
    id v29 = v15;
    id v30 = v6;
    [v14 setResponseHandler:v28];
    uint64_t v16 = [v15 messageDispatcher];
    [v16 sendMessage:v14 completionHandler:0];

    uint64_t v17 = v29;
  }
  else
  {
    int v18 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v21;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_FAULT, "%{public}@Not allowed to run in production / customer builds", buf, 0xCu);
    }
    id v14 = [v9 delegateCaller];
    uint64_t v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v14 callCompletion:v6 error:v17];
  }
}

void __64__HMHomeManager__testHH2MigrationWithCompletionHandler_payload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)_upgradeToHH2WithCompletionHandler:(id)a3 payload:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager _upgradeToHH2WithCompletionHandler:payload:]", @"completion"];
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v22;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  id v8 = v7;
  id v9 = [(HMHomeManager *)self context];
  id v10 = (void *)MEMORY[0x1E4F654B0];
  id v11 = objc_alloc(MEMORY[0x1E4F65488]);
  id v12 = [(HMHomeManager *)self uuid];
  id v13 = (void *)[v11 initWithTarget:v12];
  id v14 = [v10 messageWithName:@"HMHM.upgradeToHH2" destination:v13 payload:v8];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__HMHomeManager__upgradeToHH2WithCompletionHandler_payload___block_invoke;
  v24[3] = &unk_1E5945510;
  void v24[4] = self;
  id v25 = v9;
  id v26 = v6;
  id v15 = v6;
  id v16 = v9;
  [v14 setResponseHandler:v24];
  uint64_t v17 = [v16 messageDispatcher];
  [v17 sendMessage:v14 completionHandler:0];
}

void __60__HMHomeManager__upgradeToHH2WithCompletionHandler_payload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v22 = 138543618;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Upgrade to HH2 request finished with error : %@", (uint8_t *)&v22, 0x16u);
  }
  [*(id *)(a1 + 32) setHh2MigrationInProgress:v5 == 0];
  [*(id *)(a1 + 32) setHh2MigrationFailedError:v5];
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v11 isHH2MigrationInProgress];
  id v13 = [*(id *)(a1 + 32) hh2MigrationFailedError];
  [v11 _saveMigrationProgressToHMCache:v12 error:v13];

  id v14 = [*(id *)(a1 + 40) delegateCaller];
  [v14 callCompletion:*(void *)(a1 + 48) error:v5];

  id v15 = [HMMigrationBoost alloc];
  id v16 = [*(id *)(a1 + 32) uuid];
  uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v18 = [*(id *)(a1 + 40) messageDispatcher];
  uint64_t v19 = [*(id *)(a1 + 40) queue];
  id v20 = [(HMMigrationBoost *)v15 initWithMessageTarget:v16 notificationCenter:v17 messageDispatcher:v18 queue:v19];
  [*(id *)(a1 + 32) setMigrationBoost:v20];

  id v21 = [*(id *)(a1 + 32) migrationBoost];
  [v21 startBoost];
}

- (void)upgradeToROARWithCompletionHandler:(id)a3
{
}

- (void)timerDidFire:(id)a3
{
  id v4 = (HMFTimer *)a3;
  id v5 = [(HMHomeManager *)self context];
  id v6 = [v5 queue];
  dispatch_assert_queue_V2(v6);

  batchNotificationEndTimer = self->_batchNotificationEndTimer;
  if (batchNotificationEndTimer == v4)
  {
    [(HMHomeManager *)self _forceBatchNotificationsEnd];
  }
}

- (void)_addKeysToRepairListIfUnique:(id)a3 includePrivateKeys:(BOOL)a4 repairList:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HMHomeManager__addKeysToRepairListIfUnique_includePrivateKeys_repairList___block_invoke;
  v9[3] = &unk_1E59420A8;
  BOOL v11 = a4;
  id v10 = v7;
  id v8 = v7;
  [a3 enumerateObjectsUsingBlock:v9];
}

void __76__HMHomeManager__addKeysToRepairListIfUnique_includePrivateKeys_repairList___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F65508]);
  id v5 = [v3 identifier];
  id v6 = [v3 publicKey];
  if (*(unsigned char *)(a1 + 40))
  {
    id v7 = [v3 privateKey];
    id v8 = (void *)[v4 initWithIdentifier:v5 publicKey:v6 privateKey:v7];
  }
  else
  {
    id v8 = (void *)[v4 initWithIdentifier:v5 publicKey:v6 privateKey:0];
  }

  id v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__HMHomeManager__addKeysToRepairListIfUnique_includePrivateKeys_repairList___block_invoke_2;
  v11[3] = &unk_1E5942080;
  id v10 = v8;
  id v12 = v10;
  if ((objc_msgSend(v9, "na_any:", v11) & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v10];
  }
}

uint64_t __76__HMHomeManager__addKeysToRepairListIfUnique_includePrivateKeys_repairList___block_invoke_2()
{
  return HMFEqualObjects();
}

- (id)allPairingIdentitiesInRankOrderWithError:(id *)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (CFPreferencesGetAppBooleanValue(@"kHMDDemoModeStatusKey", @"com.apple.homed", 0))
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@allPairingIdentitiesInRankOrderWithError returning empty array because demo mode is on.", buf, 0xCu);
    }
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2050000000;
    id v9 = (void *)getHAPSystemKeychainStoreClass_softClass;
    uint64_t v60 = getHAPSystemKeychainStoreClass_softClass;
    if (!getHAPSystemKeychainStoreClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getHAPSystemKeychainStoreClass_block_invoke;
      id v64 = &unk_1E5943DD8;
      uint64_t v65 = &v57;
      __getHAPSystemKeychainStoreClass_block_invoke((uint64_t)buf);
      id v9 = (void *)v58[3];
    }
    long long v38 = self;
    id v10 = v9;
    _Block_object_dispose(&v57, 8);
    long long v39 = [v10 systemStore];
    id v8 = [MEMORY[0x1E4F1CA48] array];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    long long v53 = 0u;
    uint64_t v40 = [&unk_1EEF08F30 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v40)
    {
      uint64_t v37 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v54 != v37) {
            objc_enumerationMutation(&unk_1EEF08F30);
          }
          BOOL v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          id v52 = 0;
          int v44 = v11;
          uint64_t v42 = objc_msgSend(v39, "allKeysForType:error:");
          id v41 = v52;
          id v12 = (void *)MEMORY[0x19F3A64A0]();
          __int16 v45 = v38;
          id v13 = HMFGetOSLogHandle();
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
          if (v41)
          {
            if (v14)
            {
              id v15 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v15;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v44;
              *(_WORD *)&buf[22] = 2112;
              id v64 = v41;
              _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Unable to find pairing identity for type %@: %@", buf, 0x20u);
            }
          }
          else
          {
            if (v14)
            {
              id v16 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              *(void *)&uint8_t buf[4] = v16;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v42;
              *(_WORD *)&buf[22] = 2112;
              id v64 = v44;
              _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Found [%@] of type : %@", buf, 0x20u);
            }
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v17 = v42;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v61 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v49;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v49 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  id v21 = *(void **)(*((void *)&v48 + 1) + 8 * j);
                  id v22 = objc_alloc(MEMORY[0x1E4F65508]);
                  id v23 = [v21 identifier];
                  __int16 v24 = [v21 publicKey];
                  id v25 = [v21 privateKey];
                  uint64_t v26 = (void *)[v22 initWithIdentifier:v23 publicKey:v24 privateKey:v25];

                  v46[0] = MEMORY[0x1E4F143A8];
                  v46[1] = 3221225472;
                  v46[2] = __58__HMHomeManager_allPairingIdentitiesInRankOrderWithError___block_invoke;
                  v46[3] = &unk_1E5942080;
                  id v27 = v26;
                  id v47 = v27;
                  if (objc_msgSend(v8, "na_any:", v46))
                  {
                    uint64_t v28 = (void *)MEMORY[0x19F3A64A0]();
                    __int16 v29 = v45;
                    uint64_t v30 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v31 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543874;
                      *(void *)&uint8_t buf[4] = v31;
                      *(_WORD *)&unsigned char buf[12] = 2112;
                      *(void *)&buf[14] = v27;
                      *(_WORD *)&buf[22] = 2112;
                      id v64 = v44;
                      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_INFO, "%{public}@Not adding key [%@] [%@] as it already exist in final list", buf, 0x20u);
                    }
                  }
                  else
                  {
                    [v8 addObject:v27];
                  }
                }
                uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v61 count:16];
              }
              while (v18);
            }
          }
        }
        uint64_t v40 = [&unk_1EEF08F30 countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v40);
    }
    __int16 v32 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v33 = v38;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v35;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_INFO, "%{public}@Returning pairing identities: %@", buf, 0x16u);
    }
  }

  return v8;
}

uint64_t __58__HMHomeManager_allPairingIdentitiesInRankOrderWithError___block_invoke()
{
  return HMFEqualObjects();
}

- (void)fetchAllPairingIdentitiesForRepairFlowWithCompletionHandler:(id)a3
{
  id v7 = 0;
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = [(HMHomeManager *)self allPairingIdentitiesInRankOrderWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:completionHandler:]", @"accessoryUniqueIdentifier"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
LABEL_7:
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v23;
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  id v8 = v7;
  if (!v7)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier:completionHandler:]", @"completion"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v9 = [(HMHomeManager *)self context];
  uint64_t v28 = @"kIdentifierKey";
  id v29 = v6;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v11 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  id v13 = [(HMHomeManager *)self uuid];
  BOOL v14 = (void *)[v12 initWithTarget:v13];
  id v15 = (void *)[v11 initWithName:@"HMHM.cuacpi" destination:v14 payload:v10];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __108__HMHomeManager_currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_1E5945510;
  void v25[4] = self;
  id v26 = v6;
  id v27 = v8;
  id v16 = v8;
  id v17 = v6;
  [v15 setResponseHandler:v25];
  uint64_t v18 = [v9 messageDispatcher];
  [v18 sendMessage:v15];
}

void __108__HMHomeManager_currentUserPairingIdentityForHomeContainingAccessoryWithUniqueIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v11;
      __int16 v35 = 2112;
      long long v36 = v12;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@There was an error while retrieving pairing identity for a user in the home with accessory %@ : %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v13 = objc_msgSend(v6, "hmf_dataForKey:", @"HM.pairingIdentity");
    if (v13)
    {
      id v32 = 0;
      BOOL v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:&v32];
      id v15 = v32;
      id v16 = (void *)MEMORY[0x19F3A64A0]();
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = HMFGetOSLogHandle();
      uint64_t v19 = v18;
      if (v14)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          id v21 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          uint64_t v34 = v20;
          __int16 v35 = 2112;
          long long v36 = v14;
          __int16 v37 = 2112;
          id v38 = v21;
          _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@HM: Fetched pairing identity [%@] for a user in the home with accessory : %@", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          id v29 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          uint64_t v34 = v28;
          __int16 v35 = 2112;
          long long v36 = v29;
          __int16 v37 = 2112;
          id v38 = v15;
          _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive pairing identity a user in the home with accessory from encoded pairing identity: %@, %@", buf, 0x20u);
        }
        uint64_t v30 = *(void *)(a1 + 48);
        uint64_t v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        (*(void (**)(uint64_t, void, void *))(v30 + 16))(v30, 0, v31);
      }
    }
    else
    {
      id v22 = (void *)MEMORY[0x19F3A64A0]();
      id v23 = *(id *)(a1 + 32);
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        id v26 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v25;
        __int16 v35 = 2112;
        long long v36 = v26;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@HomeKitDaemon did not send any pairing identity a user in the home with accessory : %@", buf, 0x16u);
      }
      uint64_t v27 = *(void *)(a1 + 48);
      id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      (*(void (**)(uint64_t, void, id))(v27 + 16))(v27, 0, v15);
    }
  }
}

- (void)pairingIdentityForAccessoryWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager pairingIdentityForAccessoryWithIdentifier:completionHandler:]", @"accessoryIdentifier"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
LABEL_7:
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v23;
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  id v8 = v7;
  if (!v7)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager pairingIdentityForAccessoryWithIdentifier:completionHandler:]", @"completion"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v9 = [(HMHomeManager *)self context];
  uint64_t v28 = @"kIdentifierKey";
  id v29 = v6;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v11 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  id v13 = [(HMHomeManager *)self uuid];
  BOOL v14 = (void *)[v12 initWithTarget:v13];
  id v15 = (void *)[v11 initWithName:@"HMHM.acpi" destination:v14 payload:v10];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__HMHomeManager_pairingIdentityForAccessoryWithIdentifier_completionHandler___block_invoke;
  v25[3] = &unk_1E5945510;
  void v25[4] = self;
  id v26 = v6;
  id v27 = v8;
  id v16 = v8;
  id v17 = v6;
  [v15 setResponseHandler:v25];
  uint64_t v18 = [v9 messageDispatcher];
  [v18 sendMessage:v15];
}

void __77__HMHomeManager_pairingIdentityForAccessoryWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v11;
      __int16 v35 = 2112;
      long long v36 = v12;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@There was an error while retrieving pairing identity for %@ : %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v13 = objc_msgSend(v6, "hmf_dataForKey:", @"HM.pairingIdentity");
    if (v13)
    {
      id v32 = 0;
      BOOL v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:&v32];
      id v15 = v32;
      id v16 = (void *)MEMORY[0x19F3A64A0]();
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = HMFGetOSLogHandle();
      uint64_t v19 = v18;
      if (v14)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v20 = HMFGetLogIdentifier();
          id v21 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          uint64_t v34 = v20;
          __int16 v35 = 2112;
          long long v36 = v14;
          __int16 v37 = 2112;
          id v38 = v21;
          _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@HM: Fetched pairing identity [%@] for accessory : %@", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          id v29 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          uint64_t v34 = v28;
          __int16 v35 = 2112;
          long long v36 = v29;
          __int16 v37 = 2112;
          id v38 = v15;
          _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive pairing identity from encoded pairing identity: %@, %@", buf, 0x20u);
        }
        uint64_t v30 = *(void *)(a1 + 48);
        uint64_t v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        (*(void (**)(uint64_t, void, void *))(v30 + 16))(v30, 0, v31);
      }
    }
    else
    {
      id v22 = (void *)MEMORY[0x19F3A64A0]();
      id v23 = *(id *)(a1 + 32);
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        id v26 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v34 = v25;
        __int16 v35 = 2112;
        long long v36 = v26;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@HomeKitDaemon did not send any pairing identity for accessory : %@", buf, 0x16u);
      }
      uint64_t v27 = *(void *)(a1 + 48);
      id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      (*(void (**)(uint64_t, void, id))(v27 + 16))(v27, 0, v15);
    }
  }
}

- (void)_handleResidentProvisioningStatusChanged:(id)a3
{
  id v4 = [a3 numberForKey:@"kProvisioningStatusKey"];
  -[HMHomeManager setResidentProvisioningStatus:](self, "setResidentProvisioningStatus:", [v4 integerValue]);
}

- (void)_handleAccessAllowedWhenLockedUpdatedNotification:(id)a3
{
  char v5 = 0;
  uint64_t v4 = [a3 BOOLForKey:@"kAccessAllowedWhenLockedKey" keyPresent:&v5];
  if (v4 != [(HMHomeManager *)self isAccessAllowedWhenLocked])
  {
    [(HMHomeManager *)self setAccessAllowedWhenLocked:v4];
    [(HMHomeManager *)self _notifyAccessAllowedWhenLockedUpdated:v4];
  }
}

- (void)_handleDevicesUpdatedMessage:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  id v6 = [v4 unarchivedObjectForKey:@"HMHM.devices" ofClasses:v5];

  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v24 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Devices updated", buf, 0xCu);
    }
    id v12 = [(HMHomeManager *)v8 delegate];
    if ([v12 conformsToProtocol:&unk_1EEF6FE30]) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    if (objc_opt_respondsToSelector())
    {
      id v15 = [(HMHomeManager *)v8 context];
      id v16 = [v15 delegateCaller];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __46__HMHomeManager__handleDevicesUpdatedMessage___block_invoke;
      v19[3] = &unk_1E5945650;
      id v20 = v14;
      id v21 = v8;
      id v22 = v6;
      [v16 invokeBlock:v19];
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      id v24 = v17;
      __int16 v25 = 2112;
      id v26 = v18;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find devices in devices updated message payload: %@", buf, 0x16u);
    }
  }
}

uint64_t __46__HMHomeManager__handleDevicesUpdatedMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateDevices:*(void *)(a1 + 48)];
}

- (void)_handleResidentEnabledForThisDeviceUpdatedNotification:(id)a3
{
  id v4 = a3;
  char v5 = [(HMHomeManager *)self context];
  id v6 = [v5 pendingRequests];
  id v7 = [v4 identifier];
  id v12 = [v6 removeCompletionBlockForIdentifier:v7];

  uint64_t v8 = [v4 BOOLForKey:@"kResidentEnabledKey"];
  if (v8 == [(HMHomeManager *)self isResidentEnabledForThisDevice])
  {
    id v9 = v12;
    if (!v12) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  [(HMHomeManager *)self setResidentEnabledForThisDevice:v8];
  if (v12)
  {
LABEL_5:
    id v10 = [(HMHomeManager *)self context];
    id v11 = [v10 delegateCaller];
    [v11 callCompletion:v12 error:0];

    goto LABEL_6;
  }
  [(HMHomeManager *)self notifyResidentEnabledUpdated:v8];
LABEL_6:
  id v9 = v12;
LABEL_7:
}

- (void)_handleResidentDeviceCapableUpdatedNotification:(id)a3
{
  uint64_t v4 = [a3 BOOLForKey:@"kResidentCapableDeviceKey"];
  if (v4 != [(HMHomeManager *)self isThisDeviceResidentCapable])
  {
    [(HMHomeManager *)self setThisDeviceResidentCapable:v4];
    if ((v4 & 1) == 0 && [(HMHomeManager *)self isResidentEnabledForThisDevice])
    {
      [(HMHomeManager *)self setResidentEnabledForThisDevice:0];
      [(HMHomeManager *)self notifyResidentEnabledUpdated:0];
    }
    [(HMHomeManager *)self notifyResidentCapableUpdated:v4];
  }
}

- (void)_updateInvitation:(id)a3 presenceAuthStatus:(unint64_t)a4 invitationState:(int64_t)a5 invitationOptions:(int64_t)a6 completionHandler:(id)a7
{
  v43[5] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v34 = a7;
  uint64_t v33 = [(HMHomeManager *)self context];
  v42[0] = @"kInvitationIdentifierKey";
  id v13 = [v12 identifier];
  id v14 = [v13 UUIDString];
  v43[0] = v14;
  v42[1] = @"kInvitationStateKey";
  id v15 = [NSNumber numberWithInteger:a5];
  v43[1] = v15;
  v42[2] = @"kInvitationResponseOptionsKey";
  id v16 = [NSNumber numberWithInteger:a6];
  v43[2] = v16;
  v42[3] = @"kUserPresenceAuthorizationStatusKey";
  id v17 = [NSNumber numberWithUnsignedInteger:a4];
  v43[3] = v17;
  void v42[4] = @"kHomeUUID";
  uint64_t v18 = [v12 homeUUID];
  uint64_t v19 = [v18 UUIDString];
  v43[4] = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:5];

  id v21 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v22 = objc_alloc(MEMORY[0x1E4F65488]);
  id v23 = [(HMHomeManager *)self uuid];
  id v24 = (void *)[v22 initWithTarget:v23];
  __int16 v25 = (void *)[v21 initWithName:@"kUpdateInvitationStateRequestKey" destination:v24 payload:v20];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __106__HMHomeManager__updateInvitation_presenceAuthStatus_invitationState_invitationOptions_completionHandler___block_invoke;
  v35[3] = &unk_1E5944EF0;
  id v26 = v33;
  id v36 = v26;
  id v27 = v34;
  id v37 = v27;
  uint64_t v28 = (void *)MEMORY[0x19F3A64A0]([v25 setResponseHandler:v35]);
  id v29 = self;
  uint64_t v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v39 = v31;
    __int16 v40 = 2112;
    id v41 = v25;
    _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_INFO, "%{public}@update invitation: %@", buf, 0x16u);
  }
  id v32 = [v26 messageDispatcher];
  [v32 sendMessage:v25];
}

void __106__HMHomeManager__updateInvitation_presenceAuthStatus_invitationState_invitationOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)_acceptInvitation:(id)a3 presenceAuthStatus:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)_acceptInvitation:(id)a3 completionHandler:(id)a4
{
}

- (void)_ignoreInvitation:(id)a3 completionHandler:(id)a4
{
}

- (void)_reportJunkInvitation:(id)a3 completionHandler:(id)a4
{
}

- (void)_declineInvitation:(id)a3 completionHandler:(id)a4
{
}

- (void)_handleQueryHomeKitUsageStateResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v16 = 0;
  uint64_t v8 = objc_msgSend(v6, "hmf_BOOLForKey:isPresent:", @"kHomeKitInUseKey", &v16);
  if (v16)
  {
    uint64_t v9 = v8;
    uint64_t v10 = objc_msgSend(v6, "hmf_BOOLForKey:isPresent:", @"kHomeKitUsingCloudKey", &v16);
    if (v16)
    {
      if (v7)
      {
        uint64_t v11 = v10;
        id v12 = [(HMHomeManager *)self context];
        id v13 = [v12 delegateCaller];
        [v13 callCompletion:v7 isUsingHomeKit:v9 isUsingCloudServices:v11 error:0];
LABEL_9:
      }
    }
    else if (v7)
    {
      id v12 = [(HMHomeManager *)self context];
      id v13 = [v12 delegateCaller];
      id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:58 userInfo:0];
      [v13 callCompletion:v7 isUsingHomeKit:v9 isUsingCloudServices:0 error:v15];

      goto LABEL_9;
    }
  }
  else if (v7)
  {
    id v12 = [(HMHomeManager *)self context];
    id v13 = [v12 delegateCaller];
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:58 userInfo:0];
    [v13 callCompletion:v7 isUsingHomeKit:0 isUsingCloudServices:0 error:v14];

    goto LABEL_9;
  }
}

- (void)_handleMetadataUpdatedNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMHomeManager *)self context];
  id v6 = [v5 pendingRequests];

  id v7 = [v4 identifier];
  uint64_t v8 = [v6 removeCompletionBlockForIdentifier:v7];

  uint64_t v9 = [v4 numberForKey:@"kMetadataInfoVersionKey"];
  uint64_t v10 = [v4 numberForKey:@"kMetadataInfoSchemaVersionKey"];
  uint64_t v11 = (void *)v10;
  if (v9 && v10)
  {
    if (([(HMHomeManager *)self options] & 0x9701) != 0)
    {
      if ([v11 unsignedIntegerValue] == 1)
      {
        unint64_t v12 = [v9 unsignedIntegerValue];
        if (v12 >= [(HMHomeManager *)self metadataVersion])
        {
          -[HMHomeManager setMetadataVersion:](self, "setMetadataVersion:", [v9 unsignedIntegerValue]);
          __int16 v25 = [v4 dataForKey:@"kHAPMetadataDataKey"];
          if (v25)
          {
            id v26 = +[HMHAPMetadata getSharedInstance];
            [v26 applyProtoBufData:v25];

            id v22 = 0;
          }
          else
          {
            id v22 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1002];
          }

          if (!v8) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
      }
      uint64_t v13 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1003];
    }
    else
    {
      id v17 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v18 = self;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        HMHomeManagerOptionsToString([(HMHomeManager *)v18 options]);
        id v21 = v27 = v17;
        *(_DWORD *)buf = 138543618;
        id v29 = v20;
        __int16 v30 = 2112;
        uint64_t v31 = v21;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Client has not requested access to HAP accessories (options %@) - dropping metadata update", buf, 0x16u);

        id v17 = v27;
      }

      uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    }
    id v22 = (void *)v13;
    if (!v8)
    {
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    id v23 = [(HMHomeManager *)self context];
    id v24 = [v23 delegateCaller];
    [v24 callCompletion:v8 error:v22];

    goto LABEL_14;
  }
  if (v8)
  {
    id v14 = [(HMHomeManager *)self context];
    id v15 = [v14 delegateCaller];
    char v16 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1002];
    [v15 callCompletion:v8 error:v16];
  }
LABEL_15:
}

- (void)_handleUserInvitationsUpdatedNotification:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v37 = [v38 dataForKey:@"kInvitationsDataKey"];
  uint64_t v42 = self;
  id v4 = +[HMIncomingHomeInvitation incomingHomeInvitationFromEncodedData:homeManager:](HMIncomingHomeInvitation, "incomingHomeInvitationFromEncodedData:homeManager:");
  id v5 = (void *)[v4 mutableCopy];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = (id)[v5 copy];
  uint64_t v43 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v43)
  {
    uint64_t v41 = *(void *)v49;
    uint64_t v39 = v5;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v49 != v41) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v9 = v42;
        uint64_t v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v53 = v11;
          __int16 v54 = 2112;
          long long v55 = v7;
          _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Processing invitation: %@", buf, 0x16u);
        }
        unint64_t v12 = [(HMHomeManager *)v9 homeInvitations];
        uint64_t v13 = [v7 identifier];
        id v14 = [v12 firstItemWithValue:v13 forKey:@"identifier"];

        unint64_t v15 = [v7 invitationState];
        unint64_t v16 = v15;
        if (v14)
        {
          if (v15 <= 7 && ((1 << v15) & 0x9A) != 0)
          {
            id v17 = [(HMHomeManager *)v9 homeInvitations];
            [v17 removeObject:v14];

            uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
            uint64_t v19 = v9;
            id v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              id v21 = HMFGetLogIdentifier();
              id v22 = [v14 uniqueIdentifier];
              *(_DWORD *)buf = 138543618;
              long long v53 = v21;
              __int16 v54 = 2112;
              long long v55 = v22;
              _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Removed invitation %@", buf, 0x16u);
            }
            id v5 = v39;
          }
          [v14 _updateInvitationState:v16];
          [v5 removeObject:v7];
          id v23 = (void *)MEMORY[0x19F3A64A0]([v5 addObject:v14]);
          id v24 = v9;
          __int16 v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            id v26 = HMFGetLogIdentifier();
            id v27 = [v14 uniqueIdentifier];
            uint64_t v28 = +[HMHomeInvitationData homeInvitationStateDescription:](HMHomeInvitationData, "homeInvitationStateDescription:", [v14 invitationState]);
            *(_DWORD *)buf = 138543874;
            long long v53 = v26;
            __int16 v54 = 2112;
            long long v55 = v27;
            __int16 v56 = 2112;
            uint64_t v57 = v28;
            _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@Updated invitation state for invitation %@ to %@", buf, 0x20u);
          }
LABEL_20:

          goto LABEL_21;
        }
        if (v15 == 5 || v15 == 2)
        {
          id v29 = [(HMHomeManager *)v9 context];
          objc_msgSend(v7, "__configureWithContext:homeManager:", v29, v9);

          __int16 v30 = [(HMHomeManager *)v9 homeInvitations];
          [v30 addObject:v7];

          id v23 = (void *)MEMORY[0x19F3A64A0]();
          uint64_t v31 = v9;
          __int16 v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v32 = HMFGetLogIdentifier();
            uint64_t v33 = [v7 uniqueIdentifier];
            *(_DWORD *)buf = 138543618;
            long long v53 = v32;
            __int16 v54 = 2112;
            long long v55 = v33;
            _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@Added invitation: %@", buf, 0x16u);
          }
          goto LABEL_20;
        }
LABEL_21:
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v43);
  }

  id v34 = [(HMHomeManager *)v42 _privateDelegate];
  if ([v5 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    __int16 v35 = [(HMHomeManager *)v42 context];
    id v36 = [v35 delegateCaller];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __59__HMHomeManager__handleUserInvitationsUpdatedNotification___block_invoke;
    v44[3] = &unk_1E5945650;
    id v45 = v34;
    uint64_t v46 = v42;
    id v47 = v5;
    [v36 invokeBlock:v44];
  }
}

uint64_t __59__HMHomeManager__handleUserInvitationsUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateStateForIncomingInvitations:*(void *)(a1 + 48)];
}

- (void)_handleHomesDidUpdateNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 shortDescription];
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching home configuration in response to homes did update message: %@", (uint8_t *)&v10, 0x16u);
  }
  [(HMHomeManager *)v6 _fetchHomeConfigurationWithRefreshRequested:0];
}

- (void)_handleCurrentHomeChangedNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kCurrentHomeUUIDKey"];
  if (v5
    || (LOBYTE(v12) = 0, int v6 = [v4 BOOLForKey:@"kNoCurrentHomeKey" keyPresent:&v12], (_BYTE)v12)
    && v6)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]([(HMHomeManager *)self _updateCurrentHome:v5]);
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = HMFGetLogIdentifier();
      uint64_t v11 = [(HMHomeManager *)v8 currentHome];
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      unint64_t v15 = v11;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Updated current home: %@ due to current home changed notification", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_processHomeAddedPayload:(id)a3 completionHandler:(id)a4
{
  v90[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  aBlocuint64_t k = a4;
  id v7 = [(HMHomeManager *)self context];
  uint64_t v8 = [v7 queue];
  dispatch_assert_queue_V2(v8);

  int v9 = objc_msgSend(v6, "hmf_BOOLForKey:", @"HMHM.isPrimaryHome");
  int v10 = objc_msgSend(v6, "hmf_dataForKey:", @"kHomeDataKey");
  if (v10)
  {
    id v71 = 0;
    id v68 = v10;
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v10 error:&v71];
    id v12 = v71;
    [v11 _allowDecodingCyclesInSecureMode];
    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    v90[0] = objc_opt_class();
    v90[1] = objc_opt_class();
    __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
    unint64_t v15 = [v13 setWithArray:v14];
    uint64_t v16 = *MEMORY[0x1E4F284E8];
    id v70 = v12;
    id v17 = [v11 decodeTopLevelObjectOfClasses:v15 forKey:v16 error:&v70];
    id v67 = v70;

    id v18 = v17;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    id v20 = v19;

    if (v20)
    {
      id v21 = [v20 uuid];
      id v22 = [(HMHomeManager *)self _homeWithUUID:v21];

      if (v22)
      {
        id v23 = (void *)MEMORY[0x19F3A64A0]();
        id v24 = self;
        __int16 v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v59 = HMFGetLogIdentifier();
          uint64_t v57 = [v20 currentUser];
          id v64 = [v20 currentUser];
          __int16 v56 = [v64 uuid];
          [v22 currentUser];
          id v26 = v61 = v11;
          [v22 currentUser];
          id v27 = v65 = v23;
          uint64_t v28 = [v27 uuid];
          *(_DWORD *)buf = 138545410;
          id v73 = v59;
          __int16 v74 = 2048;
          id v75 = v20;
          __int16 v76 = 2112;
          id v77 = v20;
          __int16 v78 = 2048;
          uint64_t v79 = v22;
          __int16 v80 = 2112;
          int v81 = v22;
          __int16 v82 = 2112;
          v83 = v57;
          __int16 v84 = 2112;
          BOOL v85 = v56;
          __int16 v86 = 2112;
          uint64_t v87 = v26;
          __int16 v88 = 2112;
          uint64_t v89 = v28;
          _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@Not adding unarchived home %p/%@ to the home graph as a matching home already exist: %p/%@, [%@/%@] [%@/%@]", buf, 0x5Cu);

          id v23 = v65;
          uint64_t v11 = v61;
        }
        id v29 = [(HMHomeManager *)v24 context];
        __int16 v30 = [v29 delegateCaller];
        uint64_t v31 = v30;
        uint64_t v32 = aBlock;
        id v33 = aBlock;
        id v34 = v22;
      }
      else
      {
        int v44 = [(HMHomeManager *)self context];
        objc_msgSend(v20, "__configureWithContext:homeManager:", v44, self);

        id v45 = [(HMHomeManager *)self currentHomes];
        [v45 addObject:v20];

        uint64_t v46 = (void *)MEMORY[0x19F3A64A0]([v20 postConfigure]);
        id v47 = self;
        long long v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v63 = HMFGetLogIdentifier();
          uint64_t v60 = HMFBooleanToString();
          v58 = [v20 currentUser];
          [v20 currentUser];
          v62 = uint64_t v66 = v46;
          long long v49 = [v62 uuid];
          *(_DWORD *)buf = 138544642;
          id v73 = v63;
          __int16 v74 = 2048;
          id v75 = v20;
          __int16 v76 = 2112;
          id v77 = v20;
          __int16 v78 = 2112;
          uint64_t v79 = v60;
          __int16 v80 = 2112;
          int v81 = v58;
          __int16 v82 = 2112;
          v83 = v49;
          _os_log_impl(&dword_19D1A8000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully added home %p/%@ with isPrimary: %@, current user: %@/%@", buf, 0x3Eu);

          uint64_t v46 = v66;
        }

        if (v9)
        {
          long long v50 = [v20 uuid];
          [(HMHomeManager *)v47 _updatePrimaryHome:v50 notifyDelegate:1];
        }
        long long v51 = (void *)MEMORY[0x19F3A64A0]();
        id v52 = v47;
        long long v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          __int16 v54 = HMFGetLogIdentifier();
          long long v55 = _Block_copy(aBlock);
          *(_DWORD *)buf = 138543874;
          id v73 = v54;
          __int16 v74 = 2112;
          id v75 = v55;
          __int16 v76 = 2112;
          id v77 = v20;
          _os_log_impl(&dword_19D1A8000, v53, OS_LOG_TYPE_INFO, "%{public}@Calling completion %@ with newly added Home: %@", buf, 0x20u);
        }
        id v29 = [(HMHomeManager *)v52 context];
        __int16 v30 = [v29 delegateCaller];
        uint64_t v31 = v30;
        uint64_t v32 = aBlock;
        id v33 = aBlock;
        id v34 = v20;
      }
      [v30 callCompletion:v33 home:v34 error:0];

      uint64_t v39 = v67;
    }
    else
    {
      __int16 v40 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v41 = self;
      uint64_t v42 = HMFGetOSLogHandle();
      uint64_t v39 = v67;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v73 = v43;
        __int16 v74 = 2112;
        id v75 = v67;
        _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive home from home data: %@", buf, 0x16u);
      }
      id v22 = [(HMHomeManager *)v41 context];
      id v29 = [v22 delegateCaller];
      uint64_t v32 = aBlock;
      [v29 callCompletion:aBlock home:0 error:v67];
    }

    int v10 = v68;
  }
  else
  {
    __int16 v35 = (void *)MEMORY[0x19F3A64A0]();
    id v36 = self;
    id v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v73 = v38;
      __int16 v74 = 2112;
      id v75 = v6;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not find home data in add home response payload: %@", buf, 0x16u);
    }
    uint64_t v39 = [(HMHomeManager *)v36 context];
    uint64_t v11 = [v39 delegateCaller];
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    uint64_t v32 = aBlock;
    [v11 callCompletion:aBlock home:0 error:v18];
  }
}

- (id)homeWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHomeManager *)self currentHomes];
  id v6 = [v5 firstItemWithUniqueIdentifier:v4];

  return v6;
}

- (void)_mergeNewAppData:(id)a3
{
  id v6 = a3;
  id v4 = [(HMHomeManager *)self applicationData];
  char v5 = HMFEqualObjects();

  if ((v5 & 1) == 0) {
    [(HMHomeManager *)self _updateAppData:v6];
  }
}

- (void)_mergeHomeInvitations:(id)a3
{
  id v4 = a3;
  char v5 = [HMObjectMergeCollection alloc];
  id v6 = [(HMHomeManager *)self homeInvitations];
  id v7 = [v6 array];
  uint64_t v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  int v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __39__HMHomeManager__mergeHomeInvitations___block_invoke;
  v24[3] = &unk_1E5942058;
  void v24[4] = self;
  [v9 enumerateObjectsUsingBlock:v24];

  int v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __39__HMHomeManager__mergeHomeInvitations___block_invoke_724;
  v23[3] = &unk_1E5942058;
  void v23[4] = self;
  [v10 enumerateObjectsUsingBlock:v23];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  uint64_t v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  id v12 = [(HMHomeManager *)self homeInvitations];
  [v12 setArray:v11];

  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  __int16 v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  [v13 addObjectsFromArray:v14];

  unint64_t v15 = [(HMObjectMergeCollection *)v8 removedObjects];
  [v13 addObjectsFromArray:v15];

  uint64_t v16 = [(HMObjectMergeCollection *)v8 updatedObjects];
  [v13 addObjectsFromArray:v16];

  id v17 = [(HMHomeManager *)self _privateDelegate];
  if ([v13 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v18 = [(HMHomeManager *)self context];
    uint64_t v19 = [v18 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__HMHomeManager__mergeHomeInvitations___block_invoke_726;
    block[3] = &unk_1E5945650;
    void block[4] = self;
    id v21 = v17;
    id v22 = v13;
    dispatch_async(v19, block);
  }
}

void __39__HMHomeManager__mergeHomeInvitations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed invitation via merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __39__HMHomeManager__mergeHomeInvitations___block_invoke_724(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added invitation via merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __39__HMHomeManager__mergeHomeInvitations___block_invoke_726(id *a1)
{
  uint64_t v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__HMHomeManager__mergeHomeInvitations___block_invoke_2;
  v6[3] = &unk_1E5945650;
  id v4 = a1[5];
  id v5 = a1[4];
  id v7 = v4;
  id v8 = v5;
  id v9 = a1[6];
  [v3 invokeBlock:v6];
}

uint64_t __39__HMHomeManager__mergeHomeInvitations___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateStateForIncomingInvitations:*(void *)(a1 + 48)];
}

- (void)_mergeCurrentHomesWithNewHomes:(id)a3 newPrimaryHome:(id)a4 newCurrentHome:(id)a5 newInvitations:(id)a6 newAppData:(id)a7 refreshRequested:(BOOL)a8
{
  BOOL v57 = a8;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v58 = a4;
  id v60 = a5;
  id v62 = a6;
  id v61 = a7;
  uint64_t v59 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
  __int16 v14 = self;
  unint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMHomeManager generationCounter](v14, "generationCounter"));
    *(_DWORD *)buf = 138543618;
    int v81 = v16;
    __int16 v82 = 2112;
    v83 = v17;
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Framework merge started for generation counter: %@", buf, 0x16u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke;
  aBlock[3] = &unk_1E5942008;
  aBlock[4] = v14;
  id v18 = _Block_copy(aBlock);
  uint64_t v19 = [HMObjectMergeCollection alloc];
  id v20 = [(HMHomeManager *)v14 currentHomes];
  id v21 = [v20 array];
  id v22 = [(HMObjectMergeCollection *)v19 initWithCurrentObjects:v21 newObjects:v63 commonObjectPredicate:v18];

  id v23 = [MEMORY[0x1E4F29128] UUID];
  id v24 = [v23 UUIDString];
  __int16 v25 = [@"Merge-" stringByAppendingString:v24];

  id v26 = [(HMHomeManager *)v14 context];
  id v27 = [v26 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_709;
  block[3] = &unk_1E5945628;
  void block[4] = v14;
  id v28 = v25;
  id v78 = v28;
  dispatch_async(v27, block);

  id v29 = [(HMObjectMergeCollection *)v22 removedObjects];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2;
  v76[3] = &unk_1E5942030;
  v76[4] = v14;
  [v29 enumerateObjectsUsingBlock:v76];

  __int16 v30 = [(HMObjectMergeCollection *)v22 addedObjects];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_711;
  v75[3] = &unk_1E5942030;
  v75[4] = v14;
  [v30 enumerateObjectsUsingBlock:v75];

  [(HMObjectMergeCollection *)v22 mergeCommonObjectsNoMergeCount];
  uint64_t v31 = [(HMObjectMergeCollection *)v22 finalObjects];
  uint64_t v32 = [(HMHomeManager *)v14 currentHomes];
  [v32 setArray:v31];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v33 = [(HMHomeManager *)v14 homes];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v71 objects:v86 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v72 != v36) {
          objc_enumerationMutation(v33);
        }
        [*(id *)(*((void *)&v71 + 1) + 8 * i) postConfigure];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v71 objects:v86 count:16];
    }
    while (v35);
  }

  id v38 = [(HMObjectMergeCollection *)v22 removedObjects];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_712;
  v70[3] = &unk_1E5942030;
  v70[4] = v14;
  [v38 enumerateObjectsUsingBlock:v70];

  uint64_t v39 = [(HMObjectMergeCollection *)v22 addedObjects];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_715;
  v69[3] = &unk_1E5942030;
  v69[4] = v14;
  [v39 enumerateObjectsUsingBlock:v69];

  [(HMHomeManager *)v14 _mergeHomeInvitations:v62];
  [(HMHomeManager *)v14 _mergeNewAppData:v61];
  [(HMHomeManager *)v14 _updatePrimaryHome:v58 notifyDelegate:1];
  __int16 v40 = [(HMHomeManager *)v14 currentHome];
  uint64_t v41 = [v40 uuid];
  uint64_t v42 = v60;
  char v43 = HMFEqualObjects();

  if ((v43 & 1) == 0)
  {
    int v44 = [(HMHomeManager *)v14 context];
    id v45 = [v44 queue];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_719;
    v67[3] = &unk_1E5945628;
    v67[4] = v14;
    id v68 = v60;
    dispatch_async(v45, v67);
  }
  if (v57)
  {
    uint64_t v46 = [(HMHomeManager *)v14 context];
    id v47 = [v46 queue];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_721;
    v66[3] = &unk_1E59452E8;
    v66[4] = v14;
    dispatch_async(v47, v66);
  }
  long long v48 = [(HMHomeManager *)v14 context];
  long long v49 = [v48 queue];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_722;
  v64[3] = &unk_1E5945628;
  v64[4] = v14;
  id v50 = v28;
  id v65 = v50;
  dispatch_async(v49, v64);

  long long v51 = (void *)MEMORY[0x19F3A64A0]();
  id v52 = v14;
  long long v53 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    __int16 v54 = HMFGetLogIdentifier();
    long long v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMHomeManager generationCounter](v52, "generationCounter"));
    [v59 timeIntervalSinceNow];
    *(_DWORD *)buf = 138543874;
    int v81 = v54;
    __int16 v82 = 2112;
    v83 = v55;
    __int16 v84 = 2048;
    double v85 = -v56;
    _os_log_impl(&dword_19D1A8000, v53, OS_LOG_TYPE_INFO, "%{public}@Framework merge finished for generation counter: %@, %f seconds", buf, 0x20u);

    uint64_t v42 = v60;
  }
}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 uniqueIdentifier];
  id v8 = [v6 uniqueIdentifier];
  int v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  if (!v9) {
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 32) isDaemonRunningWithROARFramework])
  {
    __int16 v10 = [v5 currentUser];
    id v11 = [v10 homeAccessControl];
    if ([v11 isOwner])
    {

      goto LABEL_6;
    }
    uint64_t v12 = [v5 currentUser];
    uint64_t v13 = [v12 uniqueIdentifier];
    __int16 v14 = [v6 currentUser];
    unint64_t v15 = [v14 uniqueIdentifier];
    char v16 = HMFEqualObjects();

    if (v16) {
      goto LABEL_6;
    }
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = *(id *)(a1 + 32);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      int v23 = 138543874;
      id v24 = v21;
      __int16 v25 = 2112;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Found different current user unique identifiers, so not considering homes to be the same even though they have the same unique identifier. Current home: %@, new home: %@", (uint8_t *)&v23, 0x20u);
    }
LABEL_10:
    uint64_t v17 = 0;
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v17 = 1;
LABEL_11:

  return v17;
}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_709(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfBatchNotificationsStartWithReason:*(void *)(a1 + 40)];
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543874;
    int v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2048;
    id v13 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed home via merge: %@ (%p)", (uint8_t *)&v8, 0x20u);
  }
  [v3 unconfigure];
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_711(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543874;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2048;
    id v14 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added home via merge: %@ (%p)", (uint8_t *)&v9, 0x20u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:homeManager:", v8, *(void *)(a1 + 32));
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_712(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    id v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_714;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_715(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    id v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_717;
    block[3] = &unk_1E5945650;
    void block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_719(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_720;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_721(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestRefresh];
}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_722(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfBatchNotificationsEndWithReason:*(void *)(a1 + 40)];
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_720(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) _updateCurrentHome:*(void *)(a1 + 40)]);
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) currentHome];
    int v7 = 138543618;
    id v8 = v5;
    __int16 v9 = 2112;
    __int16 v10 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Updated current home: %@ due to current home merge", (uint8_t *)&v7, 0x16u);
  }
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_717(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_3_718;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_3_718(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = a1[5];
    id v7 = a1[6];
    id v8 = [v6 currentUser];
    __int16 v9 = [a1[5] currentUser];
    __int16 v10 = [v9 uuid];
    int v12 = 138544642;
    __int16 v13 = v5;
    __int16 v14 = 2048;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    int v23 = v10;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did add home: %p/%@ delegate: %@ with current user : %@ / %@", (uint8_t *)&v12, 0x3Eu);
  }
  return [a1[6] homeManager:a1[4] didAddHome:a1[5]];
}

void __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_2_714(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_3;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __121__HMHomeManager__mergeCurrentHomesWithNewHomes_newPrimaryHome_newCurrentHome_newInvitations_newAppData_refreshRequested___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543874;
    __int16 v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed home: %p / %@", (uint8_t *)&v8, 0x20u);
  }
  return [*(id *)(a1 + 48) homeManager:*(void *)(a1 + 32) didRemoveHome:*(void *)(a1 + 40)];
}

- (void)_forceBatchNotificationsEnd
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSCountedSet *)self->_batchNotificationReasons allObjects];
  [(NSCountedSet *)self->_batchNotificationReasons removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    __int16 v9 = [v4 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138543618;
    __int16 v22 = v8;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Batch notifications '%@' did not complete - force-ending", buf, 0x16u);
  }
  __int16 v10 = [(HMHomeManager *)v6 delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    __int16 v12 = [(HMHomeManager *)v6 delegate];
    if ([v12 conformsToProtocol:&unk_1EEF6FE30]) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = v13;

    id v15 = [(HMHomeManager *)v6 context];
    __int16 v16 = [v15 delegateCaller];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __44__HMHomeManager__forceBatchNotificationsEnd__block_invoke;
    v18[3] = &unk_1E5945628;
    id v19 = v14;
    __int16 v20 = v6;
    id v17 = v14;
    [v16 invokeBlock:v18];
  }
}

uint64_t __44__HMHomeManager__forceBatchNotificationsEnd__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManagerDidEndBatchNotifications:*(void *)(a1 + 40)];
}

uint64_t __47__HMHomeManager__notifyDelegateOfAppDataUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManagerDidUpdateApplicationData:*(void *)(a1 + 40)];
}

- (void)_updatePrimaryHome:(id)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HMHomeManager *)self primaryHome];
  if (v6)
  {
    int v8 = [(HMHomeManager *)self currentHomes];
    __int16 v9 = [v8 firstItemWithUUID:v6];
  }
  else
  {
    __int16 v9 = 0;
  }
  if (v9 != v7)
  {
    [v7 setPrimary:0];
    [v9 setPrimary:1];
    [(HMHomeManager *)self setPrimaryHome:v9];
    if (v4)
    {
      __int16 v10 = [(HMHomeManager *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        char v11 = [(HMHomeManager *)self context];
        __int16 v12 = [v11 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51__HMHomeManager__updatePrimaryHome_notifyDelegate___block_invoke;
        block[3] = &unk_1E5945650;
        void block[4] = self;
        id v15 = v11;
        id v16 = v10;
        id v13 = v11;
        dispatch_async(v12, block);
      }
    }
  }
}

void __51__HMHomeManager__updatePrimaryHome_notifyDelegate___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = a1[4];
  BOOL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated primary home", buf, 0xCu);
  }
  id v6 = [a1[5] delegateCaller];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HMHomeManager__updatePrimaryHome_notifyDelegate___block_invoke_690;
  v9[3] = &unk_1E5945628;
  id v7 = a1[6];
  id v8 = a1[4];
  id v10 = v7;
  id v11 = v8;
  [v6 invokeBlock:v9];
}

uint64_t __51__HMHomeManager__updatePrimaryHome_notifyDelegate___block_invoke_690(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManagerDidUpdatePrimaryHome:*(void *)(a1 + 40)];
}

- (void)_handleRuntimeStateUpdateNotification:(id)a3
{
  BOOL v4 = NSString;
  id v5 = a3;
  id v6 = [v5 name];
  id v7 = [v5 identifier];
  id v8 = [v7 UUIDString];
  id v10 = [v4 stringWithFormat:@"HomeManager-%@%@", v6, v8];

  __int16 v9 = [v5 messagePayload];

  [(HMHomeManager *)self _handleRuntimeStateUpdatePayload:v9 reason:v10];
}

- (void)_dumpCaches:(id)a3 metadata:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v44 = a4;
  if (_dumpCaches_metadata__onceToken != -1) {
    dispatch_once(&_dumpCaches_metadata__onceToken, &__block_literal_global_671);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v59 count:16];
  id v47 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v50;
    id v11 = (id *)&unk_1E9443000;
    id v45 = self;
    do
    {
      uint64_t v12 = 0;
      uint64_t v48 = v9;
      do
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(__CFString **)(*((void *)&v49 + 1) + 8 * v12);
        if (objc_msgSend(v11[221], "containsObject:", v13, v44))
        {
          uint64_t v14 = v10;
          id v15 = [v7 valueForKey:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v16 = v15;
          }
          else {
            id v16 = 0;
          }
          id v17 = v16;

          if (v17)
          {
            __int16 v18 = (void *)MEMORY[0x19F3A64A0]();
            id v19 = self;
            __int16 v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              id v21 = HMFGetLogIdentifier();
              uint64_t v22 = [v17 length];
              *(_DWORD *)buf = 138543874;
              __int16 v54 = v21;
              __int16 v55 = 2112;
              double v56 = v13;
              __int16 v57 = 2048;
              uint64_t v58 = v22;
              _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@  %@ = <NSData: %lu bytes>", buf, 0x20u);
            }
            uint64_t v10 = v14;
            id v11 = (id *)&unk_1E9443000;
          }
          else
          {
            id v23 = v15;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v24 = v23;
            }
            else {
              uint64_t v24 = 0;
            }
            id v25 = v24;

            context = (void *)MEMORY[0x19F3A64A0]();
            id v26 = self;
            __int16 v27 = HMFGetOSLogHandle();
            BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
            if (v25)
            {
              if (v28)
              {
                uint64_t v29 = HMFGetLogIdentifier();
                uint64_t v30 = [v25 count];
                *(_DWORD *)buf = 138543874;
                __int16 v54 = v29;
                __int16 v55 = 2112;
                double v56 = v13;
                __int16 v57 = 2048;
                uint64_t v58 = v30;
                _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@  %@ = <NSDictionary: %lu entries>", buf, 0x20u);

                id v11 = (id *)&unk_1E9443000;
              }

              self = v45;
              uint64_t v10 = v14;
            }
            else
            {
              uint64_t v10 = v14;
              if (v28)
              {
                uint64_t v31 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                __int16 v54 = v31;
                __int16 v55 = 2112;
                double v56 = v13;
                __int16 v57 = 2112;
                uint64_t v58 = (uint64_t)v23;
                _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@  %@ = %@", buf, 0x20u);
              }
              self = v45;
            }
          }

          id v7 = v47;
          uint64_t v9 = v48;
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v9);
  }

  uint64_t v32 = v44;
  if (v44)
  {
    id v33 = objc_msgSend(v44, "hmf_numberForKey:", @"kHAPMetadataVersionKey");
    uint64_t v34 = objc_msgSend(v44, "hmf_dataForKey:", @"kHAPMetadataDataKey");
    uint64_t v35 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v36 = self;
    id v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      id v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v54 = v38;
      __int16 v55 = 2112;
      double v56 = @"kHAPMetadataVersionKey";
      __int16 v57 = 2112;
      uint64_t v58 = (uint64_t)v33;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_INFO, "%{public}@  %@ = %@", buf, 0x20u);
    }
    uint64_t v39 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v40 = v36;
    uint64_t v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      uint64_t v42 = HMFGetLogIdentifier();
      uint64_t v43 = [v34 length];
      *(_DWORD *)buf = 138543874;
      __int16 v54 = v42;
      __int16 v55 = 2112;
      double v56 = @"kHAPMetadataDataKey";
      __int16 v57 = 2048;
      uint64_t v58 = v43;
      _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_INFO, "%{public}@  %@ = <NSData: %lu bytes>", buf, 0x20u);
    }

    uint64_t v32 = v44;
  }
}

void __38__HMHomeManager__dumpCaches_metadata___block_invoke()
{
  v2[11] = *MEMORY[0x1E4F143B8];
  v2[0] = @"kAccessAllowedWhenLockedKey";
  v2[1] = @"kCanUseCachedHomeConfigurationKey";
  v2[2] = @"kConfigGenerationCounterKey";
  v2[3] = @"kHAPMetadataVersionKey";
  v2[4] = @"kHomeCountKey";
  v2[5] = @"kHomeDataKey";
  v2[6] = @"kPrimaryHomeUUIDKey";
  void v2[7] = @"dataSyncState";
  v2[8] = @"status";
  v2[9] = @"kProvisioningStatusKey";
  v2[10] = @"multiUserStatus";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:11];
  uint64_t v1 = (void *)_dumpCaches_metadata__keysToDump;
  _dumpCaches_metadata__keysToDump = v0;
}

- (void)_removeCacheFileAtPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  char v6 = [v5 removeItemAtPath:v4 error:&v12];
  id v7 = v12;

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove cache file %@: %@", buf, 0x20u);
    }
  }
}

- (void)_removeCacheFiles
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(HMHomeManager *)self homeCacheDir];
  id v32 = 0;
  id v5 = [v3 contentsOfDirectoryAtPath:v4 error:&v32];
  id v6 = v32;

  if (v5)
  {
    id v25 = v6;
    id v7 = NSString;
    uint64_t v8 = [(HMHomeManager *)self configuration];
    __int16 v27 = [v7 stringWithFormat:@"%lu.%@", objc_msgSend(v8, "options"), @"config"];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v26 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (!v10) {
      goto LABEL_19;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v14 hasPrefix:@"homeData"]
          && [v14 hasSuffix:v27])
        {
          __int16 v15 = [(HMHomeManager *)self homeCacheDir];
          id v16 = [v15 stringByAppendingPathComponent:v14];

          __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
          id v18 = self;
          uint64_t v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            __int16 v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v34 = v20;
            __int16 v35 = 2112;
            uint64_t v36 = v16;
            id v21 = v19;
            uint64_t v22 = "%{public}@Removing home data cache file: %@";
            goto LABEL_15;
          }
          goto LABEL_16;
        }
        if ([v14 hasPrefix:@"metadata"]
          && [v14 hasSuffix:@"config"])
        {
          id v23 = [(HMHomeManager *)self homeCacheDir];
          id v16 = [v23 stringByAppendingPathComponent:v14];

          __int16 v17 = (void *)MEMORY[0x19F3A64A0]();
          uint64_t v24 = self;
          uint64_t v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            __int16 v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v34 = v20;
            __int16 v35 = 2112;
            uint64_t v36 = v16;
            id v21 = v19;
            uint64_t v22 = "%{public}@Removing metadata cache file: %@";
LABEL_15:
            _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, v22, buf, 0x16u);
          }
LABEL_16:

          [(HMHomeManager *)self _removeCacheFileAtPath:v16];

          continue;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (!v11)
      {
LABEL_19:

        id v6 = v25;
        id v5 = v26;
        break;
      }
    }
  }
}

- (BOOL)_shouldWeMergeLatestHomeGraphFromDaemonResponse:(id)a3
{
  unint64_t v3 = [(HMHomeManager *)self _dataSyncStateFromPayload:a3];
  if (HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken != -1) {
    dispatch_once(&HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken, &__block_literal_global_149);
  }
  if (HMIsCurrentProcessSPIEntitled_spiEntitled) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFFDLL;
  }
  return v4 == 1;
}

uint64_t __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_648(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mergeCurrentHomesWithNewHomes:*(void *)(a1 + 40) newPrimaryHome:*(void *)(a1 + 48) newCurrentHome:*(void *)(a1 + 56) newInvitations:*(void *)(a1 + 64) newAppData:*(void *)(a1 + 72) refreshRequested:*(unsigned __int8 *)(a1 + 80)];
}

void __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_652(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "uuid", (void)v15);
        objc_msgSend(v7, "setPrimary:", objc_msgSend(v8, "isEqual:", *(void *)(a1 + 40)));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v4);
  }

  id v9 = [*(id *)(a1 + 48) homeInvitations];
  [v9 setArray:*(void *)(a1 + 56)];

  [*(id *)(a1 + 48) _updateAppData:*(void *)(a1 + 64)];
  [*(id *)(a1 + 48) _setInitialHomes:*(void *)(a1 + 32)];
  uint64_t v10 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 48) _updateCurrentHome:*(void *)(a1 + 72)]);
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = HMFGetLogIdentifier();
    uint64_t v14 = [*(id *)(a1 + 48) currentHome];
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Updated current home: %@ due to home configuration request", buf, 0x16u);
  }
}

void __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_654(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_2;
  v5[3] = &unk_1E5945628;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_656(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  uint64_t v3 = [v2 delegateCaller];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_2_657;
  v4[3] = &unk_1E5945650;
  long long v5 = *(_OWORD *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v3 invokeBlock:v4];
}

void __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_2_657(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying client that home: %@ has been removed permanently.", (uint8_t *)&v10, 0x16u);
  }
  id v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(a1 + 40)];
  [v7 homeManager:v8 didRemoveHomePermanently:v9];
}

uint64_t __68__HMHomeManager__processHomeConfigurationResponse_refreshRequested___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying client that current accessory was removed.", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 40) homeManagerDidRemoveCurrentAccessory:*(void *)(a1 + 32)];
}

uint64_t __66__HMHomeManager__handleHomeSafetySecurityEnabledStateWithPayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateHomeSafetySecurityEnabled:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __66__HMHomeManager__handleHH2ManualMigrationEnabledStateWithPayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateHH2MigrationAvailableState:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __61__HMHomeManager__handleHH2MigrationProgressStateWithPayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateHH2MigrationInProgressState:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __44__HMHomeManager__handleHH2StateWithPayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateHH2State:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_recomputeAssistantIdentifiers
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = dispatch_group_create();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [(HMHomeManager *)self homes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        dispatch_group_enter(v3);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke;
        v15[3] = &unk_1E59452E8;
        long long v16 = v3;
        [v9 recomputeAssistantIdentifiersWithCompletion:v15];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  int v10 = [(HMHomeManager *)self context];
  id v11 = [v10 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke_2;
  block[3] = &unk_1E5945628;
  void block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_group_notify(v3, v11, block);
}

void __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke(uint64_t a1)
{
}

void __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)MEMORY[0x19F3A64A0]();
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v14 = v6;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying client of assistant identifier update", buf, 0xCu);
    }
    uint64_t v7 = [*(id *)(a1 + 40) delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke_630;
    v10[3] = &unk_1E5945628;
    id v8 = v2;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    [v7 invokeBlock:v10];
  }
}

uint64_t __47__HMHomeManager__recomputeAssistantIdentifiers__block_invoke_630(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManagerDidUpdateAssistantIdentifiers:*(void *)(a1 + 40)];
}

uint64_t __74__HMHomeManager___processSyncResponse_refreshRequested_completionHandler___block_invoke_627(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeCaches:*(void *)(a1 + 40) homeData:*(unsigned __int8 *)(a1 + 48) metadata:*(unsigned __int8 *)(a1 + 49)];
}

- (void)_pingDeviceWithUUID:(id)a3 monitor:(BOOL)a4 secure:(BOOL)a5 restrictToLocalNetwork:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  if (!v12)
  {
    uint64_t v29 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager _pingDeviceWithUUID:monitor:secure:restrictToLocalNetwork:completionHandler:]", @"deviceUUID"];
    long long v30 = (void *)MEMORY[0x19F3A64A0]();
    long long v31 = self;
    id v32 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
LABEL_7:
    id v33 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v33;
    __int16 v42 = 2112;
    uint64_t v43 = v29;
    _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v29 userInfo:0];
    objc_exception_throw(v34);
  }
  id v14 = v13;
  if (!v13)
  {
    uint64_t v29 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager _pingDeviceWithUUID:monitor:secure:restrictToLocalNetwork:completionHandler:]", @"completionHandler"];
    long long v30 = (void *)MEMORY[0x19F3A64A0]();
    long long v31 = self;
    id v32 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v15 = [(HMHomeManager *)self context];
  v38[0] = @"kIdentifierKey";
  long long v16 = [v12 UUIDString];
  v39[0] = v16;
  v38[1] = @"monitor";
  long long v17 = [NSNumber numberWithBool:v10];
  v39[1] = v17;
  v38[2] = @"secure";
  long long v18 = [NSNumber numberWithBool:v9];
  v39[2] = v18;
  v38[3] = @"localNetwork";
  long long v19 = [NSNumber numberWithBool:v8];
  v39[3] = v19;
  long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];

  id v21 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v22 = objc_alloc(MEMORY[0x1E4F65488]);
  id v23 = [(HMHomeManager *)self uuid];
  uint64_t v24 = (void *)[v22 initWithTarget:v23];
  id v25 = (void *)[v21 initWithName:@"kPingInternalRequestKey" destination:v24 payload:v20];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __93__HMHomeManager__pingDeviceWithUUID_monitor_secure_restrictToLocalNetwork_completionHandler___block_invoke;
  v35[3] = &unk_1E5944EF0;
  id v36 = v15;
  id v37 = v14;
  id v26 = v14;
  id v27 = v15;
  [v25 setResponseHandler:v35];
  long long v28 = [v27 messageDispatcher];
  [v28 sendMessage:v25];
}

void __93__HMHomeManager__pingDeviceWithUUID_monitor_secure_restrictToLocalNetwork_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)__removeAccountWithHandle:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager __removeAccountWithHandle:completionHandler:]", @"accountHandle"];
    long long v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
LABEL_7:
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v31 = v23;
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  BOOL v8 = v7;
  if (!v7)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager __removeAccountWithHandle:completionHandler:]", @"completionHandler"];
    long long v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v9 = [(HMHomeManager *)self context];
  long long v28 = @"destination";
  id v29 = v6;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v11 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  id v13 = [(HMHomeManager *)self uuid];
  id v14 = (void *)[v12 initWithTarget:v13];
  uint64_t v15 = (void *)[v11 initWithName:@"HMHM.rma" destination:v14 payload:v10];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__HMHomeManager___removeAccountWithHandle_completionHandler___block_invoke;
  v25[3] = &unk_1E5944EF0;
  id v26 = v9;
  id v27 = v8;
  id v16 = v8;
  id v17 = v9;
  [v15 setResponseHandler:v25];
  long long v18 = [v17 messageDispatcher];
  [v18 sendMessage:v15];
}

void __61__HMHomeManager___removeAccountWithHandle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)__removeAccountWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager __removeAccountWithIdentifier:completionHandler:]", @"accountIdentifier"];
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
LABEL_7:
    id v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v32 = v24;
    __int16 v33 = 2112;
    uint64_t v34 = v20;
    _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  BOOL v8 = v7;
  if (!v7)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager __removeAccountWithIdentifier:completionHandler:]", @"completionHandler"];
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v9 = [(HMHomeManager *)self context];
  id v29 = @"kIdentifierKey";
  BOOL v10 = [v6 UUIDString];
  long long v30 = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];

  id v12 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v13 = objc_alloc(MEMORY[0x1E4F65488]);
  id v14 = [(HMHomeManager *)self uuid];
  uint64_t v15 = (void *)[v13 initWithTarget:v14];
  id v16 = (void *)[v12 initWithName:@"HMHM.rma" destination:v15 payload:v11];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __65__HMHomeManager___removeAccountWithIdentifier_completionHandler___block_invoke;
  v26[3] = &unk_1E5944EF0;
  id v27 = v9;
  id v28 = v8;
  id v17 = v8;
  id v18 = v9;
  [v16 setResponseHandler:v26];
  uint64_t v19 = [v18 messageDispatcher];
  [v19 sendMessage:v16];
}

void __65__HMHomeManager___removeAccountWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)__resolveAccountHandle:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager __resolveAccountHandle:completionHandler:]", @"accountHandle"];
    uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
LABEL_7:
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v31 = v23;
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

LABEL_8:
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  BOOL v8 = v7;
  if (!v7)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager __resolveAccountHandle:completionHandler:]", @"completionHandler"];
    uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v9 = [(HMHomeManager *)self context];
  id v28 = @"destination";
  id v29 = v6;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v11 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  id v13 = [(HMHomeManager *)self uuid];
  id v14 = (void *)[v12 initWithTarget:v13];
  uint64_t v15 = (void *)[v11 initWithName:@"HMHM.rsa" destination:v14 payload:v10];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__HMHomeManager___resolveAccountHandle_completionHandler___block_invoke;
  v25[3] = &unk_1E5944EF0;
  id v26 = v9;
  id v27 = v8;
  id v16 = v8;
  id v17 = v9;
  [v15 setResponseHandler:v25];
  id v18 = [v17 messageDispatcher];
  [v18 sendMessage:v15];
}

void __58__HMHomeManager___resolveAccountHandle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (BOOL)isiPhoneOnlyPairingSupportedForMatterAccessories
{
  if ((_os_feature_enabled_impl() & 1) != 0
    || (int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0)) != 0)
  {
    LOBYTE(AppBooleanValue) = [(HMHomeManager *)self isDaemonRunningWithROARFramework];
  }
  return AppBooleanValue;
}

- (void)checkName:(id)a3 inHome:(id)a4 withValidationOptions:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v12)
  {
    uint64_t v33 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager checkName:inHome:withValidationOptions:completionHandler:]", @"completionHandler"];
    uint64_t v34 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v35 = self;
    id v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v42 = v37;
      __int16 v43 = 2112;
      uint64_t v44 = v33;
      _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v38 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v33 userInfo:0];
    objc_exception_throw(v38);
  }
  id v13 = v12;
  id v14 = [(HMHomeManager *)self context];
  if (!v10)
  {
    uint64_t v20 = [(HMHomeManager *)self context];
    id v21 = [v20 delegateCaller];
    id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v21 callCompletion:v13 value:0 conflictName:0 error:v22];

LABEL_10:
    goto LABEL_14;
  }
  unint64_t v15 = [v10 length];
  if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
    dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
  }
  if (v15 > HMMaxLengthForNaming__hmf_once_v8)
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v42 = v19;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Home name is longer than the pre-defined max length", buf, 0xCu);
    }
    uint64_t v20 = [v14 delegateCaller];
    id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
    [v20 callCompletion:v13 value:0 conflictName:0 error:v21];
    goto LABEL_10;
  }
  id v23 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  if (v11)
  {
    id v24 = [v11 uuid];
    id v25 = [v24 UUIDString];
    [v23 setObject:v25 forKeyedSubscript:@"kHomeUUID"];
  }
  [v23 setObject:v10 forKeyedSubscript:@"name"];
  id v26 = [NSNumber numberWithUnsignedInteger:a5];
  [v23 setObject:v26 forKeyedSubscript:@"options"];

  id v27 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v28 = objc_alloc(MEMORY[0x1E4F65488]);
  id v29 = [(HMHomeManager *)self uuid];
  long long v30 = (void *)[v28 initWithTarget:v29];
  long long v31 = (void *)[v27 initWithName:@"HMHM.qns" destination:v30 payload:v23];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __74__HMHomeManager_checkName_inHome_withValidationOptions_completionHandler___block_invoke;
  v39[3] = &unk_1E5943468;
  id v40 = v13;
  [v31 setResponseHandler:v39];
  __int16 v32 = [v14 messageDispatcher];
  [v32 sendMessage:v31];

LABEL_14:
}

void __74__HMHomeManager_checkName_inHome_withValidationOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "hmf_stringForKey:", @"conflictName");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateFirewallRuleTLVsFromNetworkDeclarations:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager generateFirewallRuleTLVsFromNetworkDeclarations:completionHandler:]", @"completionHandler"];
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v22;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  BOOL v8 = v7;
  BOOL v9 = [(HMHomeManager *)self context];
  id v10 = objc_alloc(MEMORY[0x1E4F65488]);
  id v11 = [(HMHomeManager *)self messageTargetUUID];
  id v12 = (void *)[v10 initWithTarget:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v27 = @"jsonData";
  id v28 = v6;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  unint64_t v15 = (void *)[v13 initWithName:@"HMHM.convertFirewallRules" destination:v12 payload:v14];

  objc_initWeak((id *)location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __83__HMHomeManager_generateFirewallRuleTLVsFromNetworkDeclarations_completionHandler___block_invoke;
  v24[3] = &unk_1E5944188;
  objc_copyWeak(&v26, (id *)location);
  id v16 = v8;
  id v25 = v16;
  [v15 setResponseHandler:v24];
  id v17 = [v9 messageDispatcher];
  [v17 sendMessage:v15];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)location);
}

void __83__HMHomeManager_generateFirewallRuleTLVsFromNetworkDeclarations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = objc_msgSend(v5, "hmf_dataForKey:", @"fileString");
    BOOL v8 = [WeakRetained context];
    BOOL v9 = [v8 delegateCaller];
    [v9 callCompletion:*(void *)(a1 + 32) obj:v7 error:v11];

LABEL_3:
    goto LABEL_6;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (!v11)
  {
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v7);
    goto LABEL_3;
  }
  (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
LABEL_6:
}

- (void)updateAccessAllowedWhenLocked:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager updateAccessAllowedWhenLocked:completionHandler:]", @"completionHandler"];
    uint64_t v19 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v30 = v22;
      __int16 v31 = 2112;
      uint64_t v32 = v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  id v7 = v6;
  BOOL v8 = [(HMHomeManager *)self context];
  id v9 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v10 = [(HMHomeManager *)self uuid];
  id v11 = (void *)[v9 initWithTarget:v10];

  id v12 = (void *)MEMORY[0x1E4F654B0];
  id v27 = @"kAccessAllowedWhenLockedKey";
  id v13 = [NSNumber numberWithBool:v4];
  id v28 = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  unint64_t v15 = [v12 messageWithName:@"kUpdateAccessAllowedWhenLockedRequestKey" destination:v11 payload:v14];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __65__HMHomeManager_updateAccessAllowedWhenLocked_completionHandler___block_invoke;
  v24[3] = &unk_1E5941EC8;
  void v24[4] = self;
  id v25 = v7;
  BOOL v26 = v4;
  id v16 = v7;
  [v15 setResponseHandler:v24];
  id v17 = [v8 messageDispatcher];
  [v17 sendMessage:v15 completionHandler:0];
}

void __65__HMHomeManager_updateAccessAllowedWhenLocked_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    id v11 = _Block_copy(*(const void **)(a1 + 40));
    int v17 = 138544130;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Update access allowed when locked : %@, completionHandler: %@ error %@", (uint8_t *)&v17, 0x2Au);
  }
  if (v5)
  {
    id v12 = [*(id *)(a1 + 32) context];
    id v13 = [v12 delegateCaller];
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = v5;
  }
  else
  {
    [*(id *)(a1 + 32) setAccessAllowedWhenLocked:*(unsigned __int8 *)(a1 + 48)];
    id v12 = [*(id *)(a1 + 32) context];
    id v13 = [v12 delegateCaller];
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = 0;
  }
  [v13 callCompletion:v15 error:v16];
}

- (void)updateResidentEnabledForThisDevice:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager updateResidentEnabledForThisDevice:completionHandler:]", @"completionHandler"];
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v25 = self;
    BOOL v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v36 = v27;
      __int16 v37 = 2112;
      uint64_t v38 = v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  id v7 = v6;
  id v8 = [(HMHomeManager *)self context];
  uint64_t v33 = @"kResidentEnabledKey";
  id v9 = [NSNumber numberWithBool:v4];
  uint64_t v34 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];

  id v11 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  id v13 = [(HMHomeManager *)self uuid];
  id v14 = (void *)[v12 initWithTarget:v13];
  uint64_t v15 = (void *)[v11 initWithName:@"kUpdateResidentEnabledOnThisDeviceRequestKey" destination:v14 payload:v10];

  id v16 = [v8 pendingRequests];
  int v17 = [v15 identifier];
  uint64_t v18 = _Block_copy(v7);
  [v16 addCompletionBlock:v18 forIdentifier:v17];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70__HMHomeManager_updateResidentEnabledForThisDevice_completionHandler___block_invoke;
  v29[3] = &unk_1E59450E8;
  id v30 = v16;
  id v31 = v17;
  id v32 = v8;
  id v19 = v8;
  id v20 = v17;
  id v21 = v16;
  [v15 setResponseHandler:v29];
  id v22 = [v19 messageDispatcher];
  [v22 sendMessage:v15];
}

void __70__HMHomeManager_updateResidentEnabledForThisDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    id v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 error:v5];
  }
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v28 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager updateApplicationData:completionHandler:]", @"completion"];
    id v29 = (void *)MEMORY[0x19F3A64A0]();
    id v30 = self;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v32;
      __int16 v44 = 2112;
      uint64_t v45 = v28;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v28 userInfo:0];
    objc_exception_throw(v33);
  }
  id v8 = v7;
  uint64_t v34 = [(HMHomeManager *)self context];
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v6)
  {
    uint64_t v10 = [v6 dictionary];
    [v9 setObject:v10 forKeyedSubscript:@"kAppDataInformationKey"];
  }
  id v11 = objc_alloc(MEMORY[0x1E4F65488]);
  id v12 = [(HMHomeManager *)self messageTargetUUID];
  id v13 = (void *)[v11 initWithTarget:v12];

  id v14 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v15 = (void *)[v9 copy];
  id v16 = [v14 messageWithName:@"kSetHomeManagerAppDataRequestKey" destination:v13 payload:v15];

  objc_initWeak((id *)location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HMHomeManager_updateApplicationData_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5944AE0;
  objc_copyWeak(&v42, (id *)location);
  id v17 = v6;
  id v40 = v17;
  id v18 = v8;
  id v41 = v18;
  id v19 = _Block_copy(aBlock);
  id v20 = [(HMHomeManager *)self context];
  id v21 = [v20 pendingRequests];

  id v22 = [v16 identifier];
  uint64_t v23 = _Block_copy(v19);
  [v21 addCompletionBlock:v23 forIdentifier:v22];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __57__HMHomeManager_updateApplicationData_completionHandler___block_invoke_2;
  v35[3] = &unk_1E5945510;
  id v24 = v21;
  id v36 = v24;
  id v25 = v22;
  id v37 = v25;
  id v26 = v19;
  id v38 = v26;
  [v16 setResponseHandler:v35];
  id v27 = [v34 messageDispatcher];
  [v27 sendMessage:v16 completionHandler:0];

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)location);
}

void __57__HMHomeManager_updateApplicationData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v8 = WeakRetained;
  if (!v4)
  {
    [WeakRetained setApplicationData:*(void *)(a1 + 32)];
    id WeakRetained = v8;
  }
  id v6 = [WeakRetained context];
  id v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) error:v4];
}

void __57__HMHomeManager_updateApplicationData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)updateiCloudSwitchState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager updateiCloudSwitchState:completionHandler:]", @"completion"];
    id v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v22;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  id v7 = v6;
  id v8 = [(HMHomeManager *)self context];
  id v26 = @"kiCloudSwitchStateKey";
  id v9 = [NSNumber numberWithBool:v4];
  id v27 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

  id v11 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v12 = objc_alloc(MEMORY[0x1E4F65488]);
  id v13 = [(HMHomeManager *)self uuid];
  id v14 = (void *)[v12 initWithTarget:v13];
  uint64_t v15 = (void *)[v11 initWithName:@"HMHM.updateiCloudSwitchState" destination:v14 payload:v10];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__HMHomeManager_updateiCloudSwitchState_completionHandler___block_invoke;
  v24[3] = &unk_1E5943468;
  id v25 = v7;
  id v16 = v7;
  [v15 setResponseHandler:v24];
  id v17 = [v8 messageDispatcher];
  [v17 sendMessage:v15];
}

uint64_t __59__HMHomeManager_updateiCloudSwitchState_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryiCloudSwitchStateWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager queryiCloudSwitchStateWithCompletionHandler:]", @"completion"];
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];
    objc_exception_throw(v19);
  }
  id v5 = v4;
  id v6 = [(HMHomeManager *)self context];
  id v7 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  id v9 = [(HMHomeManager *)self uuid];
  uint64_t v10 = (void *)[v8 initWithTarget:v9];
  id v11 = (void *)[v7 initWithName:@"HMHM.queryiCloudSwitchState" destination:v10 payload:0];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__HMHomeManager_queryiCloudSwitchStateWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E5943468;
  id v21 = v5;
  id v12 = v5;
  [v11 setResponseHandler:v20];
  id v13 = [v6 messageDispatcher];
  [v13 sendMessage:v11];
}

void __61__HMHomeManager_queryiCloudSwitchStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (!v5) {
    objc_msgSend(a3, "hmf_BOOLForKey:", @"kiCloudSwitchStateKey");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setMetadata:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager setMetadata:completionHandler:]", @"completion"];
    __int16 v24 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v36 = v27;
      __int16 v37 = 2112;
      uint64_t v38 = v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  id v8 = v7;
  id v9 = [(HMHomeManager *)self context];
  if (v6)
  {
    id v33 = @"kMetadataPlistPathKey";
    id v34 = v6;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F65488]);
  id v12 = [(HMHomeManager *)self messageTargetUUID];
  id v13 = (void *)[v11 initWithTarget:v12];

  uint64_t v14 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHM.sm" destination:v13 payload:v10];
  uint64_t v15 = [(HMHomeManager *)self context];
  id v16 = [v15 pendingRequests];

  id v17 = [v14 identifier];
  uint64_t v18 = _Block_copy(v8);
  [v16 addCompletionBlock:v18 forIdentifier:v17];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __47__HMHomeManager_setMetadata_completionHandler___block_invoke;
  v29[3] = &unk_1E59450E8;
  id v30 = v16;
  id v31 = v17;
  id v32 = v9;
  id v19 = v9;
  id v20 = v17;
  id v21 = v16;
  [v14 setResponseHandler:v29];
  id v22 = [v19 messageDispatcher];
  [v22 sendMessage:v14 completionHandler:0];
}

void __47__HMHomeManager_setMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    id v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 error:v5];
  }
}

- (void)queryMetadata:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  id v9 = [(HMHomeManager *)self messageTargetUUID];
  uint64_t v10 = (void *)[v8 initWithTarget:v9];

  id v11 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHM.qm" destination:v10 payload:v6];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__HMHomeManager_queryMetadata_completionHandler___block_invoke;
  v16[3] = &unk_1E5945510;
  id v17 = v6;
  uint64_t v18 = self;
  id v19 = v7;
  id v12 = v7;
  id v13 = v6;
  [v11 setResponseHandler:v16];
  uint64_t v14 = [(HMHomeManager *)self context];
  uint64_t v15 = [v14 messageDispatcher];
  [v15 sendMessage:v11];
}

void __49__HMHomeManager_queryMetadata_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v15 = 138543874;
      id v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@queryMetadata '%@' failed with error %@", (uint8_t *)&v15, 0x20u);
    }
  }
  id v11 = [*(id *)(a1 + 40) context];
  id v12 = [v11 delegateCaller];
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = objc_msgSend(v6, "hmf_dictionaryForKey:", @"kMetadataDictionaryKey");
  [v12 callCompletion:v13 error:v5 dictionary:v14];
}

- (void)resetLastTTRTimeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F65488]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B4FFBCEC-B0A2-4660-B1B2-4B484FE76D74"];
  id v7 = (void *)[v5 initWithTarget:v6];

  id v8 = [MEMORY[0x1E4F654B0] messageWithName:@"resetLastTTRTime" destination:v7 payload:0];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HMHomeManager_resetLastTTRTimeWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5944188;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  [v8 setResponseHandler:v12];
  uint64_t v10 = [(HMHomeManager *)self context];
  id v11 = [v10 messageDispatcher];
  [v11 sendMessage:v8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__HMHomeManager_resetLastTTRTimeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)presentTTRDialog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B4FFBCEC-B0A2-4660-B1B2-4B484FE76D74"];
  uint64_t v10 = (void *)[v8 initWithTarget:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [v11 setObject:v6 forKeyedSubscript:@"category"];
  id v12 = [MEMORY[0x1E4F654B0] messageWithName:@"presentTTRDialog" destination:v10 payload:v11];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__HMHomeManager_presentTTRDialog_completionHandler___block_invoke;
  v16[3] = &unk_1E5944188;
  objc_copyWeak(&v18, &location);
  id v13 = v7;
  id v17 = v13;
  [v12 setResponseHandler:v16];
  id v14 = [(HMHomeManager *)self context];
  int v15 = [v14 messageDispatcher];
  [v15 sendMessage:v12];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __52__HMHomeManager_presentTTRDialog_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)submitLogEventDailySchedulerRegisteredBlocksWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F65488]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  id v7 = (void *)[v5 initWithTarget:v6];

  id v8 = [MEMORY[0x1E4F654B0] messageWithName:@"logEventDailySchedulerRunRegisteredBlocks" destination:v7 payload:0];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__HMHomeManager_submitLogEventDailySchedulerRegisteredBlocksWithCompletion___block_invoke;
  v12[3] = &unk_1E5944188;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  [v8 setResponseHandler:v12];
  uint64_t v10 = [(HMHomeManager *)self context];
  id v11 = [v10 messageDispatcher];
  [v11 sendMessage:v8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __76__HMHomeManager_submitLogEventDailySchedulerRegisteredBlocksWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)requestLogEventDailySchedulerStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F65488]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  id v7 = (void *)[v5 initWithTarget:v6];

  id v8 = [MEMORY[0x1E4F654B0] messageWithName:@"logEventDailySchedulerRequestStatus" destination:v7 payload:0];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__HMHomeManager_requestLogEventDailySchedulerStatusWithCompletion___block_invoke;
  v12[3] = &unk_1E5944188;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  [v8 setResponseHandler:v12];
  uint64_t v10 = [(HMHomeManager *)self context];
  id v11 = [v10 messageDispatcher];
  [v11 sendMessage:v8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __67__HMHomeManager_requestLogEventDailySchedulerStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained context];
  id v9 = [v8 delegateCaller];
  [v9 callCompletion:*(void *)(a1 + 32) error:v7 dictionary:v6];
}

- (void)resetEventCounters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F65488]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  id v7 = (void *)[v5 initWithTarget:v6];

  id v8 = [MEMORY[0x1E4F654B0] messageWithName:@"resetEventCounters" destination:v7 payload:0];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__HMHomeManager_resetEventCounters___block_invoke;
  v12[3] = &unk_1E5944188;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  [v8 setResponseHandler:v12];
  uint64_t v10 = [(HMHomeManager *)self context];
  id v11 = [v10 messageDispatcher];
  [v11 sendMessage:v8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __36__HMHomeManager_resetEventCounters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)fetchEventCounters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F65488]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  id v7 = (void *)[v5 initWithTarget:v6];

  id v8 = [MEMORY[0x1E4F654B0] messageWithName:@"fetchEventCounters" destination:v7 payload:0];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__HMHomeManager_fetchEventCounters___block_invoke;
  v12[3] = &unk_1E5944188;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  [v8 setResponseHandler:v12];
  uint64_t v10 = [(HMHomeManager *)self context];
  id v11 = [v10 messageDispatcher];
  [v11 sendMessage:v8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __36__HMHomeManager_fetchEventCounters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained context];
  id v9 = [v8 delegateCaller];
  [v9 callCompletion:*(void *)(a1 + 32) error:v7 dictionary:v6];
}

- (void)listEphemeralContainersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F65488]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  id v7 = (void *)[v5 initWithTarget:v6];

  id v8 = [MEMORY[0x1E4F654B0] messageWithName:@"listEphemeralContainers" destination:v7 payload:0];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__HMHomeManager_listEphemeralContainersWithCompletion___block_invoke;
  v12[3] = &unk_1E5944188;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  [v8 setResponseHandler:v12];
  uint64_t v10 = [(HMHomeManager *)self context];
  id v11 = [v10 messageDispatcher];
  [v11 sendMessage:v8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__HMHomeManager_listEphemeralContainersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained context];
  id v9 = [v8 delegateCaller];
  [v9 callCompletion:*(void *)(a1 + 32) error:v7 dictionary:v6];
}

- (void)startupEphemeralContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  uint64_t v10 = (void *)[v8 initWithTarget:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [v11 setObject:v6 forKeyedSubscript:@"ephemeralContainerName"];
  id v12 = (void *)MEMORY[0x1E4F654B0];
  id v13 = (void *)[v11 copy];
  id v14 = [v12 messageWithName:@"startupEphemeralContainer" destination:v10 payload:v13];

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __62__HMHomeManager_startupEphemeralContainerWithName_completion___block_invoke;
  v18[3] = &unk_1E5944188;
  objc_copyWeak(&v20, &location);
  id v15 = v7;
  id v19 = v15;
  [v14 setResponseHandler:v18];
  id v16 = [(HMHomeManager *)self context];
  id v17 = [v16 messageDispatcher];
  [v17 sendMessage:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __62__HMHomeManager_startupEphemeralContainerWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)deleteEphemeralContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  uint64_t v10 = (void *)[v8 initWithTarget:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [v11 setObject:v6 forKeyedSubscript:@"ephemeralContainerName"];
  id v12 = (void *)MEMORY[0x1E4F654B0];
  id v13 = (void *)[v11 copy];
  id v14 = [v12 messageWithName:@"deleteEphemeralContainer" destination:v10 payload:v13];

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __61__HMHomeManager_deleteEphemeralContainerWithName_completion___block_invoke;
  v18[3] = &unk_1E5944188;
  objc_copyWeak(&v20, &location);
  id v15 = v7;
  id v19 = v15;
  [v14 setResponseHandler:v18];
  id v16 = [(HMHomeManager *)self context];
  id v17 = [v16 messageDispatcher];
  [v17 sendMessage:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __61__HMHomeManager_deleteEphemeralContainerWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)deactivateEphemeralContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  uint64_t v10 = (void *)[v8 initWithTarget:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [v11 setObject:v6 forKeyedSubscript:@"ephemeralContainerName"];
  id v12 = (void *)MEMORY[0x1E4F654B0];
  id v13 = (void *)[v11 copy];
  id v14 = [v12 messageWithName:@"deactivateEphemeralContainer" destination:v10 payload:v13];

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __65__HMHomeManager_deactivateEphemeralContainerWithName_completion___block_invoke;
  v18[3] = &unk_1E5944188;
  objc_copyWeak(&v20, &location);
  id v15 = v7;
  id v19 = v15;
  [v14 setResponseHandler:v18];
  id v16 = [(HMHomeManager *)self context];
  id v17 = [v16 messageDispatcher];
  [v17 sendMessage:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __65__HMHomeManager_deactivateEphemeralContainerWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)addEphemeralContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  uint64_t v10 = (void *)[v8 initWithTarget:v9];

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  [v11 setObject:v6 forKeyedSubscript:@"ephemeralContainerName"];
  id v12 = (void *)MEMORY[0x1E4F654B0];
  id v13 = (void *)[v11 copy];
  id v14 = [v12 messageWithName:@"addEphemeralContainer" destination:v10 payload:v13];

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __58__HMHomeManager_addEphemeralContainerWithName_completion___block_invoke;
  v18[3] = &unk_1E5944188;
  objc_copyWeak(&v20, &location);
  id v15 = v7;
  id v19 = v15;
  [v14 setResponseHandler:v18];
  id v16 = [(HMHomeManager *)self context];
  id v17 = [v16 messageDispatcher];
  [v17 sendMessage:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __58__HMHomeManager_addEphemeralContainerWithName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)deleteCountersBeforeDate:(id)a3 afterDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F65488]);
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  id v13 = (void *)[v11 initWithTarget:v12];

  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  [v14 setObject:v8 forKeyedSubscript:@"beforeDate"];
  [v14 setObject:v9 forKeyedSubscript:@"afterDate"];
  id v15 = (void *)MEMORY[0x1E4F654B0];
  id v16 = (void *)[v14 copy];
  id v17 = [v15 messageWithName:@"deleteCounters" destination:v13 payload:v16];

  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __63__HMHomeManager_deleteCountersBeforeDate_afterDate_completion___block_invoke;
  v21[3] = &unk_1E5944188;
  objc_copyWeak(&v23, &location);
  id v18 = v10;
  id v22 = v18;
  [v17 setResponseHandler:v21];
  id v19 = [(HMHomeManager *)self context];
  id v20 = [v19 messageDispatcher];
  [v20 sendMessage:v17];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __63__HMHomeManager_deleteCountersBeforeDate_afterDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)saveCountersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F65488]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  id v7 = (void *)[v5 initWithTarget:v6];

  id v8 = [MEMORY[0x1E4F654B0] messageWithName:@"saveCounters" destination:v7 payload:0];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__HMHomeManager_saveCountersWithCompletion___block_invoke;
  v12[3] = &unk_1E5944188;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  [v8 setResponseHandler:v12];
  id v10 = [(HMHomeManager *)self context];
  id v11 = [v10 messageDispatcher];
  [v11 sendMessage:v8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __44__HMHomeManager_saveCountersWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)readCountersForGroup:(id)a3 homeUUIDString:(id)a4 accessoryUUIDString:(id)a5 counter:(id)a6 statistics:(id)a7 datePartition:(id)a8 ephemeralContainerName:(id)a9 completion:(id)a10
{
  id v15 = a3;
  id v40 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v39 = a10;
  id v21 = objc_alloc(MEMORY[0x1E4F65488]);
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D3872CF5-6B42-43E3-8D60-9E0A0C8483DA"];
  id v23 = (void *)[v21 initWithTarget:v22];

  __int16 v24 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v37 = v15;
  id v25 = v15;
  uint64_t v26 = v16;
  [v24 setObject:v25 forKeyedSubscript:@"groupName"];
  [v24 setObject:v40 forKeyedSubscript:@"homeUUID"];
  [v24 setObject:v16 forKeyedSubscript:@"accessoryUUID"];
  id v36 = v17;
  [v24 setObject:v17 forKeyedSubscript:@"counter"];
  uint64_t v35 = v18;
  id v27 = v18;
  id v28 = v19;
  [v24 setObject:v27 forKeyedSubscript:@"statistics"];
  [v24 setObject:v19 forKeyedSubscript:@"partition"];
  [v24 setObject:v20 forKeyedSubscript:@"ephemeralContainerName"];
  id v29 = (void *)MEMORY[0x1E4F654B0];
  id v30 = (void *)[v24 copy];
  id v31 = [v29 messageWithName:@"readCounters" destination:v23 payload:v30];

  objc_initWeak(&location, self);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __140__HMHomeManager_readCountersForGroup_homeUUIDString_accessoryUUIDString_counter_statistics_datePartition_ephemeralContainerName_completion___block_invoke;
  void v41[3] = &unk_1E5944188;
  objc_copyWeak(&v43, &location);
  id v32 = v39;
  id v42 = v32;
  [v31 setResponseHandler:v41];
  id v33 = [(HMHomeManager *)self context];
  id v34 = [v33 messageDispatcher];
  [v34 sendMessage:v31];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __140__HMHomeManager_readCountersForGroup_homeUUIDString_accessoryUUIDString_counter_statistics_datePartition_ephemeralContainerName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained context];
  id v9 = [v8 delegateCaller];
  [v9 callCompletion:*(void *)(a1 + 32) error:v7 dictionary:v6];
}

- (void)dumpState:(id)a3 payload:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager dumpState:payload:completion:]", @"completion"];
    id v23 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v26;
      __int16 v32 = 2112;
      uint64_t v33 = v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v11 = v10;
  id v12 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v9];
  [v12 setObject:v8 forKey:@"kDumpStateRequestedConfigurationKey"];
  id v13 = objc_alloc(MEMORY[0x1E4F65488]);
  id v14 = [(HMHomeManager *)self uuid];
  id v15 = (void *)[v13 initWithTarget:v14];

  id v16 = (void *)MEMORY[0x1E4F654B0];
  id v17 = (void *)[v12 copy];
  id v18 = [v16 messageWithName:@"HMHM.ds" destination:v15 payload:v17];

  objc_initWeak((id *)location, self);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __46__HMHomeManager_dumpState_payload_completion___block_invoke;
  v28[3] = &unk_1E5944188;
  objc_copyWeak(&v30, (id *)location);
  id v19 = v11;
  id v29 = v19;
  [v18 setResponseHandler:v28];
  id v20 = [(HMHomeManager *)self context];
  id v21 = [v20 messageDispatcher];
  [v21 sendMessage:v18];

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)location);
}

void __46__HMHomeManager_dumpState_payload_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained context];
  id v9 = [v8 delegateCaller];
  [v9 callCompletion:*(void *)(a1 + 32) error:v7 dictionary:v6];
}

- (void)queryVersionWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager queryVersionWithCompletionHandler:]", @"completion"];
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v5 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4F65488]);
  id v7 = [(HMHomeManager *)self messageTargetUUID];
  id v8 = (void *)[v6 initWithTarget:v7];

  id v9 = [MEMORY[0x1E4F654B0] messageWithName:@"HMHM.qv" destination:v8 payload:0];
  objc_initWeak((id *)location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__HMHomeManager_queryVersionWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E5944188;
  objc_copyWeak(&v21, (id *)location);
  id v10 = v5;
  id v20 = v10;
  [v9 setResponseHandler:v19];
  id v11 = [(HMHomeManager *)self context];
  id v12 = [v11 messageDispatcher];
  [v12 sendMessage:v9];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)location);
}

void __51__HMHomeManager_queryVersionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
  }
  else
  {
    id v7 = objc_msgSend(a3, "hmf_stringForKey:", @"kHomeKitVersionStringKey");
    if (v7)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = [WeakRetained context];
  id v10 = [v9 delegateCaller];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__HMHomeManager_queryVersionWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E5945138;
  id v11 = *(id *)(a1 + 32);
  id v16 = v6;
  id v17 = v11;
  id v15 = v7;
  id v12 = v6;
  id v13 = v7;
  [v10 invokeBlock:v14];
}

uint64_t __51__HMHomeManager_queryVersionWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)queryHomeKitUsageStateWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager queryHomeKitUsageStateWithCompletionHandler:]", @"completion"];
    id v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];
    objc_exception_throw(v19);
  }
  id v5 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  id v8 = [(HMHomeManager *)self uuid];
  id v9 = (void *)[v7 initWithTarget:v8];
  id v10 = (void *)[v6 initWithName:@"kQueryHomeKitUsageStateRequestKey" destination:v9 payload:0];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__HMHomeManager_queryHomeKitUsageStateWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E5944EF0;
  void v20[4] = self;
  id v21 = v5;
  id v11 = v5;
  [v10 setResponseHandler:v20];
  id v12 = [(HMHomeManager *)self context];
  id v13 = [v12 messageDispatcher];
  [v13 sendMessage:v10];
}

void __61__HMHomeManager_queryHomeKitUsageStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v9 = v5;
  if (v5)
  {
    id v7 = [v6 context];
    id v8 = [v7 delegateCaller];
    [v8 callCompletion:*(void *)(a1 + 40) isUsingHomeKit:0 isUsingCloudServices:0 error:v9];
  }
  else
  {
    [v6 _handleQueryHomeKitUsageStateResponse:a3 completionHandler:*(void *)(a1 + 40)];
  }
}

- (void)eraseHomeDataAndDeleteMetadata:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(HMHomeManager *)self context];
  if (!v6)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager eraseHomeDataAndDeleteMetadata:completionHandler:]", @"completion"];
    id v19 = (void *)MEMORY[0x19F3A64A0]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v22;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  id v8 = (void *)v7;
  id v9 = objc_alloc(MEMORY[0x1E4F65488]);
  id v10 = [(HMHomeManager *)self uuid];
  id v11 = (void *)[v9 initWithTarget:v10];

  id v12 = (void *)MEMORY[0x1E4F65480];
  id v27 = @"kResetConfigMetadataKey";
  id v13 = [NSNumber numberWithBool:v4];
  id v28 = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  id v15 = [v12 messageWithName:@"kResetConfigRequestKey" qualityOfService:25 destination:v11 payload:v14];

  objc_initWeak((id *)location, self);
  id v16 = [v8 messageDispatcher];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__HMHomeManager_eraseHomeDataAndDeleteMetadata_completionHandler___block_invoke;
  v24[3] = &unk_1E5944A68;
  objc_copyWeak(&v26, (id *)location);
  id v17 = v6;
  id v25 = v17;
  [v16 sendMessage:v15 completionHandler:v24];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)location);
}

void __66__HMHomeManager_eraseHomeDataAndDeleteMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 32) error:v4];
}

- (void)eraseHomeDataWithCompletionHandler:(id)a3
{
}

- (void)resetConfiguration:(BOOL)a3 withoutPopup:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a5;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v7);
  }
  id v8 = v6;
  [(HMHomeManager *)self eraseHomeDataWithCompletionHandler:v6];
}

- (void)removeHome:(HMHome *)home completionHandler:(void *)completion
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = home;
  id v7 = completion;
  uint64_t v8 = [(HMHomeManager *)self context];
  if (!v7)
  {
    uint64_t v48 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager removeHome:completionHandler:]", @"completion"];
    long long v49 = (void *)MEMORY[0x19F3A64A0]();
    long long v50 = self;
    long long v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      long long v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v64 = v52;
      __int16 v65 = 2112;
      uint64_t v66 = v48;
      _os_log_impl(&dword_19D1A8000, v51, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v53 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v48 userInfo:0];
    objc_exception_throw(v53);
  }
  id v9 = (void *)v8;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Remove home"];
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    id v15 = [v10 identifier];
    id v16 = [v15 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v64 = v14;
    __int16 v65 = 2114;
    uint64_t v66 = (uint64_t)v16;
    __int16 v67 = 2112;
    id v68 = v6;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing home: %@", buf, 0x20u);
  }
  if (!v6)
  {
    uint64_t v32 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v33 = v12;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      id v36 = [v10 identifier];
      __int16 v37 = [v36 shortDescription];
      *(_DWORD *)buf = 138543618;
      id v64 = v35;
      __int16 v65 = 2114;
      uint64_t v66 = (uint64_t)v37;
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to remove nil home", buf, 0x16u);
    }
    id v29 = [v9 delegateCaller];
    uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = 20;
    goto LABEL_13;
  }
  id v17 = [(HMHomeManager *)v12 currentHomes];
  char v18 = [v17 containsObject:v6];

  if ((v18 & 1) == 0)
  {
    id v40 = (void *)MEMORY[0x19F3A64A0]();
    id v41 = v12;
    id v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v43 = HMFGetLogIdentifier();
      __int16 v44 = [v10 identifier];
      uint64_t v45 = [v44 shortDescription];
      [(HMHomeManager *)v41 currentHomes];
      __int16 v55 = v40;
      uint64_t v46 = (HMHome *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v64 = v43;
      __int16 v65 = 2114;
      uint64_t v66 = (uint64_t)v45;
      __int16 v67 = 2112;
      id v68 = v46;
      _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to remove home that doesn't exist in current homes: %@", buf, 0x20u);

      id v40 = v55;
    }

    id v29 = [v9 delegateCaller];
    uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = 2;
LABEL_13:
    id v47 = [v38 hmErrorWithCode:v39];
    [v29 callCompletion:v7 error:v47];

    goto LABEL_14;
  }
  id v19 = (void *)MEMORY[0x1E4F654B0];
  id v20 = objc_alloc(MEMORY[0x1E4F65488]);
  id v21 = [(HMHomeManager *)v12 uuid];
  uint64_t v22 = (void *)[v20 initWithTarget:v21];
  id v61 = @"kHomeUUID";
  id v23 = [(HMHome *)v6 uuid];
  __int16 v24 = [v23 UUIDString];
  id v62 = v24;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
  __int16 v54 = v6;
  id v25 = v7;
  id v26 = v10;
  id v28 = v27 = v9;
  id v29 = [v19 messageWithName:@"kRemoveHomeRequestKey" destination:v22 payload:v28];

  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __46__HMHomeManager_removeHome_completionHandler___block_invoke;
  v56[3] = &unk_1E5942B08;
  v56[4] = v12;
  id v57 = v26;
  id v30 = v27;
  id v58 = v30;
  id v60 = v25;
  uint64_t v59 = v54;
  [v29 setResponseHandler:v56];
  uint64_t v31 = [v30 messageDispatcher];
  [v31 sendMessage:v29];

  id v9 = v27;
  id v10 = v26;
  id v7 = v25;
  id v6 = v54;

LABEL_14:
}

void __46__HMHomeManager_removeHome_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] identifier];
      id v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v10;
      __int16 v23 = 2114;
      __int16 v24 = v12;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to remove home: %@", buf, 0x20u);
    }
    id v13 = [a1[6] delegateCaller];
    [v13 callCompletion:a1[8] error:v5];
  }
  else
  {
    uint64_t v14 = [a1[6] queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__HMHomeManager_removeHome_completionHandler___block_invoke_563;
    block[3] = &unk_1E5944900;
    id v15 = a1[5];
    void block[4] = a1[4];
    id v17 = v15;
    id v18 = a1[7];
    id v19 = a1[6];
    id v20 = a1[8];
    dispatch_async(v14, block);
  }
}

void __46__HMHomeManager_removeHome_completionHandler___block_invoke_563(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) identifier];
    id v7 = [v6 shortDescription];
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully removed home", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) currentHomes];
  [v8 removeObject:*(void *)(a1 + 48)];

  [*(id *)(a1 + 48) unconfigure];
  id v9 = [*(id *)(a1 + 56) delegateCaller];
  [v9 callCompletion:*(void *)(a1 + 64) error:0];
}

- (void)addHomeWithName:(NSString *)homeName completionHandler:(void *)completion
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = homeName;
  id v7 = completion;
  uint64_t v8 = [(HMHomeManager *)self context];
  if (!v7)
  {
    uint64_t v39 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager addHomeWithName:completionHandler:]", @"completion"];
    id v40 = (void *)MEMORY[0x19F3A64A0]();
    id v41 = self;
    id v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v52 = v43;
      __int16 v53 = 2112;
      uint64_t v54 = v39;
      _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v44 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v39 userInfo:0];
    objc_exception_throw(v44);
  }
  id v9 = (void *)v8;
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Add home"];
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  __int16 v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    id v15 = [v10 identifier];
    id v16 = [v15 shortDescription];
    *(_DWORD *)buf = 138543874;
    long long v52 = v14;
    __int16 v53 = 2114;
    uint64_t v54 = (uint64_t)v16;
    __int16 v55 = 2112;
    double v56 = v6;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding home with name: %@", buf, 0x20u);
  }
  if (v6)
  {
    unint64_t v17 = [(NSString *)v6 length];
    if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
      dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
    }
    if (v17 <= HMMaxLengthForNaming__hmf_once_v8)
    {
      uint64_t v32 = (void *)MEMORY[0x1E4F654B0];
      id v33 = objc_alloc(MEMORY[0x1E4F65488]);
      uint64_t v34 = [(HMHomeManager *)v12 uuid];
      uint64_t v35 = (void *)[v33 initWithTarget:v34];
      long long v49 = @"kHomeName";
      long long v50 = v6;
      id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      uint64_t v22 = [v32 messageWithName:@"kAddHomeRequestKey" destination:v35 payload:v36];

      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __51__HMHomeManager_addHomeWithName_completionHandler___block_invoke;
      v45[3] = &unk_1E59441B0;
      v45[4] = v12;
      id v46 = v10;
      id v37 = v9;
      id v47 = v37;
      id v48 = v7;
      [v22 setResponseHandler:v45];
      uint64_t v38 = [v37 messageDispatcher];
      [v38 sendMessage:v22];

      goto LABEL_16;
    }
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = v12;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v52 = v21;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Home name is longer than the pre-defined max length", buf, 0xCu);
    }
    uint64_t v22 = [v9 delegateCaller];
    __int16 v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = 46;
  }
  else
  {
    __int16 v25 = (void *)MEMORY[0x19F3A64A0]();
    id v26 = v12;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      id v29 = [v10 identifier];
      id v30 = [v29 shortDescription];
      *(_DWORD *)buf = 138543618;
      long long v52 = v28;
      __int16 v53 = 2114;
      uint64_t v54 = (uint64_t)v30;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Asked to add home with nil name", buf, 0x16u);
    }
    uint64_t v22 = [v9 delegateCaller];
    __int16 v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = 20;
  }
  uint64_t v31 = [v23 hmErrorWithCode:v24];
  [v22 callCompletion:v7 home:0 error:v31];

LABEL_16:
}

void __51__HMHomeManager_addHomeWithName_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      id v11 = [a1[5] identifier];
      __int16 v12 = [v11 shortDescription];
      *(_DWORD *)buf = 138543874;
      id v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add home: %@", buf, 0x20u);
    }
    id v13 = [a1[6] delegateCaller];
    [v13 callCompletion:a1[7] home:0 error:v5];
  }
  else
  {
    uint64_t v14 = [a1[4] context];
    id v15 = [v14 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HMHomeManager_addHomeWithName_completionHandler___block_invoke_559;
    block[3] = &unk_1E5945138;
    void block[4] = a1[4];
    id v17 = v6;
    id v18 = a1[7];
    dispatch_async(v15, block);
  }
}

uint64_t __51__HMHomeManager_addHomeWithName_completionHandler___block_invoke_559(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processHomeAddedPayload:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)updatePrimaryHome:(HMHome *)home completionHandler:(void *)completion
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = home;
  id v7 = completion;
  id v8 = [(HMHomeManager *)self context];
  if (!v7)
  {
    uint64_t v27 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager updatePrimaryHome:completionHandler:]", @"completion"];
    id v28 = (void *)MEMORY[0x19F3A64A0]();
    id v29 = self;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v41 = v31;
      __int16 v42 = 2112;
      uint64_t v43 = v27;
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
    objc_exception_throw(v32);
  }
  id v9 = v8;
  if (!v6)
  {
    int v10 = [v8 delegateCaller];
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    id v13 = v10;
    id v15 = v7;
    id v16 = v14;
    goto LABEL_7;
  }
  int v10 = [(HMHome *)v6 uuid];
  id v11 = [(HMHomeManager *)self currentHomes];
  __int16 v12 = [v11 firstItemWithUUID:v10];

  if (!v12)
  {
    uint64_t v14 = [v9 delegateCaller];
    id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v14 callCompletion:v7 error:v17];
LABEL_14:

    goto LABEL_15;
  }
  if (![(HMHomeManager *)self isDaemonRunningWithROARFramework])
  {
    id v18 = [(HMHome *)v6 currentUser];
    uint64_t v14 = [(HMHome *)v6 homeAccessControlForUser:v18];

    if ([v14 isAccessAllowed])
    {
      id v19 = [(HMHomeManager *)self uuid];
      uint64_t v38 = @"kHomeUUID";
      uint64_t v39 = v10;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      id v33[2] = __53__HMHomeManager_updatePrimaryHome_completionHandler___block_invoke;
      v33[3] = &unk_1E59441B0;
      id v34 = v9;
      id v37 = v7;
      uint64_t v35 = self;
      id v36 = v10;
      -[_HMContext sendMessage:target:payload:responseHandler:](v34, @"kSetPrimaryHomeRequestKey", v19, v20, v33);

      id v17 = v34;
    }
    else
    {
      __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v22 = self;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "accessNotAllowedReasonCode"));
        *(_DWORD *)buf = 138543874;
        id v41 = v24;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v6;
        __int16 v44 = 2112;
        uint64_t v45 = v25;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot set the primary home. Access to the home [%@] is not allowed due to reason: %@", buf, 0x20u);
      }
      id v17 = [v9 delegateCaller];
      id v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      [v17 callCompletion:v7 error:v26];
    }
    goto LABEL_14;
  }
  [(HMHomeManager *)self setPrimaryHome:v6];
  id v13 = [v9 delegateCaller];
  uint64_t v14 = v13;
  id v15 = v7;
  id v16 = 0;
LABEL_7:
  [v13 callCompletion:v15 error:v16];
LABEL_15:
}

void __53__HMHomeManager_updatePrimaryHome_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v3 = [*(id *)(a1 + 32) delegateCaller];
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = v7;
  }
  else
  {
    [*(id *)(a1 + 40) _updatePrimaryHome:*(void *)(a1 + 48) notifyDelegate:0];
    id v3 = [*(id *)(a1 + 32) delegateCaller];
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = 0;
  }
  [v3 callCompletion:v5 error:v6];
}

- (id)_refreshBeforeDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = 0.0;
  if (!v6) {
    goto LABEL_10;
  }
  id v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
  if ([v6 isEqualToDate:v9])
  {

LABEL_10:
    id v17 = [[__HMHomeManagerRefreshRequest alloc] initWithGenerationCounter:[(HMHomeManager *)self serverGenerationCounter] timeout:v8];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v17);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke;
    v29[3] = &unk_1E5941EA0;
    objc_copyWeak(&v31, &location);
    objc_copyWeak(&v32, &from);
    id v30 = v7;
    id v18 = (void *)MEMORY[0x19F3A64A0]([(__HMHomeManagerRefreshRequest *)v17 setCompletionBlock:v29]);
    id v19 = self;
    HMFGetOSLogHandle();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v36 = v21;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Starting refresh request", buf, 0xCu);
    }
    [(HMFOperation *)v17 start];
    uint64_t v22 = [(HMHomeManager *)v19 context];
    __int16 v23 = [v22 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_546;
    block[3] = &unk_1E5945628;
    void block[4] = v19;
    id v24 = v17;
    id v28 = v24;
    dispatch_async(v23, block);

    uint64_t v25 = v28;
    id v16 = v24;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  [v6 timeIntervalSinceNow];
  double v8 = v10;

  if (v8 >= 0.0) {
    goto LABEL_10;
  }
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  __int16 v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v36 = v14;
    __int16 v37 = 2048;
    double v38 = v8;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot refresh before date %fs in the past: %@", buf, 0x20u);
  }
  if (v7)
  {
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:0 reason:@"The date is invalid" suggestion:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
  id v16 = 0;
LABEL_13:

  return v16;
}

void __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  id v4 = [v3 error];
  if (!v3)
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];

    id v4 = (void *)v5;
  }
  if (v4 && ([v4 isHMError] & 1) == 0)
  {
    id v6 = [v4 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F64ED0]];

    if (v7)
    {
      uint64_t v8 = [v4 code];
      uint64_t v9 = 52;
      if (v8 == 13) {
        uint64_t v9 = 8;
      }
      if (v8 == 12) {
        uint64_t v10 = 23;
      }
      else {
        uint64_t v10 = v9;
      }
    }
    else
    {
      uint64_t v10 = 52;
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v10 description:0 reason:0 suggestion:0 underlyingError:v4];

    id v4 = (void *)v11;
  }
  __int16 v12 = (void *)MEMORY[0x19F3A64A0]();
  id v13 = WeakRetained;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v30 = v15;
    __int16 v31 = 2112;
    id v32 = v4;
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Completed refresh request with error: %@", buf, 0x16u);
  }
  [v3 qualityOfService];
  dispatch_qos_class_t v16 = HMFQOSClassFromQualityOfService();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_545;
  block[3] = &unk_1E59454E8;
  id v28 = a1[4];
  id v17 = v4;
  id v27 = v17;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v16, 0, block);
  id v19 = v18;
  if (v13)
  {
    id v20 = [v13 context];
    __int16 v21 = [v20 delegateCaller];
    [v21 invokeBlock:v19];

    if (v3)
    {
      uint64_t v22 = [v13 context];
      __int16 v23 = [v22 queue];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_2;
      v24[3] = &unk_1E5945628;
      void v24[4] = v13;
      id v25 = v3;
      dispatch_async(v23, v24);
    }
  }
  else
  {
    (*((void (**)(dispatch_block_t))v18 + 2))(v18);
  }
}

uint64_t __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_546(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) generationCounter];
  unint64_t v3 = [*(id *)(a1 + 32) serverGenerationCounter];
  if (v2 != -1 && v2 >= v3)
  {
    unint64_t v8 = v3;
    uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = HMFGetLogIdentifier();
      int v16 = 138543874;
      id v17 = v12;
      __int16 v18 = 2048;
      unint64_t v19 = v2;
      __int16 v20 = 2048;
      unint64_t v21 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Informing client a refresh is not needed (%tu-%tu)", (uint8_t *)&v16, 0x20u);
    }
    return [*(id *)(a1 + 40) finish];
  }
  else
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 32);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      return [v5 addObject:v6];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:*(void *)(a1 + 40)];
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(v14 + 32);
      *(void *)(v14 + 32) = v13;
      return MEMORY[0x1F41817F8](v13, v15);
    }
  }
}

uint64_t __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_545(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __54__HMHomeManager__refreshBeforeDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    [*(id *)(v1 + 32) removeObject:*(void *)(a1 + 40)];
    if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "hmf_isEmpty"))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = *(void **)(v3 + 32);
      *(void *)(v3 + 32) = 0;
    }
  }
}

- (HMCameraClipsQuotaMessenger)cameraClipsQuotaMessenger
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  cameraClipsQuotaMessenger = self->_cameraClipsQuotaMessenger;
  if (!cameraClipsQuotaMessenger)
  {
    uint64_t v5 = [HMCameraClipsQuotaMessenger alloc];
    uint64_t v6 = [(HMHomeManager *)self context];
    int v7 = [(HMCameraClipsQuotaMessenger *)v5 initWithContext:v6];
    unint64_t v8 = self->_cameraClipsQuotaMessenger;
    self->_cameraClipsQuotaMessenger = v7;

    cameraClipsQuotaMessenger = self->_cameraClipsQuotaMessenger;
  }
  uint64_t v9 = cameraClipsQuotaMessenger;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)setResidentProvisioningStatus:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_residentProvisioningStatus == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_unint64_t residentProvisioningStatus = a3;
    os_unfair_lock_unlock(p_lock);
    uint64_t v6 = [(HMHomeManager *)self delegate];
    if ([v6 conformsToProtocol:&unk_1EEF6FE30]) {
      int v7 = v6;
    }
    else {
      int v7 = 0;
    }
    id v8 = v7;

    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [(HMHomeManager *)self context];
      id v10 = [v9 delegateCaller];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __47__HMHomeManager_setResidentProvisioningStatus___block_invoke;
      v11[3] = &unk_1E5945160;
      id v12 = v8;
      uint64_t v13 = self;
      unint64_t v14 = a3;
      [v10 invokeBlock:v11];
    }
  }
}

uint64_t __47__HMHomeManager_setResidentProvisioningStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) residentProvisioningStatusChanged:*(void *)(a1 + 48)];
}

uint64_t __55__HMHomeManager__notifyAccessAllowedWhenLockedUpdated___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = HMFBooleanToString();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateAccessAllowedWhenLocked with : %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) homeManager:*(void *)(a1 + 32) didUpdateAccessAllowedWhenLocked:*(unsigned __int8 *)(a1 + 48)];
}

- (void)notifyResidentEnabledUpdated:(BOOL)a3
{
  uint64_t v5 = [(HMHomeManager *)self delegate];
  if ([v5 conformsToProtocol:&unk_1EEF6FE30]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (objc_opt_respondsToSelector())
  {
    int v8 = [(HMHomeManager *)self context];
    uint64_t v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__HMHomeManager_notifyResidentEnabledUpdated___block_invoke;
    v10[3] = &unk_1E5944D60;
    id v11 = v7;
    uint64_t v12 = self;
    BOOL v13 = a3;
    [v9 invokeBlock:v10];
  }
}

uint64_t __46__HMHomeManager_notifyResidentEnabledUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateResidentEnabledForThisDevice:*(unsigned __int8 *)(a1 + 48)];
}

- (void)setResidentEnabledForThisDevice:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_residentEnabledForThisDevice = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)notifyResidentCapableUpdated:(BOOL)a3
{
  uint64_t v5 = [(HMHomeManager *)self delegate];
  if ([v5 conformsToProtocol:&unk_1EEF6FE30]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (objc_opt_respondsToSelector())
  {
    int v8 = [(HMHomeManager *)self context];
    uint64_t v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__HMHomeManager_notifyResidentCapableUpdated___block_invoke;
    v10[3] = &unk_1E5944D60;
    id v11 = v7;
    uint64_t v12 = self;
    BOOL v13 = a3;
    [v9 invokeBlock:v10];
  }
}

uint64_t __46__HMHomeManager_notifyResidentCapableUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateThisDeviceIsResidentCapable:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __56__HMHomeManager__updateStatusWithPayload_sourceIsFetch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManager:*(void *)(a1 + 40) didUpdateStatus:*(void *)(a1 + 48)];
}

- (void)_updateStatusWithPayload:(id)a3
{
}

- (void)_handleStatusUpdated:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 messagePayload];
  uint64_t v6 = [v4 numberForKey:@"kConfigGenerationCounterKey"];
  id v7 = [v4 numberForKey:@"status"];
  int v8 = v7;
  if (v6 && v7)
  {
    unint64_t v9 = [v7 unsignedIntegerValue];
    __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = HMFGetLogIdentifier();
      unint64_t v14 = HMHomeManagerStatusToString(v9);
      *(_DWORD *)buf = 138543874;
      id v40 = v13;
      __int16 v41 = 2112;
      uint64_t v42 = (uint64_t)v6;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v14;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling status updated message with generation counter: %@, status: %@", buf, 0x20u);
    }
    char v15 = [(HMHomeManager *)v11 status];
    uint64_t v16 = [(HMHomeManager *)v11 generationCounter];
    if (v16 == [v6 unsignedIntegerValue] || (v15 & 0x31) == 0 || (v9 & 0x31) != 0)
    {
      uint64_t v28 = [(HMHomeManager *)v11 _updateStatusWithPayload:v5 sourceIsFetch:0];
      if ((v9 & 0x31) != 0) {
        goto LABEL_18;
      }
    }
    else
    {
      id v17 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v18 = v11;
      unint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        double v38 = v5;
        unint64_t v21 = v17;
        uint64_t v22 = [v6 unsignedIntegerValue];
        uint64_t v23 = [(HMHomeManager *)v18 generationCounter];
        *(_DWORD *)buf = 138543874;
        id v40 = v20;
        __int16 v41 = 2048;
        uint64_t v42 = v22;
        id v17 = v21;
        uint64_t v5 = v38;
        __int16 v43 = 2048;
        uint64_t v44 = v23;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Adding busy status to updated status because home manager generation counter %lu does not match client's value of %lu", buf, 0x20u);
      }
      id v24 = [v4 messagePayload];
      id v25 = (void *)[v24 mutableCopy];

      id v26 = [NSNumber numberWithUnsignedInteger:v9 | 1];
      [v25 setObject:v26 forKeyedSubscript:@"status"];

      uint64_t v27 = [v25 copy];
      uint64_t v28 = [(HMHomeManager *)v18 _updateStatusWithPayload:v27 sourceIsFetch:0];
      uint64_t v5 = (void *)v27;
    }
    id v34 = (void *)MEMORY[0x19F3A64A0](v28);
    uint64_t v35 = v11;
    id v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      __int16 v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v40 = v37;
      _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_INFO, "%{public}@Force-fetching home configuration after homeManager status is good", buf, 0xCu);
    }
    [(HMHomeManager *)v35 _fetchHomeConfigurationWithRefreshRequested:0];
  }
  else
  {
    id v29 = (void *)MEMORY[0x19F3A64A0]();
    id v30 = self;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = HMFGetLogIdentifier();
      uint64_t v33 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      id v40 = v32;
      __int16 v41 = 2112;
      uint64_t v42 = (uint64_t)v33;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Status update message payload missing generation counter and/or status number: %@", buf, 0x16u);
    }
  }
LABEL_18:
}

- (BOOL)isDataSyncInProgress
{
  unint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = +[HMHomeManager dataSyncInProgressFromDataSyncState:v2->_dataSyncState];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

uint64_t __38__HMHomeManager__updateDataSyncState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManagerDidUpdateDataSyncState:*(void *)(a1 + 40)];
}

uint64_t __38__HMHomeManager__updateDataSyncState___block_invoke_450(uint64_t a1)
{
  return [*(id *)(a1 + 32) homeManagerDidUpdateDataSyncInProgress:*(void *)(a1 + 40)];
}

uint64_t __53__HMHomeManager__notifyClientOfMultiUserStateChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    int v8 = 138543618;
    unint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying client of multi user state change %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) homeManager:*(void *)(a1 + 32) didUpdateMultiUserStatus:*(void *)(a1 + 56) reason:*(void *)(a1 + 48)];
}

- (void)setHh2MigrationInProgress:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hh2MigrationInProgress = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setHasOptedToHH2:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_optedToHH2 = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setThisDeviceResidentCapable:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_thisDeviceResidentCapable = a3;

  os_unfair_lock_unlock(p_lock);
}

- (HMHome)primaryHome
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_primaryHome;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setInitialMergeComplete:(BOOL)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"%@ is unavailable", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  uint64_t v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@HMHomeManager deallocated", buf, 0xCu);
  }
  [(HMHomeManager *)v4 handleInstanceDestroyed];
  id v7 = [(HMHomeManager *)v4 homes];
  id v8 = [(HMHomeManager *)v4 incomingHomeInvitations];
  unint64_t v9 = [(_HMContext *)v4->_context queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__HMHomeManager_dealloc__block_invoke;
  block[3] = &unk_1E5945628;
  id v10 = v7;
  id v14 = v10;
  id v11 = v8;
  id v15 = v11;
  dispatch_async(v9, block);

  if (v4->_serverGenerationCounterToken != -1) {
    -[HMDarwinNotificationProvider notifyCancel:](v4->_darwinNotificationProvider, "notifyCancel:");
  }
  if (v4->_serverGenerationCounterDelayedConnectionToken != -1) {
    -[HMDarwinNotificationProvider notifyCancel:](v4->_darwinNotificationProvider, "notifyCancel:");
  }

  v12.receiver = v4;
  v12.super_class = (Class)HMHomeManager;
  [(HMHomeManager *)&v12 dealloc];
}

void __24__HMHomeManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v6++) _unconfigure];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "_unconfigure", (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

uint64_t __152__HMHomeManager_initWithUUID_configuration_context_xpcEventRouterClient_lastEventStore_timerFactory_darwinNotificationProvider_privacySettingsProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__start");
}

- (HMHomeManager)init
{
  uint64_t v3 = +[HMHomeManagerConfiguration defaultConfiguration];
  uint64_t v4 = [(HMHomeManager *)self initWithConfiguration:v3];

  return v4;
}

+ (void)fetchSetupModeWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "+[HMHomeManager fetchSetupModeWithCompletion:]", @"completion"];
    long long v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = a1;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];
    objc_exception_throw(v19);
  }
  uint64_t v5 = v4;
  uint64_t v6 = [[_HMContext alloc] initWithName:@"com.apple.HomeKit.SetupMode"];
  id v7 = (void *)MEMORY[0x1E4F654B0];
  id v8 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  uint64_t v10 = (void *)[v8 initWithTarget:v9];
  uint64_t v11 = [v7 messageWithName:@"HMHM.fetchSetupMode" destination:v10 payload:0];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__HMHomeManager_fetchSetupModeWithCompletion___block_invoke;
  v20[3] = &unk_1E5943468;
  id v21 = v5;
  id v12 = v5;
  [v11 setResponseHandler:v20];
  long long v13 = [(_HMContext *)v6 messageDispatcher];
  [v13 sendMessage:v11];
}

void __46__HMHomeManager_fetchSetupModeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v5 = objc_msgSend(a3, "hmf_numberForKey:", @"mode");
  if (!v6 && v5) {
    [v5 BOOLValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)removeAllHomeKitPairingIdentities
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMHomeManager *)self context];
  if (v3)
  {
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    uint64_t v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to delete all the HomeKit Pairing Identities before TTSU... Start", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    id v9 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v10 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v11 = [(HMHomeManager *)v6 uuid];
    uint64_t v12 = [v10 initWithTarget:v11];
    long long v13 = (void *)[v9 initWithName:@"HMHM.RemoveAllPairingIdentities" destination:v12 payload:MEMORY[0x1E4F1CC08]];

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __67__HMHomeManager_PairingIdentity__removeAllHomeKitPairingIdentities__block_invoke;
    v29[3] = &unk_1E5942170;
    void v29[4] = v6;
    p_long long buf = &buf;
    uint64_t v14 = v4;
    id v30 = v14;
    [v13 setResponseHandler:v29];
    long long v15 = [v3 messageDispatcher];
    [v15 sendMessage:v13];

    dispatch_time_t v16 = dispatch_time(0, 20000000000);
    LOBYTE(v12) = dispatch_group_wait(v14, v16) == 0;
    long long v17 = (void *)MEMORY[0x19F3A64A0]();
    long long v18 = v6;
    if (v12)
    {
      HMFGetOSLogHandle();
      uint64_t v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        *(_DWORD *)id v32 = 138543362;
        uint64_t v33 = v27;
        _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@Going to delete all the HomeKit Pairing Identities before TTSU... End", v32, 0xCu);
      }
      BOOL v21 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    }
    else
    {
      HMFGetOSLogHandle();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        *(_DWORD *)id v32 = 138543362;
        uint64_t v33 = v20;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Timed out while deleting the HomeKit pairing identities.", v32, 0xCu);
      }
      BOOL v21 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v23 = self;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context. Please initialize HomeKit properly", (uint8_t *)&buf, 0xCu);
    }
    BOOL v21 = 0;
  }

  return v21;
}

void __67__HMHomeManager_PairingIdentity__removeAllHomeKitPairingIdentities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Removing of all the HomeKit Pairing Identities finished with error : %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully removed all the HomeKit Pairing Identities.", (uint8_t *)&v13, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)deleteDatabaseEntityWithModelID:(id)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMHomeManager *)self context];
  if (!v7)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager(HMHomeManagerAdaptive) deleteDatabaseEntityWithModelID:completion:]", @"completion"];
    uint64_t v23 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v34 = v26;
      __int16 v35 = 2112;
      char v36 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    id v10 = (void *)MEMORY[0x1E4F654B0];
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v12 = [(HMHomeManager *)self uuid];
    int v13 = (void *)[v11 initWithTarget:v12];
    __int16 v31 = @"modelId";
    id v32 = v6;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    __int16 v15 = [v10 messageWithName:@"HMHM.deleteHH2Entity" destination:v13 payload:v14];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __83__HMHomeManager_HMHomeManagerAdaptive__deleteDatabaseEntityWithModelID_completion___block_invoke;
    v28[3] = &unk_1E5944EF0;
    id v16 = v9;
    id v29 = v16;
    id v30 = v7;
    [v15 setResponseHandler:v28];
    uint64_t v17 = [v16 messageDispatcher];
    [v17 sendMessage:v15 completionHandler:0];
  }
  else
  {
    long long v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v21 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v34 = v21;
      __int16 v35 = 2080;
      char v36 = "-[HMHomeManager(HMHomeManagerAdaptive) deleteDatabaseEntityWithModelID:completion:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
  }
}

void __83__HMHomeManager_HMHomeManagerAdaptive__deleteDatabaseEntityWithModelID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  if (v7)
  {
    id v5 = [*(id *)(a1 + 32) delegateCaller];
    [v5 callCompletion:*(void *)(a1 + 40) obj:0 error:v7];
  }
  else
  {
    id v5 = objc_msgSend(a3, "hmf_stringForKey:", @"entity");
    id v6 = [*(id *)(a1 + 32) delegateCaller];
    [v6 callCompletion:*(void *)(a1 + 40) obj:v5 error:0];
  }
}

- (void)checkIsUsingProductionObjectModelWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMHomeManager *)self context];
  if (!v4)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager(HMHomeManagerAdaptive) checkIsUsingProductionObjectModelWithCompletion:]", @"completion"];
    id v19 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v20 = self;
    BOOL v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v28 = v22;
      __int16 v29 = 2112;
      id v30 = (const char *)v18;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0];
    objc_exception_throw(v23);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1E4F654B0];
    id v8 = objc_alloc(MEMORY[0x1E4F65488]);
    id v9 = [(HMHomeManager *)self uuid];
    id v10 = (void *)[v8 initWithTarget:v9];
    id v11 = [v7 messageWithName:@"HMHM.checkIsUsingProductionObjectModel" destination:v10 payload:0];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88__HMHomeManager_HMHomeManagerAdaptive__checkIsUsingProductionObjectModelWithCompletion___block_invoke;
    v24[3] = &unk_1E5944EF0;
    id v12 = v6;
    id v25 = v12;
    id v26 = v4;
    [v11 setResponseHandler:v24];
    int v13 = [v12 messageDispatcher];
    [v13 sendMessage:v11 completionHandler:0];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v28 = v17;
      __int16 v29 = 2080;
      id v30 = "-[HMHomeManager(HMHomeManagerAdaptive) checkIsUsingProductionObjectModelWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
  }
}

void __88__HMHomeManager_HMHomeManagerAdaptive__checkIsUsingProductionObjectModelWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    uint64_t v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = 0;
    id v9 = v11;
  }
  else
  {
    uint64_t v10 = objc_msgSend(a3, "hmf_BOOLForKey:", @"usingProductionObjectModel");
    uint64_t v5 = [*(id *)(a1 + 32) delegateCaller];
    id v6 = v5;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = v10;
    id v9 = 0;
  }
  [v5 callCompletion:v7 value:v8 error:v9];
}

- (void)dumpCloudDatabase:(BOOL)a3 localDatabase:(BOOL)a4 workingDatabase:(BOOL)a5 fakeCloudModels:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  if (!v12)
  {
    uint64_t v27 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager(HMHomeManagerAdaptive) dumpCloudDatabase:localDatabase:workingDatabase:fakeCloudModels:completion:]", @"completion"];
    uint64_t v28 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v29 = self;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v40 = v31;
      __int16 v41 = 2112;
      uint64_t v42 = v27;
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
    objc_exception_throw(v32);
  }
  int v13 = v12;
  uint64_t v33 = [(HMHomeManager *)self context];
  uint64_t v14 = (void *)MEMORY[0x1E4F654B0];
  id v15 = objc_alloc(MEMORY[0x1E4F65488]);
  id v16 = [(HMHomeManager *)self uuid];
  uint64_t v17 = (void *)[v15 initWithTarget:v16];
  v37[0] = @"c";
  uint64_t v18 = [NSNumber numberWithBool:v10];
  v38[0] = v18;
  v37[1] = @"f";
  id v19 = [NSNumber numberWithBool:v7];
  v38[1] = v19;
  void v37[2] = @"l";
  __int16 v20 = [NSNumber numberWithBool:v9];
  v38[2] = v20;
  v37[3] = @"w";
  BOOL v21 = [NSNumber numberWithBool:v8];
  v38[3] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:4];
  id v23 = [v14 messageWithName:@"HMHM.dumpDatabase" destination:v17 payload:v22];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __115__HMHomeManager_HMHomeManagerAdaptive__dumpCloudDatabase_localDatabase_workingDatabase_fakeCloudModels_completion___block_invoke;
  v34[3] = &unk_1E5944EF0;
  id v35 = v33;
  id v36 = v13;
  id v24 = v13;
  id v25 = v33;
  [v23 setResponseHandler:v34];
  id v26 = [v25 messageDispatcher];
  [v26 sendMessage:v23 completionHandler:0];
}

void __115__HMHomeManager_HMHomeManagerAdaptive__dumpCloudDatabase_localDatabase_workingDatabase_fakeCloudModels_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = 0;
LABEL_3:
    id v8 = v5;
    goto LABEL_6;
  }
  id v6 = objc_msgSend(a3, "hmf_dataForKey:", @"d");
  if (!v6)
  {
    id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    goto LABEL_3;
  }
  id v8 = 0;
LABEL_6:
  BOOL v7 = [*(id *)(a1 + 32) delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) obj:v6 error:v8];
}

- (void)enableUARPPacketCapture:(BOOL)a3 capturePath:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMHomeManager(HMHomeManagerAdaptive) enableUARPPacketCapture:capturePath:completionHandler:]", @"completion"];
    id v26 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v27 = self;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v36 = v29;
      __int16 v37 = 2112;
      uint64_t v38 = v25;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];
    objc_exception_throw(v30);
  }
  BOOL v10 = v9;
  v33[0] = @"HMHomeManagerEnableUARPPacketCaptureEnableMessageKey";
  id v11 = [NSNumber numberWithBool:v6];
  v33[1] = @"HMHomeManagerEnableUARPPacketCapturePathMessageKey";
  v34[0] = v11;
  v34[1] = v8;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  id v13 = objc_alloc(MEMORY[0x1E4F654B0]);
  id v14 = objc_alloc(MEMORY[0x1E4F65488]);
  id v15 = [(HMHomeManager *)self uuid];
  id v16 = (void *)[v14 initWithTarget:v15];
  uint64_t v17 = (void *)[v13 initWithName:@"HMHomeManagerEnableUARPPacketCaptureMessage" destination:v16 payload:v12];

  uint64_t v18 = [(HMHomeManager *)self context];
  id v19 = [v18 pendingRequests];

  __int16 v20 = [v17 identifier];
  BOOL v21 = _Block_copy(v10);
  [v19 addCompletionBlock:v21 forIdentifier:v20];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __94__HMHomeManager_HMHomeManagerAdaptive__enableUARPPacketCapture_capturePath_completionHandler___block_invoke;
  v31[3] = &unk_1E5944EF0;
  void v31[4] = self;
  id v32 = v10;
  id v22 = v10;
  [v17 setResponseHandler:v31];
  id v23 = [(HMHomeManager *)self context];
  id v24 = [v23 messageDispatcher];
  [v24 sendMessage:v17];
}

void __94__HMHomeManager_HMHomeManagerAdaptive__enableUARPPacketCapture_capturePath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 context];
  id v5 = [v6 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)_endActiveAssertion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid assertion object" userInfo:0];
    objc_exception_throw(v11);
  }
  BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v10;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Ending active assertion: %@", (uint8_t *)&v12, 0x16u);
  }
  [v6 invalidate];
}

- (id)_beginActiveAssertionWithReason:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (__HMActiveAssertion *)a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Taking active assertion with reason: %@", buf, 0x16u);
  }
  id v9 = [NSString stringWithFormat:@"com.apple.HomeKit.ActiveAssertion.%@", v4];
  BOOL v10 = [__HMActiveAssertion alloc];
  id v11 = [(HMHomeManager *)v6 context];
  int v12 = [(HMHomeManager *)v6 messageTargetUUID];
  id v13 = [(__HMActiveAssertion *)v10 initWithName:v9 context:v11 messageTargetUUID:v12];

  __int16 v14 = (void *)MEMORY[0x19F3A64A0]([(__HMActiveAssertion *)v13 acquire:0]);
  id v15 = v6;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    __int16 v20 = v17;
    __int16 v21 = 2112;
    id v22 = v13;
    _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Took active assertion: %@", buf, 0x16u);
  }

  return v13;
}

- (void)prepareForDiagnosticExtensionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHomeManager *)self context];
  id v6 = (void *)MEMORY[0x1E4F654B0];
  id v7 = objc_alloc(MEMORY[0x1E4F65488]);
  id v8 = [(HMHomeManager *)self uuid];
  id v9 = (void *)[v7 initWithTarget:v8];
  BOOL v10 = [v6 messageWithName:@"HMHM.prepareForDiagnosticExtension" destination:v9 payload:MEMORY[0x1E4F1CC08]];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __82__HMHomeManager_DiagnosticExtension__prepareForDiagnosticExtensionWithCompletion___block_invoke;
  uint64_t v17 = &unk_1E5944EF0;
  id v18 = v5;
  id v19 = v4;
  id v11 = v4;
  id v12 = v5;
  [v10 setResponseHandler:&v14];
  id v13 = objc_msgSend(v12, "messageDispatcher", v14, v15, v16, v17);
  [v13 sendMessage:v10 completionHandler:0];
}

void __82__HMHomeManager_DiagnosticExtension__prepareForDiagnosticExtensionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (BOOL)accessorySettingsDataSource:(id)a3 transformHomeUUID:(id)a4 mediaSystemUUID:(id)a5 toClientHomeIdentifier:(id *)a6 clientMediaSystemIdentifier:(id *)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [(HMHomeManager *)self currentHomes];
  uint64_t v16 = [v15 firstItemWithUUID:v13];

  if (v16)
  {
    uint64_t v17 = [v16 mediaSystemWithUUID:v14];
    BOOL v18 = v17 != 0;
    if (v17)
    {
      if (a6)
      {
        *a6 = [v16 uniqueIdentifier];
      }
      if (a7)
      {
        *a7 = [v17 uniqueIdentifier];
      }
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x19F3A64A0]();
      id v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = HMFGetLogIdentifier();
        int v28 = 138543874;
        __int16 v29 = v26;
        __int16 v30 = 2112;
        id v31 = v14;
        __int16 v32 = 2112;
        uint64_t v33 = v16;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no media system with uuid: %@ home: %@", (uint8_t *)&v28, 0x20u);
      }
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      int v28 = 138543618;
      __int16 v29 = v22;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no home with uuid: %@", (uint8_t *)&v28, 0x16u);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)accessorySettingsDataSource:(id)a3 transformHomeUUID:(id)a4 accessoryUUID:(id)a5 toClientHomeIdentifier:(id *)a6 clientAccessoryIdentifier:(id *)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [(HMHomeManager *)self currentHomes];
  uint64_t v16 = [v15 firstItemWithUUID:v13];

  if (v16)
  {
    uint64_t v17 = [v16 accessoryWithUUID:v14];
    BOOL v18 = v17 != 0;
    if (v17)
    {
      if (a6)
      {
        *a6 = [v16 uniqueIdentifier];
      }
      if (a7)
      {
        *a7 = [v17 uniqueIdentifier];
      }
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x19F3A64A0]();
      id v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = HMFGetLogIdentifier();
        int v28 = 138543874;
        __int16 v29 = v26;
        __int16 v30 = 2112;
        id v31 = v14;
        __int16 v32 = 2112;
        uint64_t v33 = v16;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no accessory with uuid: %@ home: %@", (uint8_t *)&v28, 0x20u);
      }
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      int v28 = 138543618;
      __int16 v29 = v22;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform to client identifiers due to no home with uuid: %@", (uint8_t *)&v28, 0x16u);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (id)accessorySettingsDataSource:(id)a3 homeWithHomeIdentifier:(id)a4
{
  return [(HMHomeManager *)self homeWithUniqueIdentifier:a4];
}

- (id)createAccessorySettingsMessengerWithHomeUUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    BOOL v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating accessory settings messenger with home uuid: %@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v9 = [(HMHomeManager *)v6 accessorySettingsMetricsDispatcher];
  if (!v9) {
    _HMFPreconditionFailure();
  }
  BOOL v10 = (void *)v9;
  id v11 = +[HMAccessorySettingsMessenger messageTargetUUIDWithHomeUUID:v4];
  id v12 = [HMAccessorySettingsMessenger alloc];
  id v13 = [(HMHomeManager *)v6 context];
  id v14 = [v13 messageDispatcher];
  uint64_t v15 = [(HMAccessorySettingsMessenger *)v12 initWithMessageDispatcher:v14 messageTargetUUID:v11 metricsDispatcher:v10];

  return v15;
}

- (void)createAutoAddWalletKeySupressionAssertionWithIncomingInvitation:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 homeUUID];
  uint64_t v9 = [v6 identifier];
  BOOL v10 = [[HMAutoAddWalletKeySupressionAssertion alloc] initWithHomeManager:self homeUUID:v8];
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543874;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v9;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Acquiring auto add wallet key suppression assertion for home: %@ invitation: %@", buf, 0x20u);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __100__HMHomeManager_Wallet__createAutoAddWalletKeySupressionAssertionWithIncomingInvitation_completion___block_invoke;
  v18[3] = &unk_1E5943B08;
  void v18[4] = v12;
  id v19 = v9;
  id v20 = v10;
  id v21 = v7;
  uint64_t v15 = v10;
  id v16 = v7;
  id v17 = v9;
  [(HMAutoAddWalletKeySupressionAssertion *)v15 acquireWithCompletion:v18];
}

void __100__HMHomeManager_Wallet__createAutoAddWalletKeySupressionAssertionWithIncomingInvitation_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138543874;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to acquire auto add wallet key suppression assertion for invitation %@:%@", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = HMFGetLogIdentifier();
    id v11 = *(void **)(a1 + 40);
    int v12 = 138543618;
    id v13 = v10;
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully acquired auto add wallet key suppression assertion for invitation: %@", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)handleInstanceDestroyed
{
  if (isInternalBuild())
  {
    os_unfair_lock_lock_with_options();
    id v3 = [(id)objc_opt_class() instanceTracker];
    [v3 removeObject:self];

    os_unfair_lock_unlock((os_unfair_lock_t)&instanceTrackerLock);
  }
}

@end
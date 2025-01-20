@interface HMDAppleMediaAccessory
+ (BOOL)shouldAcceptMessage:(id)a3 home:(id)a4 privilege:(unint64_t)a5;
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_allowSoftwareUpdateChangeFromSource:(unint64_t)a3;
- (BOOL)_shouldFilterAccessoryProfileForEntitledClients:(id)a3;
- (BOOL)_shouldFilterAccessoryProfileForUnentitledClients:(id)a3;
- (BOOL)fixedPairingIdentityInCloud;
- (BOOL)hasValidHome:(id)a3 backingStore:(id)a4 messageDispatcher:(id)a5;
- (BOOL)isAppleTV;
- (BOOL)isAudioAnalysisEventNotificationEnabled;
- (BOOL)isCurrentAccessory;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)isDeviceReachable;
- (BOOL)isDoorbellChimeSettingEnabled;
- (BOOL)isHomePod;
- (BOOL)isHomePod2ndGen;
- (BOOL)isHomePodMini;
- (BOOL)isMatchingCachedEventPublicPairingIdentity:(id)a3;
- (BOOL)isMultiUserEnabledForAccessorySettingsController:(id)a3;
- (BOOL)isReadyForSensorPairing:(id)a3;
- (BOOL)isRemotelyReachable;
- (BOOL)isResidentConfirmedForAppleMediaAccessorySensorManager:(id)a3;
- (BOOL)legacyLocationServicesEnabled;
- (BOOL)shouldApplySoftwareUpdateWhenFound;
- (BOOL)shouldUpdateWithDevice:(id)a3 initialConfiguration:(BOOL)a4;
- (BOOL)supportsAnnounce;
- (BOOL)supportsAudioAnalysis;
- (BOOL)supportsAudioReturnChannel;
- (BOOL)supportsCompanionInitiatedObliterate;
- (BOOL)supportsCompanionInitiatedRestart;
- (BOOL)supportsCoordinationDoorbellChime;
- (BOOL)supportsCoordinationFreeDoorbellChime;
- (BOOL)supportsDoorbellChime;
- (BOOL)supportsDropIn;
- (BOOL)supportsHomeHub;
- (BOOL)supportsHomeLevelLocationServiceSetting;
- (BOOL)supportsJustSiri;
- (BOOL)supportsManagedConfigurationProfile;
- (BOOL)supportsMediaActions;
- (BOOL)supportsMediaContentProfile;
- (BOOL)supportsMessagedHomePodSettings;
- (BOOL)supportsMultiUser;
- (BOOL)supportsMusicAlarm;
- (BOOL)supportsPreferredMediaUser;
- (BOOL)supportsRMVonAppleTV;
- (BOOL)supportsSoftwareUpdate;
- (BOOL)supportsSoftwareUpdateV2;
- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification;
- (BOOL)supportsTargetControl;
- (BOOL)supportsThirdPartyMusic;
- (BOOL)supportsUserManagement;
- (BOOL)supportsUserMediaSettings;
- (HMAccessoryCapabilities)capabilitiesInternal;
- (HMDAccessorySettingsController)settingsController;
- (HMDAccessorySetupMetricDispatcher)accessorySetupMetricDispatcher;
- (HMDAccessorySymptomHandler)symptomsHandler;
- (HMDAppleMediaAccessory)accessoryWithUUID:(id)a3 forAppleMediaAccessoryLocalMessageHandler:(id)a4;
- (HMDAppleMediaAccessory)accessoryWithUUID:(id)a3 forAppleMediaAccessorySensorManager:(id)a4;
- (HMDAppleMediaAccessory)init;
- (HMDAppleMediaAccessory)initWithCoder:(id)a3;
- (HMDAppleMediaAccessory)initWithDependencyFactory:(id)a3 deviceMediaRouteIdentifierFactory:(id)a4;
- (HMDAppleMediaAccessory)initWithDeviceController:(id)a3 deviceIdentifierFactory:(id)a4;
- (HMDAppleMediaAccessory)initWithTransaction:(id)a3 home:(id)a4;
- (HMDAppleMediaAccessory)initWithTransaction:(id)a3 home:(id)a4 dependencyFactory:(id)a5;
- (HMDAppleMediaAccessoryDataSource)dataSource;
- (HMDAppleMediaAccessoryDependencyFactory)dependencyFactory;
- (HMDAppleMediaAccessoryInfoController)currentAccessoryInfoController;
- (HMDAppleMediaAccessoryInfoSubscriber)accessoryInfoSubscriber;
- (HMDAppleMediaAccessoryMessenger)messenger;
- (HMDAppleMediaAccessoryMetricsDispatcher)metricsDispatcher;
- (HMDAppleMediaAccessorySensorManager)sensorManager;
- (HMDAppleMediaAccessorySleepWakeStateController)sleepWakeStateController;
- (HMDAudioAnalysisEventSubscriber)audioAnalysisEventSubscriber;
- (HMDAudioAnalysisRequestManager)audioAnalysisRequestManager;
- (HMDBackingStore)backingStore;
- (HMDCurrentAccessorySetupMetricDispatcher)currentAccessorySetupMetricDispatcher;
- (HMDDevice)device;
- (HMDDevice)deviceForDirectMessaging;
- (HMDDeviceAddress)deviceAddress;
- (HMDDoorbellChimeProfile)doorbellChimeProfile;
- (HMDFetchedAccessorySettingsController)currentAccessorySettingsController;
- (HMDMediaDestinationController)audioDestinationController;
- (HMDMediaDestinationControllerFactory)mediaDestinationControllerFactory;
- (HMDMediaDestinationManager)audioDestinationManager;
- (HMDMediaDestinationManagerFactory)mediaDestinationManagerFactory;
- (HMDMessageRouter)messageRouter;
- (HMDPreferredMediaUserEventController)preferredMediaUserEventController;
- (HMDRemoteLoginHandler)remoteLoginHandler;
- (HMDSoftwareUpdateEventListener)softwareUpdateListener;
- (HMDSoftwareUpdateEventProvider)softwareUpdateProvider;
- (HMDSoftwareUpdateInstallProvider)softwareUpdateInstallProvider;
- (HMDTargetControlManager)targetControlManager;
- (HMDarwinNotificationProvider)darwinNotificationProvider;
- (HMEEventForwarder)eventForwarder;
- (HMELastEventStoreReadHandle)eventStoreReadHandle;
- (HMESubscriptionProviding)subscriptionProvider;
- (HMFActivity)setupActivity;
- (HMFPairingIdentity)lastCreatedPairingIdentity;
- (HMFPairingIdentity)pairingIdentity;
- (HMFSoftwareVersion)softwareVersion;
- (HMFWiFiManager)wifiManager;
- (HMFWiFiNetworkInfo)lastStagedWifiNetworkInfo;
- (HMFWiFiNetworkInfo)wifiNetworkInfo;
- (HMMLogEventSubmitting)logEventSubmitter;
- (HMMediaDestination)audioDestination;
- (HMMediaDestinationControllerData)audioDestinationControllerData;
- (HMSoftwareUpdateDescriptor)lastSentSoftwareUpdateDescriptor;
- (HMSoftwareUpdateProgress)lastSentSoftwareUpdateProgress;
- (NSArray)supportedMultiUserLanguageCodes;
- (NSData)deviceIRK;
- (NSData)rawCapabilities;
- (NSHashTable)hostedAccessories;
- (NSPredicate)audioAnalysisEventNotificationCondition;
- (NSString)description;
- (NSUUID)idsIdentifier;
- (NSUUID)sensorAccessoryUUID;
- (double)setupStartTimestamp;
- (id)_createMediaProfile;
- (id)_dumpStateCachedSettingsForHome:(id)a3 accessory:(id)a4 eventStoreReadHandle:(id)a5;
- (id)_initWithCoder:(id)a3;
- (id)_scanForSoftwareUpdate;
- (id)_scanForSoftwareUpdateWithRetries;
- (id)_softwareUpdateV2FromDescriptor:(id)a3;
- (id)accessoriesWithHostUUID:(id)a3 forAppleMediaAccessorySensorManager:(id)a4;
- (id)accessoryBrowserForAppleMediaAccessorySensorManager:(id)a3;
- (id)accessoryInfoControllerSoftwareVersionTopicForController:(id)a3;
- (id)accessoryInfoControllerTopicForWifiInfo;
- (id)appleMediaProfileForAccessoryUUID:(id)a3;
- (id)assistantAccessControlModelWithRemovedAccessoriesForAccessorySettingsController:(id)a3;
- (id)assistantObject;
- (id)availableDestinationIdentifiersForMediaDestinationController:(id)a3;
- (id)backingStoreObjectForMediaDestination;
- (id)backingStoreObjectForMediaDestinationControllerData;
- (id)backingStoreObjects:(int64_t)a3;
- (id)cachedEventPairingIdentity;
- (id)committedAudioDestination;
- (id)committedAudioDestinationControllerData;
- (id)controller:(id)a3 topicForKeyPath:(id)a4;
- (id)createAppleMediaAccessoryMessengerWithIdentifier:(id)a3 messageDispatcher:(id)a4 router:(id)a5 localHandler:(id)a6;
- (id)currentAccessorySoftwareVersion;
- (id)currentDestinationTypeForMediaDestinationControllerMetricsEventDispatcher:(id)a3;
- (id)currentDeviceProductInfoForAppleMediaAccessorySleepWakeStateController:(id)a3;
- (id)currentRoomForAppleMediaAccessoryMetricsDispatcher:(id)a3;
- (id)currentUserForMediaDestinationControllerMetricsEventDispatcher:(id)a3;
- (id)defaultAudioGroupIdentifier;
- (id)deviceMediaRouteIdentifierFactory;
- (id)deviceMonitor;
- (id)dumpSimpleState;
- (id)dumpState;
- (id)dumpStateLocalSettings;
- (id)eventSourceIdentifierNameForAccessoryInfoController:(id)a3;
- (id)eventSourceIdentifierNameForFetchedSettingsController:(id)a3;
- (id)firstCloudKitImportFutureForAppleMediaAccessorySensorManager:(id)a3;
- (id)homeUUID;
- (id)homeUUIDForAppleMediaAccessorySensorManager:(id)a3;
- (id)idsIdentifierInternal;
- (id)keychainStoreForAppleMediaAccessorySensorManager:(id)a3;
- (id)languageValueList;
- (id)legacyAudioDestination;
- (id)legacyAudioDestinationControllerData;
- (id)legacyCommittedAudioDestination;
- (id)legacyCommittedAudioDestinationControllerData;
- (id)logIdentifier;
- (id)logSubmitterForAppleMediaAccessorySensorManager:(id)a3;
- (id)mediaDestinationController:(id)a3 destinationManagerWithIdentifier:(id)a4;
- (id)mediaDestinationController:(id)a3 destinationWithParentIdentifier:(id)a4;
- (id)mediaDestinationController:(id)a3 rootDestinationWithDecendantIdentifier:(id)a4;
- (id)mediaDestinationControllerWithData:(id)a3 backingStore:(id)a4 messageDispatcher:(id)a5 notificationCenter:(id)a6 logEventSubmitter:(id)a7 dailyScheduler:(id)a8 targetDevice:(BOOL)a9 dataSource:(id)a10 delegate:(id)a11;
- (id)mediaDestinationManager:(id)a3 destinationControllerWithIdentifier:(id)a4;
- (id)mediaDestinationManagerWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 backingStore:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9;
- (id)mediaGroupLocalDataStorageForMediaDestinationController:(id)a3;
- (id)mediaGroupParticipantDataLocalStorage;
- (id)mediaGroupParticipantLocalDataStorageForMediaDestinationManager:(id)a3;
- (id)messageSendPolicy;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)modelsToMakeSettingsForController:(id)a3 parentUUID:(id)a4;
- (id)modelsToMigrateSettingsForController:(id)a3;
- (id)notificationCenterForAppleMediaAccessorySensorManager:(id)a3;
- (id)pairingIdentityTopic;
- (id)remoteMessageDestination;
- (id)remoteMessageDestinationForAccessorySettingsController:(id)a3 target:(id)a4;
- (id)residentNotificationObjectForAppleMediaAccessorySensorManager:(id)a3;
- (id)residentSyncClientDidSyncFutureForAppleMediaAccessorySensorManager:(id)a3;
- (id)rootDestinationManagerForMediaDestinationManager:(id)a3;
- (id)runtimeState;
- (id)settingsConnectionFactory;
- (id)transactionWithObjectChangeType:(unint64_t)a3;
- (int64_t)fallbackMediaUserType;
- (int64_t)mediaDestinationControllerMetricsEventDispatcher:(id)a3 destinationTypeForDestinationWithIdentifier:(id)a4;
- (int64_t)numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher:(id)a3;
- (int64_t)numberOfCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:(id)a3;
- (int64_t)numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:(id)a3;
- (int64_t)productColor;
- (int64_t)reachableTransports;
- (unint64_t)expectedDestinationSupportOptions;
- (unint64_t)homePodVariant;
- (unint64_t)supportedStereoPairVersions;
- (unint64_t)variant;
- (void)_applySoftwareUpdateModel:(id)a3 completion:(id)a4;
- (void)_applySoftwareUpdateWithDescriptor:(id)a3;
- (void)_configureGroupParticipantLocalDataStorageWithHome:(id)a3;
- (void)_encodeMediaDestinationAndControllerDataWithCoder:(id)a3;
- (void)_encodeWithCoder:(id)a3;
- (void)_fetchMultiUserLanguages;
- (void)_fixCloudKeyIfNeeded;
- (void)_handleAudioAnalysisBulletinBoardCommit:(id)a3;
- (void)_handleTriggerPairingIdentityUpdateNotification:(id)a3;
- (void)_handleUpdatedName:(id)a3;
- (void)_installManagedConfigurationProfileWithData:(id)a3 completion:(id)a4;
- (void)_legacyEncodeMediaDestinationAndControllerDataWithCoder:(id)a3;
- (void)_registerForMessages;
- (void)_relayRequestMessage:(id)a3 responseHandler:(id)a4;
- (void)_removeManagedConfigurationProfileWithIdentifier:(id)a3 completion:(id)a4;
- (void)_scanForSoftwareUpdateRepeatedlyAndInstallUpdate:(BOOL)a3;
- (void)_startUpdate:(id)a3;
- (void)_updateSoftwareVersion:(id)a3;
- (void)accessoryInfoController:(id)a3 didUpdateWifiInfo:(id)a4;
- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4;
- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4 model:(id)a5;
- (void)addAdvertisement:(id)a3;
- (void)addHostedAccessory:(id)a3;
- (void)addUser:(id)a3 completionHandler:(id)a4;
- (void)autoConfigureTargetControllers;
- (void)configureAppleMediaAccessoryMessengerWithFactory:(id)a3;
- (void)configureAudioDestinationController;
- (void)configureAudioDestinationManager;
- (void)configurePairingIdentity;
- (void)configureTargetController:(id)a3;
- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6;
- (void)createAccessoryInfoSubscriberIfNecessary;
- (void)createAudioDestination;
- (void)createAudioDestinationController;
- (void)createNewPairingIdentity;
- (void)createSoftwareUpdateEventListenerIfNecessary;
- (void)currentAccessorySensorStatusFlagsForAppleMediaAccessoryMetricsDispatcher:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteSiriHistoryForAccessoryWithUUID:(id)a3 completionHandler:(id)a4;
- (void)deviceController:(id)a3 didUpdateDevice:(id)a4;
- (void)encodeFlagsFromHostedAccessories:(id)a3 coder:(id)a4;
- (void)encodeServicesFromHostedAccessories:(id)a3 coder:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)forwardAccessoryPublicPairingIdentity:(id)a3;
- (void)handleCurrentDeviceIRKUpdated:(id)a3;
- (void)handleCurrentDeviceUpdated:(id)a3;
- (void)handleCurrentNetworkChangedNotification:(id)a3;
- (void)handleDeleteSiriHistoryRequest:(id)a3;
- (void)handleDeviceIsNotReachable:(id)a3;
- (void)handleDeviceIsReachable:(id)a3;
- (void)handleFetchManagedConfigurationProfiles:(id)a3;
- (void)handleHomeUserRemovedNotification:(id)a3;
- (void)handleInstallManagedConfigurationProfile:(id)a3;
- (void)handleRemoveManagedConfigurationProfile:(id)a3;
- (void)handleRemovedMediaDestinationControllerModel:(id)a3 message:(id)a4;
- (void)handleRemovedMediaDestinationModel:(id)a3 message:(id)a4;
- (void)handleRoomChanged:(id)a3;
- (void)handleRoomNameChanged:(id)a3;
- (void)handleSoftwareUpdateDidBecomeAvailableWithDescriptor:(id)a3;
- (void)handleSoftwareUpdateV2Scan:(id)a3;
- (void)handleSoftwareUpdateV2ScanRepeatedlyAndApplyMessage:(id)a3;
- (void)handleTransactionUpdatedPublicPairingIdentity:(id)a3 result:(id)a4;
- (void)handleUpdatePreferredMediaUser:(id)a3;
- (void)handleUpdatedMediaDestinationControllerModel:(id)a3 message:(id)a4;
- (void)handleUpdatedMediaDestinationModel:(id)a3 message:(id)a4;
- (void)infoSubscriber:(id)a3 didReceiveWiFiInfoUpdate:(id)a4;
- (void)languagesChangedForAccessorySettingsController:(id)a3;
- (void)legacyCreateAudioDestinationControllerWithControllerIdentifier:(id)a3;
- (void)legacyCreateAudioDestinationWithIdentifier:(id)a3 supportedOptions:(unint64_t)a4;
- (void)mediaDestinationControllerDidUpdateStagedValues:(id)a3;
- (void)mediaDestinationManagerDidUpdateStagedValues:(id)a3;
- (void)mergeAudioDestination:(id)a3;
- (void)mergeAudioDestinationControllerData:(id)a3;
- (void)migrateLocalParticipantData;
- (void)notifyClientsOfUpdatedAccessoryControllableValue:(BOOL)a3;
- (void)notifyFrameworkOfUpdatedPairingIdentity;
- (void)pairingsWithCompletionHandler:(id)a3;
- (void)performAfterDelay:(double)a3 block:(id)a4 queue:(id)a5;
- (void)performLocalAddAccessoryWithDescription:(id)a3 progressHandlerDelegate:(id)a4 completion:(id)a5;
- (void)populateModelObject:(id)a3 version:(int64_t)a4;
- (void)postDeviceIRKIfDifferent:(id)a3;
- (void)removeAdvertisement:(id)a3;
- (void)removeAudioDestination;
- (void)removeHostedAccessory:(id)a3;
- (void)removeManagedConfigurationProfileWithProfileData:(id)a3 completion:(id)a4;
- (void)removeUser:(id)a3 completionHandler:(id)a4;
- (void)renameService:(id)a3 name:(id)a4;
- (void)runTransactionWithPreferredMediaUserUUID:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5;
- (void)setAccessoryInfoSubscriber:(id)a3;
- (void)setAudioAnalysisEventNotificationCondition:(id)a3;
- (void)setAudioAnalysisEventNotificationEnabled:(BOOL)a3;
- (void)setAudioAnalysisEventSubscriber:(id)a3;
- (void)setAudioAnalysisRequestManager:(id)a3;
- (void)setAudioDestinationController:(id)a3;
- (void)setAudioDestinationManager:(id)a3;
- (void)setCapabilitiesInternal:(id)a3;
- (void)setCurrentAccessoryInfoController:(id)a3;
- (void)setCurrentAccessorySettingsController:(id)a3;
- (void)setDarwinNotificationProvider:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDependencyFactory:(id)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setDeviceController:(id)a3;
- (void)setDeviceIRK:(id)a3;
- (void)setDeviceReachable:(BOOL)a3;
- (void)setFixedPairingIdentityInCloud:(BOOL)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setLastCreatedPairingIdentity:(id)a3;
- (void)setLastStagedWifiNetworkInfo:(id)a3;
- (void)setMediaDestinationControllerFactory:(id)a3;
- (void)setMediaDestinationManagerFactory:(id)a3;
- (void)setMessenger:(id)a3;
- (void)setMetricsDispatcher:(id)a3;
- (void)setPairingIdentity:(id)a3;
- (void)setPreferredMediaUserEventController:(id)a3;
- (void)setProductColor:(int64_t)a3;
- (void)setRawCapabilities:(id)a3;
- (void)setRemotelyReachable:(BOOL)a3;
- (void)setSensorManager:(id)a3;
- (void)setSettingsConnectionFactory:(id)a3;
- (void)setSettingsController:(id)a3;
- (void)setSetupActivity:(id)a3;
- (void)setSetupStartTimestamp:(double)a3;
- (void)setShouldApplySoftwareUpdateWhenFound:(BOOL)a3;
- (void)setSleepWakeStateController:(id)a3;
- (void)setSoftwareUpdateInstallProvider:(id)a3;
- (void)setSoftwareUpdateListener:(id)a3;
- (void)setSoftwareUpdateProvider:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setSupportedMultiUserLanguageCodes:(id)a3;
- (void)setSupportedStereoPairVersions:(unint64_t)a3;
- (void)setSymptomsHandler:(id)a3;
- (void)setTargetControlManager:(id)a3;
- (void)setVariant:(unint64_t)a3;
- (void)setWifiManager:(id)a3;
- (void)setWifiNetworkInfo:(id)a3;
- (void)startMonitoringReachability;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)unsetAudioDestination;
- (void)unsetAudioDestinationControllerData;
- (void)updatePreferredMediaUser:(id)a3 selectionType:(unint64_t)a4;
- (void)updatePreferredMediaUserWithUUID:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5;
- (void)updateProductInformation;
- (void)updateReachabilityOfCurrentDevice;
- (void)updateWiFiNetworkInfo;
- (void)updateWithDevice:(id)a3;
@end

@implementation HMDAppleMediaAccessory

- (void)deleteSiriHistoryForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [(HMDAppleMediaAccessory *)self messenger];
  v9 = v8;
  if (v8)
  {
    [v8 sendDeleteSiriHistoryRequestForAccessoryWithUUID:v6 completionHandler:v7];
  }
  else
  {
    v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get messenger to delete siri history for accessory with uuid: %@ error: %@", (uint8_t *)&v15, 0x20u);
    }
    v7[2](v7, v10);
  }
}

- (BOOL)supportsHomeHub
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(HMDAppleMediaAccessory *)self capabilities];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 supportsHomeHub];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [(HMDAppleMediaAccessory *)v7 device];
      int v12 = 138543874;
      v13 = v9;
      __int16 v14 = 2112;
      int v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = 0;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get supports home hub due to no capabilities or device: %@, capabilities: %@", (uint8_t *)&v12, 0x20u);
    }
    char v5 = 0;
  }

  return v5;
}

- (HMDAppleMediaAccessory)accessoryWithUUID:(id)a3 forAppleMediaAccessoryLocalMessageHandler:(id)a4
{
  id v5 = a3;
  id v6 = [(HMDAccessory *)self home];
  v7 = [v6 accessoryWithUUID:v5];

  return (HMDAppleMediaAccessory *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAnalysisEventNotificationCondition, 0);
  objc_storeStrong(&self->_settingsConnectionFactory, 0);
  objc_storeStrong((id *)&self->_accessoryInfoSubscriber, 0);
  objc_storeStrong((id *)&self->_currentAccessoryInfoController, 0);
  objc_storeStrong((id *)&self->_currentAccessorySettingsController, 0);
  objc_storeStrong((id *)&self->_sensorManager, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_softwareUpdateInstallProvider, 0);
  objc_storeStrong((id *)&self->_softwareUpdateProvider, 0);
  objc_storeStrong((id *)&self->_hostedAccessories, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_destroyWeak((id *)&self->_mediaDestinationManagerFactory);
  objc_destroyWeak((id *)&self->_mediaDestinationControllerFactory);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_symptomsHandler, 0);
  objc_storeStrong((id *)&self->_darwinNotificationProvider, 0);
  objc_storeStrong((id *)&self->_dependencyFactory, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserEventController, 0);
  objc_storeStrong((id *)&self->_sleepWakeStateController, 0);
  objc_storeStrong(&self->_deviceMediaRouteIdentifierFactory, 0);
  objc_storeStrong((id *)&self->_lastCreatedPairingIdentity, 0);
  objc_storeStrong((id *)&self->_softwareUpdateListener, 0);
  objc_storeStrong((id *)&self->_audioAnalysisEventSubscriber, 0);
  objc_storeStrong((id *)&self->_audioAnalysisRequestManager, 0);
  objc_storeStrong((id *)&self->_audioDestinationController, 0);
  objc_storeStrong((id *)&self->_audioDestinationManager, 0);
  objc_storeStrong((id *)&self->_supportedMultiUserLanguageCodes, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_targetControlManager, 0);
  objc_storeStrong((id *)&self->_deviceIRK, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_rawCapabilities, 0);
  objc_storeStrong((id *)&self->_capabilitiesInternal, 0);
  objc_storeStrong((id *)&self->_lastStagedWifiNetworkInfo, 0);
  objc_storeStrong((id *)&self->_wifiNetworkInfo, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_remoteLoginHandler, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_committedAudioDestinationControllerData, 0);
  objc_storeStrong((id *)&self->_committedAudioDestination, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setAudioAnalysisEventNotificationCondition:(id)a3
{
}

- (NSPredicate)audioAnalysisEventNotificationCondition
{
  return (NSPredicate *)objc_getProperty(self, a2, 856, 1);
}

- (void)setAudioAnalysisEventNotificationEnabled:(BOOL)a3
{
  self->_audioAnalysisEventNotificationEnabled = a3;
}

- (BOOL)isAudioAnalysisEventNotificationEnabled
{
  return self->_audioAnalysisEventNotificationEnabled;
}

- (void)setSettingsConnectionFactory:(id)a3
{
}

- (id)settingsConnectionFactory
{
  return objc_getProperty(self, a2, 848, 1);
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setAccessoryInfoSubscriber:(id)a3
{
}

- (HMDAppleMediaAccessoryInfoSubscriber)accessoryInfoSubscriber
{
  return (HMDAppleMediaAccessoryInfoSubscriber *)objc_getProperty(self, a2, 832, 1);
}

- (void)setCurrentAccessoryInfoController:(id)a3
{
}

- (HMDAppleMediaAccessoryInfoController)currentAccessoryInfoController
{
  return (HMDAppleMediaAccessoryInfoController *)objc_getProperty(self, a2, 824, 1);
}

- (void)setCurrentAccessorySettingsController:(id)a3
{
}

- (HMDFetchedAccessorySettingsController)currentAccessorySettingsController
{
  return (HMDFetchedAccessorySettingsController *)objc_getProperty(self, a2, 816, 1);
}

- (void)setSensorManager:(id)a3
{
}

- (HMDAppleMediaAccessorySensorManager)sensorManager
{
  return (HMDAppleMediaAccessorySensorManager *)objc_getProperty(self, a2, 808, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDAppleMediaAccessoryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAppleMediaAccessoryDataSource *)WeakRetained;
}

- (void)setFixedPairingIdentityInCloud:(BOOL)a3
{
  self->_fixedPairingIdentityInCloud = a3;
}

- (BOOL)fixedPairingIdentityInCloud
{
  return self->_fixedPairingIdentityInCloud;
}

- (void)setSoftwareUpdateInstallProvider:(id)a3
{
}

- (HMDSoftwareUpdateInstallProvider)softwareUpdateInstallProvider
{
  return (HMDSoftwareUpdateInstallProvider *)objc_getProperty(self, a2, 792, 1);
}

- (void)setSoftwareUpdateProvider:(id)a3
{
}

- (HMDSoftwareUpdateEventProvider)softwareUpdateProvider
{
  return (HMDSoftwareUpdateEventProvider *)objc_getProperty(self, a2, 784, 1);
}

- (NSHashTable)hostedAccessories
{
  return (NSHashTable *)objc_getProperty(self, a2, 776, 1);
}

- (void)setMetricsDispatcher:(id)a3
{
}

- (HMDAppleMediaAccessoryMetricsDispatcher)metricsDispatcher
{
  return (HMDAppleMediaAccessoryMetricsDispatcher *)objc_getProperty(self, a2, 768, 1);
}

- (void)setWifiManager:(id)a3
{
}

- (HMFWiFiManager)wifiManager
{
  return (HMFWiFiManager *)objc_getProperty(self, a2, 760, 1);
}

- (void)setMediaDestinationManagerFactory:(id)a3
{
}

- (HMDMediaDestinationManagerFactory)mediaDestinationManagerFactory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaDestinationManagerFactory);
  return (HMDMediaDestinationManagerFactory *)WeakRetained;
}

- (void)setMediaDestinationControllerFactory:(id)a3
{
}

- (HMDMediaDestinationControllerFactory)mediaDestinationControllerFactory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaDestinationControllerFactory);
  return (HMDMediaDestinationControllerFactory *)WeakRetained;
}

- (void)setMessenger:(id)a3
{
}

- (HMDAppleMediaAccessoryMessenger)messenger
{
  return (HMDAppleMediaAccessoryMessenger *)objc_getProperty(self, a2, 736, 1);
}

- (void)setSymptomsHandler:(id)a3
{
}

- (HMDAccessorySymptomHandler)symptomsHandler
{
  return (HMDAccessorySymptomHandler *)objc_getProperty(self, a2, 728, 1);
}

- (void)setDarwinNotificationProvider:(id)a3
{
}

- (HMDarwinNotificationProvider)darwinNotificationProvider
{
  return self->_darwinNotificationProvider;
}

- (void)setShouldApplySoftwareUpdateWhenFound:(BOOL)a3
{
  self->_shouldApplySoftwareUpdateWhenFound = a3;
}

- (BOOL)shouldApplySoftwareUpdateWhenFound
{
  return self->_shouldApplySoftwareUpdateWhenFound;
}

- (void)setDependencyFactory:(id)a3
{
}

- (HMDAppleMediaAccessoryDependencyFactory)dependencyFactory
{
  return self->_dependencyFactory;
}

- (void)setPreferredMediaUserEventController:(id)a3
{
}

- (HMDPreferredMediaUserEventController)preferredMediaUserEventController
{
  return (HMDPreferredMediaUserEventController *)objc_getProperty(self, a2, 704, 1);
}

- (void)setSleepWakeStateController:(id)a3
{
}

- (HMDAppleMediaAccessorySleepWakeStateController)sleepWakeStateController
{
  return (HMDAppleMediaAccessorySleepWakeStateController *)objc_getProperty(self, a2, 696, 1);
}

- (id)deviceMediaRouteIdentifierFactory
{
  return objc_getProperty(self, a2, 688, 1);
}

- (void)setLastCreatedPairingIdentity:(id)a3
{
}

- (HMFPairingIdentity)lastCreatedPairingIdentity
{
  return self->_lastCreatedPairingIdentity;
}

- (void)setSoftwareUpdateListener:(id)a3
{
}

- (HMDSoftwareUpdateEventListener)softwareUpdateListener
{
  return (HMDSoftwareUpdateEventListener *)objc_getProperty(self, a2, 672, 1);
}

- (int64_t)fallbackMediaUserType
{
  return self->_fallbackMediaUserType;
}

- (void)setAudioAnalysisEventSubscriber:(id)a3
{
}

- (HMDAudioAnalysisEventSubscriber)audioAnalysisEventSubscriber
{
  return (HMDAudioAnalysisEventSubscriber *)objc_getProperty(self, a2, 656, 1);
}

- (void)setAudioAnalysisRequestManager:(id)a3
{
}

- (HMDAudioAnalysisRequestManager)audioAnalysisRequestManager
{
  return (HMDAudioAnalysisRequestManager *)objc_getProperty(self, a2, 648, 1);
}

- (void)setAudioDestinationController:(id)a3
{
}

- (HMDMediaDestinationController)audioDestinationController
{
  return (HMDMediaDestinationController *)objc_getProperty(self, a2, 640, 1);
}

- (void)setAudioDestinationManager:(id)a3
{
}

- (HMDMediaDestinationManager)audioDestinationManager
{
  return (HMDMediaDestinationManager *)objc_getProperty(self, a2, 632, 1);
}

- (void)setSupportedMultiUserLanguageCodes:(id)a3
{
}

- (NSArray)supportedMultiUserLanguageCodes
{
  return (NSArray *)objc_getProperty(self, a2, 624, 1);
}

- (void)setSettingsController:(id)a3
{
}

- (HMDAccessorySettingsController)settingsController
{
  return (HMDAccessorySettingsController *)objc_getProperty(self, a2, 616, 1);
}

- (void)setTargetControlManager:(id)a3
{
}

- (HMDTargetControlManager)targetControlManager
{
  return self->_targetControlManager;
}

- (HMDRemoteLoginHandler)remoteLoginHandler
{
  return (HMDRemoteLoginHandler *)objc_getProperty(self, a2, 520, 1);
}

- (void)performAfterDelay:(double)a3 block:(id)a4 queue:(id)a5
{
  int64_t v6 = (uint64_t)(a3 * 1000000000.0);
  v7 = a5;
  dispatch_block_t block = a4;
  dispatch_time_t v8 = dispatch_time(0, v6);
  dispatch_after(v8, v7, block);
}

- (id)keychainStoreForAppleMediaAccessorySensorManager:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F35AD0], "systemStore", a3);
}

- (id)firstCloudKitImportFutureForAppleMediaAccessorySensorManager:(id)a3
{
  v3 = +[HMDCoreData sharedInstance];
  v4 = [v3 firstCloudKitImportFuture];

  return v4;
}

- (id)residentSyncClientDidSyncFutureForAppleMediaAccessorySensorManager:(id)a3
{
  v3 = [(HMDAccessory *)self home];
  v4 = [v3 residentSyncClientDidSyncFuture];

  return v4;
}

- (id)logSubmitterForAppleMediaAccessorySensorManager:(id)a3
{
  return +[HMDMetricsManager sharedLogEventSubmitter];
}

- (BOOL)isReadyForSensorPairing:(id)a3
{
  v3 = [(HMDAccessory *)self home];
  v4 = [v3 homeManager];
  id v5 = [v4 homes];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__HMDAppleMediaAccessory_isReadyForSensorPairing___block_invoke;
  v8[3] = &unk_264A2B2D0;
  id v9 = v3;
  id v6 = v3;
  LOBYTE(v4) = objc_msgSend(v5, "na_any:", v8);

  return (char)v4;
}

uint64_t __50__HMDAppleMediaAccessory_isReadyForSensorPairing___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

- (id)accessoriesWithHostUUID:(id)a3 forAppleMediaAccessorySensorManager:(id)a4
{
  id v5 = a3;
  id v6 = [(HMDAccessory *)self home];
  v7 = [v6 accessories];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__HMDAppleMediaAccessory_accessoriesWithHostUUID_forAppleMediaAccessorySensorManager___block_invoke;
  v11[3] = &unk_264A27218;
  id v12 = v5;
  id v8 = v5;
  id v9 = objc_msgSend(v7, "na_filter:", v11);

  return v9;
}

uint64_t __86__HMDAppleMediaAccessory_accessoriesWithHostUUID_forAppleMediaAccessorySensorManager___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 hostAccessory];
  v4 = [v3 uuid];
  uint64_t v5 = objc_msgSend(v4, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v5;
}

- (id)residentNotificationObjectForAppleMediaAccessorySensorManager:(id)a3
{
  v3 = [(HMDAccessory *)self home];
  v4 = [v3 residentDeviceManager];

  return v4;
}

- (void)renameService:(id)a3 name:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accessory];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F42570]);
    v10 = [v8 uuid];
    v11 = (void *)[v9 initWithTarget:v10];

    v30[0] = @"kServiceInstanceID";
    id v12 = [v6 instanceID];
    v30[1] = @"kServiceName";
    v31[0] = v12;
    v31[1] = v7;
    v13 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

    __int16 v14 = [MEMORY[0x263F42590] messageWithName:*MEMORY[0x263F0EAE0] destination:v11 payload:v13];
    objc_initWeak((id *)location, self);
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __45__HMDAppleMediaAccessory_renameService_name___block_invoke;
    v25 = &unk_264A291A8;
    objc_copyWeak(&v29, (id *)location);
    id v26 = v6;
    id v15 = v8;
    id v27 = v15;
    id v28 = v7;
    [v14 setResponseHandler:&v22];
    __int16 v16 = [(HMDAccessory *)self home];
    if ([v16 isCurrentDevicePrimaryResident])
    {
      [v15 _handleRenameService:v14];
    }
    else
    {
      uint64_t v21 = [v16 residentSyncManager];
      [v21 performResidentRequest:v14 options:0];
    }
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    uint64_t v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543874;
      *(void *)&location[4] = v20;
      __int16 v33 = 2112;
      id v34 = v6;
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to rename service %@ to %@ as it has no accessory", location, 0x20u);
    }
  }
}

void __45__HMDAppleMediaAccessory_renameService_name___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) uuid];
    v13 = v8;
    id v14 = v6;
    uint64_t v15 = *(void *)(a1 + 48);
    __int16 v16 = HMFBooleanToString();
    *(_DWORD *)buf = 138544642;
    __int16 v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    id v6 = v14;
    id v8 = v13;
    __int16 v26 = 2112;
    id v27 = v16;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Did complete renaming service %@ on accessory %@ to %@ after sensor pairing with success: %@/%@", buf, 0x3Eu);
  }
}

- (void)performLocalAddAccessoryWithDescription:(id)a3 progressHandlerDelegate:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  v10 = [(HMDAccessory *)self home];
  v11 = v10;
  if (v10)
  {
    [v10 performLocalAddAccessoryWithDescription:v13 progressHandlerDelegate:v8 completion:v9];
  }
  else if (v9)
  {
    id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
    v9[2](v9, v12);
  }
}

- (id)notificationCenterForAppleMediaAccessorySensorManager:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
}

- (BOOL)isResidentConfirmedForAppleMediaAccessorySensorManager:(id)a3
{
  v3 = [(HMDAccessory *)self home];
  v4 = [v3 primaryResident];
  char v5 = [v4 isConfirmed];

  return v5;
}

- (id)homeUUIDForAppleMediaAccessorySensorManager:(id)a3
{
  v3 = [(HMDAccessory *)self home];
  v4 = [v3 uuid];

  return v4;
}

- (HMDAppleMediaAccessory)accessoryWithUUID:(id)a3 forAppleMediaAccessorySensorManager:(id)a4
{
  id v5 = a3;
  id v6 = [(HMDAccessory *)self home];
  id v7 = [v6 accessoryWithUUID:v5];

  return (HMDAppleMediaAccessory *)v7;
}

- (id)accessoryBrowserForAppleMediaAccessorySensorManager:(id)a3
{
  v3 = [(HMDAccessory *)self home];
  v4 = [v3 accessoryBrowser];

  return v4;
}

- (void)infoSubscriber:(id)a3 didReceiveWiFiInfoUpdate:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Set wifi info to: %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMDAppleMediaAccessory *)v9 setWifiNetworkInfo:v7];
}

- (BOOL)isMatchingCachedEventPublicPairingIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAppleMediaAccessory *)self cachedEventPairingIdentity];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 publicPairingIdentity];
    id v8 = [v4 publicPairingIdentity];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)cachedEventPairingIdentity
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [(HMDAppleMediaAccessory *)self eventStoreReadHandle];
  uint64_t v4 = [(HMDAppleMediaAccessory *)self pairingIdentityTopic];
  id v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = [v3 lastEventForTopic:v4];
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x263F425E8]);
      id v8 = [v6 encodedData];
      char v9 = (void *)[v7 initWithProtoData:v8];

      if (v9)
      {
        id v10 = v9;
      }
      else
      {
        id v15 = (void *)MEMORY[0x230FBD990]();
        uint64_t v16 = self;
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          int v20 = 138543618;
          uint64_t v21 = v18;
          __int16 v22 = 2112;
          uint64_t v23 = v6;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode cached pairing identity from event: %@", (uint8_t *)&v20, 0x16u);
        }
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    int v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v20 = 138543874;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v3;
      __int16 v24 = 2112;
      uint64_t v25 = v5;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get cached event pairing identity due missing eventStoreReadHandle: %@ topic: %@", (uint8_t *)&v20, 0x20u);
    }
    char v9 = 0;
  }

  return v9;
}

- (id)pairingIdentityTopic
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [(HMDAccessory *)self home];
  uint64_t v4 = [v3 uuid];

  uint64_t v5 = [(HMDAccessory *)self uuid];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    id v7 = [MEMORY[0x263F0DFA8] topicFromSuffixID:*MEMORY[0x263F0B300] homeUUID:v4 accessoryUUID:v5];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    char v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v13 = 138543874;
      __int16 v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pairing identity topic due to missing homeUUID: %@ accessoryUUID: %@", (uint8_t *)&v13, 0x20u);
    }
    id v7 = 0;
  }

  return v7;
}

- (void)forwardAccessoryPublicPairingIdentity:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 privateKey];

  if (v5) {
    _HMFPreconditionFailure();
  }
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      char v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Forwarding accessory public pairing identity: %@", buf, 0x16u);
    }
    id v10 = [(HMDAppleMediaAccessory *)v7 eventForwarder];
    v11 = [(HMDAppleMediaAccessory *)v7 pairingIdentityTopic];
    if (v11 && v10)
    {
      if (![(HMDAppleMediaAccessory *)v7 isMatchingCachedEventPublicPairingIdentity:v4])
      {
        id v20 = objc_alloc(MEMORY[0x263F49390]);
        uint64_t v21 = [(HMDAccessory *)v7 uuid];
        __int16 v22 = [v21 UUIDString];
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        uint64_t v23 = objc_msgSend(v20, "initWithSource:cachePolicy:combineType:timestamp:", v22, 2, 2);

        id v24 = objc_alloc(MEMORY[0x263F49380]);
        uint64_t v25 = [v4 pbData];
        uint64_t v26 = (void *)[v24 initWithEventData:v25 metadata:v23];

        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __64__HMDAppleMediaAccessory_forwardAccessoryPublicPairingIdentity___block_invoke;
        v27[3] = &unk_264A2F3E8;
        v27[4] = v7;
        [v10 forwardEvent:v26 topic:v11 completion:v27];

        goto LABEL_15;
      }
      int v12 = (void *)MEMORY[0x230FBD990]();
      int v13 = v7;
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v29 = v15;
        __int16 v30 = 2112;
        id v31 = v4;
        uint64_t v16 = "%{public}@Skipping forwarding accessory public pairing identity due to matching cached pairing identity: %@";
        __int16 v17 = v14;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
        uint32_t v19 = 22;
LABEL_12:
        _os_log_impl(&dword_22F52A000, v17, v18, v16, buf, v19);
      }
    }
    else
    {
      int v12 = (void *)MEMORY[0x230FBD990]();
      int v13 = v7;
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v29 = v15;
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 2112;
        __int16 v33 = v11;
        uint64_t v16 = "%{public}@Failed to forward accessory public pairing identity due to missing dependencies eventForwarder: %@ topic: %@";
        __int16 v17 = v14;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 32;
        goto LABEL_12;
      }
    }

LABEL_15:
  }
}

void __64__HMDAppleMediaAccessory_forwardAccessoryPublicPairingIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = @" with error: ";
    int v10 = 138543874;
    v11 = v7;
    if (!v3) {
      id v8 = &stru_26E2EB898;
    }
    __int16 v12 = 2112;
    int v13 = v8;
    if (v3) {
      char v9 = v3;
    }
    else {
      char v9 = &stru_26E2EB898;
    }
    __int16 v14 = 2112;
    __int16 v15 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Forwarded accessory public pairing identity event completed %@%@", (uint8_t *)&v10, 0x20u);
  }
}

- (id)appleMediaProfileForAccessoryUUID:(id)a3
{
  v3 = [(HMDMediaAccessory *)self mediaProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)currentDeviceProductInfoForAppleMediaAccessorySleepWakeStateController:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F42620], "productInfo", a3);
}

- (void)currentAccessorySensorStatusFlagsForAppleMediaAccessoryMetricsDispatcher:(id)a3 completion:(id)a4
{
}

- (int64_t)numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  id v4 = [(HMDAccessory *)self home];
  id v5 = [v4 actionSets];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke;
  v9[3] = &unk_264A210B8;
  v9[4] = self;
  id v6 = objc_msgSend(v5, "na_filter:", v9);

  int64_t v7 = [v6 count];
  return v7;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 actions];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_2;
  v6[3] = &unk_264A22050;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5)
  {
    int64_t v7 = [v5 mediaProfiles];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_3;
    v10[3] = &unk_264A21090;
    v10[4] = *(void *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v7, "na_any:", v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 mediaProfile];
  id v5 = [v4 uniqueIdentifier];
  id v6 = [v3 uniqueIdentifier];

  uint64_t v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

- (int64_t)numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = [(HMDAppleMediaAccessory *)self hostedAccessories];
  id v6 = [v5 allObjects];

  os_unfair_recursive_lock_unlock();
  uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_530);
  if (v7)
  {
    uint64_t v8 = [(HMDAccessory *)self home];
    char v9 = [v8 triggers];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_2;
    v13[3] = &unk_264A21068;
    id v14 = v7;
    int v10 = objc_msgSend(v9, "na_filter:", v13);

    int64_t v11 = [v10 count];
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 characteristicBaseEvents];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_3;
    v10[3] = &unk_264A21040;
    id v11 = *(id *)(a1 + 32);
    uint64_t v8 = objc_msgSend(v7, "na_any:", v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_4;
  v8[3] = &unk_264A28A10;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 characteristic];
  id v5 = [v4 accessory];
  uint64_t v6 = [v5 uuid];
  uint64_t v7 = [v3 uuid];

  uint64_t v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);
  return v8;
}

id __115__HMDAppleMediaAccessory_numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (int64_t)numberOfCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = [(HMDAppleMediaAccessory *)self hostedAccessories];
  int64_t v6 = [v5 count];

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (id)currentRoomForAppleMediaAccessoryMetricsDispatcher:(id)a3
{
  id v3 = [(HMDAccessory *)self room];
  id v4 = [v3 name];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (void)_handleAudioAnalysisBulletinBoardCommit:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessory *)self home];
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = [v4 BOOLForKey:*MEMORY[0x263F0E9A8]];
    uint64_t v7 = [v4 predicateForKey:*MEMORY[0x263F0E9A0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    int v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = HMFGetLogIdentifier();
      id v14 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v14;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling request to update audio analysis notification registration with enabled: %@ condition: %@", buf, 0x20u);
    }
    __int16 v15 = [HMDAudioAnalysisEventBulletinNotificationRegistration alloc];
    uint64_t v16 = [(HMDAccessory *)v11 uuid];
    __int16 v17 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)v15 initWithPredicate:v9 accessoryUUID:v16];

    os_log_type_t v18 = [v5 audioAnalysisBulletinNotificationManager];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __66__HMDAppleMediaAccessory__handleAudioAnalysisBulletinBoardCommit___block_invoke;
    v22[3] = &unk_264A21018;
    v22[4] = v11;
    uint64_t v23 = v17;
    id v24 = v4;
    id v25 = v9;
    char v27 = v6;
    id v26 = v5;
    id v19 = v9;
    id v20 = v17;
    [v18 updateNotificationRegistration:v20 enabled:v6 completion:v22];
  }
  else
  {
    uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:10];
    [v4 respondWithError:v21];
  }
}

void __66__HMDAppleMediaAccessory__handleAudioAnalysisBulletinBoardCommit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio analysis registration: %@, %@", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 48) respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v15 = 138543618;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated audio analysis registration: %@", (uint8_t *)&v15, 0x16u);
    }
    [*(id *)(a1 + 48) respondWithSuccess];
    [*(id *)(a1 + 32) setAudioAnalysisEventNotificationCondition:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) setAudioAnalysisEventNotificationEnabled:*(unsigned __int8 *)(a1 + 72)];
    __int16 v12 = [*(id *)(a1 + 64) homeManager];
    int v13 = [*(id *)(a1 + 48) name];
    id v14 = [*(id *)(a1 + 32) uuid];
    [v12 updateGenerationCounterWithReason:v13 sourceUUID:v14 shouldNotifyClients:1];
  }
}

- (id)logIdentifier
{
  id v2 = [(HMDAccessory *)self uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)_dumpStateCachedSettingsForHome:(id)a3 accessory:(id)a4 eventStoreReadHandle:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v30 = [MEMORY[0x263EFF9A0] dictionary];
  char v27 = objc_alloc_init(HMDAccessorySettingsEventHelper);
  __int16 v28 = v9;
  id v29 = v8;
  [(HMDAccessorySettingsEventHelper *)v27 allTopicsForHome:v8 accessory:v9];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    id v31 = v10;
    uint64_t v32 = *(void *)v37;
    do
    {
      uint64_t v14 = 0;
      uint64_t v33 = v12;
      do
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 8 * v14);
        uint64_t v16 = [v10 lastEventForTopic:v15];
        if (v16)
        {
          id v35 = 0;
          __int16 v17 = [MEMORY[0x263F0E3F8] decodeSettingFromEvent:v16 error:&v35];
          id v18 = v35;
          if (v18)
          {
            __int16 v19 = v18;
            id v20 = (void *)MEMORY[0x230FBD990]();
            uint64_t v21 = self;
            __int16 v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = uint64_t v23 = self;
              *(_DWORD *)buf = 138543874;
              v41 = v24;
              __int16 v42 = 2112;
              uint64_t v43 = v15;
              __int16 v44 = 2112;
              v45 = v19;
              _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Error decoding stored setting for topic %@, error: %@", buf, 0x20u);

              self = v23;
              id v10 = v31;
            }

            uint64_t v13 = v32;
            uint64_t v12 = v33;
          }
          else
          {
            if (!v17) {
              goto LABEL_14;
            }
            __int16 v19 = [v17 description];
            id v25 = [v17 keyPath];
            [v30 setObject:v19 forKeyedSubscript:v25];
          }
        }
LABEL_14:

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v12);
  }

  return v30;
}

- (id)dumpStateLocalSettings
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessory *)self home];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 homeManager];
    if (v5)
    {
      uint64_t v6 = [v4 uuid];
      uint64_t v7 = [(HMDAccessory *)self uuid];
      id v8 = [v5 eventStoreReadHandle];
      id v9 = [(HMDAppleMediaAccessory *)self _dumpStateCachedSettingsForHome:v6 accessory:v7 eventStoreReadHandle:v8];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      uint64_t v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v17 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Media accessory that has a home but does not have home manager", (uint8_t *)&v19, 0xCu);
      }
      id v9 = (void *)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Media accessory does not have a home", (uint8_t *)&v19, 0xCu);
    }
    id v9 = (void *)MEMORY[0x263EFFA78];
  }

  return v9;
}

- (id)dumpSimpleState
{
  v12.receiver = self;
  v12.super_class = (Class)HMDAppleMediaAccessory;
  id v3 = [(HMDMediaAccessory *)&v12 dumpSimpleState];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *MEMORY[0x263F41FA8];
  uint64_t v6 = objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x263F41FA8]);
  uint64_t v7 = [(HMDAppleMediaAccessory *)self device];
  id v8 = [v7 identifier];
  id v9 = [v8 UUIDString];
  id v10 = [v6 stringByAppendingFormat:@", device: %@", v9];

  [v4 setObject:v10 forKeyedSubscript:v5];
  return v4;
}

- (id)dumpState
{
  v18.receiver = self;
  v18.super_class = (Class)HMDAppleMediaAccessory;
  id v3 = [(HMDMediaAccessory *)&v18 dumpState];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *MEMORY[0x263F41FA8];
  uint64_t v6 = objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x263F41FA8]);
  unint64_t v7 = [(HMDAppleMediaAccessory *)self variant];
  if (v7)
  {
    if (v7)
    {
      id v8 = @"Original HomePod";
    }
    else if ((v7 & 2) != 0)
    {
      id v8 = @"HomePod Mini";
    }
    else if ((v7 & 4) != 0)
    {
      id v8 = @"2nd Generation HomePod";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown (0x%tx)", v7);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 stringByAppendingFormat:@", variant: %@", v8];

  id v10 = [(HMDAppleMediaAccessory *)self device];
  uint64_t v11 = [v10 description];
  objc_super v12 = [v9 stringByAppendingFormat:@", device: %@", v11];

  os_unfair_recursive_lock_lock_with_options();
  uint64_t v13 = [(HMDAppleMediaAccessory *)self hostedAccessories];
  uint64_t v14 = [v13 allObjects];
  uint64_t v15 = objc_msgSend(v14, "na_map:", &__block_literal_global_516);
  uint64_t v16 = [v12 stringByAppendingFormat:@", hosted accessory uuids: %@", v15];

  os_unfair_recursive_lock_unlock();
  [v4 setObject:v16 forKeyedSubscript:v5];

  return v4;
}

id __35__HMDAppleMediaAccessory_dumpState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)encodeFlagsFromHostedAccessories:(id)a3 coder:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (objc_msgSend(v5, "hmd_isForXPCTransport"))
  {
    uint64_t v6 = objc_msgSend(v8, "na_reduceWithInitialValue:reducer:", &unk_26E471C50, &__block_literal_global_502);
    [v5 encodeObject:v6 forKey:@"accessoryFlagsCodingKey"];
  }
  else
  {
    uint64_t v7 = _HMFPreconditionFailure();
    __65__HMDAppleMediaAccessory_encodeFlagsFromHostedAccessories_coder___block_invoke(v7);
  }
}

id __65__HMDAppleMediaAccessory_encodeFlagsFromHostedAccessories_coder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = NSNumber;
  uint64_t v6 = [a3 unsignedIntegerValue];
  id v7 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 accessoryFlags];

  uint64_t v11 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") | v6);

  return v11;
}

- (void)encodeServicesFromHostedAccessories:(id)a3 coder:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if (objc_msgSend(v5, "hmd_isForXPCTransport"))
  {
    uint64_t v6 = objc_msgSend(v10, "na_flatMap:", &__block_literal_global_493);
    id v7 = objc_msgSend(v10, "na_firstObjectPassingTest:", &__block_literal_global_496_137142);
    id v8 = [v7 hapMetadata];

    +[HMDHAPAccessory encodeServices:v6 forXPCCoder:v5 metadata:v8];
  }
  else
  {
    uint64_t v9 = _HMFPreconditionFailure();
    __68__HMDAppleMediaAccessory_encodeServicesFromHostedAccessories_coder___block_invoke_2(v9);
  }
}

BOOL __68__HMDAppleMediaAccessory_encodeServicesFromHostedAccessories_coder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = [v4 hapMetadata];

  return v5 != 0;
}

id __68__HMDAppleMediaAccessory_encodeServicesFromHostedAccessories_coder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = [v4 services];

  return v5;
}

- (void)_encodeWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  int v6 = objc_msgSend(v4, "hmd_isForLocalStore");
  __int16 v7 = objc_msgSend(v4, "hmd_homeManagerOptions");
  v45.receiver = self;
  v45.super_class = (Class)HMDAppleMediaAccessory;
  [(HMDMediaAccessory *)&v45 encodeWithCoder:v4];
  id v8 = [(HMDAppleMediaAccessory *)self pairingIdentity];
  uint64_t v9 = v8;
  if ((v5 & 1) == 0)
  {
    if (v6)
    {
      [v4 encodeObject:v8 forKey:*MEMORY[0x263F0B440]];
      id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAppleMediaAccessory fixedPairingIdentityInCloud](self, "fixedPairingIdentityInCloud"));
      uint64_t v11 = @"HM.FixedPairingIdentityInCloudCodingKey";
LABEL_6:
      [v4 encodeObject:v10 forKey:v11];

      goto LABEL_7;
    }
    if (v8)
    {
      id v10 = [v8 publicPairingIdentity];
      uint64_t v11 = (__CFString *)*MEMORY[0x263F0B440];
      goto LABEL_6;
    }
  }
LABEL_7:
  if ((v7 & 0x841) == 0
    && ((v7 & 0x10) == 0 || ![(HMDAppleMediaAccessory *)self isCurrentAccessory]))
  {
LABEL_16:
    if (v6) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    if (!objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess")) {
      goto LABEL_16;
    }
    objc_super v12 = [(HMDAppleMediaAccessory *)self deviceForDirectMessaging];
    uint64_t v13 = [(HMDAppleMediaAccessory *)self deviceIRK];
    uint64_t v14 = [v12 rpIdentity];

    if (!v14 && v13)
    {
      id v15 = objc_alloc(MEMORY[0x263F42548]);
      uint64_t v16 = (void *)[v15 initWithType:*MEMORY[0x263F41FF0] size:*MEMORY[0x263F41FE8] data:v13];
      __int16 v17 = [[HMDRPIdentity alloc] initWithDeviceIRK:v16];
      [v12 setRpIdentity:v17];
    }
    objc_super v18 = [v12 idsIdentifier];
    [v4 encodeObject:v18 forKey:@"HM.accountIdentifier"];

    [v4 encodeObject:v12 forKey:*MEMORY[0x263F0B280]];
    int v19 = [(HMDAppleMediaAccessory *)self deviceIRK];
    [v4 encodeObject:v19 forKey:*MEMORY[0x263F0B288]];
  }
  else
  {
    objc_super v12 = [(HMDAppleMediaAccessory *)self device];
    [v4 encodeObject:v12 forKey:*MEMORY[0x263F0B280]];
  }

  if (v6)
  {
LABEL_21:
    BOOL v20 = [(HMDAppleMediaAccessory *)self isAudioAnalysisEventNotificationEnabled];
    [v4 encodeBool:v20 forKey:*MEMORY[0x263F0AF90]];
    uint64_t v21 = [(HMDAppleMediaAccessory *)self audioAnalysisEventNotificationCondition];
    [v4 encodeObject:v21 forKey:*MEMORY[0x263F0AF88]];

    goto LABEL_22;
  }
LABEL_20:
  if (objc_msgSend(v4, "hmd_isForXPCTransport")) {
    goto LABEL_21;
  }
LABEL_22:
  if ((v7 & 0x41) != 0 || [(HMDAppleMediaAccessory *)self isCurrentAccessory] && (v7 & 0x10) != 0)
  {
    if (objc_msgSend(v4, "hmd_isForXPCTransport"))
    {
      BOOL v22 = [(HMDAppleMediaAccessory *)self isDeviceReachable];
      [v4 encodeBool:v22 forKey:*MEMORY[0x263F0B250]];
      if (objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
      {
        BOOL v23 = [(HMDAppleMediaAccessory *)self supportsTargetControl];
        [v4 encodeBool:v23 forKey:*MEMORY[0x263F0B7F8]];
        BOOL v24 = [(HMDAppleMediaAccessory *)self supportsCompanionInitiatedRestart];
        [v4 encodeBool:v24 forKey:*MEMORY[0x263F0B748]];
        BOOL v25 = [(HMDAppleMediaAccessory *)self supportsCompanionInitiatedObliterate];
        [v4 encodeBool:v25 forKey:*MEMORY[0x263F0B740]];
        BOOL v26 = [(HMDAppleMediaAccessory *)self supportsAudioAnalysis];
        [v4 encodeBool:v26 forKey:*MEMORY[0x263F0B728]];
        BOOL v27 = [(HMDAppleMediaAccessory *)self supportsDropIn];
        [v4 encodeBool:v27 forKey:*MEMORY[0x263F0B760]];
        BOOL v28 = [(HMDAppleMediaAccessory *)self supportsThirdPartyMusic];
        [v4 encodeBool:v28 forKey:*MEMORY[0x263F0B7D0]];
        BOOL v29 = [(HMDAppleMediaAccessory *)self supportsPreferredMediaUser];
        [v4 encodeBool:v29 forKey:*MEMORY[0x263F0B7B0]];
        BOOL v30 = [(HMDAppleMediaAccessory *)self supportsCoordinationDoorbellChime];
        [v4 encodeBool:v30 forKey:*MEMORY[0x263F0B750]];
        BOOL v31 = [(HMDAppleMediaAccessory *)self supportsMediaContentProfile];
        [v4 encodeBool:v31 forKey:*MEMORY[0x263F0B790]];
        [v4 encodeBool:1 forKey:*MEMORY[0x263F0B360]];
        if (_os_feature_enabled_impl())
        {
          BOOL v32 = [(HMDAppleMediaAccessory *)self supportsRMVonAppleTV];
          [v4 encodeBool:v32 forKey:*MEMORY[0x263F0B7C0]];
        }
        BOOL v33 = [(HMDAppleMediaAccessory *)self supportsJustSiri];
        [v4 encodeBool:v33 forKey:*MEMORY[0x263F0B770]];
        os_unfair_recursive_lock_lock_with_options();
        uint64_t v34 = [(HMDAppleMediaAccessory *)self hostedAccessories];
        id v35 = [v34 allObjects];

        os_unfair_recursive_lock_unlock();
        [(HMDAppleMediaAccessory *)self encodeServicesFromHostedAccessories:v35 coder:v4];
        [(HMDAppleMediaAccessory *)self encodeFlagsFromHostedAccessories:v35 coder:v4];
      }
      if ([(HMDAppleMediaAccessory *)self isHomePod])
      {
        long long v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory homePodVariant](self, "homePodVariant"));
        [v4 encodeObject:v36 forKey:*MEMORY[0x263F0CD70]];
      }
      if ([(HMDAppleMediaAccessory *)self isHomePod])
      {
        BOOL v37 = [(HMDAppleMediaAccessory *)self supportsManagedConfigurationProfile];
        [v4 encodeBool:v37 forKey:*MEMORY[0x263F0B778]];
        BOOL v38 = [(HMDAppleMediaAccessory *)self supportsMessagedHomePodSettings];
        [v4 encodeBool:v38 forKey:*MEMORY[0x263F0B798]];
      }
      BOOL v39 = [(HMDAppleMediaAccessory *)self supportsSoftwareUpdateV2];
      [v4 encodeBool:v39 forKey:*MEMORY[0x263F0B7C8]];
    }
    if (!objc_msgSend(v4, "hmd_isForXPCTransport")
      || objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      v40 = [(HMDAppleMediaAccessory *)self softwareVersion];
      [v4 encodeObject:v40 forKey:*MEMORY[0x263F0B708]];

      v41 = [(HMDAppleMediaAccessory *)self wifiNetworkInfo];
      [v4 encodeObject:v41 forKey:*MEMORY[0x263F0B8A0]];

      __int16 v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
      [v4 encodeObject:v42 forKey:*MEMORY[0x263F0DAF0]];

      int64_t v43 = [(HMDAppleMediaAccessory *)self productColor];
      [v4 encodeInteger:v43 forKey:*MEMORY[0x263F0D4F8]];
      [(HMDAppleMediaAccessory *)self _encodeMediaDestinationAndControllerDataWithCoder:v4];
    }
    if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
      || (objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") & 1) != 0
      || (objc_msgSend(v4, "hmd_isForRemoteUserAdministrator") & 1) != 0
      || objc_msgSend(v4, "hmd_isForXPCTransport")
      && objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      __int16 v44 = [(HMDAppleMediaAccessory *)self remoteLoginHandler];
      [v4 encodeObject:v44 forKey:*MEMORY[0x263F0B4B8]];
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x230FBD990]();
  [(HMDAppleMediaAccessory *)self _encodeWithCoder:v5];
}

- (void)removeHostedAccessory:(id)a3
{
  id v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = [(HMDAppleMediaAccessory *)self hostedAccessories];
  [v4 removeObject:v5];

  os_unfair_recursive_lock_unlock();
}

- (void)addHostedAccessory:(id)a3
{
  id v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = [(HMDAppleMediaAccessory *)self hostedAccessories];
  [v4 addObject:v5];

  os_unfair_recursive_lock_unlock();
}

- (void)_legacyEncodeMediaDestinationAndControllerDataWithCoder:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    id v6 = [(HMDAppleMediaAccessory *)self committedAudioDestinationControllerData];
    [(HMDAppleMediaAccessory *)self committedAudioDestination];
  }
  else
  {
    id v6 = [(HMDAppleMediaAccessory *)self audioDestinationControllerData];
    [(HMDAppleMediaAccessory *)self audioDestination];
  id v5 = };
  [v4 encodeObject:v6 forKey:*MEMORY[0x263F0AFA8]];
  [v4 encodeObject:v5 forKey:*MEMORY[0x263F0AF98]];
}

- (void)_encodeMediaDestinationAndControllerDataWithCoder:(id)a3
{
  id v6 = a3;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ![(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    [(HMDAppleMediaAccessory *)self _legacyEncodeMediaDestinationAndControllerDataWithCoder:v6];
  }
  else
  {
    id v4 = [(HMDAppleMediaAccessory *)self audioDestinationControllerData];
    [v6 encodeObject:v4 forKey:*MEMORY[0x263F0AFA8]];

    id v5 = [(HMDAppleMediaAccessory *)self audioDestination];
    [v6 encodeObject:v5 forKey:*MEMORY[0x263F0AF98]];
  }
}

- (id)_initWithCoder:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)HMDAppleMediaAccessory;
  id v5 = [(HMDMediaAccessory *)&v58 initWithCoder:v4];
  if (v5)
  {
    id v6 = objc_alloc_init(HMDAppleMediaAccessoryDependencyFactory);
    dependencyFactory = v5->_dependencyFactory;
    v5->_dependencyFactory = v6;

    id deviceMediaRouteIdentifierFactory = v5->_deviceMediaRouteIdentifierFactory;
    v5->_id deviceMediaRouteIdentifierFactory = &__block_literal_global_479;

    id settingsConnectionFactory = v5->_settingsConnectionFactory;
    v5->_id settingsConnectionFactory = &__block_literal_global_481;

    if (objc_msgSend(v4, "hmd_isHH2MigrationInProgress")
      && [(HMDAppleMediaAccessory *)v5 isHomePod])
    {
      [(HMDAppleMediaAccessory *)v5 setVariant:1];
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B280]];
    device = v5->_device;
    v5->_device = (HMDDevice *)v10;

    if (v5->_device)
    {
      uint64_t v12 = -[HMDAppleMediaAccessoryDependencyFactory deviceControllerWithDevice:](v5->_dependencyFactory, "deviceControllerWithDevice:");
      deviceController = v5->_deviceController;
      v5->_deviceController = (HMDDeviceController *)v12;
    }
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B440]];
    pairingIdentity = v5->_pairingIdentity;
    v5->_pairingIdentity = (HMFPairingIdentity *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B708]];
    softwareVersion = v5->_softwareVersion;
    v5->_softwareVersion = (HMFSoftwareVersion *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B8A0]];
    wifiNetworkInfo = v5->_wifiNetworkInfo;
    v5->_wifiNetworkInfo = (HMFWiFiNetworkInfo *)v18;

    objc_storeStrong((id *)&v5->_lastStagedWifiNetworkInfo, v5->_wifiNetworkInfo);
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B4B8]];
    remoteLoginHandler = v5->_remoteLoginHandler;
    v5->_remoteLoginHandler = (HMDRemoteLoginHandler *)v20;

    if (!v5->_remoteLoginHandler)
    {
      BOOL v22 = [[HMDRemoteLoginHandler alloc] initWithAccessory:v5 loggedInAccountData:0];
      BOOL v23 = v5->_remoteLoginHandler;
      v5->_remoteLoginHandler = v22;
    }
    BOOL v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.FixedPairingIdentityInCloudCodingKey"];
    BOOL v25 = v24;
    if (v24) {
      LOBYTE(v24) = [v24 BOOLValue];
    }
    v5->_fixedPairingIdentityInCloud = (char)v24;
    uint64_t v26 = *MEMORY[0x263F0AFA0];
    if ([v4 containsValueForKey:*MEMORY[0x263F0AFA0]])
    {
      BOOL v27 = (void *)MEMORY[0x230FBD990]();
      BOOL v28 = v5;
      BOOL v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        BOOL v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v60 = v30;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Decoding destination controller data using legacy encoding", buf, 0xCu);
      }
      [MEMORY[0x263F08928] setClass:objc_opt_class() forClassName:@"HMDMediaDestinationController"];
      uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v26];
      committedAudioDestinationControllerData = v28->_committedAudioDestinationControllerData;
      v28->_committedAudioDestinationControllerData = (HMMediaDestinationControllerData *)v31;
    }
    else
    {
      uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0AFA8]];
      committedAudioDestinationControllerData = v5->_committedAudioDestinationControllerData;
      v5->_committedAudioDestinationControllerData = (HMMediaDestinationControllerData *)v33;
    }

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0AF98]];
    committedAudioDestination = v5->_committedAudioDestination;
    v5->_committedAudioDestination = (HMMediaDestination *)v34;

    long long v36 = v5->_committedAudioDestination;
    if (v36)
    {
      BOOL v37 = [(HMMediaDestination *)v36 parentIdentifier];
      BOOL v38 = v37;
      if (!v37
        || ([v37 UUIDString],
            BOOL v39 = objc_claimAutoreleasedReturnValue(),
            int v40 = [v39 isEqualToString:*MEMORY[0x263F0D0D0]],
            v39,
            v40))
      {
        v41 = (void *)MEMORY[0x230FBD990]();
        __int16 v42 = v5;
        int64_t v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          __int16 v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v60 = v44;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@No parent identifier given was given - fixing bad legacy encoding state", buf, 0xCu);
        }
        id v45 = objc_alloc(MEMORY[0x263F0E4C0]);
        v46 = [(HMMediaDestination *)v5->_committedAudioDestination uniqueIdentifier];
        uint64_t v47 = [(HMDAccessory *)v42 uuid];
        uint64_t v48 = [(HMMediaDestination *)v5->_committedAudioDestination supportedOptions];
        v49 = [(HMMediaDestination *)v5->_committedAudioDestination audioGroupIdentifier];
        uint64_t v50 = [v45 initWithUniqueIdentifier:v46 parentIdentifier:v47 supportedOptions:v48 audioGroupIdentifier:v49];
        v51 = v5->_committedAudioDestination;
        v5->_committedAudioDestination = (HMMediaDestination *)v50;
      }
    }
    v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0DAF0]];
    v5->_supportedStereoPairVersions = [v52 unsignedIntegerValue];

    __bootstrapSupportedStereoPairVersions(v5);
    [(HMDAccessory *)v5 decodePreferredMediaUser:v4];
    v53 = [HMDAppleMediaAccessorySleepWakeStateController alloc];
    v54 = [(HMDAccessory *)v5 uuid];
    uint64_t v55 = [(HMDAppleMediaAccessorySleepWakeStateController *)v53 initWithAccessoryUUID:v54 dataSource:v5];
    sleepWakeStateController = v5->_sleepWakeStateController;
    v5->_sleepWakeStateController = (HMDAppleMediaAccessorySleepWakeStateController *)v55;

    v5->_productColor = [v4 decodeIntegerForKey:*MEMORY[0x263F0D4F8]];
  }

  return v5;
}

id __41__HMDAppleMediaAccessory__initWithCoder___block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x263F285E0]);
  return v0;
}

id __41__HMDAppleMediaAccessory__initWithCoder___block_invoke()
{
  return (id)_mediaRouteIdentifier;
}

- (HMDAppleMediaAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = (HMDAppleMediaAccessory *)[(HMDAppleMediaAccessory *)self _initWithCoder:v4];

  return v6;
}

- (void)accessoryInfoController:(id)a3 didUpdateWifiInfo:(id)a4
{
  id v5 = (HMFWiFiNetworkInfo *)a4;
  os_unfair_recursive_lock_lock_with_options();
  wifiNetworkInfo = self->_wifiNetworkInfo;
  self->_wifiNetworkInfo = v5;

  os_unfair_recursive_lock_unlock();
}

- (id)currentAccessorySoftwareVersion
{
  id v2 = [MEMORY[0x263F42620] productInfo];
  id v3 = [v2 softwareVersion];

  return v3;
}

- (id)accessoryInfoControllerSoftwareVersionTopicForController:(id)a3
{
  id v4 = (void *)MEMORY[0x263F0DFA8];
  uint64_t v5 = *MEMORY[0x263F0B328];
  id v6 = [(HMDAccessory *)self home];
  __int16 v7 = [v6 uuid];
  id v8 = [(HMDAccessory *)self uuid];
  uint64_t v9 = [v4 topicFromSuffixID:v5 homeUUID:v7 accessoryUUID:v8];

  return v9;
}

- (id)eventSourceIdentifierNameForAccessoryInfoController:(id)a3
{
  id v3 = [(HMDAccessory *)self uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

- (id)accessoryInfoControllerTopicForWifiInfo
{
  id v3 = (void *)MEMORY[0x263F0DFA8];
  uint64_t v4 = *MEMORY[0x263F0B330];
  uint64_t v5 = [(HMDAccessory *)self home];
  id v6 = [v5 uuid];
  __int16 v7 = [(HMDAccessory *)self uuid];
  id v8 = [v3 topicFromSuffixID:v4 homeUUID:v6 accessoryUUID:v7];

  return v8;
}

- (HMDCurrentAccessorySetupMetricDispatcher)currentAccessorySetupMetricDispatcher
{
  id v2 = [(HMDAccessory *)self home];
  id v3 = [v2 homeManager];
  uint64_t v4 = [v3 currentAccessorySetupMetricDispatcher];

  return (HMDCurrentAccessorySetupMetricDispatcher *)v4;
}

- (id)eventSourceIdentifierNameForFetchedSettingsController:(id)a3
{
  id v3 = [(HMDAccessory *)self uuid];
  uint64_t v4 = [v3 UUIDString];

  return v4;
}

- (id)controller:(id)a3 topicForKeyPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessory *)self home];
  __int16 v7 = [v6 uuid];
  id v8 = [(HMDAccessory *)self uuid];
  uint64_t v9 = MEMORY[0x230FBBF00](v7, v8, v5);

  return v9;
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  id v2 = [(HMDAccessory *)self home];
  id v3 = [v2 homeManager];
  uint64_t v4 = [v3 eventStoreReadHandle];

  return (HMELastEventStoreReadHandle *)v4;
}

- (HMESubscriptionProviding)subscriptionProvider
{
  id v2 = [(HMDAccessory *)self home];
  id v3 = [v2 homeManager];
  uint64_t v4 = [v3 localAndRemoteSubscriptionProvider];

  return (HMESubscriptionProviding *)v4;
}

- (HMEEventForwarder)eventForwarder
{
  id v2 = [(HMDAccessory *)self home];
  id v3 = [v2 homeManager];
  uint64_t v4 = [v3 eventForwarder];

  return (HMEEventForwarder *)v4;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  id v2 = [(HMDAccessory *)self home];
  id v3 = [v2 logEventSubmitter];

  return (HMMLogEventSubmitting *)v3;
}

- (id)homeUUID
{
  id v2 = [(HMDAccessory *)self home];
  id v3 = [v2 uuid];

  return v3;
}

- (void)languagesChangedForAccessorySettingsController:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [(HMDAccessory *)self home];
  if (v4)
  {
    id v5 = [(HMDMediaAccessory *)self notificationCenter];
    __int16 v7 = @"HMDHomeNotificationKey";
    v8[0] = v4;
    id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v5 postNotificationName:@"HMDAppleMediaAccessoryLanguagesChangedNotification" object:self userInfo:v6];
  }
}

- (id)assistantAccessControlModelWithRemovedAccessoriesForAccessorySettingsController:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [(HMDAccessory *)self home];
  id v5 = [v4 currentUser];
  id v6 = [v5 assistantAccessControl];
  v10[0] = self;
  __int16 v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v8 = [v6 assistantAccessControlModelWithRemovedAccessories:v7];

  return v8;
}

- (id)remoteMessageDestinationForAccessorySettingsController:(id)a3 target:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAppleMediaAccessory *)self device];

  if (v6)
  {
    __int16 v7 = [HMDRemoteDeviceMessageDestination alloc];
    id v8 = [(HMDAppleMediaAccessory *)self device];
    uint64_t v9 = [(HMDRemoteDeviceMessageDestination *)v7 initWithTarget:v5 device:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isMultiUserEnabledForAccessorySettingsController:(id)a3
{
  id v3 = [(HMDAccessory *)self home];
  char v4 = [v3 isMultiUserEnabled];

  return v4;
}

- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessory *)self home];
  id v8 = [v6 homeManager];

  __int16 v7 = [(HMDAccessory *)self uuid];
  [v8 updateGenerationCounterWithReason:v5 sourceUUID:v7 shouldNotifyClients:1];
}

- (void)accessorySettingsController:(id)a3 saveWithReason:(id)a4 model:(id)a5
{
  id v7 = a4;
  id v8 = [(HMDAccessory *)self home];
  [v8 saveWithReason:v7 postSyncNotification:0 objectChange:a5 != 0];
}

- (void)removeManagedConfigurationProfileWithProfileData:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v19 = 0;
  id v8 = [MEMORY[0x263F53C48] profileWithData:v6 outError:&v19];
  id v9 = v19;
  uint64_t v10 = (void *)MEMORY[0x230FBD990]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  uint64_t v13 = v12;
  if (v8) {
    BOOL v14 = v9 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v8 identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      BOOL v23 = v18;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile with identifier: %@", buf, 0x16u);
    }
    uint64_t v16 = [v8 identifier];
    [(HMDAppleMediaAccessory *)v11 _removeManagedConfigurationProfileWithIdentifier:v16 completion:v7];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      BOOL v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get managed configuration profile: %@ with error: %@", buf, 0x20u);
    }
    uint64_t v16 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v7[2](v7, v16);
  }
}

- (id)modelsToMigrateSettingsForController:(id)a3
{
  char v4 = objc_alloc_init(HMDAccessorySettingsMetadata);
  if (v4
    && ([(HMDAppleMediaAccessory *)self settingsController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = [(HMDAppleMediaAccessory *)self settingsController];
    id v7 = [v6 mergeWithSettingsMetadata:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)modelsToMakeSettingsForController:(id)a3 parentUUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding root settings", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v12 = objc_alloc_init(HMDAccessorySettingsMetadata);
  uint64_t v13 = v12;
  if (v12)
  {
    BOOL v14 = [(HMDAccessorySettingsMetadata *)v12 rootGroup];
    id v15 = [v14 modelsWithParentIdentifier:v7];

    if ([v15 count]) {
      goto LABEL_7;
    }
  }
  id v15 = 0;
LABEL_7:

  return v15;
}

- (double)setupStartTimestamp
{
  id v2 = [(HMDAccessory *)self home];
  id v3 = [v2 homeManager];
  [v3 setupStartTimestamp];
  double v5 = v4;

  return v5;
}

- (void)setSetupStartTimestamp:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v5 = (void *)MEMORY[0x230FBD990](self, a2);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    double v14 = a3;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Setup start timestamp %f", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [(HMDAccessory *)v6 home];
  uint64_t v10 = [v9 homeManager];
  [v10 setSetupStartTimestamp:a3];
}

- (void)setSetupActivity:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDAccessory *)self home];
  double v5 = [v6 homeManager];
  [v5 setSetupActivity:v4];
}

- (HMDAccessorySetupMetricDispatcher)accessorySetupMetricDispatcher
{
  id v3 = [(HMDAccessory *)self home];
  id v4 = [v3 homeManager];
  double v5 = [(HMDAccessory *)self uuid];
  id v6 = [v4 accessorySetupMetricDispatcherForAccessoryUUID:v5];

  return (HMDAccessorySetupMetricDispatcher *)v6;
}

- (HMFActivity)setupActivity
{
  id v2 = [(HMDAccessory *)self home];
  id v3 = [v2 homeManager];
  id v4 = [v3 setupActivity];

  return (HMFActivity *)v4;
}

- (HMDBackingStore)backingStore
{
  id v2 = [(HMDAccessory *)self home];
  id v3 = [v2 backingStore];

  return (HMDBackingStore *)v3;
}

- (void)mediaDestinationManagerDidUpdateStagedValues:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination manager did update staged values", (uint8_t *)&v17, 0xCu);
  }
  id v9 = [(HMDAccessory *)v6 home];
  uint64_t v10 = [v9 homeManager];

  if (v10)
  {
    uint64_t v11 = *MEMORY[0x263F0D0F0];
    uint64_t v12 = [(HMDAccessory *)v6 uuid];
    [v10 updateGenerationCounterWithReason:v11 sourceUUID:v12 shouldNotifyClients:1];

    [v10 assistantSyncDataChanged:v11];
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x230FBD990]();
    double v14 = v6;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to handle expired values due to no home manager", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (id)mediaDestinationManagerWithDestination:(id)a3 messageDispatcher:(id)a4 notificationCenter:(id)a5 backingStore:(id)a6 targetDevice:(BOOL)a7 dataSource:(id)a8 delegate:(id)a9
{
  BOOL v10 = a7;
  id v15 = a9;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  uint64_t v21 = [[HMDMediaDestinationManager alloc] initWithDestination:v20 messageDispatcher:v19 notificationCenter:v18 backingStore:v17 targetDevice:v10 dataSource:v16 delegate:v15];

  return v21;
}

- (id)mediaGroupParticipantLocalDataStorageForMediaDestinationManager:(id)a3
{
  id v3 = [(HMDAccessory *)self home];
  id v4 = [v3 homeManager];
  double v5 = [v4 mediaGroupParticipantDataLocalStorage];

  return v5;
}

- (id)rootDestinationManagerForMediaDestinationManager:(id)a3
{
  id v4 = a3;
  double v5 = [(HMDAccessory *)self home];
  id v6 = [v4 identifier];

  id v7 = [v5 rootDestinationManagerWithDescendantDestinationIdentifier:v6];

  return v7;
}

- (id)mediaDestinationManager:(id)a3 destinationControllerWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessory *)self home];
  id v7 = [v6 destinationControllerWithIdentifier:v5];

  return v7;
}

- (id)mediaDestinationControllerWithData:(id)a3 backingStore:(id)a4 messageDispatcher:(id)a5 notificationCenter:(id)a6 logEventSubmitter:(id)a7 dailyScheduler:(id)a8 targetDevice:(BOOL)a9 dataSource:(id)a10 delegate:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  LOBYTE(v27) = a9;
  id v25 = [[HMDMediaDestinationController alloc] initWithData:v24 backingStore:v23 messageDispatcher:v22 notificationCenter:v21 logEventSubmitter:v20 dailyScheduler:v19 targetDevice:v27 dataSource:v18 delegate:v17];

  return v25;
}

- (void)mediaDestinationControllerDidUpdateStagedValues:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v17 = 138543362;
    id v18 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling media destination controller did update staged values", (uint8_t *)&v17, 0xCu);
  }
  id v9 = [(HMDAccessory *)v6 home];
  BOOL v10 = [v9 homeManager];

  if (v10)
  {
    uint64_t v11 = *MEMORY[0x263F0D0F0];
    uint64_t v12 = [(HMDAccessory *)v6 uuid];
    [v10 updateGenerationCounterWithReason:v11 sourceUUID:v12 shouldNotifyClients:1];

    [v10 assistantSyncDataChanged:v11];
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x230FBD990]();
    double v14 = v6;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      id v18 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to handle expired values due to no home manager", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (id)currentDestinationTypeForMediaDestinationControllerMetricsEventDispatcher:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAppleMediaAccessory *)self audioDestinationControllerData];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 destinationIdentifier];
    if (v7)
    {
      id v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAppleMediaAccessory mediaDestinationControllerMetricsEventDispatcher:destinationTypeForDestinationWithIdentifier:](self, "mediaDestinationControllerMetricsEventDispatcher:destinationTypeForDestinationWithIdentifier:", v4, v7));
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    BOOL v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get controller data for media destination controller metrics", (uint8_t *)&v14, 0xCu);
    }
    id v8 = &unk_26E471C38;
  }

  return v8;
}

- (int64_t)mediaDestinationControllerMetricsEventDispatcher:(id)a3 destinationTypeForDestinationWithIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessory *)self home];
  id v9 = v8;
  if (v8)
  {
    int64_t v10 = [v8 destinationTypeForDestinationWithIdentifier:v7];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      int v17 = v14;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not get home to derive destination identifier from parent destination identifier: %@", (uint8_t *)&v16, 0x16u);
    }
    int64_t v10 = 0;
  }

  return v10;
}

- (id)currentUserForMediaDestinationControllerMetricsEventDispatcher:(id)a3
{
  id v3 = [(HMDAccessory *)self home];
  id v4 = [v3 currentUser];

  return v4;
}

- (id)mediaGroupLocalDataStorageForMediaDestinationController:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessory *)self home];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 homeManager];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 mediaGroupParticipantDataLocalStorage];
      int64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        uint64_t v20 = (void *)MEMORY[0x230FBD990]();
        id v21 = self;
        id v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = HMFGetLogIdentifier();
          int v25 = 138543618;
          uint64_t v26 = v23;
          __int16 v27 = 2112;
          BOOL v28 = v8;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media group participant data local storage on home manager: %@", (uint8_t *)&v25, 0x16u);
        }
      }
    }
    else
    {
      int v16 = (void *)MEMORY[0x230FBD990]();
      int v17 = self;
      __int16 v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        int v25 = 138543618;
        uint64_t v26 = v19;
        __int16 v27 = 2112;
        BOOL v28 = v6;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media group participant data local storage due to no home manager on home: %@", (uint8_t *)&v25, 0x16u);
      }
      int64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v25 = 138543362;
      uint64_t v26 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media group participant data local storage due to no home", (uint8_t *)&v25, 0xCu);
    }
    int64_t v10 = 0;
  }

  return v10;
}

- (id)mediaDestinationController:(id)a3 rootDestinationWithDecendantIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessory *)self home];
  id v9 = v8;
  if (v8)
  {
    int64_t v10 = [v8 rootDestinationManagerWithDescendantDestinationIdentifier:v7];
    id v11 = [v10 destination];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      __int16 v18 = v15;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not get home to derive root destination from destination identifier: %@", (uint8_t *)&v17, 0x16u);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)mediaDestinationController:(id)a3 destinationWithParentIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessory *)self home];
  id v9 = v8;
  if (v8)
  {
    int64_t v10 = [v8 destinationManagerWithParentIdentifier:v7];
    id v11 = [v10 destination];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      __int16 v18 = v15;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not get home to derive destination from parent identifier: %@", (uint8_t *)&v17, 0x16u);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)mediaDestinationController:(id)a3 destinationManagerWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessory *)self home];
  id v7 = [v6 mediaDestinationManagersWithHomeTheaterSupportedOptions];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__HMDAppleMediaAccessory_mediaDestinationController_destinationManagerWithIdentifier___block_invoke;
  v11[3] = &unk_264A20FB0;
  id v12 = v5;
  id v8 = v5;
  id v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v11);

  return v9;
}

uint64_t __86__HMDAppleMediaAccessory_mediaDestinationController_destinationManagerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (id)availableDestinationIdentifiersForMediaDestinationController:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(HMDAccessory *)self home];
  id v5 = [(HMDAccessory *)self room];
  id v6 = [v4 mediaDestinationsInRoom:v5];

  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsHomeTheaterSupportedOptions", (void)v17))
        {
          int v14 = [v13 uniqueIdentifier];
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v15 = (void *)[v7 copy];
  return v15;
}

- (void)deviceController:(id)a3 didUpdateDevice:(id)a4
{
}

- (void)handleRemovedMediaDestinationControllerModel:(id)a3 message:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v22 = 138543618;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling transaction removed media destination controller model: %@", (uint8_t *)&v22, 0x16u);
  }
  id v12 = [(HMDAppleMediaAccessory *)v9 audioDestinationController];
  __int16 v13 = [v6 uuid];
  int v14 = [v12 identifier];
  int v15 = objc_msgSend(v13, "hmf_isEqualToUUID:", v14);

  if (v15)
  {
    int v16 = (void *)MEMORY[0x230FBD990]();
    long long v17 = v9;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      long long v19 = HMFGetLogIdentifier();
      int v22 = 138543618;
      id v23 = v19;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination controller: %@", (uint8_t *)&v22, 0x16u);
    }
    [(HMDAppleMediaAccessory *)v17 setAudioDestinationController:0];
    [(HMDAppleMediaAccessory *)v17 unsetAudioDestinationControllerData];
    long long v20 = [v7 transactionResult];
    [v20 markChanged];

    uint64_t v21 = [v7 transactionResult];
    [v21 markSaveToAssistant];
  }
  [v7 respondWithSuccess];
}

- (void)handleRemovedMediaDestinationModel:(id)a3 message:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v24 = 138543618;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling transaction removed media destination model: %@", (uint8_t *)&v24, 0x16u);
  }
  id v12 = [v6 uuid];
  __int16 v13 = [(HMDAppleMediaAccessory *)v9 audioDestination];
  int v14 = [v13 uniqueIdentifier];
  int v15 = objc_msgSend(v12, "hmf_isEqualToUUID:", v14);

  if (v15)
  {
    int v16 = (void *)MEMORY[0x230FBD990]();
    long long v17 = v9;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      long long v19 = HMFGetLogIdentifier();
      int v24 = 138543362;
      id v25 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination manager due to removed model transaction", (uint8_t *)&v24, 0xCu);
    }
    long long v20 = [(HMDAppleMediaAccessory *)v17 audioDestinationManager];
    [(HMDAppleMediaAccessory *)v17 setAudioDestinationManager:0];
    [(HMDAppleMediaAccessory *)v17 unsetAudioDestination];
    uint64_t v21 = [v20 messageHandler];
    [v21 handleUpdatedDestination:0];

    int v22 = [v7 transactionResult];
    [v22 markChanged];

    id v23 = [v7 transactionResult];
    [v23 markSaveToAssistant];
  }
  [v7 respondWithSuccess];
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (v9)
  {
    [(HMDAppleMediaAccessory *)self handleRemovedMediaDestinationModel:v9 message:v7];
  }
  else
  {
    id v10 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      [(HMDAppleMediaAccessory *)self handleRemovedMediaDestinationControllerModel:v12 message:v7];
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)HMDAppleMediaAccessory;
      [(HMDAccessory *)&v13 transactionObjectRemoved:v10 message:v7];
    }
  }
}

- (void)handleUpdatedMediaDestinationModel:(id)a3 message:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ![(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    id v12 = [(HMDAppleMediaAccessory *)self audioDestinationManager];
    objc_super v13 = v12;
    if (v12)
    {
      int v14 = [v12 backingStoreHandler];
      [v14 transactionObjectUpdated:v6 newValues:v6 message:v7];
    }
    else
    {
      int v15 = [(HMDAccessory *)self home];
      int v16 = (void *)MEMORY[0x230FBD990]();
      long long v17 = self;
      long long v18 = HMFGetOSLogHandle();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v15)
      {
        BOOL v39 = v15;
        if (v19)
        {
          long long v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v41 = v20;
          __int16 v42 = 2112;
          id v43 = v6;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination manager with model: %@", buf, 0x16u);
        }
        uint64_t v21 = [v6 supportedOptions];
        uint64_t v22 = [v21 unsignedIntegerValue];

        id v23 = [v6 audioGroupIdentifier];
        id v24 = objc_alloc(MEMORY[0x263F0E4C0]);
        id v25 = [v6 uuid];
        __int16 v26 = [v6 parentUUID];
        id v27 = (void *)[v24 initWithUniqueIdentifier:v25 parentIdentifier:v26 supportedOptions:v22 audioGroupIdentifier:v23];

        uint64_t v28 = [HMDMediaDestinationManager alloc];
        uint64_t v29 = [(HMDAccessory *)v17 msgDispatcher];
        BOOL v30 = [(HMDMediaAccessory *)v17 notificationCenter];
        uint64_t v31 = [(HMDAppleMediaAccessory *)v17 backingStore];
        BOOL v32 = [(HMDMediaDestinationManager *)v28 initWithDestination:v27 messageDispatcher:v29 notificationCenter:v30 backingStore:v31 targetDevice:[(HMDAppleMediaAccessory *)v17 isCurrentAccessory] dataSource:v17 delegate:v17];
        [(HMDAppleMediaAccessory *)v17 setAudioDestinationManager:v32];

        uint64_t v33 = [(HMDAppleMediaAccessory *)v17 audioDestinationManager];
        int v15 = v39;
        objc_msgSend(v33, "configureWithHome:currentAccessory:", v39, -[HMDAppleMediaAccessory isCurrentAccessory](v17, "isCurrentAccessory"));

        uint64_t v34 = [(HMDAppleMediaAccessory *)v17 audioDestinationManager];
        id v35 = [v34 messageHandler];
        [v35 handleUpdatedDestination:v27];

        long long v36 = [v7 transactionResult];
        [v36 markChanged];

        BOOL v37 = [v7 transactionResult];
        [v37 markSaveToAssistant];

        [v7 respondWithSuccess];
      }
      else
      {
        if (v19)
        {
          BOOL v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v41 = v38;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to create audio destination manager due to no home", buf, 0xCu);
        }
        id v23 = [MEMORY[0x263F087E8] hmfErrorWithCode:4];
        [v7 respondWithError:v23];
      }
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v11;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping model: %@ due to home theater QFA", buf, 0x16u);
    }
  }
}

- (void)handleUpdatedMediaDestinationControllerModel:(id)a3 message:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ![(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
  {
    id v12 = [(HMDAppleMediaAccessory *)self audioDestinationController];
    objc_super v13 = v12;
    if (v12)
    {
      int v14 = [v12 backingStoreHandler];
      [v14 transactionObjectUpdated:v6 newValues:v6 message:v7];
    }
    else
    {
      int v15 = (void *)MEMORY[0x230FBD990]();
      int v16 = self;
      long long v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        long long v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v51 = v18;
        __int16 v52 = 2112;
        id v53 = v6;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination controller with model: %@", buf, 0x16u);
      }
      uint64_t v19 = [v6 availableDestinationModelIdentifiers];
      long long v20 = (void *)v19;
      uint64_t v21 = (void *)MEMORY[0x263EFFA68];
      if (v19) {
        uint64_t v21 = (void *)v19;
      }
      id v22 = v21;

      id v23 = objc_alloc(MEMORY[0x263F0E4D0]);
      id v24 = [v6 uuid];
      id v25 = [v6 parentUUID];
      __int16 v26 = [v6 destinationModelIdentifier];
      id v27 = [v6 supportedOptions];
      uint64_t v48 = v22;
      uint64_t v49 = objc_msgSend(v23, "initWithIdentifier:parentIdentifier:destinationIdentifier:supportedOptions:availableDestinationIdentifiers:", v24, v25, v26, objc_msgSend(v27, "unsignedIntegerValue"), v22);

      uint64_t v28 = [(HMDAccessory *)v16 home];
      uint64_t v29 = [(HMDAppleMediaAccessory *)v16 backingStore];
      BOOL v30 = [(HMDAccessory *)v16 msgDispatcher];
      uint64_t v31 = [(HMDMediaAccessory *)v16 notificationCenter];
      BOOL v32 = [v28 logEventSubmitter];
      uint64_t v47 = v28;
      uint64_t v33 = [v28 dailyScheduler];
      uint64_t v34 = (void *)v33;
      if (v29 && v30 && v31 && v32 && v33)
      {
        id v35 = [HMDMediaDestinationController alloc];
        LOBYTE(v44) = [(HMDAppleMediaAccessory *)v16 isCurrentAccessory];
        long long v36 = [(HMDMediaDestinationController *)v35 initWithData:v49 backingStore:v29 messageDispatcher:v30 notificationCenter:v31 logEventSubmitter:v32 dailyScheduler:v34 targetDevice:v44 dataSource:v16 delegate:v16];
        [(HMDAppleMediaAccessory *)v16 setAudioDestinationController:v36];

        BOOL v37 = [(HMDAppleMediaAccessory *)v16 audioDestinationController];
        BOOL v38 = v47;
        [v37 configureWithHome:v47];

        BOOL v39 = [v7 transactionResult];
        [v39 markChanged];

        int v40 = [v7 transactionResult];
        [v40 markSaveToAssistant];

        v41 = (void *)v49;
        [v7 respondWithSuccess];
      }
      else
      {
        context = (void *)MEMORY[0x230FBD990]();
        __int16 v42 = v16;
        id v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544642;
          v51 = v45;
          __int16 v52 = 2112;
          id v53 = v29;
          __int16 v54 = 2112;
          uint64_t v55 = v30;
          __int16 v56 = 2112;
          v57 = v31;
          __int16 v58 = 2112;
          v59 = v32;
          __int16 v60 = 2112;
          uint64_t v61 = v34;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new audio destination controller due to missing dependencies backing store: %@ message dispatcher: %@ notification center: %@ log submitter: %@ daily scheduler: %@", buf, 0x3Eu);
        }
        v41 = (void *)v49;
        BOOL v38 = v47;
      }
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v51 = v11;
      __int16 v52 = 2112;
      id v53 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Skipping transaction update: %@ due to Home Theater QFA enabled", buf, 0x16u);
    }
  }
}

- (void)handleTransactionUpdatedPublicPairingIdentity:(id)a3 result:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v18 = 138543618;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated accessory public pairing identity: %@", (uint8_t *)&v18, 0x16u);
    }
    id v12 = [(HMDAppleMediaAccessory *)v9 pairingIdentity];
    int v13 = [v12 isEqual:v6];

    if (v13)
    {
      int v14 = (void *)MEMORY[0x230FBD990]();
      int v15 = v9;
      int v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        long long v17 = HMFGetLogIdentifier();
        int v18 = 138543362;
        uint64_t v19 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Skipping already saved pairing identity", (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      [(HMDAppleMediaAccessory *)v9 setPairingIdentity:v6];
      [(HMDAppleMediaAccessory *)v9 notifyFrameworkOfUpdatedPairingIdentity];
      [v7 markChanged];
    }
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__137201;
    uint64_t v28 = __Block_byref_object_dispose__137202;
    id v29 = 0;
    int v14 = [v10 responseHandler];
    if (v14)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__HMDAppleMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke;
      aBlock[3] = &unk_264A20F88;
      aBlock[4] = &v24;
      int v15 = _Block_copy(aBlock);
      [v10 setResponseHandler:v15];
    }
    v22.receiver = self;
    v22.super_class = (Class)HMDAppleMediaAccessory;
    [(HMDMediaAccessory *)&v22 transactionObjectUpdated:0 newValues:v11 message:v10];
    __transactionAccessoryUpdated_137203(self, v13, v10);
    if (v14) {
      v14[2](v14, v25[5], 0);
    }

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v16 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v17 = v16;
    }
    else {
      long long v17 = 0;
    }
    id v18 = v17;

    if (v18)
    {
      [(HMDAppleMediaAccessory *)self handleUpdatedMediaDestinationControllerModel:v18 message:v10];
    }
    else
    {
      id v16 = v16;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v19 = v16;
      }
      else {
        uint64_t v19 = 0;
      }
      id v20 = v19;

      if (!v20)
      {
        v21.receiver = self;
        v21.super_class = (Class)HMDAppleMediaAccessory;
        [(HMDMediaAccessory *)&v21 transactionObjectUpdated:v8 newValues:v16 message:v10];
        goto LABEL_21;
      }
      [(HMDAppleMediaAccessory *)self handleUpdatedMediaDestinationModel:v20 message:v10];
    }
  }
LABEL_21:
}

void __69__HMDAppleMediaAccessory_transactionObjectUpdated_newValues_message___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (id)backingStoreObjectForMediaDestinationControllerData
{
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    id v4 = [(HMDAppleMediaAccessory *)self committedAudioDestinationControllerData];
    if (v4)
    {
      id v3 = +[HMDMediaDestinationControllerBackingStoreHandler backingStoreObjectForData:v4];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)backingStoreObjectForMediaDestination
{
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    id v4 = [(HMDAppleMediaAccessory *)self committedAudioDestination];
    if (v4)
    {
      id v3 = +[HMDMediaDestinationBackingStoreHandler backingStoreObjectForMediaDestination:v4];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)backingStoreObjects:(int64_t)a3
{
  id v5 = [(HMDAppleMediaAccessory *)self modelObjectWithChangeType:1];
  id v6 = [MEMORY[0x263EFF980] arrayWithObject:v5];
  id v7 = [(HMDAppleMediaAccessory *)self backingStoreObjectForMediaDestination];
  if (v7) {
    [v6 addObject:v7];
  }
  id v8 = [(HMDAppleMediaAccessory *)self backingStoreObjectForMediaDestinationControllerData];
  if (v8) {
    [v6 addObject:v8];
  }
  v12.receiver = self;
  v12.super_class = (Class)HMDAppleMediaAccessory;
  id v9 = [(HMDAccessory *)&v12 backingStoreObjects:a3];
  [v6 addObjectsFromArray:v9];

  id v10 = (void *)[v6 copy];
  return v10;
}

- (void)populateModelObject:(id)a3 version:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  v42.receiver = self;
  v42.super_class = (Class)HMDAppleMediaAccessory;
  [(HMDAccessory *)&v42 populateModelObject:v8 version:a4];
  id v9 = [(HMDAppleMediaAccessory *)self device];
  id v10 = [v9 version];
  id v11 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:@"4.0"];
  int v12 = [v10 isAtLeastVersion:v11];

  BOOL v13 = isWatch();
  if (v13
    && (+[HMDDeviceCapabilities deviceCapabilities],
        id v10 = objc_claimAutoreleasedReturnValue(),
        ![v10 supportsCloudDataSync]))
  {
    int v15 = 1;
  }
  else
  {
    int v14 = [(HMDAccessory *)self home];
    int v15 = [v14 isOwnerUser] ^ 1;

    if (!v13)
    {
      if (!v12) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
  }

  if (!v12)
  {
LABEL_15:
    id v18 = [v9 identifier];
    uint64_t v19 = [v18 UUIDString];
    [v8 setDeviceUUID:v19];

    if (v15 && self->_device)
    {
      objc_msgSend(v8, "setDevice:");
      device = self->_device;
      self->_device = 0;
    }
    else
    {
      [v8 setDevice:v9];
    }
    goto LABEL_19;
  }
LABEL_11:
  int v16 = [v9 isCurrentDevice];
  if (a4 > 3) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  if ((v17 | v15) == 1) {
    goto LABEL_15;
  }
LABEL_19:
  objc_super v21 = [(HMDAppleMediaAccessory *)self remoteLoginHandler];

  if (v21)
  {
    objc_super v22 = [(HMDAppleMediaAccessory *)self remoteLoginHandler];
    id v23 = [v22 loggedInAccount];
    uint64_t v24 = encodeRootObject();
    [v8 setLoggedInAccount:v24];
  }
  id v25 = [(HMDAppleMediaAccessory *)self softwareVersion];

  if (v25)
  {
    uint64_t v26 = [(HMDAppleMediaAccessory *)self softwareVersion];
    [v8 setSoftwareVersion:v26];
  }
  id v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory variant](self, "variant"));
  [v8 setVariant:v27];

  uint64_t v28 = [(HMDAppleMediaAccessory *)self rawCapabilities];
  [v8 setAccessoryCapabilities:v28];

  id v29 = [(HMDAppleMediaAccessory *)self wifiNetworkInfo];

  if (v29)
  {
    BOOL v30 = [(HMDAppleMediaAccessory *)self wifiNetworkInfo];
    [v8 setWifiNetworkInfo:v30];
  }
  uint64_t v31 = [(HMDAppleMediaAccessory *)self pairingIdentity];
  BOOL v32 = [v31 publicPairingIdentity];

  if (v32)
  {
    uint64_t v33 = [(HMDAppleMediaAccessory *)self pairingIdentity];
    uint64_t v34 = [v33 publicPairingIdentity];
    [v8 setPairingIdentity:v34];
  }
  if ([(HMDAppleMediaAccessory *)self supportedStereoPairVersions])
  {
    id v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
    [v8 setSupportedStereoPairVersions:v35];
  }
  if ([(HMDAppleMediaAccessory *)self supportsPreferredMediaUser])
  {
    long long v36 = [(HMDAccessory *)self preferredMediaUserUUID];
    [v8 setPreferredMediaUserUUID:v36];
  }
  BOOL v37 = [(HMDAccessory *)self preferredMediaUserSelectionTypeNumber];

  if (v37)
  {
    BOOL v38 = [(HMDAccessory *)self preferredMediaUserSelectionTypeNumber];
    [v8 setPreferredUserSelectionType:v38];
  }
  if ([(HMDAppleMediaAccessory *)self productColor])
  {
    BOOL v39 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAppleMediaAccessory productColor](self, "productColor"));
    [v8 setProductColor:v39];
  }
  int v40 = [(HMDAppleMediaAccessory *)self idsIdentifier];

  if (v40)
  {
    v41 = [(HMDAppleMediaAccessory *)self idsIdentifier];
    [v8 setIdsIdentifier:v41];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  id v4 = [(HMDAppleMediaAccessory *)self transactionWithObjectChangeType:a3];
  [(HMDAppleMediaAccessory *)self populateModelObject:v4 version:4];
  return v4;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  id v5 = [HMDAppleMediaAccessoryModel alloc];
  id v6 = [(HMDAccessory *)self uuid];
  id v7 = [(HMDAccessory *)self home];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  return v9;
}

- (id)messageSendPolicy
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    uint64_t v2 = 81;
  }
  else {
    uint64_t v2 = 65;
  }
  id v3 = [[HMDHomeManagerXPCMessageSendPolicy alloc] initWithEntitlements:5 options:v2];
  return v3;
}

- (id)remoteMessageDestination
{
  id v3 = [(HMDAppleMediaAccessory *)self device];

  if (v3)
  {
    id v4 = [HMDRemoteDeviceMessageDestination alloc];
    id v5 = [(HMDAccessory *)self messageTargetUUID];
    id v6 = [(HMDAppleMediaAccessory *)self device];
    id v7 = [(HMDRemoteDeviceMessageDestination *)v4 initWithTarget:v5 device:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)_relayRequestMessage:(id)a3 responseHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isRemote])
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v35 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot relay a remote message", buf, 0xCu);
    }
    int v12 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    [v6 respondWithError:v12];
  }
  else
  {
    BOOL v13 = [(HMDAccessory *)self home];
    int v14 = [v13 homeManager];
    int v12 = [v14 messageDispatcher];

    if (v12)
    {
      int v15 = [(HMDAppleMediaAccessory *)self remoteMessageDestination];
      if (v15)
      {
        int v16 = [v6 name];
        uint64_t v17 = [v6 qualityOfService];
        id v18 = [v6 messagePayload];
        uint64_t v19 = +[HMDRemoteMessage secureMessageWithName:v16 qualityOfService:v17 destination:v15 messagePayload:v18];

        objc_initWeak((id *)buf, self);
        uint64_t v28 = MEMORY[0x263EF8330];
        uint64_t v29 = 3221225472;
        BOOL v30 = __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke;
        uint64_t v31 = &unk_264A2EAE0;
        objc_copyWeak(&v33, (id *)buf);
        id v32 = v7;
        [v19 setResponseHandler:&v28];
        objc_msgSend(v12, "sendMessage:", v19, v28, v29, v30, v31);

        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        uint64_t v24 = (void *)MEMORY[0x230FBD990]();
        id v25 = self;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          id v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v35 = v27;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Cannot send message to unknown remote device", buf, 0xCu);
        }
        uint64_t v19 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
        [v6 respondWithError:v19];
      }
    }
    else
    {
      id v20 = (void *)MEMORY[0x230FBD990]();
      objc_super v21 = self;
      objc_super v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v35 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Not configured to relay messages", buf, 0xCu);
      }
      int v15 = [MEMORY[0x263F087E8] hmErrorWithCode:54];
      [v6 respondWithError:v15];
    }
  }
}

void __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v9 = [WeakRetained workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke_2;
    block[3] = &unk_264A2EE80;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __63__HMDAppleMediaAccessory__relayRequestMessage_responseHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)handleCurrentNetworkChangedNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received current network changed notification: %@", (uint8_t *)&v9, 0x16u);
  }
  [(HMDAppleMediaAccessory *)v6 updateWiFiNetworkInfo];
}

- (void)updateWiFiNetworkInfo
{
  id v3 = [(HMDAccessory *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) wifiManager];
  id v3 = [v2 MACAddress];

  id v4 = [*(id *)(a1 + 32) wifiManager];
  id v5 = [v4 currentNetworkSSID];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F42688]) initWithMACAddress:v3 SSID:v5];
  id v7 = +[HMDBackingStoreTransactionOptions defaultLocalOptions];
  if (v5)
  {
    id v8 = [*(id *)(a1 + 32) lastStagedWifiNetworkInfo];
    char v9 = [v8 isEqualToNetworkInfo:v6];

    if ((v9 & 1) == 0)
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = *(id *)(a1 + 32);
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        int v14 = [*(id *)(a1 + 32) wifiNetworkInfo];
        [*(id *)(a1 + 32) lastStagedWifiNetworkInfo];
        int v15 = v28 = v10;
        *(_DWORD *)buf = 138544130;
        uint64_t v31 = v13;
        __int16 v32 = 2112;
        id v33 = v6;
        __int16 v34 = 2112;
        id v35 = v14;
        __int16 v36 = 2112;
        BOOL v37 = v15;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updating WiFi network info to %@, lastCommitedWiFiInfo: %@, lastStagedWiFiInfo %@", buf, 0x2Au);

        id v10 = v28;
      }

      int v16 = [*(id *)(a1 + 32) transactionWithObjectChangeType:2];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = 0;
      }
      id v18 = v17;

      [v18 setWifiNetworkInfo:v6];
      uint64_t v19 = [*(id *)(a1 + 32) lastStagedWifiNetworkInfo];
      id v20 = [v19 SSID];
      objc_super v21 = [v6 SSID];
      char v22 = HMFEqualObjects();

      if (v22)
      {
        id v23 = @"HMDAppleMediaAccessoryWiFiMACLocalOnlyUpdateLabel";
      }
      else
      {
        uint64_t v24 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];

        id v23 = @"HMDAppleMediaAccessoryWiFiNetworkInfoUpdateLabel";
        id v7 = (void *)v24;
      }
      objc_msgSend(*(id *)(a1 + 32), "setLastStagedWifiNetworkInfo:", v6, v28);
      id v25 = [*(id *)(a1 + 32) home];
      uint64_t v26 = [v25 backingStore];
      id v27 = [v26 transaction:v23 options:v7];

      [v27 add:v18];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke_454;
      v29[3] = &unk_264A2F3E8;
      v29[4] = *(void *)(a1 + 32);
      [v27 run:v29];
    }
  }
}

void __47__HMDAppleMediaAccessory_updateWiFiNetworkInfo__block_invoke_454(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) setLastStagedWifiNetworkInfo:0]);
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      char v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Updating WiFi network info backing store transaction failed: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (HMFWiFiNetworkInfo)lastStagedWifiNetworkInfo
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_lastStagedWifiNetworkInfo;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setLastStagedWifiNetworkInfo:(id)a3
{
  id v4 = (HMFWiFiNetworkInfo *)a3;
  os_unfair_recursive_lock_lock_with_options();
  lastStagedWifiNetworkInfo = self->_lastStagedWifiNetworkInfo;
  self->_lastStagedWifiNetworkInfo = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setWifiNetworkInfo:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    objc_storeStrong((id *)&self->_wifiNetworkInfo, a3);
    os_unfair_recursive_lock_unlock();
    id v5 = [(HMDMediaAccessory *)self notificationCenter];
    [v5 postNotificationName:@"HMDAppleMediaAccessoryWiFiNetworkInfoUpdatedNotification" object:self];
  }
}

- (HMFWiFiNetworkInfo)wifiNetworkInfo
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_wifiNetworkInfo;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)handleSoftwareUpdateV2Scan:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v16 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling SoftwareUpdateV2Scan", buf, 0xCu);
  }
  if (![(HMDAppleMediaAccessory *)v6 isCurrentAccessory])
  {
    char v9 = (void *)MEMORY[0x230FBD990]();
    __int16 v10 = v6;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v16 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Relaying SoftwareUpdateV2Scan", buf, 0xCu);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __53__HMDAppleMediaAccessory_handleSoftwareUpdateV2Scan___block_invoke;
    v13[3] = &unk_264A2D870;
    void v13[4] = v10;
    id v14 = v4;
    [(HMDAppleMediaAccessory *)v10 _relayRequestMessage:v14 responseHandler:v13];
  }
}

void __53__HMDAppleMediaAccessory_handleSoftwareUpdateV2Scan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  char v9 = HMFGetOSLogHandle();
  __int16 v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@SoftwareUpdateV2Scan responded with error: %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@SoftwareUpdateV2Scan responded", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithPayload:v6];
  }
}

- (id)_scanForSoftwareUpdate
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v25 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update.", buf, 0xCu);
  }
  id v7 = objc_alloc(MEMORY[0x263F42570]);
  id v8 = [(HMDAccessory *)v4 uuid];
  char v9 = (void *)[v7 initWithTarget:v8];

  __int16 v10 = (void *)MEMORY[0x263F42590];
  uint64_t v22 = *MEMORY[0x263F0B6E8];
  id v23 = &unk_26E471C20;
  id v11 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  uint64_t v12 = [v10 messageWithName:*MEMORY[0x263F0B6F8] destination:v9 payload:v11];

  id v13 = objc_alloc_init(MEMORY[0x263F58190]);
  objc_initWeak((id *)buf, v4);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __48__HMDAppleMediaAccessory__scanForSoftwareUpdate__block_invoke;
  uint64_t v19 = &unk_264A2D420;
  objc_copyWeak(&v21, (id *)buf);
  id v14 = v13;
  id v20 = v14;
  [v12 setResponseHandler:&v16];
  -[HMDAppleMediaAccessory handleSoftwareUpdateV2Scan:](v4, "handleSoftwareUpdateV2Scan:", v12, v16, v17, v18, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

  return v14;
}

void __48__HMDAppleMediaAccessory__scanForSoftwareUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x230FBD990]();
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v33 = 138543362;
      __int16 v34 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Received response for HMAccessorySoftwareUpdateControllerV2ScanMessage", (uint8_t *)&v33, 0xCu);
    }
    if (v5)
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = v9;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = HMFGetLogIdentifier();
        int v33 = 138543618;
        __int16 v34 = v15;
        __int16 v35 = 2112;
        id v36 = v5;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@SRAISU: Scan message failed with error: %@", (uint8_t *)&v33, 0x16u);
      }
      uint64_t v16 = *(void **)(a1 + 32);
      uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v16 finishWithError:v17];
      goto LABEL_22;
    }
    id v20 = objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x263F0B6E0]);
    uint64_t v17 = v20;
    if (v20)
    {
      int v21 = [v20 BOOLValue];
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = v9;
      uint64_t v24 = HMFGetOSLogHandle();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v21)
      {
        if (v25)
        {
          uint64_t v26 = HMFGetLogIdentifier();
          int v33 = 138543362;
          __int16 v34 = v26;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@SRAISU: scanResultFuture successfully found update", (uint8_t *)&v33, 0xCu);
        }
        [*(id *)(a1 + 32) finishWithNoResult];
        goto LABEL_22;
      }
      if (!v25) {
        goto LABEL_21;
      }
      id v27 = HMFGetLogIdentifier();
      int v33 = 138543362;
      __int16 v34 = v27;
      uint64_t v28 = "%{public}@SRAISU: scanResultFuture failed to find update";
      uint64_t v29 = v24;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = v9;
      uint64_t v24 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        uint64_t v31 = *(void **)(a1 + 32);
        __int16 v32 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        [v31 finishWithError:v32];

LABEL_22:
        goto LABEL_23;
      }
      id v27 = HMFGetLogIdentifier();
      int v33 = 138543362;
      __int16 v34 = v27;
      uint64_t v28 = "%{public}@SRAISU: Message did not contain required key in response: HMAccessorySoftwareUpdateControllerV2Mes"
            "sageKeyScanDidFindUpdate";
      uint64_t v29 = v24;
      os_log_type_t v30 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_22F52A000, v29, v30, v28, (uint8_t *)&v33, 0xCu);

    goto LABEL_21;
  }
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    int v33 = 138543362;
    __int16 v34 = v19;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Completing scan future with success because the accessory was deallocated", (uint8_t *)&v33, 0xCu);
  }
  [*(id *)(a1 + 32) finishWithNoResult];
LABEL_23:
}

- (id)_scanForSoftwareUpdateWithRetries
{
  v35[5] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v32 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update with retries.", buf, 0xCu);
  }
  id v7 = [NSNumber numberWithDouble:360.0];
  v35[0] = v7;
  id v8 = [NSNumber numberWithDouble:900.0];
  v35[1] = v8;
  id v9 = [NSNumber numberWithDouble:1800.0];
  v35[2] = v9;
  __int16 v10 = [NSNumber numberWithDouble:7200.0];
  v35[3] = v10;
  id v11 = [NSNumber numberWithDouble:21600.0];
  v35[4] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:5];

  if (isInternalBuild()
    && ([MEMORY[0x263F42608] sharedPreferences],
        id v13 = objc_claimAutoreleasedReturnValue(),
        [v13 preferenceForKey:@"HMDAppleMediaAccessoryShouldOverrideRepeatScanningIntervals"],
        id v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 BOOLValue],
        v14,
        v13,
        v15))
  {
    uint64_t v16 = [MEMORY[0x263F42608] sharedPreferences];
    uint64_t v17 = [v16 preferenceForKey:@"HMDAppleMediaAccessoryRepeatScanningIntervalsOverride"];
    id v18 = [v17 value];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    id v20 = v19;

    int v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = v4;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v32 = v24;
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Overriding retries with new retries: %@", buf, 0x16u);
    }
  }
  else
  {
    id v20 = v12;
  }
  objc_initWeak((id *)buf, v4);
  BOOL v25 = (void *)MEMORY[0x263F58190];
  uint64_t v26 = [(HMDAccessory *)v4 workQueue];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __59__HMDAppleMediaAccessory__scanForSoftwareUpdateWithRetries__block_invoke;
  v29[3] = &unk_264A20F60;
  objc_copyWeak(&v30, (id *)buf);
  id v27 = [v25 futureWithRetryIntervals:v20 workQueue:v26 block:v29];
  objc_destroyWeak(&v30);

  objc_destroyWeak((id *)buf);
  return v27;
}

id __59__HMDAppleMediaAccessory__scanForSoftwareUpdateWithRetries__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x230FBD990]();
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v14 = 138543618;
      int v15 = v8;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update with retryIntervalsRemaining: %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v9 = [v6 _scanForSoftwareUpdate];
  }
  else
  {
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      int v15 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Completing scan future with success because the accessory was deallocated", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v9 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  uint64_t v12 = (void *)v9;

  return v12;
}

- (id)_softwareUpdateV2FromDescriptor:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating HMSoftwareUpdateV2 for descriptor: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = [MEMORY[0x263F0E810] softwareUpdateFromDescriptor:v4];

  return v9;
}

- (void)_applySoftwareUpdateWithDescriptor:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Applying software update with descriptor: %@", buf, 0x16u);
  }
  uint64_t v9 = [(HMDAppleMediaAccessory *)v6 _softwareUpdateV2FromDescriptor:v4];
  __int16 v10 = [v9 version];

  if (v10)
  {
    int v11 = [MEMORY[0x263F0E0A0] softwareUpdateFromSoftwareUpdateV2:v9];
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    __int16 v13 = v6;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v15;
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Created HMSoftwareUpdate: %@", buf, 0x16u);
    }
    uint64_t v27 = *MEMORY[0x263F0D9F0];
    __int16 v16 = encodeRootObject();
    uint64_t v28 = v16;
    id v17 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

    id v18 = objc_alloc(MEMORY[0x263F42570]);
    uint64_t v19 = [(HMDAccessory *)v13 uuid];
    id v20 = (void *)[v18 initWithTarget:v19];

    int v21 = [MEMORY[0x263F42590] messageWithName:*MEMORY[0x263F0D9E0] destination:v20 payload:v17];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __61__HMDAppleMediaAccessory__applySoftwareUpdateWithDescriptor___block_invoke;
    v26[3] = &unk_264A2F0C8;
    v26[4] = v13;
    [v21 setResponseHandler:v26];
    [(HMDAppleMediaAccessory *)v13 _startUpdate:v21];
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = v6;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      BOOL v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v25;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@SRAISU: Cannot apply software update with no version: %@", buf, 0x16u);
    }
  }
}

void __61__HMDAppleMediaAccessory__applySoftwareUpdateWithDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  __int16 v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v16 = 138543618;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      uint64_t v12 = "%{public}@SRAISU: Failed to start software update with error: %@";
      __int16 v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v16, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v16 = 138543362;
    id v17 = v11;
    uint64_t v12 = "%{public}@SRAISU: Successfully started software update";
    __int16 v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }
}

- (void)handleSoftwareUpdateDidBecomeAvailableWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessory *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__HMDAppleMediaAccessory_handleSoftwareUpdateDidBecomeAvailableWithDescriptor___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __79__HMDAppleMediaAccessory_handleSoftwareUpdateDidBecomeAvailableWithDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Handling software update did become available with descriptor: %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = [*(id *)(a1 + 32) shouldApplySoftwareUpdateWhenFound];
  if (result)
  {
    [*(id *)(a1 + 32) _applySoftwareUpdateWithDescriptor:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) setShouldApplySoftwareUpdateWhenFound:0];
  }
  return result;
}

- (void)_scanForSoftwareUpdateRepeatedlyAndInstallUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = [(HMDAccessory *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    __int16 v10 = HMFBooleanToString();
    int v28 = 138543618;
    uint64_t v29 = v9;
    __int16 v30 = 2112;
    __int16 v31 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update repeatedly with shouldInstallUpdate: %@", (uint8_t *)&v28, 0x16u);
  }
  uint64_t v11 = [(HMDAppleMediaAccessory *)v7 softwareUpdateListener];
  int v12 = [v11 isSoftwareUpdateAvailable];

  __int16 v13 = [(HMDAppleMediaAccessory *)v7 softwareUpdateListener];
  os_log_type_t v14 = [v13 softwareUpdateDescriptorForLastEvent];

  if (v3)
  {
    int v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = v7;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = HMFBooleanToString();
      int v28 = 138543874;
      uint64_t v29 = v19;
      __int16 v30 = 2112;
      __int16 v31 = v20;
      __int16 v32 = 2112;
      uint64_t v33 = v14;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@SRAISU: isSoftwareUpdateAvailable: %@ forDescriptor: %@", (uint8_t *)&v28, 0x20u);
    }
    if (v14) {
      int v21 = v12;
    }
    else {
      int v21 = 0;
    }
    if (v21 == 1)
    {
      [(HMDAppleMediaAccessory *)v17 _applySoftwareUpdateWithDescriptor:v14];
      goto LABEL_17;
    }
    uint64_t v15 = [(HMDAppleMediaAccessory *)v17 setShouldApplySoftwareUpdateWhenFound:1];
  }
  if (v12)
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990](v15);
    id v23 = v7;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      BOOL v25 = HMFGetLogIdentifier();
      uint64_t v26 = HMFBooleanToString();
      int v28 = 138543874;
      uint64_t v29 = v25;
      __int16 v30 = 2112;
      __int16 v31 = v26;
      __int16 v32 = 2112;
      uint64_t v33 = v14;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Skipping scan because isSoftwareUpdateAvailable: %@ forDescriptor: %@", (uint8_t *)&v28, 0x20u);
    }
  }
  id v27 = [(HMDAppleMediaAccessory *)v7 _scanForSoftwareUpdateWithRetries];
LABEL_17:
}

- (void)handleSoftwareUpdateV2ScanRepeatedlyAndApplyMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Handling SoftwareUpdateV2ScanRepeatedlyAndApplyMessage: %@", buf, 0x16u);
  }
  uint64_t v9 = [v4 numberForKey:*MEMORY[0x263F0B6F0]];
  if (v9)
  {
    __int16 v10 = [(HMDAccessory *)v6 workQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__HMDAppleMediaAccessory_handleSoftwareUpdateV2ScanRepeatedlyAndApplyMessage___block_invoke;
    v16[3] = &unk_264A2F820;
    v16[4] = v6;
    id v17 = v9;
    dispatch_async(v10, v16);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    int v12 = v6;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v19 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@SRAISU: Missing value for required message key: HMAccessorySoftwareUpdateControllerV2MessageKeyShouldApplyUpdate", buf, 0xCu);
    }
    uint64_t v15 = [MEMORY[0x263F087E8] hmErrorWithCode:27];
    [v4 respondWithError:v15];
  }
}

uint64_t __78__HMDAppleMediaAccessory_handleSoftwareUpdateV2ScanRepeatedlyAndApplyMessage___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) BOOLValue];
  return [v1 _scanForSoftwareUpdateRepeatedlyAndInstallUpdate:v2];
}

- (void)createSoftwareUpdateEventListenerIfNecessary
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (+[HMDDeviceCapabilities supportsUserNotifications])
  {
    BOOL v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v19 = 138543362;
      __int16 v20 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating softwareUpdateEventListener", (uint8_t *)&v19, 0xCu);
    }
    id v7 = [(HMDAccessory *)v4 home];
    int v8 = [v7 homeManager];
    uint64_t v9 = [v8 localAndRemoteSubscriptionProvider];

    if (!v9)
    {
      __int16 v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = v4;
      int v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = HMFGetLogIdentifier();
        int v19 = 138543362;
        __int16 v20 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to find subscriptionProvider while creating softwareUpdateEventListener", (uint8_t *)&v19, 0xCu);
      }
    }
    os_log_type_t v14 = [HMDSoftwareUpdateEventListenerContext alloc];
    uint64_t v15 = [(HMDAppleMediaAccessory *)v4 eventStoreReadHandle];
    int v16 = [(HMDSoftwareUpdateEventListenerContext *)v14 initWithAccessory:v4 subscriptionProvider:v9 eventStoreReadHandle:v15];

    id v17 = [[HMDSoftwareUpdateEventListener alloc] initWithContext:v16];
    [(HMDAppleMediaAccessory *)v4 setSoftwareUpdateListener:v17];

    __int16 v18 = [(HMDAppleMediaAccessory *)v4 softwareUpdateListener];
    [v18 registerForEvents];
  }
}

- (void)setDeviceIRK:(id)a3
{
  id v9 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_storeStrong((id *)&self->_deviceIRK, a3);
  os_unfair_recursive_lock_unlock();
  if (v9)
  {
    id v5 = objc_alloc(MEMORY[0x263F42548]);
    uint64_t v6 = (void *)[v5 initWithType:*MEMORY[0x263F41FF0] size:*MEMORY[0x263F41FE8] data:v9];
    id v7 = [(HMDAppleMediaAccessory *)self device];
    int v8 = [[HMDRPIdentity alloc] initWithDeviceIRK:v6];
    [v7 setRpIdentity:v8];
  }
}

- (NSData)deviceIRK
{
  BOOL v3 = [(HMDAppleMediaAccessory *)self device];
  id v4 = [v3 rpIdentity];
  id v5 = [v4 deviceIRK];
  uint64_t v6 = [v5 data];

  os_unfair_recursive_lock_lock_with_options();
  deviceIRK = self->_deviceIRK;
  if (!deviceIRK) {
    deviceIRK = v6;
  }
  int v8 = deviceIRK;
  os_unfair_recursive_lock_unlock();

  return v8;
}

- (void)setDeviceAddress:(id)a3
{
  id v4 = (HMDDeviceAddress *)a3;
  os_unfair_recursive_lock_lock_with_options();
  deviceAddress = self->_deviceAddress;
  self->_deviceAddress = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMDDeviceAddress)deviceAddress
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_deviceAddress;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)runTransactionWithPreferredMediaUserUUID:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = (void *)MEMORY[0x230FBD990]();
  uint64_t v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = HMFGetLogIdentifier();
    os_log_type_t v14 = [NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    uint64_t v26 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Run transaction and set preferred media user: %@, type: %@.", buf, 0x20u);
  }
  uint64_t v15 = [(HMDAppleMediaAccessory *)v11 transactionWithObjectChangeType:2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v16 = v15;
  }
  else {
    int v16 = 0;
  }
  id v17 = v16;

  [v17 setPreferredMediaUserUUID:v8];
  __int16 v18 = [NSNumber numberWithUnsignedInteger:a4];
  [v17 setPreferredUserSelectionType:v18];

  id v20 = v17;
  int v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];

  [(HMDAccessory *)v11 runTransactionWithModels:v19 label:@"Update preferred media user" completion:v9];
}

- (void)updatePreferredMediaUser:(id)a3 selectionType:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v6];
  [(HMDAccessory *)self setPreferredMediaUserUUID:v7];

  id v8 = [NSNumber numberWithUnsignedInteger:a4];
  [(HMDAccessory *)self setPreferredMediaUserSelectionTypeNumber:v8];

  id v9 = (void *)MEMORY[0x230FBD990]();
  __int16 v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    __int16 v13 = [(HMDAccessory *)v10 preferredMediaUserUUID];
    os_log_type_t v14 = [(HMDAccessory *)v10 preferredMediaUserSelectionTypeNumber];
    int v15 = 138543874;
    int v16 = v12;
    __int16 v17 = 2112;
    __int16 v18 = v13;
    __int16 v19 = 2112;
    id v20 = v14;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updated preferred media user UUID: %@, type: %@", (uint8_t *)&v15, 0x20u);
  }
}

- (void)updatePreferredMediaUserWithUUID:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = objc_alloc(MEMORY[0x263F0DFC0]);
  uint64_t v11 = [v8 UUIDString];
  int v12 = (void *)[v10 initWithUUIDString:v11 selectionType:a4];

  __int16 v13 = [(HMDAppleMediaAccessory *)self preferredMediaUserEventController];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__HMDAppleMediaAccessory_updatePreferredMediaUserWithUUID_selectionType_completion___block_invoke;
  v16[3] = &unk_264A20F38;
  objc_copyWeak(v19, &location);
  id v14 = v8;
  id v17 = v14;
  v19[1] = (id)a4;
  id v15 = v9;
  id v18 = v15;
  [v13 updatePreferredMediaUserWithPrimaryUserInfo:v12 completion:v16];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __84__HMDAppleMediaAccessory_updatePreferredMediaUserWithUUID_selectionType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (v3)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = v5;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = *(void **)(a1 + 32);
      int v17 = 138543874;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Updated preferred media user to %@ with error: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    [WeakRetained setPreferredMediaUserUUID:*(void *)(a1 + 32)];
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
    [v5 setPreferredMediaUserSelectionTypeNumber:v11];

    id v6 = (void *)MEMORY[0x230FBD990]();
    id v12 = v5;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      id v14 = [v12 preferredMediaUserUUID];
      id v15 = [v12 preferredMediaUserSelectionTypeNumber];
      int v17 = 138543874;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v14;
      __int16 v21 = 2112;
      id v22 = v15;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated preferred media user UUID: %@, type: %@", (uint8_t *)&v17, 0x20u);
    }
  }

  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

- (void)handleUpdatePreferredMediaUser:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    id v5 = [MEMORY[0x263F42620] productInfo];
    uint64_t v6 = [v5 productClass];

    if (v6 == 6)
    {
      id v7 = [v4 numberForKey:*MEMORY[0x263F0B470]];
      if ([v7 unsignedIntegerValue] == 1)
      {
        id v8 = [v4 uuidForKey:@"kUserUUIDKey"];
        id v9 = [(HMDAccessory *)self home];
        id v10 = [v9 userWithUUID:v8];

        if (v10)
        {
          uint64_t v11 = 1;
LABEL_22:
          __int16 v30 = (void *)MEMORY[0x230FBD990]();
          __int16 v31 = self;
          __int16 v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            uint64_t v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v47 = v33;
            _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Handling update preferred media user notification", buf, 0xCu);
          }
          uint64_t v34 = [(HMDAccessory *)v31 preferredMediaUserUUID];
          int v35 = HMFEqualObjects();

          if (v35)
          {
            uint64_t v36 = [(HMDAccessory *)v31 preferredMediaUserSelectionTypeNumber];
            if (v36)
            {
              uint64_t v37 = (void *)v36;
              uint64_t v38 = [(HMDAccessory *)v31 preferredMediaUserSelectionTypeNumber];
              uint64_t v39 = [v38 unsignedIntegerValue];

              if (v11 == v39)
              {
                int v40 = (void *)MEMORY[0x230FBD990]();
                v41 = v31;
                objc_super v42 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  id v43 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  uint64_t v47 = v43;
                  _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@User already matches.", buf, 0xCu);
                }
                [v4 respondWithSuccess];
              }
            }
          }

          goto LABEL_31;
        }
        id v24 = (void *)MEMORY[0x230FBD990]();
        __int16 v25 = self;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = HMFGetLogIdentifier();
          int v28 = [(HMDAccessory *)v25 home];
          *(_DWORD *)buf = 138543874;
          uint64_t v47 = v27;
          __int16 v48 = 2112;
          uint64_t v49 = v8;
          __int16 v50 = 2112;
          v51 = v28;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Did not find user with uuid %@ in home %@.", buf, 0x20u);
        }
        uint64_t v29 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
        [v4 respondWithError:v29];
      }
      else
      {
        if (![v7 unsignedIntegerValue])
        {
          uint64_t v11 = 0;
          id v8 = 0;
          goto LABEL_22;
        }
        id v20 = (void *)MEMORY[0x230FBD990]();
        __int16 v21 = self;
        id v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v47 = v23;
          __int16 v48 = 2112;
          uint64_t v49 = v7;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unexpected selection type %@", buf, 0x16u);
        }
        id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
        [v4 respondWithError:v8];
      }
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x230FBD990]();
      int v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot set preferred user on device class.", buf, 0xCu);
      }
      id v7 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
      [v4 respondWithError:v7];
    }

    goto LABEL_31;
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  __int16 v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = v15;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Relaying preferred media user update.", buf, 0xCu);
  }
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __57__HMDAppleMediaAccessory_handleUpdatePreferredMediaUser___block_invoke;
  v44[3] = &unk_264A2D870;
  v44[4] = v13;
  id v45 = v4;
  [(HMDAppleMediaAccessory *)v13 _relayRequestMessage:v45 responseHandler:v44];

LABEL_31:
}

void __57__HMDAppleMediaAccessory_handleUpdatePreferredMediaUser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v12 = 138543618;
    __int16 v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Got preferred user update response %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v11 = *(void **)(a1 + 40);
  if (v5) {
    [v11 respondWithError:v5];
  }
  else {
    [v11 respondWithSuccess];
  }
}

- (void)handleDeleteSiriHistoryRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v32 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received delete siri history request", buf, 0xCu);
  }
  if ([(HMDAppleMediaAccessory *)v6 isCurrentAccessory])
  {
    id v9 = [MEMORY[0x263F42620] productInfo];
    BOOL v10 = [v9 productClass] == 6;

    if (v10)
    {
      uint64_t v11 = [HMDAppleMediaAccessoryDeleteSiriHistoryOperation alloc];
      int v12 = [(HMDAppleMediaAccessory *)v6 settingsConnectionFactory];
      __int16 v13 = v12[2]();
      __int16 v14 = [(HMDAppleMediaAccessoryDeleteSiriHistoryOperation *)v11 initWithSettingsConnection:v13];

      objc_initWeak((id *)buf, v14);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke_439;
      v26[3] = &unk_264A2B5D8;
      objc_copyWeak(&v28, (id *)buf);
      v26[4] = v6;
      id v27 = v4;
      [(HMDAppleMediaAccessoryDeleteSiriHistoryOperation *)v14 setCompletionBlock:v26];
      id v15 = [MEMORY[0x263F42628] defaultScheduler];
      id v16 = (id)[v15 performOperation:v14];

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      __int16 v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = v6;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v32 = v24;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Attempted to delete siri history on unsupported device", buf, 0xCu);
      }
      __int16 v25 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
      [v4 respondWithError:v25];
    }
  }
  else
  {
    int v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = v6;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v32 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Relaying delete siri history request to current accessory", buf, 0xCu);
    }
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke;
    v29[3] = &unk_264A2D870;
    void v29[4] = v18;
    id v30 = v4;
    [(HMDAppleMediaAccessory *)v18 _relayRequestMessage:v30 responseHandler:v29];
  }
}

void __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  BOOL v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      __int16 v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history relay responded with error: %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      __int16 v14 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Delete siri history relay responded", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithPayload:0];
  }
}

void __57__HMDAppleMediaAccessory_handleDeleteSiriHistoryRequest___block_invoke_439(id *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained error];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = a1[4];
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      int v13 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history operation completed with error: %@", (uint8_t *)&v10, 0x16u);
    }
    [a1[5] respondWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Delete siri history operation completed", (uint8_t *)&v10, 0xCu);
    }
    [a1[5] respondWithPayload:0];
  }
}

- (void)_startUpdate:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v50 = v8;
    __int16 v51 = 2112;
    id v52 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting update for message: %@", buf, 0x16u);
  }
  id v9 = [v4 dataForKey:*MEMORY[0x263F0D9F0]];
  if (v9)
  {
    int v10 = [MEMORY[0x263F08928] deserializeObjectWithData:v9 allowedClass:objc_opt_class() frameworkClasses:&unk_26E474248];
    if (v10)
    {
      uint64_t v11 = [(HMDAccessory *)v6 home];
      if ([v11 isAdminUser])
      {
        +[HMDSoftwareUpdateStartedEvent eventUpdateStartedWithAutomaticUpdateEnabled:](HMDSoftwareUpdateStartedEvent, "eventUpdateStartedWithAutomaticUpdateEnabled:", [v11 isAutomaticSoftwareUpdateEnabled]);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        if ([(HMDAppleMediaAccessory *)v6 isCurrentAccessory])
        {
          int v13 = (void *)MEMORY[0x230FBD990]();
          uint64_t v14 = v6;
          __int16 v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            id v16 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v50 = v16;
            __int16 v51 = 2112;
            id v52 = v10;
            _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Received request to start update: %@", buf, 0x16u);
          }
          uint64_t v17 = [(HMDAppleMediaAccessory *)v14 softwareUpdateInstallProvider];
          if (v17)
          {
            objc_initWeak((id *)buf, v14);
            v41[0] = MEMORY[0x263EF8330];
            v41[1] = 3221225472;
            v41[2] = __39__HMDAppleMediaAccessory__startUpdate___block_invoke_437;
            v41[3] = &unk_264A279B0;
            objc_copyWeak(&v45, (id *)buf);
            id v42 = v10;
            id v12 = v12;
            id v43 = v12;
            id v44 = v4;
            [v17 startUpdate:v42 completionHandler:v41];

            objc_destroyWeak(&v45);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            int v35 = (void *)MEMORY[0x230FBD990]();
            uint64_t v36 = v14;
            uint64_t v37 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              uint64_t v38 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              __int16 v50 = v38;
              _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Software update install not supported", buf, 0xCu);
            }
            uint64_t v39 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
            int v40 = +[HMDMetricsManager sharedLogEventSubmitter];
            [v40 submitLogEvent:v12 error:v39];

            [v4 respondWithError:v39];
            uint64_t v17 = 0;
          }
        }
        else
        {
          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __39__HMDAppleMediaAccessory__startUpdate___block_invoke;
          v46[3] = &unk_264A2D870;
          id v12 = v12;
          uint64_t v47 = (void (**)(void, void, void))v12;
          id v48 = v4;
          [(HMDAppleMediaAccessory *)v6 _relayRequestMessage:v48 responseHandler:v46];

          uint64_t v17 = v47;
        }
      }
      else
      {
        uint64_t v29 = (void *)MEMORY[0x230FBD990]();
        id v30 = v6;
        __int16 v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          __int16 v32 = HMFGetLogIdentifier();
          uint64_t v33 = [v11 currentUser];
          *(_DWORD *)buf = 138543618;
          __int16 v50 = v32;
          __int16 v51 = 2112;
          id v52 = v33;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Only administrators may start updates, current user: %@", buf, 0x16u);
        }
        uint64_t v34 = [v4 responseHandler];

        if (!v34) {
          goto LABEL_30;
        }
        id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:17 description:@"Insufficient privileges." reason:@"Current user is not an administrator." suggestion:0];
        uint64_t v17 = [v4 responseHandler];
        ((void (**)(void, id, void))v17)[2](v17, v12, 0);
      }
    }
    else
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      __int16 v25 = v6;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v50 = v27;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Invalid software update in message payload", buf, 0xCu);
      }
      id v28 = [v4 responseHandler];

      if (!v28)
      {
        int v10 = 0;
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v11 = [MEMORY[0x263F087E8] hmErrorWithCode:22];
      id v12 = [v4 responseHandler];
      (*((void (**)(id, void, void))v12 + 2))(v12, v11, 0);
    }

LABEL_30:
    goto LABEL_31;
  }
  id v18 = (void *)MEMORY[0x230FBD990]();
  __int16 v19 = v6;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __int16 v21 = HMFGetLogIdentifier();
    id v22 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    __int16 v50 = v21;
    __int16 v51 = 2112;
    id v52 = v22;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized software update from message payload: %@", buf, 0x16u);
  }
  uint64_t v23 = [v4 responseHandler];

  if (v23)
  {
    int v10 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    uint64_t v11 = [v4 responseHandler];
    ((void (**)(void, void *, void))v11)[2](v11, v10, 0);
    goto LABEL_30;
  }
LABEL_32:
}

void __39__HMDAppleMediaAccessory__startUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v3 submitLogEvent:*(void *)(a1 + 32) error:v6];

  id v4 = [*(id *)(a1 + 40) responseHandler];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) responseHandler];
    ((void (**)(void, id, void))v5)[2](v5, v6, 0);
  }
}

void __39__HMDAppleMediaAccessory__startUpdate___block_invoke_437(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v17 = 138543874;
      id v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v3;
      uint64_t v11 = "%{public}@Failed to start update, %@, with error: %@";
      id v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v15 = *(void *)(a1 + 32);
    int v17 = 138543618;
    id v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    uint64_t v11 = "%{public}@Successfully started update: %@";
    id v12 = v8;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 22;
    goto LABEL_6;
  }

  id v16 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v16 submitLogEvent:*(void *)(a1 + 40) error:v3];

  [*(id *)(a1 + 48) respondWithPayload:0 error:v3];
}

- (BOOL)_allowSoftwareUpdateChangeFromSource:(unint64_t)a3
{
  return 0;
}

- (void)_applySoftwareUpdateModel:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = (void *)MEMORY[0x263F087E8];
    id v6 = a4;
    id v7 = [v5 hmErrorWithCode:48];
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (BOOL)supportsSoftwareUpdate
{
  id v3 = [(HMDAccessory *)self identifier];
  id v4 = (id)_mediaRouteIdentifier;
  if ([v3 isEqual:v4])
  {
    id v5 = [MEMORY[0x263F42620] productInfo];
    uint64_t v6 = [v5 productClass];

    if (v6 == 6) {
      return 1;
    }
  }
  else
  {
  }
  return [(HMDAppleMediaAccessory *)self isHomePod];
}

- (void)_updateSoftwareVersion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    uint64_t v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [v4 versionString];
      int v17 = 138543618;
      id v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating software version to: %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v10 = [(HMDAppleMediaAccessory *)v6 transactionWithObjectChangeType:2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    [v12 setSoftwareVersion:v4];
    os_log_type_t v13 = [(HMDAccessory *)v6 home];
    uint32_t v14 = [v13 backingStore];
    uint64_t v15 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
    id v16 = [v14 transaction:@"Update Software Version" options:v15];

    [v16 add:v12];
    [v16 run];
  }
}

- (void)setSoftwareVersion:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    objc_storeStrong((id *)&self->_softwareVersion, a3);
    os_unfair_recursive_lock_unlock();
    id v5 = [(HMDMediaAccessory *)self notificationCenter];
    [v5 postNotificationName:@"HMDAppleMediaAccessorySoftwareVersionUpdatedNotification" object:self];
  }
}

- (HMFSoftwareVersion)softwareVersion
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_softwareVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)postDeviceIRKIfDifferent:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v47 = v8;
    __int16 v48 = 2112;
    id v49 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Posting device IRK: %@", buf, 0x16u);
  }
  id v9 = [(HMDAccessory *)v6 home];
  uint64_t v10 = [v9 uuid];

  uint64_t v11 = [(HMDAppleMediaAccessory *)v6 eventForwarder];
  uint64_t v12 = [(HMDAppleMediaAccessory *)v6 eventStoreReadHandle];
  os_log_type_t v13 = (void *)v12;
  if (v4 && v11 && v12 && v10)
  {
    uint32_t v14 = (void *)MEMORY[0x263F0DFA8];
    uint64_t v15 = *MEMORY[0x263F0B2E0];
    id v16 = [(HMDAccessory *)v6 uuid];
    uint64_t v17 = [v14 topicFromSuffixID:v15 homeUUID:v10 accessoryUUID:v16];

    id v44 = (void *)v17;
    id v18 = [v13 lastEventForTopic:v17];
    if (!v18)
    {
      __int16 v19 = (void *)MEMORY[0x230FBD990]();
      uint64_t v20 = v6;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@No previously cached IRK", buf, 0xCu);
      }
    }
    uint64_t v23 = [v18 encodedData];
    id v24 = (void *)v23;
    if (!v18 || v23)
    {
      if (v23 && [v4 isEqualToData:v23])
      {
        uint64_t v33 = (void *)MEMORY[0x230FBD990]();
        uint64_t v34 = v6;
        int v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v47 = v36;
          __int16 v48 = 2112;
          id v49 = v4;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Skipping posting already cached device IRK: %@", buf, 0x16u);
        }
        uint64_t v37 = v44;
        goto LABEL_25;
      }
    }
    else
    {
      __int16 v25 = (void *)MEMORY[0x230FBD990]();
      uint64_t v26 = v6;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v28 = v43 = v25;
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v28;
        __int16 v48 = 2112;
        id v49 = v18;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode cached device IRK from event: %@", buf, 0x16u);

        __int16 v25 = v43;
      }
    }
    id v38 = objc_alloc(MEMORY[0x263F49390]);
    uint64_t v39 = [(HMDAccessory *)v6 uuid];
    int v40 = [v39 UUIDString];
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    v41 = objc_msgSend(v38, "initWithSource:cachePolicy:combineType:timestamp:", v40, 2, 2);

    id v42 = (void *)[objc_alloc(MEMORY[0x263F49380]) initWithEventData:v4 metadata:v41];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __51__HMDAppleMediaAccessory_postDeviceIRKIfDifferent___block_invoke;
    v45[3] = &unk_264A2F3E8;
    v45[4] = v6;
    uint64_t v37 = v44;
    [v11 forwardEvent:v42 topic:v44 completion:v45];

LABEL_25:
    goto LABEL_26;
  }
  uint64_t v29 = (void *)MEMORY[0x230FBD990]();
  id v30 = v6;
  __int16 v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    __int16 v32 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    uint64_t v47 = v32;
    __int16 v48 = 2112;
    id v49 = v4;
    __int16 v50 = 2112;
    __int16 v51 = v11;
    __int16 v52 = 2112;
    uint64_t v53 = v13;
    __int16 v54 = 2112;
    uint64_t v55 = v10;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to post deviceIRK: %@ due to missing dependencies eventforwarder: %@ event store read handle: %@ homeUUID: %@", buf, 0x34u);
  }
LABEL_26:
}

void __51__HMDAppleMediaAccessory_postDeviceIRKIfDifferent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Forwarded current device IRK error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)handleCurrentDeviceIRKUpdated:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"deviceIRK"];

  if (v6)
  {
    [(HMDAppleMediaAccessory *)self postDeviceIRKIfDifferent:v6];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    int v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@No device IRK in notification", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)handleRoomChanged:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDAppleMediaAccessory;
  [(HMDMediaAccessory *)&v14 handleRoomChanged:v4];
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int v8 = [v7 uuid];
    id v9 = [(HMDAccessory *)self uuid];
    if (!objc_msgSend(v8, "hmf_isEqualToUUID:", v9))
    {
LABEL_8:

      goto LABEL_9;
    }
    BOOL v10 = [(HMDAppleMediaAccessory *)self isCurrentAccessory];

    if (v10)
    {
      int v11 = [v4 userInfo];
      int v8 = objc_msgSend(v11, "hmf_stringForKey:", @"kRoomOldNameKey");

      id v9 = [(HMDAppleMediaAccessory *)self metricsDispatcher];
      uint64_t v12 = [(HMDAccessory *)self room];
      uint64_t v13 = [v12 name];
      [v9 submitRoomChangeEvent:v13 previousRoom:v8];

      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)handleRoomNameChanged:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDAppleMediaAccessory;
  [(HMDMediaAccessory *)&v14 handleRoomNameChanged:v4];
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    int v8 = [(HMDAccessory *)self room];
    int v9 = HMFEqualObjects();

    if (v9)
    {
      if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
      {
        BOOL v10 = [v4 userInfo];
        int v11 = objc_msgSend(v10, "hmf_stringForKey:", @"kRoomOldNameKey");

        uint64_t v12 = [(HMDAppleMediaAccessory *)self metricsDispatcher];
        uint64_t v13 = [v7 name];
        [v12 submitRoomChangeEvent:v13 previousRoom:v11];
      }
    }
  }
}

- (void)setSupportedStereoPairVersions:(unint64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  if (self->_supportedStereoPairVersions != a3) {
    self->_supportedStereoPairVersions = a3;
  }
  os_unfair_recursive_lock_unlock();
}

- (unint64_t)supportedStereoPairVersions
{
  os_unfair_recursive_lock_lock_with_options();
  unint64_t supportedStereoPairVersions = self->_supportedStereoPairVersions;
  os_unfair_recursive_lock_unlock();
  return supportedStereoPairVersions;
}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"HMDUserNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  int v9 = (void *)MEMORY[0x230FBD990]();
  BOOL v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v13 = 138543618;
    objc_super v14 = v12;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling removed user: %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)pairingsWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", (uint8_t *)&v10, 0xCu);
  }
  if (v4)
  {
    int v9 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v4[2](v4, 0, v9);
  }
}

- (void)removeUser:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    objc_super v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", (uint8_t *)&v13, 0xCu);
  }
  if (v7)
  {
    uint64_t v12 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v7[2](v7, v12);
  }
}

- (void)addUser:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    objc_super v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", (uint8_t *)&v13, 0xCu);
  }
  if (v7)
  {
    uint64_t v12 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    v7[2](v7, v12);
  }
}

- (BOOL)supportsUserManagement
{
  return 0;
}

- (void)setPairingIdentity:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = (HMFPairingIdentity *)[v6 copy];
  pairingIdentity = self->_pairingIdentity;
  self->_pairingIdentity = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)_handleTriggerPairingIdentityUpdateNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]([v4 respondWithSuccess]);
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Will trigger notification for updated pairing identity for accessory: %@ with message HMAccessoryPairingIdentityUpdatedNotification", (uint8_t *)&v9, 0x16u);
  }
  [(HMDAppleMediaAccessory *)v6 notifyFrameworkOfUpdatedPairingIdentity];
}

- (void)notifyFrameworkOfUpdatedPairingIdentity
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F42590];
  uint64_t v4 = *MEMORY[0x263F0B458];
  id v5 = objc_alloc(MEMORY[0x263F42570]);
  id v6 = [(HMDAccessory *)self uuid];
  id v7 = (void *)[v5 initWithTarget:v6];
  id v8 = [v3 messageWithName:v4 destination:v7 payload:MEMORY[0x263EFFA78]];

  int v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  __int16 v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v14 = 138543362;
    uint64_t v15 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated accessory pairing identity", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v13 = [(HMDAccessory *)v10 msgDispatcher];
  [v13 sendMessage:v8];
}

- (HMFPairingIdentity)pairingIdentity
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_pairingIdentity;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)_handleUpdatedName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMDAppleMediaAccessory;
  [(HMDAccessory *)&v3 _handleUpdatedName:a3];
}

- (id)runtimeState
{
  v11[1] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)HMDAppleMediaAccessory;
  objc_super v3 = [(HMDAccessory *)&v9 runtimeState];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v10 = *MEMORY[0x263F0B258];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAppleMediaAccessory isDeviceReachable](self, "isDeviceReachable"));
  v11[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v4 addEntriesFromDictionary:v6];

  id v7 = (void *)[v4 copy];
  return v7;
}

- (int64_t)reachableTransports
{
  v5.receiver = self;
  v5.super_class = (Class)HMDAppleMediaAccessory;
  int64_t v3 = [(HMDMediaAccessory *)&v5 reachableTransports];
  if ([(HMDAccessory *)self isReachable]) {
    v3 |= 0x10uLL;
  }
  if ([(HMDAppleMediaAccessory *)self isRemotelyReachable]) {
    return v3 | 8;
  }
  else {
    return v3;
  }
}

- (void)setRemotelyReachable:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->super.super._remotelyReachable != v3) {
    self->super.super._remotelyReachable = v3;
  }
  os_unfair_recursive_lock_unlock();
}

- (BOOL)isRemotelyReachable
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_deviceReachable || self->super.super._remotelyReachable;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)removeAdvertisement:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring removed advertisement: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)addAdvertisement:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring added advertisement: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)handleDeviceIsNotReachable:(id)a3
{
  id v4 = [a3 object];
  objc_super v5 = [(HMDAppleMediaAccessory *)self device];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = [(HMDAccessory *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__HMDAppleMediaAccessory_handleDeviceIsNotReachable___block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = self;
    dispatch_async(v7, block);
  }
}

uint64_t __53__HMDAppleMediaAccessory_handleDeviceIsNotReachable___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification device is no longer reachable", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) setDeviceReachable:0];
}

- (void)handleDeviceIsReachable:(id)a3
{
  id v4 = [a3 object];
  objc_super v5 = [(HMDAppleMediaAccessory *)self device];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    int v7 = [(HMDAccessory *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__HMDAppleMediaAccessory_handleDeviceIsReachable___block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = self;
    dispatch_async(v7, block);
  }
}

uint64_t __50__HMDAppleMediaAccessory_handleDeviceIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification device is reachable", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) setDeviceReachable:1];
}

- (void)startMonitoringReachability
{
  id v3 = [(HMDMediaAccessory *)self notificationCenter];
  [v3 removeObserver:self name:@"HMDRemoteDeviceIsReachableNotification" object:0];

  id v4 = [(HMDMediaAccessory *)self notificationCenter];
  [v4 removeObserver:self name:@"HMDRemoteDeviceIsNotReachableNotification" object:0];

  id v11 = [(HMDAppleMediaAccessory *)self device];
  if (v11)
  {
    objc_super v5 = [(HMDMediaAccessory *)self notificationCenter];
    [v5 addObserver:self selector:sel_handleDeviceIsReachable_ name:@"HMDRemoteDeviceIsReachableNotification" object:0];

    int v6 = [(HMDMediaAccessory *)self notificationCenter];
    [v6 addObserver:self selector:sel_handleDeviceIsNotReachable_ name:@"HMDRemoteDeviceIsNotReachableNotification" object:0];

    int v7 = [(HMDAppleMediaAccessory *)self deviceMonitor];
    id v8 = [v7 unreachableDevices];
    int v9 = [v8 containsObject:v11];

    [(HMDAppleMediaAccessory *)self setDeviceReachable:v9 ^ 1u];
    uint64_t v10 = [(HMDAppleMediaAccessory *)self deviceMonitor];
    [v10 startMonitoringDevice:v11 withInitialReachability:0 forClient:self];
  }
}

- (id)deviceMonitor
{
  uint64_t v2 = [(HMDAccessory *)self home];
  id v3 = [v2 homeManager];
  id v4 = [v3 messageDispatcher];
  objc_super v5 = [v4 secureRemoteTransport];
  int v6 = [v5 deviceMonitor];

  return v6;
}

- (void)notifyClientsOfUpdatedAccessoryControllableValue:(BOOL)a3
{
  BOOL v3 = a3;
  v10[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)HMDAppleMediaAccessory;
  -[HMDAccessory notifyClientsOfUpdatedAccessoryControllableValue:](&v8, sel_notifyClientsOfUpdatedAccessoryControllableValue_);
  if (v3)
  {
    objc_super v5 = [(HMDMediaAccessory *)self notificationCenter];
    int v6 = [(HMDAppleMediaAccessory *)self device];
    int v9 = @"HMDAccessoryNotificationKey";
    v10[0] = self;
    int v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v5 postNotificationName:@"HMDAppleMediaAccessoryDeviceIsReachableNotification" object:v6 userInfo:v7];
  }
}

- (void)setDeviceReachable:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_deviceReachable == v3)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    self->_deviceReachable = v3;
    os_unfair_recursive_lock_unlock();
    [(HMDAppleMediaAccessory *)self notifyClientsOfUpdatedAccessoryControllableValue:v3];
  }
}

- (BOOL)isDeviceReachable
{
  LOBYTE(self) = self->_deviceReachable;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)updateReachabilityOfCurrentDevice
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    BOOL v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    objc_super v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      objc_super v8 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Updating reachability to YES as this is the current device", (uint8_t *)&v7, 0xCu);
    }
    [(HMDAccessory *)v4 setReachable:1];
  }
}

- (void)_installManagedConfigurationProfileWithData:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, void, uint64_t))a4;
  objc_super v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v20 = 138543362;
    uint64_t v21 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Installing managed configuration profile", (uint8_t *)&v20, 0xCu);
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  uint64_t v13 = v9;
  int v14 = HMFGetOSLogHandle();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v15)
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Managed Configuration Profile is not supported", (uint8_t *)&v20, 0xCu);
    }
    if (v7)
    {
      uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
LABEL_12:
      __int16 v19 = (void *)v17;
      v7[2](v7, 0, v17);
    }
  }
  else
  {
    if (v15)
    {
      id v18 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v18;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Passed nil managed configuration profile data", (uint8_t *)&v20, 0xCu);
    }
    if (v7)
    {
      uint64_t v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
      goto LABEL_12;
    }
  }
}

- (void)_removeManagedConfigurationProfileWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t))a4;
  objc_super v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v20 = 138543618;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing managed configuration profile: %@", (uint8_t *)&v20, 0x16u);
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  uint64_t v13 = v9;
  int v14 = HMFGetOSLogHandle();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v15)
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Managed Configuration Profile is not supported", (uint8_t *)&v20, 0xCu);
    }
    if (v7)
    {
      uint64_t v17 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
LABEL_12:
      __int16 v19 = (void *)v17;
      v7[2](v7, v17);
    }
  }
  else
  {
    if (v15)
    {
      id v18 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v18;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil managed configuration profile identifier", (uint8_t *)&v20, 0xCu);
    }
    if (v7)
    {
      uint64_t v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
      goto LABEL_12;
    }
  }
}

- (void)handleInstallManagedConfigurationProfile:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_super v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received install managed configuration profile request", buf, 0xCu);
  }
  if ([(HMDAppleMediaAccessory *)v6 isCurrentAccessory])
  {
    uint64_t v9 = [v4 dataForKey:*MEMORY[0x263F0B3A8]];
    if (v9)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      id v19[2] = __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke_397;
      v19[3] = &unk_264A2B7B0;
      id v20 = v4;
      [(HMDAppleMediaAccessory *)v6 _installManagedConfigurationProfileWithData:v9 completion:v19];
      uint64_t v10 = v20;
    }
    else
    {
      BOOL v15 = (void *)MEMORY[0x230FBD990]();
      uint64_t v16 = v6;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@No profile data", buf, 0xCu);
      }
      uint64_t v10 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      [v4 respondWithError:v10];
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = v6;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Relaying remove managed configuration profile request", buf, 0xCu);
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke;
    v21[3] = &unk_264A2D870;
    v21[4] = v12;
    id v22 = v4;
    [(HMDAppleMediaAccessory *)v12 _relayRequestMessage:v22 responseHandler:v21];
  }
}

void __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Remove managed configuration profile responded with error: %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile responded", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithPayload:v6];
  }
}

void __67__HMDAppleMediaAccessory_handleInstallManagedConfigurationProfile___block_invoke_397(uint64_t a1, void *a2, uint64_t a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  BOOL v3 = *(void **)(a1 + 32);
  if (a3)
  {
    id v5 = a2;
    [v3 respondWithError:a3];
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F0B3A0];
    v9[0] = a2;
    id v6 = NSDictionary;
    id v7 = a2;
    id v5 = [v6 dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v3 respondWithPayload:v5];
  }
}

- (void)handleRemoveManagedConfigurationProfile:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received remove managed configuration profile request", buf, 0xCu);
  }
  if ([(HMDAppleMediaAccessory *)v6 isCurrentAccessory])
  {
    uint64_t v9 = [v4 stringForKey:*MEMORY[0x263F0B3A0]];
    if (v9)
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      id v19[2] = __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke_396;
      v19[3] = &unk_264A2F3E8;
      id v20 = v4;
      [(HMDAppleMediaAccessory *)v6 _removeManagedConfigurationProfileWithIdentifier:v9 completion:v19];
      uint64_t v10 = v20;
    }
    else
    {
      __int16 v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = v6;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil identifier", buf, 0xCu);
      }
      uint64_t v10 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      [v4 respondWithError:v10];
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = v6;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Relaying remove managed configuration profile request", buf, 0xCu);
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke;
    v21[3] = &unk_264A2D870;
    v21[4] = v12;
    id v22 = v4;
    [(HMDAppleMediaAccessory *)v12 _relayRequestMessage:v22 responseHandler:v21];
  }
}

void __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Remove managed configuration profile responded with error: %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Remove managed configuration profile responded", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithPayload:v6];
  }
}

uint64_t __66__HMDAppleMediaAccessory_handleRemoveManagedConfigurationProfile___block_invoke_396(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return [v2 respondWithSuccess];
  }
}

- (void)handleFetchManagedConfigurationProfiles:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v58 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received fetch managed configuration profiles request", buf, 0xCu);
  }
  BOOL v9 = [(HMDAppleMediaAccessory *)v6 isCurrentAccessory];
  uint64_t v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = v6;
  id v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v58 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling fetch managed configuration profiles request", buf, 0xCu);
    }
    __int16 v15 = [getMCProfileConnectionClass() sharedConnection];
    if (v15)
    {
      v46 = v4;
      id v16 = [getMCProfileConnectionClass() sharedConnection];
      uint64_t v17 = [v16 installedProfileIdentifiers];

      id v18 = (void *)MEMORY[0x230FBD990]();
      __int16 v19 = v11;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        id v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        *(_DWORD *)buf = 138543874;
        __int16 v58 = v21;
        __int16 v59 = 2112;
        __int16 v60 = v22;
        __int16 v61 = 2112;
        id v62 = v17;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetched profile identifiers: %@, %@", buf, 0x20u);
      }
      id v23 = [MEMORY[0x263EFF980] array];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v24 = v17;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v49 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v48 + 1) + 8 * i);
            id v30 = objc_msgSend(v15, "installedProfileDataWithIdentifier:", v29, v46);
            __int16 v31 = (void *)[objc_alloc(MEMORY[0x263F0E4A0]) initWithIdentifier:v29 profileData:v30];
            [v23 addObject:v31];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v26);
      }

      __int16 v32 = (void *)MEMORY[0x263F08910];
      uint64_t v33 = (void *)[v23 copy];
      id v47 = 0;
      uint64_t v34 = [v32 archivedDataWithRootObject:v33 requiringSecureCoding:1 error:&v47];
      id v35 = v47;

      if (v34)
      {
        uint64_t v54 = *MEMORY[0x263F0B3B0];
        uint64_t v55 = v34;
        uint64_t v36 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        id v4 = v46;
        [v46 respondWithPayload:v36];
      }
      else
      {
        id v42 = (void *)MEMORY[0x230FBD990]();
        id v43 = v19;
        id v44 = HMFGetOSLogHandle();
        id v4 = v46;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          id v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          __int16 v58 = v45;
          __int16 v59 = 2112;
          __int16 v60 = v23;
          __int16 v61 = 2112;
          id v62 = v35;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode profiles %@:%@", buf, 0x20u);
        }
        uint64_t v36 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        [v46 respondWithError:v36];
      }
    }
    else
    {
      id v38 = (void *)MEMORY[0x230FBD990]();
      uint64_t v39 = v11;
      int v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v58 = v41;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to link profile connection", buf, 0xCu);
      }
      id v24 = [MEMORY[0x263F087E8] hmfErrorWithCode:14];
      [v4 respondWithError:v24];
    }
  }
  else
  {
    if (v13)
    {
      uint64_t v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v58 = v37;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Relaying fetch managed configuration profiles request", buf, 0xCu);
    }
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __66__HMDAppleMediaAccessory_handleFetchManagedConfigurationProfiles___block_invoke;
    v52[3] = &unk_264A2D870;
    v52[4] = v11;
    id v53 = v4;
    [(HMDAppleMediaAccessory *)v11 _relayRequestMessage:v53 responseHandler:v52];
  }
}

void __66__HMDAppleMediaAccessory_handleFetchManagedConfigurationProfiles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  BOOL v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Fetch managed configuration profiles responded with error: %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 40) respondWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetch managed configuration profiles responded", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 40) respondWithPayload:v6];
  }
}

- (void)handleCurrentDeviceUpdated:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v8 = v5;

  if (v8)
  {
    id v6 = [(HMDAppleMediaAccessory *)self device];
    if (v8 == v6)
    {
    }
    else
    {
      BOOL v7 = [(HMDAppleMediaAccessory *)self shouldUpdateWithDevice:v8 initialConfiguration:0];

      if (!v7) {
        goto LABEL_10;
      }
    }
    [(HMDAppleMediaAccessory *)self updateWithDevice:v8];
  }
LABEL_10:
}

- (BOOL)shouldUpdateWithDevice:(id)a3 initialConfiguration:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDAppleMediaAccessory *)self device];
  if (v7 == v6 && !v4 || !HMFEqualObjects()) {
    goto LABEL_23;
  }
  id v8 = [v6 productInfo];

  if (v8)
  {
    BOOL v9 = [v6 productInfo];
    uint64_t v10 = [v7 productInfo];
    int v11 = [v9 isEqual:v10];

    if (!v11)
    {
LABEL_23:
      BOOL v31 = 1;
      goto LABEL_24;
    }
    uint64_t v12 = [(HMDAccessory *)self manufacturer];
    if (!v12) {
      goto LABEL_19;
    }
    int v13 = (void *)v12;
    uint64_t v14 = [(HMDAccessory *)self model];
    if (v14)
    {
      __int16 v15 = (void *)v14;
      uint64_t v16 = [(HMDAccessory *)self serialNumber];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        id v18 = [(HMDAccessory *)self firmwareVersion];

        if (v18) {
          goto LABEL_10;
        }
LABEL_19:
        __int16 v32 = (void *)MEMORY[0x230FBD990]();
        uint64_t v37 = self;
        uint64_t v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          id v35 = HMFGetLogIdentifier();
          int v40 = 138543362;
          v41 = v35;
          uint64_t v36 = "%{public}@Force updating product information";
          goto LABEL_21;
        }
LABEL_22:

        goto LABEL_23;
      }
    }
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v19 = [(HMDAccessory *)self category];
  if (!v19) {
    goto LABEL_15;
  }
  id v20 = (void *)v19;
  uint64_t v21 = [(HMDAccessory *)self category];
  id v22 = (void *)MEMORY[0x263F0DF40];
  id v23 = [v6 productInfo];
  id v24 = [v22 categoryForProductInfo:v23];
  char v25 = [v21 isEqual:v24];

  if ((v25 & 1) == 0)
  {
LABEL_15:
    __int16 v32 = (void *)MEMORY[0x230FBD990]();
    uint64_t v33 = self;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = HMFGetLogIdentifier();
      int v40 = 138543362;
      v41 = v35;
      uint64_t v36 = "%{public}@Force updating category";
LABEL_21:
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, v36, (uint8_t *)&v40, 0xCu);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  uint64_t v26 = [v6 rpIdentity];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    id v28 = [v6 rpIdentity];
    uint64_t v29 = [v7 rpIdentity];
    char v30 = [v28 isEqual:v29];

    if ((v30 & 1) == 0)
    {
      __int16 v32 = (void *)MEMORY[0x230FBD990]();
      uint64_t v39 = self;
      uint64_t v34 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      id v35 = HMFGetLogIdentifier();
      int v40 = 138543362;
      v41 = v35;
      uint64_t v36 = "%{public}@Force updating rapport identity";
      goto LABEL_21;
    }
  }
  BOOL v31 = 0;
LABEL_24:

  return v31;
}

- (void)updateWithDevice:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v54 = v8;
      __int16 v55 = 2112;
      id v56 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating with device: %@", buf, 0x16u);
    }
    BOOL v9 = [(HMDAppleMediaAccessory *)v6 transactionWithObjectChangeType:2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      uint64_t v12 = [v4 identifier];
      int v13 = [v12 UUIDString];
      [v11 setDeviceUUID:v13];

      [v11 setDevice:v4];
      uint64_t v14 = (void *)MEMORY[0x263F0DF40];
      __int16 v15 = [v4 productInfo];
      uint64_t v16 = [v14 categoryForProductInfo:v15];

      if (v16)
      {
        uint64_t v17 = [(HMDAccessory *)v6 category];
        char v18 = HMFEqualObjects();

        if ((v18 & 1) == 0)
        {
          uint64_t v19 = [MEMORY[0x263F0DF40] categoryIdentifierForCategory:v16];
          [v11 setAccessoryCategory:v19];

          id v20 = [v16 categoryType];
          char v21 = [v20 isEqual:*MEMORY[0x263F0B0D0]];

          if ((v21 & 1) == 0)
          {
            objc_initWeak((id *)buf, v6);
            id v22 = [(HMDAppleMediaAccessory *)v6 backingStore];
            id v23 = [v22 context];
            uint64_t v47 = MEMORY[0x263EF8330];
            uint64_t v48 = 3221225472;
            long long v49 = __43__HMDAppleMediaAccessory_updateWithDevice___block_invoke;
            long long v50 = &unk_264A2C148;
            objc_copyWeak(&v52, (id *)buf);
            id v51 = v16;
            [v23 performBlock:&v47];

            objc_destroyWeak(&v52);
            objc_destroyWeak((id *)buf);
          }
        }
      }
      id v24 = [(HMDAccessory *)v6 manufacturer];
      char v25 = HMFEqualObjects();

      if ((v25 & 1) == 0) {
        [v11 setManufacturer:@"Apple Inc."];
      }
      uint64_t v26 = [MEMORY[0x263F42648] systemInfo];
      uint64_t v27 = [v26 model];
      id v28 = (void *)[v27 mutableCopy];

      if (v28)
      {
        uint64_t v29 = [MEMORY[0x263F42648] systemInfo];
        char v30 = [v29 regionInfo];

        if (v30) {
          [v28 appendString:v30];
        }
        BOOL v31 = [(HMDAccessory *)v6 model];
        char v32 = [v28 isEqual:v31];

        if ((v32 & 1) == 0) {
          [v11 setModel:v28];
        }
      }
      uint64_t v33 = [MEMORY[0x263F42648] systemInfo];
      uint64_t v34 = [v33 serialNumber];

      if (v34)
      {
        id v35 = [(HMDAccessory *)v6 serialNumber];
        char v36 = [v34 isEqual:v35];

        if ((v36 & 1) == 0) {
          [v11 setSerialNumber:v34];
        }
      }

      uint64_t v37 = [v4 productInfo];
      id v38 = v37;
      if (v37)
      {
        uint64_t v39 = [v37 softwareVersion];
        if (v39)
        {
          int v40 = [(HMDAccessory *)v6 firmwareVersion];
          char v41 = [v39 isEqual:v40];

          if ((v41 & 1) == 0)
          {
            uint64_t v42 = [v39 versionString];
            [v11 setFirmwareVersion:v42];
          }
        }
      }
      id v43 = [(HMDAccessory *)v6 home];
      id v44 = [v43 backingStore];
      id v45 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
      v46 = [v44 transaction:@"updateWithDevice" options:v45];

      [v46 add:v11 withMessage:0];
      [v46 run];
    }
  }
}

void __43__HMDAppleMediaAccessory_updateWithDevice___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained uuid];
    id v5 = +[HMCContext findAppleMediaAccessoryWithModelID:v4];

    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = v3;
    id v8 = HMFGetOSLogHandle();
    BOOL v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        id v11 = [v7 category];
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        id v20 = v10;
        __int16 v21 = 2112;
        id v22 = v11;
        __int16 v23 = 2112;
        uint64_t v24 = v12;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating category from: %@, to: %@", buf, 0x20u);
      }
      int v13 = [MEMORY[0x263F0DF40] categoryIdentifierForCategory:*(void *)(a1 + 32)];
      [v5 setAccessoryCategory:v13];

      uint64_t v14 = [v7 backingStore];
      __int16 v15 = [v14 context];
      uint64_t v18 = 0;
      [v15 save:&v18];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        uint64_t v17 = [v7 uuid];
        *(_DWORD *)buf = 138543618;
        id v20 = v16;
        __int16 v21 = 2112;
        id v22 = v17;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@MKF models do not exist for media accessory with UUID: %@", buf, 0x16u);
      }
    }
  }
}

- (void)setDeviceController:(id)a3
{
  id v10 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_storeStrong((id *)&self->_deviceController, a3);
  id v5 = self->_deviceIRK;
  os_unfair_recursive_lock_unlock();
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F42548]);
    id v7 = (void *)[v6 initWithType:*MEMORY[0x263F41FF0] size:*MEMORY[0x263F41FE8] data:v5];
    id v8 = [(HMDAppleMediaAccessory *)self device];
    BOOL v9 = [[HMDRPIdentity alloc] initWithDeviceIRK:v7];
    [v8 setRpIdentity:v9];
  }
}

- (HMDMessageRouter)messageRouter
{
  uint64_t v2 = [(HMDAppleMediaAccessory *)self messenger];
  BOOL v3 = [v2 router];

  return (HMDMessageRouter *)v3;
}

- (HMDDevice)device
{
  uint64_t v2 = __HMDAppleMediaAccessoryGetDeviceController(self);
  BOOL v3 = [v2 device];

  return (HMDDevice *)v3;
}

- (HMDDevice)deviceForDirectMessaging
{
  BOOL v3 = [(HMDAppleMediaAccessory *)self device];
  id v4 = [(HMDAppleMediaAccessory *)self deviceAddress];
  uint64_t v5 = [(HMDAppleMediaAccessory *)self idsIdentifierInternal];
  id v6 = (void *)v5;
  if (!v3)
  {
    if (v4)
    {
      id v7 = [(HMDAppleMediaAccessory *)self dependencyFactory];
      uint64_t v8 = [v7 deviceWithAddress:v4];
LABEL_6:
      BOOL v3 = (void *)v8;

      goto LABEL_7;
    }
    if (v5)
    {
      id v7 = [(HMDAppleMediaAccessory *)self dependencyFactory];
      uint64_t v8 = [v7 deviceForIDSIdentifier:v6];
      goto LABEL_6;
    }
    BOOL v3 = 0;
  }
LABEL_7:

  return (HMDDevice *)v3;
}

- (BOOL)isHomePod2ndGen
{
  return [(HMDAppleMediaAccessory *)self variant] == 4;
}

- (BOOL)isHomePodMini
{
  return [(HMDAppleMediaAccessory *)self variant] == 2;
}

- (BOOL)supportsSoftwareUpdateV2
{
  if ([(HMDAppleMediaAccessory *)self isHomePod]) {
    return 1;
  }
  id v4 = [(HMDAppleMediaAccessory *)self capabilities];
  char v5 = [v4 supportsSoftwareUpdateV2];

  return v5;
}

- (BOOL)supportsJustSiri
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  BOOL v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsJustSiri];

  return v4;
}

- (BOOL)supportsRMVonAppleTV
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    BOOL v3 = +[HMDDeviceCapabilities deviceCapabilities];
    char v4 = [v3 supportsRMVonAppleTV];

    if ((v4 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    id v6 = [(HMDAppleMediaAccessory *)self capabilities];
    int v7 = [v6 supportsRMVonAppleTV];

    if (!v7) {
      return 0;
    }
  }
  return _os_feature_enabled_impl();
}

- (BOOL)supportsMessagedHomePodSettings
{
  return 1;
}

- (BOOL)supportsMediaContentProfile
{
  BOOL v3 = [(HMDAccessory *)self category];
  char v4 = [v3 categoryType];
  char v5 = HMFEqualObjects();

  id v6 = [(HMDAppleMediaAccessory *)self capabilities];
  LOBYTE(v3) = [v6 supportsLoreto];

  return v5 & ~(_BYTE)v3;
}

- (HMSoftwareUpdateProgress)lastSentSoftwareUpdateProgress
{
  return 0;
}

- (HMSoftwareUpdateDescriptor)lastSentSoftwareUpdateDescriptor
{
  return 0;
}

- (BOOL)supportsManagedConfigurationProfile
{
  uint64_t v2 = [(HMDAppleMediaAccessory *)self capabilities];
  char v3 = [v2 supportsManagedConfigurationProfile];

  return v3;
}

- (BOOL)supportsMediaActions
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  char v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsMediaActions];

  return v4;
}

- (BOOL)supportsAnnounce
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  char v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsAnnounce];

  return v4;
}

- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification
{
  BOOL v4 = [(HMDAppleMediaAccessory *)self isCurrentAccessory];
  if (v4)
  {
    uint64_t v2 = +[HMDDeviceCapabilities deviceCapabilities];
    if ([v2 supportsTVOSUpdateManualUpdateAvailableNotification])
    {
      char v5 = 1;
LABEL_5:

      return v5;
    }
  }
  id v6 = [(HMDAppleMediaAccessory *)self capabilities];
  char v5 = [v6 supportsTVOSUpdateManualUpdateAvailableNotification];

  if (v4) {
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)supportsCoordinationFreeDoorbellChime
{
  BOOL v4 = [(HMDAppleMediaAccessory *)self isCurrentAccessory];
  if (v4)
  {
    uint64_t v2 = +[HMDDeviceCapabilities deviceCapabilities];
    if ([v2 supportsCoordinationFreeDoorbellChime])
    {
      char v5 = 1;
LABEL_5:

      return v5;
    }
  }
  id v6 = [(HMDAppleMediaAccessory *)self capabilities];
  char v5 = [v6 supportsCoordinationFreeDoorbellChime];

  if (v4) {
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)supportsCoordinationDoorbellChime
{
  BOOL v4 = [(HMDAppleMediaAccessory *)self isCurrentAccessory];
  if (v4)
  {
    uint64_t v2 = +[HMDDeviceCapabilities deviceCapabilities];
    if ([v2 supportsCoordinationDoorbellChime])
    {
      char v5 = 1;
LABEL_5:

      return v5;
    }
  }
  id v6 = [(HMDAppleMediaAccessory *)self capabilities];
  char v5 = [v6 supportsCoordinationDoorbellChime];

  if (v4) {
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)supportsUserMediaSettings
{
  BOOL v4 = [(HMDAppleMediaAccessory *)self isCurrentAccessory];
  if (v4)
  {
    uint64_t v2 = +[HMDDeviceCapabilities deviceCapabilities];
    if ([v2 supportsUserMediaSettings])
    {
      char v5 = 1;
LABEL_5:

      return v5;
    }
  }
  id v6 = [(HMDAppleMediaAccessory *)self capabilities];
  char v5 = [v6 supportsUserMediaSettings];

  if (v4) {
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)supportsDoorbellChime
{
  BOOL v4 = [(HMDAppleMediaAccessory *)self isCurrentAccessory];
  if (v4)
  {
    uint64_t v2 = +[HMDDeviceCapabilities deviceCapabilities];
    if ([v2 supportsDoorbellChime])
    {
      char v5 = 1;
LABEL_5:

      return v5;
    }
  }
  id v6 = [(HMDAppleMediaAccessory *)self capabilities];
  char v5 = [v6 supportsDoorbellChime];

  if (v4) {
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)supportsDropIn
{
  BOOL v7 = [(HMDAppleMediaAccessory *)self isCurrentAccessory];
  if (v7)
  {
    uint64_t v2 = [(HMDAccessory *)self home];
    char v3 = [v2 homeManager];
    BOOL v4 = [v3 capabilitiesController];
    char v5 = [v4 currentAccessoryCapabilities];
    if ([v5 supportsDropIn])
    {
      char v8 = 1;
LABEL_5:

      return v8;
    }
  }
  BOOL v9 = [(HMDAppleMediaAccessory *)self capabilities];
  char v8 = [v9 supportsDropIn];

  if (v7) {
    goto LABEL_5;
  }
  return v8;
}

- (BOOL)supportsAudioAnalysis
{
  BOOL v7 = [(HMDAppleMediaAccessory *)self isCurrentAccessory];
  if (v7)
  {
    uint64_t v2 = [(HMDAccessory *)self home];
    char v3 = [v2 homeManager];
    BOOL v4 = [v3 capabilitiesController];
    char v5 = [v4 currentAccessoryCapabilities];
    if ([v5 supportsAudioAnalysis])
    {
      char v8 = 1;
LABEL_5:

      return v8;
    }
  }
  BOOL v9 = [(HMDAppleMediaAccessory *)self capabilities];
  char v8 = [v9 supportsAudioAnalysis];

  if (v7) {
    goto LABEL_5;
  }
  return v8;
}

- (BOOL)supportsPreferredMediaUser
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  char v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsPreferredMediaUser];

  return v4;
}

- (BOOL)supportsThirdPartyMusic
{
  BOOL v4 = [(HMDAppleMediaAccessory *)self isCurrentAccessory];
  if (v4)
  {
    uint64_t v2 = +[HMDDeviceCapabilities deviceCapabilities];
    if ([v2 supportsThirdPartyMusic])
    {
      char v5 = 1;
LABEL_5:

      return v5;
    }
  }
  id v6 = [(HMDAppleMediaAccessory *)self capabilities];
  char v5 = [v6 supportsThirdPartyMusic];

  if (v4) {
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)supportsMusicAlarm
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  char v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsMusicAlarm];

  return v4;
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  char v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsCompanionInitiatedObliterate];

  return v4;
}

- (BOOL)supportsCompanionInitiatedRestart
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  char v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsCompanionInitiatedRestart];

  return v4;
}

- (BOOL)supportsAudioReturnChannel
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  char v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsAudioReturnChannel];

  return v4;
}

- (BOOL)legacyLocationServicesEnabled
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v3 = [(HMDAppleMediaAccessory *)self settingsController];
  char v4 = [v3 rootGroup];
  char v5 = [v4 groups];
  id v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_370);
  BOOL v7 = [v6 settings];
  char v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_376);

  if (v8)
  {
    id v9 = [v8 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      char v12 = [v11 BOOLValue];
    }
    else
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = self;
      __int16 v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v18 = 138543618;
        uint64_t v19 = v16;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get location service enabled value due to unknown class for value: %@", (uint8_t *)&v18, 0x16u);
      }
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

uint64_t __55__HMDAppleMediaAccessory_legacyLocationServicesEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"enabled"];

  return v3;
}

uint64_t __55__HMDAppleMediaAccessory_legacyLocationServicesEnabled__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"locationServices"];

  return v3;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  uint64_t v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsHomeLevelLocationServiceSetting];

  return v4;
}

- (BOOL)supportsMultiUser
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  uint64_t v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsMultiUser];

  return v4;
}

- (BOOL)supportsTargetControl
{
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    +[HMDDeviceCapabilities deviceCapabilities];
  }
  else {
  uint64_t v3 = [(HMDAppleMediaAccessory *)self capabilities];
  }
  char v4 = [v3 supportsTargetControl];

  return v4;
}

- (BOOL)isCurrentAccessory
{
  uint64_t v3 = [(HMDAppleMediaAccessory *)self device];
  char v4 = [(HMDAppleMediaAccessory *)self deviceMediaRouteIdentifierFactory];
  char v5 = v4[2]();

  id v6 = [(HMDAccessory *)self identifier];
  BOOL v7 = v6;
  if (v5) {
    BOOL v8 = v3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if (![v6 isEqualToString:v5])
    {
      BOOL v10 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!v5)
  {
LABEL_9:
    char v9 = [v3 isCurrentDevice];
    goto LABEL_10;
  }
  char v9 = [v6 isEqualToString:v5];
LABEL_10:
  BOOL v10 = v9;
LABEL_12:

  return v10;
}

- (void)setIdsIdentifier:(id)a3
{
  char v4 = (NSUUID *)a3;
  os_unfair_recursive_lock_lock_with_options();
  idsIdentifier = self->_idsIdentifier;
  self->_idsIdentifier = v4;

  os_unfair_recursive_lock_unlock();
}

- (id)idsIdentifierInternal
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_idsIdentifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSUUID)idsIdentifier
{
  uint64_t v3 = [(HMDAppleMediaAccessory *)self deviceForDirectMessaging];
  char v4 = [v3 idsIdentifier];

  if (!v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    char v4 = self->_idsIdentifier;
    os_unfair_recursive_lock_unlock();
  }
  return v4;
}

- (void)setProductColor:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_productColor = a3;
  os_unfair_recursive_lock_unlock();
}

- (int64_t)productColor
{
  os_unfair_recursive_lock_lock_with_options();
  int64_t productColor = self->_productColor;
  os_unfair_recursive_lock_unlock();
  return productColor;
}

- (unint64_t)homePodVariant
{
  unint64_t v2 = [(HMDAppleMediaAccessory *)self variant];
  unint64_t v3 = 2;
  if ((v2 & 2) == 0) {
    unint64_t v3 = ((uint64_t)(v2 << 61) >> 63) & 3;
  }
  if (v2) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)setRawCapabilities:(id)a3
{
  char v4 = (NSData *)a3;
  os_unfair_recursive_lock_lock_with_options();
  rawCapabilities = self->_rawCapabilities;
  self->_rawCapabilities = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSData)rawCapabilities
{
  os_unfair_recursive_lock_lock_with_options();
  unint64_t v3 = self->_rawCapabilities;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setCapabilitiesInternal:(id)a3
{
  char v4 = (HMAccessoryCapabilities *)a3;
  os_unfair_recursive_lock_lock_with_options();
  capabilitiesInternal = self->_capabilitiesInternal;
  self->_capabilitiesInternal = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMAccessoryCapabilities)capabilitiesInternal
{
  os_unfair_recursive_lock_lock_with_options();
  unint64_t v3 = self->_capabilitiesInternal;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)configureTargetController:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDAppleMediaAccessory *)self targetControlManager];
  v7[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  [v5 addTargetControllers:v6];
}

- (void)autoConfigureTargetControllers
{
  unint64_t v3 = [(HMDAccessory *)self home];
  id v4 = [v3 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__HMDAppleMediaAccessory_autoConfigureTargetControllers__block_invoke;
  v6[3] = &unk_264A27CD8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", v6);
}

void __56__HMDAppleMediaAccessory_autoConfigureTargetControllers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 supportsTargetController])
  {
    id v4 = v3;
    objc_opt_class();
    id v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;
    id v6 = v5;

    if (v6)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 32);
      char v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        BOOL v10 = [*(id *)(a1 + 32) uuid];
        uint64_t v19 = [v4 shortDescription];
        [*(id *)(a1 + 32) isCurrentAccessory];
        int v18 = HMFBooleanToString();
        [*(id *)(a1 + 40) isCurrentDeviceAvailableResident];
        id v11 = HMFBooleanToString();
        *(_DWORD *)buf = 138544386;
        uint64_t v22 = v20;
        __int16 v23 = 2112;
        uint64_t v24 = v10;
        __int16 v25 = 2112;
        uint64_t v26 = v19;
        __int16 v27 = 2112;
        id v28 = v18;
        __int16 v29 = 2112;
        char v30 = v11;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding new target UUID: %@ to accessory: %@. isCurrentAccessory: %@ / isPrimaryResident: %@", buf, 0x34u);
      }
      uint64_t v12 = [v6 targetUUIDs];
      int v13 = (void *)v12;
      if (v12) {
        uint64_t v14 = (void *)v12;
      }
      else {
        uint64_t v14 = (void *)MEMORY[0x263EFFA68];
      }
      __int16 v15 = [*(id *)(a1 + 32) uuid];
      uint64_t v16 = [v15 UUIDString];
      uint64_t v17 = [v14 arrayByAddingObject:v16];
      [v6 saveTargetUUIDs:v17];
    }
  }
}

- (void)_fixCloudKeyIfNeeded
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (![(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    return;
  }
  id v3 = [(HMDAppleMediaAccessory *)self pairingIdentity];

  if (!v3)
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v28 = v24;
      __int16 v25 = "%{public}@No pairing identity yet to fix";
LABEL_17:
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, v25, buf, 0xCu);
    }
LABEL_18:

    return;
  }
  id v4 = [(HMDAppleMediaAccessory *)self pairingIdentity];
  id v5 = [v4 privateKey];

  if (!v5)
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v28 = v24;
      __int16 v25 = "%{public}@Pairing identity can't be used.";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (![(HMDAppleMediaAccessory *)self fixedPairingIdentityInCloud])
  {
    id v6 = [(HMDAppleMediaAccessory *)self transactionWithObjectChangeType:2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      char v9 = (void *)MEMORY[0x230FBD990]();
      BOOL v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v28 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Fixing pairing identity", buf, 0xCu);
      }
      int v13 = [(HMDAppleMediaAccessory *)v10 pairingIdentity];
      uint64_t v14 = [v13 publicPairingIdentity];
      [v8 setPairingIdentity:v14];

      __int16 v15 = [MEMORY[0x263F08C38] UUID];
      uint64_t v16 = [v15 UUIDString];
      [v8 setAppleMediaAccessoryChangeTag:v16];

      uint64_t v17 = [(HMDAccessory *)v10 home];
      int v18 = [v17 backingStore];
      uint64_t v19 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
      __int16 v20 = [v18 transaction:@"Fix Pairing Identity" options:v19];

      [v20 add:v8];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __46__HMDAppleMediaAccessory__fixCloudKeyIfNeeded__block_invoke;
      v26[3] = &unk_264A2F3E8;
      v26[4] = v10;
      [v20 run:v26];
    }
  }
}

void __46__HMDAppleMediaAccessory__fixCloudKeyIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    char v9 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Fixed pairing identity", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_fetchMultiUserLanguages
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching multi-user languages.", buf, 0xCu);
  }
  id v7 = [(HMDAppleMediaAccessory *)v4 settingsConnectionFactory];
  int v8 = v7[2]();

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __50__HMDAppleMediaAccessory__fetchMultiUserLanguages__block_invoke;
  v10[3] = &unk_264A2E1A0;
  id v11 = v8;
  uint64_t v12 = v4;
  id v9 = v8;
  [v9 fetchSupportedMultiUserLanguageCodes:v10];
}

void __50__HMDAppleMediaAccessory__fetchMultiUserLanguages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 40);
  id v9 = HMFGetOSLogHandle();
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain supported multi-user languages. Error: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetched multi-user languages %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 40) setSupportedMultiUserLanguageCodes:v5];
  }
}

- (id)_createMediaProfile
{
  unint64_t v2 = [(HMDMediaProfile *)[HMDAppleMediaProfile alloc] initWithAccessory:self];
  return v2;
}

- (void)removeAudioDestination
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    id v3 = [(HMDAppleMediaAccessory *)self audioDestination];
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination: %@", buf, 0x16u);
    }
    if (v3)
    {
      id v8 = [[HMDMediaDestinationModel alloc] initWithDestination:v3 changeType:3];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __48__HMDAppleMediaAccessory_removeAudioDestination__block_invoke;
      v13[3] = &unk_264A2F3E8;
      void v13[4] = v5;
      [(HMDAccessory *)v5 runTransactionWithModel:v8 label:@"Remove audio destination" completion:v13];
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Skipping removing audio destination due to non-current device", buf, 0xCu);
    }
  }
}

void __48__HMDAppleMediaAccessory_removeAudioDestination__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      id v9 = "%{public}@Audio destination removal transaction completed with error: %@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v8;
    id v9 = "%{public}@Audio destination removal transaction completed";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (id)mediaGroupParticipantDataLocalStorage
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessory *)self home];
  id v4 = [v3 homeManager];
  id v5 = [v4 mediaGroupParticipantDataLocalStorage];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v11 = HMFGetLogIdentifier();
      int v13 = 138543874;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media groups participant data local storage due to dependencies home: %@ homeManager: %@", (uint8_t *)&v13, 0x20u);
    }
  }

  return v6;
}

- (void)legacyCreateAudioDestinationWithIdentifier:(id)a3 supportedOptions:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [HMDMediaDestinationModel alloc];
  id v8 = [(HMDAccessory *)self uuid];
  id v9 = [(HMDBackingStoreModelObject *)v7 initWithObjectChangeType:1 uuid:v6 parentUUID:v8];

  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a4];
  [(HMDMediaDestinationModel *)v9 setSupportedOptions:v10];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __86__HMDAppleMediaAccessory_legacyCreateAudioDestinationWithIdentifier_supportedOptions___block_invoke;
  v11[3] = &unk_264A2F3E8;
  void v11[4] = self;
  [(HMDAccessory *)self runTransactionWithModel:v9 label:@"Create audio destination" completion:v11];
}

void __86__HMDAppleMediaAccessory_legacyCreateAudioDestinationWithIdentifier_supportedOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      id v9 = "%{public}@Audio destination transaction completed with error: %@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v8;
    id v9 = "%{public}@Audio destination transaction completed";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (id)defaultAudioGroupIdentifier
{
  return 0;
}

- (void)createAudioDestination
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    if (+[HMDDeviceCapabilities supportsAudioDestinationCreation])
    {
      id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"5CC65005-CE51-4781-9F78-3429557B6FD4"];
      id v4 = (void *)MEMORY[0x263F08C38];
      id v5 = [(HMDAccessory *)self uuid];
      id v6 = [v5 UUIDString];
      id v7 = [v6 dataUsingEncoding:4];
      id v8 = objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v3, v7);

      unint64_t v9 = [(HMDAppleMediaAccessory *)self expectedDestinationSupportOptions];
      uint64_t v10 = (void *)MEMORY[0x230FBD990]();
      os_log_type_t v11 = self;
      uint32_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = HMFGetLogIdentifier();
        uint64_t v14 = HMMediaDestinationSupportOptionsAsString();
        int v34 = 138543874;
        id v35 = v13;
        __int16 v36 = 2112;
        uint64_t v37 = v8;
        __int16 v38 = 2112;
        uint64_t v39 = v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination with identifier: %@ supportedOptions: %@", (uint8_t *)&v34, 0x20u);
      }
      if (isFeatureHomeTheaterQFAEnabledForTests
        && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
      {
        char v30 = (void *)MEMORY[0x230FBD990]();
        uint64_t v31 = v11;
        char v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          uint64_t v33 = HMFGetLogIdentifier();
          int v34 = 138543362;
          id v35 = v33;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v34, 0xCu);
        }
        [(HMDAppleMediaAccessory *)v31 legacyCreateAudioDestinationWithIdentifier:v8 supportedOptions:v9];
      }
      else
      {
        __int16 v15 = [(HMDAppleMediaAccessory *)v11 mediaGroupParticipantDataLocalStorage];
        id v16 = [v15 participantData];
        uint64_t v17 = [v16 destination];

        if (v17)
        {
          uint64_t v18 = (void *)MEMORY[0x230FBD990]();
          uint64_t v19 = v11;
          __int16 v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = HMFGetLogIdentifier();
            int v34 = 138543618;
            id v35 = v21;
            __int16 v36 = 2112;
            uint64_t v37 = v17;
            _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Overwriting stale audio destination: %@", (uint8_t *)&v34, 0x16u);
          }
        }
        id v22 = objc_alloc(MEMORY[0x263F0E4C0]);
        __int16 v23 = [(HMDAccessory *)v11 uuid];
        uint64_t v24 = [(HMDAppleMediaAccessory *)v11 defaultAudioGroupIdentifier];
        __int16 v25 = (void *)[v22 initWithUniqueIdentifier:v8 parentIdentifier:v23 supportedOptions:v9 audioGroupIdentifier:v24];

        [v15 updateMediaDestination:v25];
        [(HMDAppleMediaAccessory *)v11 mergeAudioDestination:v25];
      }
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = self;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        int v34 = 138543362;
        id v35 = v29;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Skipping creating audio destination manager for unsupported device", (uint8_t *)&v34, 0xCu);
      }
    }
  }
}

- (unint64_t)expectedDestinationSupportOptions
{
  if ([(HMDAppleMediaAccessory *)self isHomePodMini]) {
    return 36;
  }
  if ([(HMDAppleMediaAccessory *)self isHomePod2ndGen]) {
    return 192;
  }
  return 17;
}

- (void)migrateLocalParticipantData
{
  if ((!isFeatureHomeTheaterQFAEnabledForTests
     || [(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue])
    && [(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    id v3 = [(HMDAppleMediaAccessory *)self audioDestinationController];

    if (v3)
    {
      id v4 = [(HMDAppleMediaAccessory *)self mediaGroupParticipantDataLocalStorage];
      objc_msgSend(v4, "migrateWithExpectedDestinationControllerSupportOptions:", +[HMDMediaDestinationController expectedSupportOptions](HMDMediaDestinationController, "expectedSupportOptions"));
    }
    id v5 = [(HMDAppleMediaAccessory *)self audioDestinationManager];

    if (v5)
    {
      id v6 = [(HMDAppleMediaAccessory *)self mediaGroupParticipantDataLocalStorage];
      objc_msgSend(v6, "migrateWithExpectedDestinationSupportOptions:", -[HMDAppleMediaAccessory expectedDestinationSupportOptions](self, "expectedDestinationSupportOptions"));
    }
  }
}

- (void)configureAudioDestinationManager
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(HMDAppleMediaAccessory *)self isHomePod])
  {
    id v3 = [(HMDAppleMediaAccessory *)self committedAudioDestination];
    id v4 = v3;
    if (v3
      && ([v3 parentIdentifier],
          id v5 = objc_claimAutoreleasedReturnValue(),
          [(HMDAccessory *)self uuid],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6),
          v6,
          v5,
          (v7 & 1) != 0))
    {
      id v8 = [(HMDAccessory *)self home];
      unint64_t v9 = [(HMDAccessory *)self msgDispatcher];
      uint64_t v10 = [(HMDMediaAccessory *)self notificationCenter];
      os_log_type_t v11 = [(HMDAppleMediaAccessory *)self backingStore];
      if ([(HMDAppleMediaAccessory *)self hasValidHome:v8 backingStore:v11 messageDispatcher:v9])
      {
        uint32_t v12 = [(HMDAppleMediaAccessory *)self mediaDestinationManagerFactory];
        int v13 = objc_msgSend(v12, "mediaDestinationManagerWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:", v4, v9, v10, v11, -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"), self, self);
        [(HMDAppleMediaAccessory *)self setAudioDestinationManager:v13];

        uint64_t v14 = [(HMDAppleMediaAccessory *)self audioDestinationManager];
        objc_msgSend(v14, "configureWithHome:currentAccessory:", v8, -[HMDAppleMediaAccessory isCurrentAccessory](self, "isCurrentAccessory"));

        [(HMDAppleMediaAccessory *)self migrateLocalParticipantData];
      }
      else
      {
        __int16 v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = self;
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v20 = v18;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate required home objects during destination manager configuration", buf, 0xCu);
        }
      }
    }
    else
    {
      [(HMDAppleMediaAccessory *)self createAudioDestination];
    }
  }
}

- (void)mergeAudioDestination:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAppleMediaAccessory *)self audioDestinationManager];
  id v6 = v5;
  if (v5)
  {
    [v5 mergeDestination:v4];
  }
  else
  {
    char v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    unint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v10;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging new audio destination: %@", buf, 0x16u);
    }
    os_log_type_t v11 = [(HMDAccessory *)v8 home];
    uint32_t v12 = [(HMDAccessory *)v8 msgDispatcher];
    int v13 = [(HMDMediaAccessory *)v8 notificationCenter];
    uint64_t v14 = [(HMDAppleMediaAccessory *)v8 backingStore];
    if ([(HMDAppleMediaAccessory *)v8 hasValidHome:v11 backingStore:v14 messageDispatcher:v12])
    {
      __int16 v15 = [(HMDAppleMediaAccessory *)v8 mediaDestinationManagerFactory];
      id v16 = objc_msgSend(v15, "mediaDestinationManagerWithDestination:messageDispatcher:notificationCenter:backingStore:targetDevice:dataSource:delegate:", v4, v12, v13, v14, -[HMDAppleMediaAccessory isCurrentAccessory](v8, "isCurrentAccessory"), v8, v8);
      [(HMDAppleMediaAccessory *)v8 setAudioDestinationManager:v16];

      uint64_t v17 = [(HMDAppleMediaAccessory *)v8 audioDestinationManager];
      objc_msgSend(v17, "configureWithHome:currentAccessory:", v11, -[HMDAppleMediaAccessory isCurrentAccessory](v8, "isCurrentAccessory"));

      uint64_t v18 = [(HMDAppleMediaAccessory *)v8 audioDestinationManager];
      uint64_t v19 = [v18 messageHandler];
      [v19 handleUpdatedDestination:v4];
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x230FBD990]();
      uint64_t v21 = v8;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v25 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate required home objects during destination merge", buf, 0xCu);
      }
    }
  }
}

- (void)unsetAudioDestination
{
  os_unfair_recursive_lock_lock_with_options();
  committedAudioDestination = self->_committedAudioDestination;
  self->_committedAudioDestination = 0;

  os_unfair_recursive_lock_unlock();
}

- (id)legacyAudioDestination
{
  id v3 = [(HMDAppleMediaAccessory *)self audioDestinationManager];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 destination];
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    id v5 = self->_committedAudioDestination;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (HMMediaDestination)audioDestination
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    id v5 = [(HMDAppleMediaAccessory *)self legacyAudioDestination];
  }
  else
  {
    id v3 = [(HMDAppleMediaAccessory *)self dataSource];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 destinationForAppleMediaAccessory:self];
    }
    else
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      char v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v9 = HMFGetLogIdentifier();
        int v11 = 138543362;
        uint32_t v12 = v9;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get audio destination due to no data source", (uint8_t *)&v11, 0xCu);
      }
      id v5 = 0;
    }
  }
  return (HMMediaDestination *)v5;
}

- (id)legacyCommittedAudioDestination
{
  id v3 = [(HMDAppleMediaAccessory *)self audioDestinationManager];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 committedDestination];
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    id v5 = self->_committedAudioDestination;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (id)committedAudioDestination
{
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    uint64_t v6 = [(HMDAppleMediaAccessory *)self legacyCommittedAudioDestination];
  }
  else
  {
    if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
    {
      id v3 = [(HMDAppleMediaAccessory *)self mediaGroupParticipantDataLocalStorage];
      id v4 = [v3 participantData];
      id v5 = [v4 destination];

      goto LABEL_8;
    }
    uint64_t v6 = [(HMDAppleMediaAccessory *)self audioDestination];
  }
  id v5 = (void *)v6;
LABEL_8:
  return v5;
}

- (void)legacyCreateAudioDestinationControllerWithControllerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [HMDMediaDestinationControllerModel alloc];
  uint64_t v6 = [(HMDAccessory *)self uuid];
  char v7 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v4 parentUUID:v6];

  [(HMDMediaDestinationControllerModel *)v7 setAvailableDestinationModelIdentifiers:MEMORY[0x263EFFA68]];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[HMDMediaDestinationController expectedSupportOptions](HMDMediaDestinationController, "expectedSupportOptions"));
  [(HMDMediaDestinationControllerModel *)v7 setSupportedOptions:v8];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __89__HMDAppleMediaAccessory_legacyCreateAudioDestinationControllerWithControllerIdentifier___block_invoke;
  v9[3] = &unk_264A2F3E8;
  v9[4] = self;
  [(HMDAccessory *)self runTransactionWithModel:v7 label:@"Create audio destination controller" completion:v9];
}

void __89__HMDAppleMediaAccessory_legacyCreateAudioDestinationControllerWithControllerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  char v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      unint64_t v9 = "%{public}@Upload audio destination controller finished with error: %@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v8;
    unint64_t v9 = "%{public}@Upload audio destination controller completed";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

- (void)createAudioDestinationController
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    if (+[HMDDeviceCapabilities supportsAudioDestinationControllerCreation])
    {
      id v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"EE041E8C-28B9-4250-B2E2-0C032BDDDF1A"];
      id v4 = (void *)MEMORY[0x263F08C38];
      id v5 = [(HMDAccessory *)self uuid];
      uint64_t v6 = [v5 UUIDString];
      char v7 = [v6 dataUsingEncoding:4];
      id v8 = objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v3, v7);

      unint64_t v9 = (void *)MEMORY[0x230FBD990]();
      uint64_t v10 = self;
      os_log_type_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint32_t v12 = HMFGetLogIdentifier();
        int v32 = 138543618;
        uint64_t v33 = v12;
        __int16 v34 = 2112;
        id v35 = v8;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Creating new audio destination controller with identifier: %@", (uint8_t *)&v32, 0x16u);
      }
      if (isFeatureHomeTheaterQFAEnabledForTests
        && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
      {
        uint64_t v28 = (void *)MEMORY[0x230FBD990]();
        uint64_t v29 = v10;
        char v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = HMFGetLogIdentifier();
          int v32 = 138543362;
          uint64_t v33 = v31;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v32, 0xCu);
        }
        [(HMDAppleMediaAccessory *)v29 legacyCreateAudioDestinationControllerWithControllerIdentifier:v8];
      }
      else
      {
        int v13 = [(HMDAppleMediaAccessory *)v10 mediaGroupParticipantDataLocalStorage];
        uint64_t v14 = [v13 participantData];
        __int16 v15 = [v14 destinationControllerData];

        if (v15)
        {
          id v16 = (void *)MEMORY[0x230FBD990]();
          uint64_t v17 = v10;
          uint64_t v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = HMFGetLogIdentifier();
            int v32 = 138543618;
            uint64_t v33 = v19;
            __int16 v34 = 2112;
            id v35 = v15;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Overwriting stale audio destination controller data: %@", (uint8_t *)&v32, 0x16u);
          }
        }
        id v20 = objc_alloc(MEMORY[0x263F0E4D0]);
        uint64_t v21 = [(HMDAccessory *)v10 uuid];
        unint64_t v22 = +[HMDMediaDestinationController expectedSupportOptions];
        __int16 v23 = (void *)[v20 initWithIdentifier:v8 parentIdentifier:v21 destinationIdentifier:0 supportedOptions:v22 availableDestinationIdentifiers:MEMORY[0x263EFFA68]];

        [v13 updateDestinationControllerData:v23];
        [(HMDAppleMediaAccessory *)v10 mergeAudioDestinationControllerData:v23];
      }
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x230FBD990]();
      __int16 v25 = self;
      __int16 v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = HMFGetLogIdentifier();
        int v32 = 138543362;
        uint64_t v33 = v27;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Skipping audio destination controller creation due to device does not support home theater", (uint8_t *)&v32, 0xCu);
      }
    }
  }
}

- (BOOL)hasValidHome:(id)a3 backingStore:(id)a4 messageDispatcher:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_log_type_t v11 = v10;
  if (v8) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = v12 || v9 == 0;
  BOOL v14 = !v13;
  if (v13)
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v20 = 138544130;
      uint64_t v21 = v18;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      __int16 v25 = v11;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Found nil objects: home: %@ messageDispatcher: %@ backing store: %@", (uint8_t *)&v20, 0x2Au);
    }
  }

  return v14;
}

- (void)configureAudioDestinationController
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessory *)self category];
  id v4 = [v3 categoryType];
  int v5 = [v4 isEqual:*MEMORY[0x263F0B030]];

  if (v5)
  {
    uint64_t v6 = [(HMDAppleMediaAccessory *)self committedAudioDestinationControllerData];
    char v7 = v6;
    if (v6
      && ([v6 parentIdentifier],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [(HMDAccessory *)self uuid],
          id v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = objc_msgSend(v8, "hmf_isEqualToUUID:", v9),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      os_log_type_t v11 = [(HMDAccessory *)self home];
      BOOL v12 = [(HMDAccessory *)self msgDispatcher];
      BOOL v13 = [(HMDMediaAccessory *)self notificationCenter];
      BOOL v14 = [(HMDAppleMediaAccessory *)self backingStore];
      BOOL v15 = [(HMDAppleMediaAccessory *)self hasValidHome:v11 backingStore:v14 messageDispatcher:v12];
      id v16 = (void *)MEMORY[0x230FBD990]();
      uint64_t v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      uint64_t v19 = v18;
      if (v15)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v29 = v20;
          __int16 v30 = 2112;
          uint64_t v31 = v7;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Configuring audio destination controller with data: %@", buf, 0x16u);
        }
        uint64_t v21 = [(HMDAppleMediaAccessory *)v17 mediaDestinationControllerFactory];
        __int16 v22 = [v11 logEventSubmitter];
        id v23 = [v11 dailyScheduler];
        LOBYTE(v27) = [(HMDAppleMediaAccessory *)v17 isCurrentAccessory];
        __int16 v24 = [v21 mediaDestinationControllerWithData:v7 backingStore:v14 messageDispatcher:v12 notificationCenter:v13 logEventSubmitter:v22 dailyScheduler:v23 targetDevice:v27 dataSource:v17 delegate:v17];
        [(HMDAppleMediaAccessory *)v17 setAudioDestinationController:v24];

        __int16 v25 = [(HMDAppleMediaAccessory *)v17 audioDestinationController];
        [v25 configureWithHome:v11];

        [(HMDAppleMediaAccessory *)v17 migrateLocalParticipantData];
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __int16 v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v29 = v26;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate required home objects during destination controller configuration", buf, 0xCu);
        }
      }
    }
    else
    {
      [(HMDAppleMediaAccessory *)self createAudioDestinationController];
    }
  }
}

- (void)mergeAudioDestinationControllerData:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(HMDAppleMediaAccessory *)self audioDestinationController];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 mergeData:v4];
  }
  else
  {
    char v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      char v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v10;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Merging new audio destination controller with data: %@", buf, 0x16u);
    }
    os_log_type_t v11 = [(HMDAccessory *)v8 home];
    BOOL v12 = [(HMDAccessory *)v8 msgDispatcher];
    BOOL v13 = [(HMDMediaAccessory *)v8 notificationCenter];
    BOOL v14 = [(HMDAppleMediaAccessory *)v8 backingStore];
    if ([(HMDAppleMediaAccessory *)v8 hasValidHome:v11 backingStore:v14 messageDispatcher:v12])
    {
      BOOL v15 = [(HMDAppleMediaAccessory *)v8 mediaDestinationControllerFactory];
      id v16 = [v11 logEventSubmitter];
      uint64_t v17 = [v11 dailyScheduler];
      LOBYTE(v24) = [(HMDAppleMediaAccessory *)v8 isCurrentAccessory];
      [v15 mediaDestinationControllerWithData:v4 backingStore:v14 messageDispatcher:v12 notificationCenter:v13 logEventSubmitter:v16 dailyScheduler:v17 targetDevice:v24 dataSource:v8 delegate:v8];
      uint64_t v18 = v25 = v13;
      [(HMDAppleMediaAccessory *)v8 setAudioDestinationController:v18];

      uint64_t v19 = [(HMDAppleMediaAccessory *)v8 audioDestinationController];
      [v19 configureWithHome:v11];

      BOOL v13 = v25;
    }
    else
    {
      int v20 = (void *)MEMORY[0x230FBD990]();
      uint64_t v21 = v8;
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate required home objects during destination controller merge", buf, 0xCu);
      }
    }
  }
}

- (void)unsetAudioDestinationControllerData
{
  os_unfair_recursive_lock_lock_with_options();
  committedAudioDestinationControllerData = self->_committedAudioDestinationControllerData;
  self->_committedAudioDestinationControllerData = 0;

  os_unfair_recursive_lock_unlock();
}

- (id)legacyCommittedAudioDestinationControllerData
{
  id v3 = [(HMDAppleMediaAccessory *)self audioDestinationController];
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 committedData];
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    int v5 = self->_committedAudioDestinationControllerData;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (id)committedAudioDestinationControllerData
{
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    uint64_t v6 = [(HMDAppleMediaAccessory *)self legacyCommittedAudioDestinationControllerData];
  }
  else
  {
    if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
    {
      id v3 = [(HMDAppleMediaAccessory *)self mediaGroupParticipantDataLocalStorage];
      id v4 = [v3 participantData];
      int v5 = [v4 destinationControllerData];

      goto LABEL_8;
    }
    uint64_t v6 = [(HMDAppleMediaAccessory *)self audioDestinationControllerData];
  }
  int v5 = (void *)v6;
LABEL_8:
  return v5;
}

- (id)legacyAudioDestinationControllerData
{
  id v3 = [(HMDAppleMediaAccessory *)self audioDestinationController];
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 data];
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    int v5 = self->_committedAudioDestinationControllerData;
    os_unfair_recursive_lock_unlock();
  }

  return v5;
}

- (HMMediaDestinationControllerData)audioDestinationControllerData
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (isFeatureHomeTheaterQFAEnabledForTests
    && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
  {
    int v5 = [(HMDAppleMediaAccessory *)self legacyAudioDestinationControllerData];
  }
  else
  {
    id v3 = [(HMDAppleMediaAccessory *)self dataSource];
    id v4 = v3;
    if (v3)
    {
      int v5 = [v3 destinationControllerDataForAppleMediaAccessory:self];
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x230FBD990]();
      char v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        int v11 = 138543362;
        BOOL v12 = v9;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get audio destination data due to no data source", (uint8_t *)&v11, 0xCu);
      }
      int v5 = 0;
    }
  }
  return (HMMediaDestinationControllerData *)v5;
}

- (NSUUID)sensorAccessoryUUID
{
  unint64_t v2 = [(HMDAppleMediaAccessory *)self sensorManager];
  id v3 = [v2 sensorAccessoryUUID];

  return (NSUUID *)v3;
}

- (BOOL)isDoorbellChimeSettingEnabled
{
  unint64_t v2 = [(HMDAppleMediaAccessory *)self currentAccessorySettingsController];
  id v3 = [v2 cachedSettingForKeyPath:@"root.doorbellChime.enabled"];

  id v4 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  char v7 = [v6 BOOLValue];
  return v7;
}

- (void)createAccessoryInfoSubscriberIfNecessary
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAppleMediaAccessory *)self accessoryInfoSubscriber];

  if (!v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    int v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = HMFGetLogIdentifier();
      int v13 = 138543362;
      BOOL v14 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating WiFi info subscriber", (uint8_t *)&v13, 0xCu);
    }
    id v8 = [HMDAppleMediaAccessoryInfoSubscriber alloc];
    id v9 = [(HMDAccessory *)v5 workQueue];
    char v10 = [(HMDAppleMediaAccessoryInfoSubscriber *)v8 initWithQueue:v9 dataSource:v5];
    [(HMDAppleMediaAccessory *)v5 setAccessoryInfoSubscriber:v10];

    int v11 = [(HMDAppleMediaAccessory *)v5 accessoryInfoSubscriber];
    [v11 setDelegate:v5];

    BOOL v12 = [(HMDAppleMediaAccessory *)v5 accessoryInfoSubscriber];
    [v12 subscribeToWiFiInfoUpdate];
  }
}

- (BOOL)isAppleTV
{
  unint64_t v2 = [(HMDAccessory *)self category];
  id v3 = [v2 categoryType];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F0B030]];

  return v4;
}

- (BOOL)isHomePod
{
  unint64_t v2 = [(HMDAccessory *)self category];
  id v3 = [v2 categoryType];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F0B0A0]];

  return v4;
}

- (void)updateProductInformation
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  char v4 = self;
  int v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v33 = 138543362;
    __int16 v34 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating Product Information", (uint8_t *)&v33, 0xCu);
  }
  char v7 = [(HMDAppleMediaAccessory *)v4 transactionWithObjectChangeType:2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = +[HMDDeviceCapabilities supportsStereoPairingV1];
  if (+[HMDDeviceCapabilities supportsStereoPairingV2]) {
    v10 |= 2uLL;
  }
  if (+[HMDDeviceCapabilities supportsStereoPairingV3]) {
    v10 |= 4uLL;
  }
  if (+[HMDDeviceCapabilities supportsStereoPairingV4]) {
    uint64_t v11 = v10 | 8;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = [(HMDAppleMediaAccessory *)v4 supportedStereoPairVersions];
  if (v12 != v11)
  {
    int v13 = (void *)MEMORY[0x230FBD990]();
    BOOL v14 = v4;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = [NSNumber numberWithUnsignedInteger:v11];
      int v33 = 138543618;
      __int16 v34 = v16;
      __int16 v35 = 2112;
      uint64_t v36 = v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating supported stereo pair versions to: %@", (uint8_t *)&v33, 0x16u);
    }
    uint64_t v18 = [NSNumber numberWithUnsignedInteger:v11];
    [v9 setSupportedStereoPairVersions:v18];
  }
  uint64_t v19 = [MEMORY[0x263F42620] productInfo];
  uint64_t v20 = [v19 productClass];

  if (v20 == 6
    && ([MEMORY[0x263F42620] productInfo],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        uint64_t v22 = [v21 productColor],
        v21,
        [(HMDAppleMediaAccessory *)v4 productColor] != v22))
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    uint64_t v24 = v4;
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      __int16 v26 = HMFGetLogIdentifier();
      uint64_t v27 = HMFProductColorToString();
      int v33 = 138543618;
      __int16 v34 = v26;
      __int16 v35 = 2112;
      uint64_t v36 = v27;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Updating product color to: %@", (uint8_t *)&v33, 0x16u);
    }
    __int16 v28 = [NSNumber numberWithInteger:v22];
    [v9 setProductColor:v28];
  }
  else if (v12 == v11)
  {
    goto LABEL_25;
  }
  id v29 = [(HMDAccessory *)v4 home];
  uint64_t v30 = [v29 backingStore];
  uint64_t v31 = +[HMDBackingStoreTransactionOptions defaultPreferencesOptions];
  uint64_t v32 = [v30 transaction:@"Update Product Information" options:v31];

  [v32 add:v9 withMessage:0];
  [v32 run];

LABEL_25:
}

- (void)createNewPairingIdentity
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    id v3 = [(HMDAppleMediaAccessory *)self currentAccessorySetupMetricDispatcher];
    [v3 markSetupBeginStage:6 error:0];

    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CreateHH2PairingIdentity", "", (uint8_t *)&v25, 2u);
    }
    int v5 = [MEMORY[0x263F425E8] pairingIdentity];
    id v6 = objc_alloc(MEMORY[0x263F425E8]);
    char v7 = [(HMDAccessory *)self uuid];
    id v8 = [v7 UUIDString];
    id v9 = [v5 publicKey];
    uint64_t v10 = [v5 privateKey];
    uint64_t v11 = (void *)[v6 initWithIdentifier:v8 publicKey:v9 privateKey:v10];

    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    int v13 = self;
    BOOL v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v25 = 138543618;
      __int16 v26 = v15;
      __int16 v27 = 2112;
      __int16 v28 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Creating new accessory pairing identity: %@", (uint8_t *)&v25, 0x16u);
    }
    id v16 = [MEMORY[0x263F35AD0] systemStore];
    if ([v16 saveAppleMediaAccessoryPairingIdentity:v11])
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      uint64_t v19 = v13;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        int v25 = 138543362;
        __int16 v26 = v21;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to save new accessory pairing identity in the keychain store", (uint8_t *)&v25, 0xCu);
      }
      uint64_t v17 = [MEMORY[0x263F087E8] hmfErrorWithCode:16 reason:@"Keychain store save failed"];
    }
    [(HMDAppleMediaAccessory *)v13 setLastCreatedPairingIdentity:v11];
    [(HMDAppleMediaAccessory *)v13 setPairingIdentity:v11];
    uint64_t v22 = [v11 publicPairingIdentity];
    [(HMDAppleMediaAccessory *)v13 forwardAccessoryPublicPairingIdentity:v22];

    [(HMDAppleMediaAccessory *)v13 notifyFrameworkOfUpdatedPairingIdentity];
    id v23 = [(HMDAppleMediaAccessory *)v13 currentAccessorySetupMetricDispatcher];
    [v23 markSetupEndStage:6 error:v17];

    uint64_t v24 = self->_logger;
    if (os_signpost_enabled(v24))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CreateHH2PairingIdentity", "", (uint8_t *)&v25, 2u);
    }
  }
}

- (void)configurePairingIdentity
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F35AD0] systemStore];
  char v4 = [(HMDAccessory *)self uuid];
  int v5 = [v3 pairingIdentityForAppleMediaAccessoryWithUUID:v4];

  id v6 = (void *)MEMORY[0x230FBD990]();
  char v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    uint64_t v10 = (void *)v9;
    uint64_t v11 = @"<waiting>";
    if (v5) {
      uint64_t v11 = v5;
    }
    int v13 = 138543618;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Configuring with accessory pairing identity: %@", (uint8_t *)&v13, 0x16u);
  }
  if (v5)
  {
    [(HMDAppleMediaAccessory *)v7 setLastCreatedPairingIdentity:v5];
    [(HMDAppleMediaAccessory *)v7 setPairingIdentity:v5];
    uint64_t v12 = [(__CFString *)v5 publicPairingIdentity];
    [(HMDAppleMediaAccessory *)v7 forwardAccessoryPublicPairingIdentity:v12];
  }
  else
  {
    [(HMDAppleMediaAccessory *)v7 createNewPairingIdentity];
  }
}

- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v160 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a5;
  uint64_t v13 = HMFUptime();
  uint64_t v15 = v14;
  unsigned int v127 = v6;
  v125 = v12;
  if (v6)
  {
    id v16 = (void *)MEMORY[0x230FBD990](v13);
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    unint64_t v19 = 0x263F08000;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      uint64_t v21 = [v10 uuid];
      uint64_t v22 = [(HMDAccessory *)v17 uuid];
      id v23 = [NSNumber numberWithBool:1];
      *(_DWORD *)buf = 138545922;
      v139 = v20;
      __int16 v140 = 2114;
      v141 = @"accessoryConfigureStart";
      __int16 v142 = 2112;
      v143 = @"Configuring accessory";
      __int16 v144 = 2114;
      v145 = @"state";
      __int16 v146 = 2112;
      v147 = @"start";
      __int16 v148 = 2114;
      v149 = @"homeUUID";
      __int16 v150 = 2112;
      v151 = v21;
      __int16 v152 = 2114;
      v153 = @"accessoryUUID";
      __int16 v154 = 2112;
      v155 = v22;
      __int16 v156 = 2114;
      v157 = @"initialConfig";
      __int16 v158 = 2112;
      v159 = v23;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x70u);

      unint64_t v19 = 0x263F08000uLL;
    }

    uint64_t v24 = [MEMORY[0x263F499E0] sharedInstance];
    id v25 = objc_alloc(MEMORY[0x263F499F0]);
    __int16 v26 = [v10 uuid];
    __int16 v27 = [(HMDAccessory *)v17 uuid];
    __int16 v28 = [*(id *)(v19 + 2584) numberWithBool:1];
    uint64_t v29 = HMDTaggedLoggingCreateDictionary();
    uint64_t v30 = objc_msgSend(v25, "initWithTag:data:", @"accessoryConfigureStart", v29, @"state", @"start", @"homeUUID", v26, @"accessoryUUID", v27, @"initialConfig", v28);
    uint64_t v31 = [MEMORY[0x263F424F0] currentTagProcessorList];
    [v24 submitTaggedEvent:v30 processorList:v31];

    uint64_t v6 = v127;
    uint64_t v12 = v125;
  }
  v126 = [v10 homeManager];
  if (v12) {
    dispatch_group_enter(v12);
  }
  if ([(HMDAppleMediaAccessory *)self isHomePod])
  {
    uint64_t v32 = [[HMDDoorbellChimeProfile alloc] initWithAppleMediaAccessory:self];
    [(NSMutableSet *)self->super.super._accessoryProfiles addObject:v32];
  }
  v137.receiver = self;
  v137.super_class = (Class)HMDAppleMediaAccessory;
  [(HMDAccessory *)&v137 configureWithHome:v10 msgDispatcher:v11 configurationTracker:v12 initialConfiguration:v6];
  [(HMDAppleMediaAccessory *)self configureAppleMediaAccessoryMessengerWithFactory:self];
  int v33 = [v10 wifiManager];
  [(HMDAppleMediaAccessory *)self setWifiManager:v33];

  __int16 v34 = [(HMDAppleMediaAccessory *)self dependencyFactory];
  __int16 v35 = [v34 darwinNotificationProviderForAccessory:self];
  [(HMDAppleMediaAccessory *)self setDarwinNotificationProvider:v35];

  uint64_t v36 = [(HMDAppleMediaAccessory *)self remoteLoginHandler];
  uint64_t v37 = [(HMDAccessory *)self workQueue];
  __int16 v38 = [(HMDAppleMediaAccessory *)self eventStoreReadHandle];
  uint64_t v39 = [(HMDAppleMediaAccessory *)self eventForwarder];
  [v36 configureWithWorkQueue:v37 messageDispatcher:v11 eventStoreReadHandle:v38 eventForwarder:v39];

  uint64_t v40 = [(HMDAppleMediaAccessory *)self dependencyFactory];
  char v41 = [v40 symptomsHandlerForAccessory:self];
  [(HMDAppleMediaAccessory *)self setSymptomsHandler:v41];

  uint64_t v42 = [(HMDAppleMediaAccessory *)self symptomsHandler];
  [v42 configure];

  [(HMDAppleMediaAccessory *)self configureAudioDestinationManager];
  id v43 = [(HMDAppleMediaAccessory *)self audioAnalysisEventSubscriber];
  if (v43) {
    goto LABEL_12;
  }
  if ([(HMDAppleMediaAccessory *)self isHomePod])
  {
    id v44 = [HMDAudioAnalysisEventSubscriber alloc];
    id v45 = [HMDAudioAnalysisEventSubscriberContext alloc];
    id v43 = [(HMDAccessory *)self workQueue];
    v46 = [(HMDAudioAnalysisEventSubscriberContext *)v45 initWithAccessory:self queue:v43];
    uint64_t v47 = [(HMDAudioAnalysisEventSubscriber *)v44 initWithContext:v46];
    [(HMDAppleMediaAccessory *)self setAudioAnalysisEventSubscriber:v47];

LABEL_12:
  }
  if (_os_feature_enabled_impl() && (isMac() || isiOSDevice()))
  {
    uint64_t v48 = [v10 audioAnalysisBulletinNotificationManager];
    int v49 = [v48 multipleLocalRegistrationsForAccessory:self];

    unsigned __int8 v136 = 0;
    long long v50 = [v10 audioAnalysisBulletinNotificationManager];
    id v51 = [v50 localRegistrationForAccessory:self enabled:&v136];

    if ((v49 & 1) != 0 || !v51)
    {
      v124 = v51;
      __int16 v59 = [HMDAudioAnalysisEventBulletinNotificationRegistration alloc];
      __int16 v60 = [MEMORY[0x263EFFA08] set];
      __int16 v61 = [(HMDAccessory *)self uuid];
      id v62 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)v59 initWithConditions:v60 audioAnalysisClassifierOptions:3 accessoryUUID:v61];

      uint64_t v63 = [(HMDAudioAnalysisEventBulletinNotificationRegistration *)v62 predicate];
      [(HMDAppleMediaAccessory *)self setAudioAnalysisEventNotificationCondition:v63];

      v64 = (void *)MEMORY[0x230FBD990]([(HMDAppleMediaAccessory *)self setAudioAnalysisEventNotificationEnabled:1]);
      v65 = self;
      v66 = HMFGetOSLogHandle();
      BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
      if (v49)
      {
        if (v67)
        {
          v68 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v139 = v68;
          _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@Multiple local store registrations detected, attempting cleanup now...", buf, 0xCu);
        }
        v69 = [v10 audioAnalysisBulletinNotificationManager];
        v135[0] = MEMORY[0x263EF8330];
        v135[1] = 3221225472;
        v135[2] = __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke;
        v135[3] = &unk_264A2F3E8;
        v135[4] = v65;
        [v69 cleanupMultipleRegistrationsAndReplaceWithRegistration:v62 completion:v135];
      }
      else
      {
        if (v67)
        {
          v70 = HMFGetLogIdentifier();
          [(HMDAppleMediaAccessory *)v65 isAudioAnalysisEventNotificationEnabled];
          HMFBooleanToString();
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v72 = [(HMDAppleMediaAccessory *)v65 audioAnalysisEventNotificationCondition];
          *(_DWORD *)buf = 138543874;
          v139 = v70;
          __int16 v140 = 2112;
          v141 = v71;
          __int16 v142 = 2112;
          v143 = v72;
          _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@Local bulletin not found creating and initializing audio analysis event notification registration with enabled: %@, condition: %@", buf, 0x20u);
        }
        v69 = [v10 audioAnalysisBulletinNotificationManager];
        v134[0] = MEMORY[0x263EF8330];
        v134[1] = 3221225472;
        v134[2] = __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_314;
        v134[3] = &unk_264A2F3E8;
        v134[4] = v65;
        [v69 updateNotificationRegistration:v62 enabled:1 completion:v134];
      }

      LOBYTE(v6) = v127;
      id v51 = v124;
      uint64_t v12 = v125;
    }
    else
    {
      id v52 = [v51 predicate];
      [(HMDAppleMediaAccessory *)self setAudioAnalysisEventNotificationCondition:v52];

      id v53 = (void *)MEMORY[0x230FBD990]([(HMDAppleMediaAccessory *)self setAudioAnalysisEventNotificationEnabled:v136]);
      uint64_t v54 = self;
      __int16 v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v56 = v123 = v51;
        uint64_t v57 = [(HMDAppleMediaAccessory *)v54 audioAnalysisEventNotificationCondition];
        uint64_t v6 = HMFBooleanToString();
        __int16 v58 = [(HMDAppleMediaAccessory *)v54 audioAnalysisEventNotificationCondition];
        *(_DWORD *)buf = 138543874;
        v139 = v56;
        __int16 v140 = 2112;
        v141 = (__CFString *)v6;
        __int16 v142 = 2112;
        v143 = v58;
        _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_INFO, "%{public}@Initializing audio analysis event notification registration with enabled: %@, condition: %@", buf, 0x20u);

        LOBYTE(v6) = v127;
        id v51 = v123;
      }

      uint64_t v12 = v125;
    }
  }
  device = self->_device;
  self->_device = 0;

  v74 = [(HMDAccessory *)self identifier];
  v75 = [(HMDAppleMediaAccessory *)self deviceMediaRouteIdentifierFactory];
  v76 = v75[2]();
  int v77 = [v74 isEqual:v76];

  if (v77)
  {
    logger = self->_logger;
    if (os_signpost_enabled(logger))
    {
      v79 = logger;
      v80 = [(HMDAccessory *)self uuid];
      *(_DWORD *)buf = 138412290;
      v139 = v80;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, v79, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ConfigureCurrentAccessory", "accessoryUUID=%{signpost.description:attribute}@ ", buf, 0xCu);
    }
    v81 = [(HMDMediaAccessory *)self notificationCenter];
    [v81 postNotificationName:@"HMDAppleMediaAccessoryCurrentAccessoryAddedNotification" object:self];

    [(HMDAppleMediaAccessory *)self registerForDarwinNotificationsOnCurrentAccessory];
    deviceController = self->_deviceController;
    if (!deviceController
      || ([(HMDDeviceController *)deviceController identifier],
          v83 = objc_claimAutoreleasedReturnValue(),
          v83,
          v83))
    {
      v84 = (void *)MEMORY[0x230FBD990]();
      v85 = self;
      v86 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        v87 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v139 = v87;
        _os_log_impl(&dword_22F52A000, v86, OS_LOG_TYPE_INFO, "%{public}@Setting up device controller for ourselves", buf, 0xCu);
      }
      v88 = [(HMDAppleMediaAccessory *)v85 dependencyFactory];
      v89 = [v88 deviceController];
      v90 = self->_deviceController;
      self->_deviceController = v89;
    }
    v91 = [v126 softwareUpdateManager];
    [v91 setAccessory:self];

    v92 = [(HMDAppleMediaAccessory *)self dependencyFactory];
    v93 = [v92 accountManagerForAccessory:self];
    v94 = [v93 device];

    if (v94)
    {
      if ([(HMDAppleMediaAccessory *)self shouldUpdateWithDevice:v94 initialConfiguration:v127])
      {
        [(HMDAppleMediaAccessory *)self updateWithDevice:v94];
      }
      v95 = [(HMDMediaAccessory *)self notificationCenter];
      [v95 removeObserver:self name:@"HMDDeviceUpdatedNotification" object:0];

      v96 = [(HMDMediaAccessory *)self notificationCenter];
      [v96 addObserver:self selector:sel_handleCurrentDeviceUpdated_ name:@"HMDDeviceUpdatedNotification" object:v94];

      v97 = [(HMDAppleMediaAccessory *)self remoteLoginHandler];
      [v97 _registerForUsernameUpdates];

      v98 = [v94 rpIdentity];
      v99 = [v98 deviceIRK];
      v100 = [v99 data];

      if (v100) {
        [(HMDAppleMediaAccessory *)self postDeviceIRKIfDifferent:v100];
      }
    }
    [(HMDAppleMediaAccessory *)self configurePairingIdentity];
    [(HMDAppleMediaAccessory *)self updateProductInformation];
    v101 = [(HMDAppleMediaAccessory *)self softwareVersion];
    v102 = [MEMORY[0x263F42620] productInfo];
    v103 = [v102 softwareVersion];
    char v104 = HMFEqualObjects();

    if ((v104 & 1) == 0)
    {
      v105 = [(HMDAccessory *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_318;
      block[3] = &unk_264A2F7F8;
      void block[4] = self;
      dispatch_async(v105, block);
    }
    if ([(HMDAppleMediaAccessory *)self supportsTargetControl])
    {
      v106 = [(HMDAppleMediaAccessory *)self targetControlManager];

      if (!v106)
      {
        v107 = [[HMDTargetControlManager alloc] initWithTargetAccessory:self controllers:0];
        [(HMDAppleMediaAccessory *)self setTargetControlManager:v107];
      }
    }
    [(HMDAppleMediaAccessory *)self _fetchMultiUserLanguages];
    v108 = [(HMDMediaAccessory *)self notificationCenter];
    [v108 removeObserver:self name:@"HMDHomeUserRemovedNotification" object:0];

    v109 = [(HMDMediaAccessory *)self notificationCenter];
    [v109 addObserver:self selector:sel_handleHomeUserRemovedNotification_ name:@"HMDHomeUserRemovedNotification" object:v10];

    v110 = [HMDAppleMediaAccessoryMetricsDispatcher alloc];
    v111 = [v10 logEventSubmitter];
    v112 = [v10 dailyScheduler];
    v113 = [(HMDAppleMediaAccessoryMetricsDispatcher *)v110 initWithDataSource:self logEventSubmitter:v111 dailyScheduler:v112];
    [(HMDAppleMediaAccessory *)self setMetricsDispatcher:v113];

    v114 = [(HMDAppleMediaAccessory *)self metricsDispatcher];
    [v114 registerForDailySetRoomLogEvents];

    if (([v10 isMultiUserEnabled] & 1) == 0) {
      [v10 enableMultiUser];
    }
    v115 = [(HMDMediaAccessory *)self notificationCenter];
    [v115 addObserver:self selector:sel_handleCurrentDeviceIRKUpdated_ name:@"HMDAppleAccountManagerFetchedCurrentDeviceIRK" object:0];

    v116 = self->_logger;
    if (os_signpost_enabled(v116))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22F52A000, v116, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ConfigureCurrentAccessory", "", buf, 2u);
    }

    LOBYTE(v6) = v127;
    uint64_t v12 = v125;
  }
  else
  {
    [(HMDAppleMediaAccessory *)self startMonitoringReachability];
    [(HMDAppleMediaAccessory *)self createAccessoryInfoSubscriberIfNecessary];
    __bootstrapSupportedStereoPairVersions(self);
  }
  v117 = [(HMDAppleMediaAccessory *)self sleepWakeStateController];
  v118 = [(HMDAccessory *)self home];
  v119 = [(HMDAccessory *)self workQueue];
  [v117 configureWithHome:v118 messageDispatcher:v11 workQueue:v119];

  [(HMDAppleMediaAccessory *)self updateReachabilityOfCurrentDevice];
  [(HMDAppleMediaAccessory *)self _configureGroupParticipantLocalDataStorageWithHome:v10];
  [(HMDAppleMediaAccessory *)self createOrUpdateSoftwareUpdateEventProviderIfNecessary];
  [(HMDAppleMediaAccessory *)self createSoftwareUpdateEventListenerIfNecessary];
  [(HMDDeviceController *)self->_deviceController setDelegate:self];
  v120 = [(HMDAccessory *)self workQueue];
  v128[0] = MEMORY[0x263EF8330];
  v128[1] = 3221225472;
  v128[2] = __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_326;
  v128[3] = &unk_264A20ED0;
  char v132 = v6;
  uint64_t v131 = v15;
  v128[4] = self;
  id v129 = v10;
  v130 = v12;
  v121 = v12;
  id v122 = v10;
  dispatch_async(v120, v128);
}

void __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  char v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      uint64_t v9 = "%{public}@Failed to clean up multiple local store registrations: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v8;
    uint64_t v9 = "%{public}@Successfully cleaned up multiple local store registrations";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

void __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_314(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  char v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      uint64_t v9 = "%{public}@Failed to save initial audio analysis registration: %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    uint64_t v14 = v8;
    uint64_t v9 = "%{public}@Successfully created initial audio analysis registration";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
}

void __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_318(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F42620] productInfo];
  unint64_t v2 = [v3 softwareVersion];
  [v1 _updateSoftwareVersion:v2];
}

void __100__HMDAppleMediaAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke_326(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 64))
  {
    unint64_t v2 = (void *)MEMORY[0x230FBD990]();
    id v3 = *(id *)(a1 + 32);
    char v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = NSString;
      HMFUptime();
      id v8 = objc_msgSend(v6, "stringWithFormat:", @"%.3f", v7 - *(double *)(a1 + 56));
      uint64_t v9 = [*(id *)(a1 + 40) uuid];
      id v10 = [*(id *)(a1 + 32) uuid];
      os_log_type_t v11 = (objc_class *)objc_opt_class();
      uint32_t v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138546434;
      __int16 v27 = v5;
      __int16 v28 = 2114;
      uint64_t v29 = @"accessoryConfigureDone";
      __int16 v30 = 2112;
      uint64_t v31 = @"Configured accessory";
      __int16 v32 = 2114;
      int v33 = @"state";
      __int16 v34 = 2112;
      __int16 v35 = @"end";
      __int16 v36 = 2114;
      uint64_t v37 = @"duration";
      __int16 v38 = 2112;
      uint64_t v39 = v8;
      __int16 v40 = 2114;
      char v41 = @"homeUUID";
      __int16 v42 = 2112;
      id v43 = v9;
      __int16 v44 = 2114;
      id v45 = @"accessoryUUID";
      __int16 v46 = 2112;
      uint64_t v47 = v10;
      __int16 v48 = 2114;
      int v49 = @"accessoryType";
      __int16 v50 = 2112;
      id v51 = v12;
      _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x84u);
    }
    int v13 = [MEMORY[0x263F499E0] sharedInstance];
    id v14 = objc_alloc(MEMORY[0x263F499F0]);
    __int16 v15 = NSString;
    HMFUptime();
    uint64_t v17 = objc_msgSend(v15, "stringWithFormat:", @"%.3f", v16 - *(double *)(a1 + 56));
    uint64_t v18 = [*(id *)(a1 + 40) uuid];
    unint64_t v19 = [*(id *)(a1 + 32) uuid];
    uint64_t v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    uint64_t v22 = HMDTaggedLoggingCreateDictionary();
    id v23 = objc_msgSend(v14, "initWithTag:data:", @"accessoryConfigureDone", v22, @"state", @"end", @"duration", v17, @"homeUUID", v18, @"accessoryUUID", v19, @"accessoryType", v21);
    uint64_t v24 = [MEMORY[0x263F424F0] currentTagProcessorList];
    [v13 submitTaggedEvent:v23 processorList:v24];
  }
  id v25 = *(NSObject **)(a1 + 48);
  if (v25) {
    dispatch_group_leave(v25);
  }
}

- (void)_configureGroupParticipantLocalDataStorageWithHome:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory])
  {
    if (isFeatureHomeTheaterQFAEnabledForTests
      && ([(id)isFeatureHomeTheaterQFAEnabledForTests BOOLValue] & 1) == 0)
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = self;
      __int16 v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        double v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        uint64_t v18 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Home Theater QFA is not enabled", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      id v5 = [v4 homeManager];
      uint64_t v6 = [(HMDAccessory *)self msgDispatcher];
      double v7 = [v5 mediaGroupParticipantDataLocalStorage];
      id v8 = v7;
      if (v4 && v6 && v7)
      {
        [v7 configureWithHome:v4 messageDispatcher:v6];
      }
      else
      {
        uint64_t v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = self;
        os_log_type_t v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint32_t v12 = HMFGetLogIdentifier();
          int v17 = 138544386;
          uint64_t v18 = v12;
          __int16 v19 = 2112;
          id v20 = v4;
          __int16 v21 = 2112;
          uint64_t v22 = v6;
          __int16 v23 = 2112;
          uint64_t v24 = v8;
          __int16 v25 = 2112;
          __int16 v26 = v5;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed to configure groups participant local data storage with dependencies home: %@ messageDispatcher: %@ dataStorage: %@ homeManager: %@", (uint8_t *)&v17, 0x34u);
        }
      }
    }
  }
}

- (HMDDoorbellChimeProfile)doorbellChimeProfile
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v2 = [(HMDAccessory *)self accessoryProfiles];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(id *)(*((void *)&v11 + 1) + 8 * v6);
      objc_opt_class();
      id v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
      id v9 = v8;

      if (v9) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    id v7 = 0;
  }

  return (HMDDoorbellChimeProfile *)v7;
}

- (BOOL)_shouldFilterAccessoryProfileForEntitledClients:(id)a3
{
  id v4 = a3;
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDAppleMediaAccessory;
    BOOL v5 = [(HMDAccessory *)&v7 _shouldFilterAccessoryProfileForEntitledClients:v4];
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)_shouldFilterAccessoryProfileForUnentitledClients:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HMDAppleMediaAccessory;
    BOOL v5 = [(HMDMediaAccessory *)&v7 _shouldFilterAccessoryProfileForUnentitledClients:v4];
  }

  return v5;
}

- (void)_registerForMessages
{
  v24[3] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)HMDAppleMediaAccessory;
  [(HMDMediaAccessory *)&v20 _registerForMessages];
  uint64_t v3 = [(HMDAccessory *)self msgDispatcher];
  id v4 = [(HMDAccessory *)self home];
  isInternalBuild();
  BOOL v5 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v24[0] = v5;
  uint64_t v6 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v24[1] = v6;
  objc_super v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:3 remoteAccessRequired:0];
  v24[2] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];

  [v3 registerForMessage:*MEMORY[0x263F0B340] receiver:self policies:v8 selector:sel_handleFetchManagedConfigurationProfiles_];
  [v3 registerForMessage:*MEMORY[0x263F0B4D8] receiver:self policies:v8 selector:sel_handleRemoveManagedConfigurationProfile_];
  [v3 registerForMessage:*MEMORY[0x263F0B380] receiver:self policies:v8 selector:sel_handleInstallManagedConfigurationProfile_];

  id v9 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v23[0] = v9;
  id v10 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v23[1] = v10;
  long long v11 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:4 remoteAccessRequired:0];
  v23[2] = v11;
  long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];

  [v3 registerForMessage:*MEMORY[0x263F0D9E0] receiver:self policies:v12 selector:sel__startUpdate_];
  [v3 registerForMessage:*MEMORY[0x263F0B278] receiver:self policies:v12 selector:sel_handleDeleteSiriHistoryRequest_];
  [v3 registerForMessage:*MEMORY[0x263F0B858] receiver:self policies:v12 selector:sel_handleUpdatePreferredMediaUser_];
  [v3 registerForMessage:*MEMORY[0x263F0B6F8] receiver:self policies:v12 selector:sel_handleSoftwareUpdateV2Scan_];
  [v3 registerForMessage:*MEMORY[0x263F0B700] receiver:self policies:v12 selector:sel_handleSoftwareUpdateV2ScanRepeatedlyAndApplyMessage_];

  if (isInternalBuild())
  {
    long long v13 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:0 remoteAccessRequired:0];
    long long v14 = +[HMDXPCMessagePolicy policyWithEntitlements:13];
    v22[0] = v14;
    v22[1] = v13;
    __int16 v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];

    [v3 registerForMessage:*MEMORY[0x263F0B838] receiver:self policies:v15 selector:sel__handleTriggerPairingIdentityUpdateNotification_];
  }
  uint64_t v16 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v21[0] = v16;
  int v17 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v21[1] = v17;
  uint64_t v18 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:0 remoteAccessRequired:0];
  v21[2] = v18;
  __int16 v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];

  [v3 registerForMessage:*MEMORY[0x263F0E998] receiver:self policies:v19 selector:sel__handleAudioAnalysisBulletinBoardCommit_];
}

- (NSString)description
{
  int v17 = NSString;
  uint64_t v16 = objc_opt_class();
  objc_super v20 = [(HMDAccessory *)self uuid];
  __int16 v15 = [v20 UUIDString];
  __int16 v21 = [(HMDMediaAccessory *)self name];
  uint64_t v3 = [(HMDAccessory *)self identifier];
  __int16 v19 = [(HMDAccessory *)self category];
  long long v14 = [v19 name];
  id v4 = [(HMDAppleMediaAccessory *)self softwareVersion];
  BOOL v5 = [(HMDAccessory *)self softwareUpdate];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
  if ([(HMDAppleMediaAccessory *)self isCurrentAccessory]) {
    objc_super v7 = @" isCurrent = YES,";
  }
  else {
    objc_super v7 = &stru_26E2EB898;
  }
  id v8 = [(HMDAppleMediaAccessory *)self device];
  id v9 = [(HMDAccessory *)self home];
  id v10 = [v9 name];
  long long v11 = [(HMDAccessory *)self room];
  long long v12 = [v11 uuid];
  uint64_t v18 = [v17 stringWithFormat:@"<%@, UUID = %@, Name = %@, Identifier = %@, Category = %@, Version = %@, Update = %@, Stereo Pair Versions = %@,%@ Device = %@, Home = %@, RoomUUID = %@>", v16, v15, v21, v3, v14, v4, v5, v6, v7, v8, v10, v12];

  return (NSString *)v18;
}

- (void)dealloc
{
  uint64_t v3 = [(HMDMediaAccessory *)self notificationCenter];
  [v3 removeObserver:self];

  id v4 = [(HMDAppleMediaAccessory *)self targetControlManager];
  [v4 invalidate];

  [(HMDAppleMediaAccessory *)self setTargetControlManager:0];
  v5.receiver = self;
  v5.super_class = (Class)HMDAppleMediaAccessory;
  [(HMDAccessory *)&v5 dealloc];
}

- (HMDAppleMediaAccessory)initWithDeviceController:(id)a3 deviceIdentifierFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HMDAppleMediaAccessory *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceController, a3);
    long long v11 = _Block_copy(v8);
    id deviceMediaRouteIdentifierFactory = v10->_deviceMediaRouteIdentifierFactory;
    v10->_id deviceMediaRouteIdentifierFactory = v11;
  }
  return v10;
}

- (HMDAppleMediaAccessory)init
{
  v16.receiver = self;
  v16.super_class = (Class)HMDAppleMediaAccessory;
  unint64_t v2 = [(HMDMediaAccessory *)&v16 init];
  if (v2)
  {
    uint64_t v3 = HMFGetOSLogHandle();
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    v2->_deviceReachable = 1;
    id settingsConnectionFactory = v2->_settingsConnectionFactory;
    v2->_id settingsConnectionFactory = &__block_literal_global_250;

    id deviceMediaRouteIdentifierFactory = v2->_deviceMediaRouteIdentifierFactory;
    v2->_id deviceMediaRouteIdentifierFactory = &__block_literal_global_252_137525;

    id v7 = [HMDAppleMediaAccessorySleepWakeStateController alloc];
    id v8 = [(HMDAccessory *)v2 uuid];
    uint64_t v9 = [(HMDAppleMediaAccessorySleepWakeStateController *)v7 initWithAccessoryUUID:v8 dataSource:v2];
    sleepWakeStateController = v2->_sleepWakeStateController;
    v2->_sleepWakeStateController = (HMDAppleMediaAccessorySleepWakeStateController *)v9;

    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    hostedAccessories = v2->_hostedAccessories;
    v2->_hostedAccessories = (NSHashTable *)v11;

    v2->_int64_t productColor = 0;
    objc_storeWeak((id *)&v2->_mediaDestinationControllerFactory, v2);
    objc_storeWeak((id *)&v2->_mediaDestinationManagerFactory, v2);
    long long v13 = objc_alloc_init(HMDAppleMediaAccessoryDependencyFactory);
    dependencyFactory = v2->_dependencyFactory;
    v2->_dependencyFactory = v13;
  }
  return v2;
}

id __30__HMDAppleMediaAccessory_init__block_invoke_2()
{
  return (id)_mediaRouteIdentifier;
}

id __30__HMDAppleMediaAccessory_init__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F285E0]);
  return v0;
}

- (HMDAppleMediaAccessory)initWithDependencyFactory:(id)a3 deviceMediaRouteIdentifierFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(HMDAppleMediaAccessory *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dependencyFactory, a3);
    if (v8)
    {
      uint64_t v11 = _Block_copy(v8);
      id deviceMediaRouteIdentifierFactory = v10->_deviceMediaRouteIdentifierFactory;
      v10->_id deviceMediaRouteIdentifierFactory = v11;
    }
  }

  return v10;
}

- (HMDAppleMediaAccessory)initWithTransaction:(id)a3 home:(id)a4 dependencyFactory:(id)a5
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v13 = v12;
  }
  else {
    long long v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    __int16 v15 = [v14 deviceUUID];

    if (v15)
    {
      id v16 = objc_alloc(MEMORY[0x263F08C38]);
      int v17 = [v14 deviceUUID];
      objc_super v5 = (HMDAppleMediaAccessory *)[v16 initWithUUIDString:v17];

      __int16 v15 = [v11 deviceControllerWithDeviceIdentifier:v5];
    }
    uint64_t v18 = [v14 device];

    if (v18)
    {
      if (!v15)
      {
        __int16 v19 = [v14 device];
        __int16 v15 = [v11 deviceControllerWithDevice:v19];
      }
      objc_super v20 = [v14 device];
      [v15 updateWithDevice:v20 completionHandler:0];
    }
    uint64_t v21 = [v14 deviceAddress];
    uint64_t v22 = (void *)v21;
    if (v15) {
      goto LABEL_24;
    }
    if (v21)
    {
      objc_super v5 = [v11 deviceWithAddress:v21];
      if (!v5) {
        goto LABEL_21;
      }
    }
    else
    {
      __int16 v28 = [v14 idsIdentifier];

      if (!v28) {
        goto LABEL_21;
      }
      uint64_t v29 = [v14 idsIdentifier];
      objc_super v5 = [v11 deviceForIDSIdentifier:v29];

      if (!v5) {
        goto LABEL_21;
      }
    }
    __int16 v15 = [v11 deviceControllerWithDevice:v5];

    if (v15)
    {
LABEL_24:

      v67.receiver = self;
      v67.super_class = (Class)HMDAppleMediaAccessory;
      int v33 = [(HMDMediaAccessory *)&v67 initWithTransaction:v12 home:v10];
      if (v33)
      {
        id v66 = v10;
        uint64_t v34 = HMFGetOSLogHandle();
        logger = v33->_logger;
        v33->_logger = (OS_os_log *)v34;

        __int16 v36 = [v14 variant];
        v33->_variant = [v36 unsignedIntegerValue];

        uint64_t v37 = [v14 accessoryCapabilities];
        rawCapabilities = v33->_rawCapabilities;
        v33->_rawCapabilities = (NSData *)v37;

        id v39 = objc_alloc(MEMORY[0x263F0DF30]);
        __int16 v40 = [v14 accessoryCapabilities];
        uint64_t v41 = [v39 initWithProtoData:v40];
        capabilitiesInternal = v33->_capabilitiesInternal;
        v33->_capabilitiesInternal = (HMAccessoryCapabilities *)v41;

        objc_storeStrong((id *)&v33->_deviceController, v15);
        uint64_t v43 = [v14 softwareVersion];
        softwareVersion = v33->_softwareVersion;
        v33->_softwareVersion = (HMFSoftwareVersion *)v43;

        uint64_t v45 = [v14 pairingIdentity];
        pairingIdentity = v33->_pairingIdentity;
        v33->_pairingIdentity = (HMFPairingIdentity *)v45;

        id settingsConnectionFactory = v33->_settingsConnectionFactory;
        v33->_id settingsConnectionFactory = &__block_literal_global_137531;

        id deviceMediaRouteIdentifierFactory = v33->_deviceMediaRouteIdentifierFactory;
        v33->_id deviceMediaRouteIdentifierFactory = &__block_literal_global_244;

        int v49 = [v14 idsIdentifier];
        __int16 v50 = v49;
        if (!v49)
        {
          objc_super v5 = [v14 device];
          __int16 v50 = [(HMDAppleMediaAccessory *)v5 idsIdentifier];
        }
        objc_storeStrong((id *)&v33->_idsIdentifier, v50);
        if (!v49)
        {
        }
        uint64_t v51 = [v14 deviceAddress];
        deviceAddress = v33->_deviceAddress;
        v33->_deviceAddress = (HMDDeviceAddress *)v51;

        uint64_t v53 = [v14 deviceIRKData];
        deviceIRK = v33->_deviceIRK;
        v33->_deviceIRK = (NSData *)v53;

        __int16 v55 = [v14 loggedInAccount];
        id v56 = [[HMDRemoteLoginHandler alloc] initWithAccessory:v33 loggedInAccountData:v55];
        remoteLoginHandler = v33->_remoteLoginHandler;
        v33->_remoteLoginHandler = v56;

        __int16 v58 = [v14 supportedStereoPairVersions];
        v33->_unint64_t supportedStereoPairVersions = [v58 unsignedIntegerValue];

        __int16 v59 = [HMDAppleMediaAccessorySleepWakeStateController alloc];
        __int16 v60 = [(HMDAccessory *)v33 uuid];
        uint64_t v61 = [(HMDAppleMediaAccessorySleepWakeStateController *)v59 initWithAccessoryUUID:v60 dataSource:v33];
        sleepWakeStateController = v33->_sleepWakeStateController;
        v33->_sleepWakeStateController = (HMDAppleMediaAccessorySleepWakeStateController *)v61;

        __bootstrapSupportedStereoPairVersions(v33);
        uint64_t v63 = [v14 productColor];
        v33->_int64_t productColor = [v63 unsignedIntegerValue];

        objc_storeStrong((id *)&v33->_dependencyFactory, a5);
        id v10 = v66;
      }
      uint64_t v24 = v33;

      uint64_t v27 = v24;
      goto LABEL_31;
    }
LABEL_21:
    __int16 v30 = (void *)MEMORY[0x230FBD990]();
    objc_super v5 = self;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      __int16 v32 = v65 = v10;
      *(_DWORD *)buf = 138543362;
      v69 = v32;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Unable to determine device", buf, 0xCu);

      id v10 = v65;
    }

    __int16 v15 = 0;
    goto LABEL_24;
  }
  __int16 v23 = (void *)MEMORY[0x230FBD990]();
  uint64_t v24 = self;
  __int16 v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    __int16 v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v69 = v26;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize an AppleMedia accessory without an AppleMedia model.", buf, 0xCu);
  }
  uint64_t v27 = 0;
LABEL_31:

  return v27;
}

id __69__HMDAppleMediaAccessory_initWithTransaction_home_dependencyFactory___block_invoke_2()
{
  return (id)_mediaRouteIdentifier;
}

id __69__HMDAppleMediaAccessory_initWithTransaction_home_dependencyFactory___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F285E0]);
  return v0;
}

- (HMDAppleMediaAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HMDAppleMediaAccessoryDependencyFactory);
  id v9 = [(HMDAppleMediaAccessory *)self initWithTransaction:v7 home:v6 dependencyFactory:v8];

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t299 != -1) {
    dispatch_once(&logCategory__hmf_once_t299, &__block_literal_global_523);
  }
  unint64_t v2 = (void *)logCategory__hmf_once_v300;
  return v2;
}

void __37__HMDAppleMediaAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v300;
  logCategory__hmf_once_v300 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)shouldAcceptMessage:(id)a3 home:(id)a4 privilege:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([v7 isRemote])
  {
    if ([v7 isSecureRemote])
    {
      id v9 = [v7 matchingRemoteIdentityUserForHome:v8];
      goto LABEL_6;
    }
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = v8;
    uint64_t v18 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
LABEL_17:

      id v10 = [v7 responseHandler];

      if (v10)
      {
        uint64_t v21 = [MEMORY[0x263F087E8] hmErrorWithCode:10];
        uint64_t v22 = [v7 responseHandler];
        ((void (**)(void, void *, void))v22)[2](v22, v21, 0);

        id v10 = 0;
      }
      goto LABEL_30;
    }
    __int16 v19 = HMFGetLogIdentifier();
    int v32 = 138543362;
    int v33 = v19;
    objc_super v20 = "%{public}@Only secure clients may modify settings";
LABEL_16:
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&v32, 0xCu);

    goto LABEL_17;
  }
  if (([v7 isEntitledForSPIAccess] & 1) == 0)
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = v8;
    uint64_t v18 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    __int16 v19 = HMFGetLogIdentifier();
    int v32 = 138543362;
    int v33 = v19;
    objc_super v20 = "%{public}@Only entitled clients may modify settings";
    goto LABEL_16;
  }
  id v9 = [v8 currentUser];
LABEL_6:
  id v10 = v9;
  if (!v9)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v23 = v8;
    long long v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_28;
    }
    id v14 = HMFGetLogIdentifier();
    int v32 = 138543618;
    int v33 = v14;
    __int16 v34 = 2112;
    id v35 = v7;
    __int16 v15 = "%{public}@Unable to determine originator of message: %@";
    goto LABEL_27;
  }
  if (a5 != 3)
  {
    if (a5 == 4 && ([v9 isAdministrator] & 1) == 0)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = v8;
      long long v13 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_28;
      }
      id v14 = HMFGetLogIdentifier();
      int v32 = 138543618;
      int v33 = v14;
      __int16 v34 = 2112;
      id v35 = v10;
      __int16 v15 = "%{public}@User does not have administrator privilege: %@";
      goto LABEL_27;
    }
LABEL_22:
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = v8;
    __int16 v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      int v32 = 138543618;
      int v33 = v27;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Accepting message: %@", (uint8_t *)&v32, 0x16u);
    }
    LOBYTE(v24) = 1;
    goto LABEL_31;
  }
  if ([v9 isOwner]) {
    goto LABEL_22;
  }
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v28 = v8;
  long long v13 = HMFGetOSLogHandle();
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
    goto LABEL_28;
  }
  id v14 = HMFGetLogIdentifier();
  int v32 = 138543618;
  int v33 = v14;
  __int16 v34 = 2112;
  id v35 = v10;
  __int16 v15 = "%{public}@User does not have owner privilege: %@";
LABEL_27:
  _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v32, 0x16u);

LABEL_28:
  uint64_t v24 = [v7 responseHandler];

  if (v24)
  {
    uint64_t v29 = [MEMORY[0x263F087E8] hmErrorWithCode:17 description:@"Insufficient privileges." reason:@"User has insufficient privileges for request." suggestion:0];
    __int16 v30 = [v7 responseHandler];
    ((void (**)(void, void *, void))v30)[2](v30, v29, 0);

LABEL_30:
    LOBYTE(v24) = 0;
  }
LABEL_31:

  return (char)v24;
}

- (id)assistantObject
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  v76.receiver = self;
  v76.super_class = (Class)HMDAppleMediaAccessory;
  uint64_t v3 = [(HMDMediaAccessory *)&v76 assistantObject];
  id v4 = (void *)[v3 mutableCopy];

  objc_super v5 = [(HMDAccessory *)self category];
  id v6 = [v5 categoryType];
  char v7 = [v6 isEqual:*MEMORY[0x263F0B030]];

  if (v7)
  {
    id v8 = (id *)MEMORY[0x263F65638];
    id v9 = (id *)MEMORY[0x263F656E8];
    goto LABEL_5;
  }
  id v10 = [v5 categoryType];
  char v11 = [v10 isEqual:*MEMORY[0x263F0B0A0]];

  if (v11)
  {
    id v8 = (id *)MEMORY[0x263F65678];
    id v9 = (id *)MEMORY[0x263F657C8];
LABEL_5:
    id v12 = *v9;
    id v13 = *v8;
    if (v12) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    uint64_t v61 = v13;
    if (!v14)
    {
      v81[0] = @"objectServiceType";
      v81[1] = @"objectServiceSubType";
      v82[0] = v12;
      v82[1] = v13;
      __int16 v15 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
      [v4 addEntriesFromDictionary:v15];
    }
    goto LABEL_13;
  }
  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v84 = v18;
    __int16 v85 = 2112;
    v86 = v5;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Apple media accessory with invalid accessory category: %@", buf, 0x16u);
  }
  id v12 = 0;
  uint64_t v61 = 0;
LABEL_13:
  __int16 v19 = [(HMDAccessory *)self home];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  objc_super v20 = [v19 mediaSystems];
  uint64_t v21 = (void *)[v20 copy];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v72 objects:v80 count:16];
  uint64_t v63 = v19;
  v64 = v4;
  id v62 = v5;
  if (v22)
  {
    uint64_t v23 = v22;
    id v24 = v12;
    uint64_t v25 = *(void *)v73;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v73 != v25) {
          objc_enumerationMutation(v21);
        }
        uint64_t v27 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        id v28 = [v27 accessories];
        int v29 = [v28 containsObject:self];

        if (v29)
        {
          uint64_t v31 = [v27 name];
          __int16 v30 = [v27 urlString];
          goto LABEL_23;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v72 objects:v80 count:16];
      if (v23) {
        continue;
      }
      break;
    }
    __int16 v30 = 0;
    uint64_t v31 = 0;
LABEL_23:
    id v12 = v24;
    __int16 v19 = v63;
    id v4 = v64;
  }
  else
  {
    __int16 v30 = 0;
    uint64_t v31 = 0;
  }

  int v32 = [(HMDAppleMediaAccessory *)self audioDestinationController];
  int v33 = [v32 data];
  __int16 v34 = [v33 destinationIdentifier];

  if (v34)
  {
    uint64_t v35 = [(HMDMediaAccessory *)self name];

    uint64_t v36 = [v32 urlString];

    __int16 v30 = (void *)v36;
    uint64_t v31 = (void *)v35;
  }
  uint64_t v37 = [(HMDAppleMediaAccessory *)self audioDestination];
  __int16 v38 = (void *)v37;
  if (!v31 && v37)
  {
    id v66 = (void *)v37;
    objc_super v67 = v30;
    __int16 v58 = v33;
    __int16 v59 = v32;
    id v60 = v12;
    id v39 = [v19 accessories];
    __int16 v40 = objc_msgSend(v39, "na_map:", &__block_literal_global_166639);

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = v40;
    uint64_t v41 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = 0;
      uint64_t v44 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v69 != v44) {
            objc_enumerationMutation(obj);
          }
          __int16 v46 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          uint64_t v47 = [v46 audioDestinationController];
          __int16 v48 = [v47 data];
          int v49 = [v48 destinationIdentifier];
          __int16 v50 = [v66 uniqueIdentifier];
          int v51 = objc_msgSend(v49, "hmf_isEqualToUUID:", v50);

          if (v51)
          {
            uint64_t v52 = [v46 name];

            uint64_t v53 = [v47 urlString];

            objc_super v67 = (void *)v53;
            uint64_t v43 = (void *)v52;
          }
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
      }
      while (v42);
    }
    else
    {
      uint64_t v43 = 0;
    }

    __int16 v19 = v63;
    id v4 = v64;
    int v32 = v59;
    id v12 = v60;
    __int16 v38 = v66;
    __int16 v30 = v67;
    int v33 = v58;
    uint64_t v31 = v43;
  }
  if (v31 && v30)
  {
    v78 = v31;
    uint64_t v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
    [v4 setObject:v54 forKey:@"objectGroups"];

    int v77 = v30;
    __int16 v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
    [v4 setObject:v55 forKey:@"objectGroupIdentifiers"];
  }
  id v56 = (void *)[v4 copy];

  return v56;
}

id __52__HMDAppleMediaAccessory_Assistant__assistantObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)languageValueList
{
  id v2 = [(HMDAppleMediaAccessory *)self settingsController];
  uint64_t v3 = [v2 languageValueList];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v3;

  return v5;
}

- (id)createAppleMediaAccessoryMessengerWithIdentifier:(id)a3 messageDispatcher:(id)a4 router:(id)a5 localHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[HMDAppleMediaAccessoryMessenger alloc] initWithIdentifier:v12 messageDispatcher:v11 router:v10 localHandler:v9];

  return v13;
}

- (void)configureAppleMediaAccessoryMessengerWithFactory:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessory *)self uuid];
  id v6 = [(HMDAccessory *)self msgDispatcher];
  uint64_t v7 = [(HMDAccessory *)self home];
  if (!v5)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  if (!v6) {
    goto LABEL_10;
  }
  id v8 = (void *)v7;
  if (v7)
  {
    id v9 = [[HMDAppleMediaAccessoryMessageRouter alloc] initWithIdentifier:v5 messageDispatcher:v6];
    [(HMDAppleMediaAccessoryMessageRouter *)v9 setDataSource:self];
    id v10 = [HMDAssistantSettingsConnection alloc];
    id v11 = [MEMORY[0x263F42628] defaultScheduler];
    id v12 = [(HMDAssistantSettingsConnection *)v10 initWithScheduler:v11];

    [(HMDAssistantSettingsConnection *)v12 setDataSource:v12];
    id v13 = [[HMDAppleMediaAccessoryLocalMessageHandler alloc] initWithIdentifier:v5 assistantSettingsConnection:v12];
    [(HMDAppleMediaAccessoryLocalMessageHandler *)v13 setDataSource:self];
    BOOL v14 = [v4 createAppleMediaAccessoryMessengerWithIdentifier:v5 messageDispatcher:v6 router:v9 localHandler:v13];
    [v14 registerForMessagesWithHome:v8];
    [(HMDAppleMediaAccessory *)self setMessenger:v14];
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      objc_super v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure apple media accessory due to no home on accessory", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (BOOL)isCurrentDevicePrimaryResident
{
  id v2 = [(HMDAccessory *)self home];
  char v3 = [v2 isCurrentDevicePrimaryResident];

  return v3;
}

@end
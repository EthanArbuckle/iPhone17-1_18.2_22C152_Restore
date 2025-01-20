@interface HMAccessory
+ (BOOL)supportsSecureCoding;
+ (HMAccessory)accessoryWithAccessoryReference:(id)a3 home:(id)a4;
+ (HMAccessory)accessoryWithSerializedDictionaryRepresentation:(id)a3 home:(id)a4;
+ (id)_cameraProfilesForAccessoryProfiles:(id)a3;
+ (id)_doorbellProfilesForAccessoryProfiles:(id)a3;
+ (id)_lightProfilesForAccessoryProfiles:(id)a3;
+ (id)_mediaProfilesForAccessoryProfiles:(id)a3;
+ (id)_networkConfigurationProfilesForCoder:(id)a3 accessoryIdentifier:(id)a4;
+ (id)_siriEndpointProfilesForAccessoryProfiles:(id)a3;
+ (id)logCategory;
+ (id)shortDescription;
+ (id)televisionProfilesForAccessoryServices:(id)a3 isSPIEntitled:(BOOL)a4;
+ (unint64_t)networkRouterStatusFromRouterStatus:(int64_t)a3 wanStatusListData:(id)a4;
+ (unint64_t)networkRouterStatusFromWiFiSatelliteStatus:(int64_t)a3;
- (BOOL)_mergeBulletinBoardNotificationByEndpoint:(id)a3;
- (BOOL)_mergeControlTargetUUIDs:(id)a3;
- (BOOL)_mergeRemoteLoginHandler:(id)a3;
- (BOOL)_mergeServices:(id)a3;
- (BOOL)_updateFromAccessory:(id)a3;
- (BOOL)_updateHasSymptomsHandler:(BOOL)a3;
- (BOOL)bridgedAccessory;
- (BOOL)hasOnboardedForNaturalLighting;
- (BOOL)hasSymptomsHandler;
- (BOOL)isAdditionalSetupRequired;
- (BOOL)isBlocked;
- (BOOL)isCalibrating;
- (BOOL)isControllable;
- (BOOL)isCurrentAccessory;
- (BOOL)isFirmwareUpdateAvailable;
- (BOOL)isReachable;
- (BOOL)isSuspendCapable;
- (BOOL)isUserNotifiedOfSoftwareUpdate;
- (BOOL)knownToSystemCommissioner;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)mfiCertifiedACWG;
- (BOOL)paired;
- (BOOL)requiresThreadRouter;
- (BOOL)supportsAccessCodes;
- (BOOL)supportsAnnounce;
- (BOOL)supportsAudioAnalysis;
- (BOOL)supportsAudioDestination;
- (BOOL)supportsAudioGroup;
- (BOOL)supportsAudioReturnChannel;
- (BOOL)supportsCHIP;
- (BOOL)supportsCompanionInitiatedObliterate;
- (BOOL)supportsCompanionInitiatedRestart;
- (BOOL)supportsCoordinationDoorbellChime;
- (BOOL)supportsDiagnosticsTransfer;
- (BOOL)supportsDoorbellChime;
- (BOOL)supportsDropIn;
- (BOOL)supportsHomeLevelLocationServiceSetting;
- (BOOL)supportsIdentify;
- (BOOL)supportsJustSiri;
- (BOOL)supportsManagedConfigurationProfile;
- (BOOL)supportsMediaAccessControl;
- (BOOL)supportsMediaActions;
- (BOOL)supportsMediaContentProfile;
- (BOOL)supportsMessagedHomePodSettings;
- (BOOL)supportsMultiUser;
- (BOOL)supportsMusicAlarm;
- (BOOL)supportsNativeMatter;
- (BOOL)supportsPreferredMediaUser;
- (BOOL)supportsPrimaryUserInfoSubscription;
- (BOOL)supportsRMVonAppleTV;
- (BOOL)supportsSoftwareUpdateV2;
- (BOOL)supportsTargetControl;
- (BOOL)supportsTargetController;
- (BOOL)supportsThirdPartyMusic;
- (BOOL)supportsUWBUnlock;
- (BOOL)supportsUserMediaSettings;
- (BOOL)supportsWalletKey;
- (BOOL)suspendCapable;
- (BOOL)targetControllerHardwareSupport;
- (HMAccessory)init;
- (HMAccessory)initWithCoder:(id)a3;
- (HMAccessory)initWithUUID:(id)a3;
- (HMAccessoryCategory)category;
- (HMAccessoryInfoDataProvider)accessoryInfoDataProvider;
- (HMAccessorySettings)settings;
- (HMAccessorySettingsAdapter)settingsAdapter;
- (HMAccessorySettingsController)accessorySettingsController;
- (HMAccessorySettingsDataSource)accessorySettingsDataSource;
- (HMApplicationData)applicationData;
- (HMAudioAnalysisEventBulletinBoardNotification)audioAnalysisEventBulletinBoardNotification;
- (HMDevice)device;
- (HMDoorbellChimeProfile)doorbellChimeProfile;
- (HMFPairingIdentity)pairingIdentity;
- (HMFSoftwareVersion)softwareVersion;
- (HMFWiFiNetworkInfo)wifiNetworkInfo;
- (HMHome)home;
- (HMMediaDestination)audioDestination;
- (HMMediaDestinationController)audioDestinationController;
- (HMMutableArray)accessoryProfiles;
- (HMMutableArray)currentServices;
- (HMNetworkConfigurationProfile)networkConfigurationProfile;
- (HMRemoteLoginHandler)remoteLoginHandler;
- (HMRoom)room;
- (HMSupportedAccessoryDiagnostics)supportedDiagnostics;
- (HMSymptomsHandler)symptomsHandler;
- (NSArray)attributeDescriptions;
- (NSArray)audioDestinationMediaProfiles;
- (NSArray)bridgedAccessories;
- (NSArray)cameraProfiles;
- (NSArray)controlTargetUUIDs;
- (NSArray)profiles;
- (NSArray)services;
- (NSArray)televisionProfiles;
- (NSArray)uniqueIdentifiersForBridgedAccessories;
- (NSData)deviceIRKData;
- (NSData)readerGroupSubIdentifierACWG;
- (NSData)readerIDACWG;
- (NSData)rootPublicKey;
- (NSDictionary)bulletinBoardNotificationByEndpoint;
- (NSDictionary)serializedDictionaryRepresentation;
- (NSNumber)accessoryFlags;
- (NSNumber)matterNodeID;
- (NSNumber)nodeID;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSNumber)weekDaySchedulesPerUserCapacity;
- (NSNumber)yearDaySchedulesPerUserCapacity;
- (NSString)assistantIdentifier;
- (NSString)audioDestinationIdentifier;
- (NSString)audioDestinationParentIdentifier;
- (NSString)bundleID;
- (NSString)configuredName;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)firmwareVersion;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)pendingConfigurationIdentifier;
- (NSString)serialNumber;
- (NSString)shortDescription;
- (NSString)storeID;
- (NSUUID)accountIdentifier;
- (NSUUID)audioDestinationGroupIdentifier;
- (NSUUID)commissioningID;
- (NSUUID)networkProtectionGroupUUID;
- (NSUUID)peerIdentifier;
- (NSUUID)preferredMediaUserUUID;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)_accessoryInformationService;
- (id)_findCharacteristic:(id)a3 forService:(id)a4;
- (id)_findService:(id)a3;
- (id)_findServiceWithUniqueIdentifier:(id)a3;
- (id)_handleMultipleCharacteristicsUpdated:(id)a3 message:(id)a4 informDelegate:(BOOL)a5;
- (id)_privateDelegate;
- (id)_valueForCharacteristic:(id)a3 ofService:(id)a4;
- (id)bulletinBoardNotificationForEndpoint:(id)a3;
- (id)controlTargets;
- (id)delegate;
- (id)lightProfiles;
- (id)logIdentifier;
- (id)mediaDestinationController:(id)a3 destinationWithIdentifier:(id)a4;
- (id)mediaProfile;
- (id)preferredMediaUser;
- (id)siriEndpointProfile;
- (id)softwareUpdateController;
- (id)targetControllers;
- (int64_t)associationOptions;
- (int64_t)audioDestinationType;
- (int64_t)certificationStatus;
- (int64_t)productColor;
- (int64_t)reachableTransports;
- (unint64_t)accessoryReprovisionState;
- (unint64_t)additionalSetupStatus;
- (unint64_t)calibrationStatus;
- (unint64_t)homePodVariant;
- (unint64_t)preferredUserSelectionType;
- (unint64_t)supportedStereoPairVersions;
- (unint64_t)suspendedState;
- (unint64_t)transportTypes;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_auditPairingsWithCompletionHandler:(id)a3;
- (void)_configureProfilesWithContext:(id)a3;
- (void)_createSymptomsHandler;
- (void)_deleteSiriHistoryWithCompletion:(id)a3;
- (void)_handleAccessoryCategoryChanged:(id)a3;
- (void)_handleAccessoryControllableChanged:(id)a3;
- (void)_handleAccessoryFlagsChanged:(id)a3;
- (void)_handleAccessoryNotificationsUpdated:(id)a3;
- (void)_handleCharacteristicValueUpdated:(id)a3;
- (void)_handleCharacteristicsUpdated:(id)a3;
- (void)_handleConnectivityChanged:(id)a3;
- (void)_handleMultiUserSupportUpdatedMessage:(id)a3;
- (void)_handlePairingIdentityUpdate:(id)a3;
- (void)_handlePairingStateChanged:(id)a3;
- (void)_handleRenamed:(id)a3;
- (void)_handleRequiresThreadRouterUpdateMessage:(id)a3;
- (void)_handleRootSettingsUpdated:(id)a3;
- (void)_handleServiceConfigurationState:(id)a3;
- (void)_handleServiceDefaultNameUpdate:(id)a3;
- (void)_handleServiceMediaSourceIdentifierUpdated:(id)a3;
- (void)_handleServiceRenamed:(id)a3;
- (void)_handleServiceSubtype:(id)a3;
- (void)_handleSupportsCompanionInitiatedObliterateUpdatedMessage:(id)a3;
- (void)_handleSupportsCompanionInitiatedRestartUpdatedMessage:(id)a3;
- (void)_handleSupportsDiagnosticsTransferUpdateMessage:(id)a3;
- (void)_handleTargetControlSupportUpdatedMessage:(id)a3;
- (void)_identifyWithCompletionHandler:(id)a3;
- (void)_invokeDidUpdateSupportsUWBUnlockDelegate:(BOOL)a3;
- (void)_invokeDidUpdateSupportsWalletKeyDelegate:(BOOL)a3;
- (void)_listPairingsWithCompletionHandler:(id)a3;
- (void)_mergeProfiles:(id)a3;
- (void)_notifyClientsOfDiagnosticsTransferSupportUpdate;
- (void)_notifyClientsOfHomeLevelLocationServiceSettingSupportUpdate;
- (void)_notifyClientsOfMultiUserSupportUpdate;
- (void)_notifyClientsOfSupportsCompanionInitiatedObliterateUpdate;
- (void)_notifyClientsOfSupportsCompanionInitiatedRestartUpdate;
- (void)_notifyClientsOfSupportsMusicAlarmUpdate;
- (void)_notifyClientsOfTargetControlSupportUpdate;
- (void)_notifyDelegateOfAddedControlTarget:(id)a3;
- (void)_notifyDelegateOfRemovedControlTarget:(id)a3;
- (void)_notifyDelegateOfUpdatedSettings:(id)a3;
- (void)_notifyDelegatesOfAdditionalSetupRequiredChange;
- (void)_notifyDelegatesOfUpdatedCalibrationStatus;
- (void)_notifyDelegatesOfUpdatedControllable;
- (void)_readValueForCharacteristic:(id)a3 completionHandler:(id)a4;
- (void)_recomputeAssistantIdentifier;
- (void)_unconfigure;
- (void)_updateApplicationData:(id)a3 forService:(id)a4 completionHandler:(id)a5;
- (void)_updateAssociatedServiceType:(id)a3 forService:(id)a4 completionHandler:(id)a5;
- (void)_updateAuthorizationData:(id)a3 forService:(id)a4 characteristic:(id)a5 completionHandler:(id)a6;
- (void)_updateName:(id)a3 completionHandler:(id)a4;
- (void)_updateName:(id)a3 forService:(id)a4 completionHandler:(id)a5;
- (void)_updateRoom:(id)a3 completionHandler:(id)a4;
- (void)_writeValue:(id)a3 forCharacteristic:(id)a4 service:(id)a5 completionHandler:(id)a6;
- (void)accessoryInfoDataProvider:(id)a3 didReceiveUpdatesForAccessoryWithIdentifier:(id)a4 primaryUserInfo:(id)a5;
- (void)accessoryInfoDataProvider:(id)a3 didReceiveUpdatesForAccessoryWithIdentifier:(id)a4 wifiNetworkInfo:(id)a5;
- (void)activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion:(id)a3;
- (void)activateCHIPPairingModeWithCompletion:(id)a3;
- (void)adapter:(id)a3 didUpdateSettingKeyPaths:(id)a4;
- (void)adapter:(id)a3 didUpdateSettings:(id)a4;
- (void)addControlTarget:(id)a3 completionHandler:(id)a4;
- (void)callCompletionHandler:(id)a3;
- (void)callCompletionHandler:(id)a3 error:(id)a4;
- (void)clearMatterCredentialWithType:(int64_t)a3 forUserIndex:(int64_t)a4 completion:(id)a5;
- (void)clearMatterUserWithIndex:(int64_t)a3 completion:(id)a4;
- (void)configureInfoDataProviderIfNeededWithOption:(unint64_t)a3;
- (void)configureSettingsAdapterIfNeeded;
- (void)configureSettingsAdapterWithCompletionHandler:(id)a3;
- (void)createSettingsAdapterWithDataSource:(id)a3 controller:(id)a4 context:(id)a5;
- (void)deleteSiriHistoryWithCompletion:(id)a3;
- (void)dumpMatterUsersWithCompletion:(id)a3;
- (void)fetchCHIPPairingsWithCompletion:(id)a3;
- (void)fetchManagedConfigurationProfilesWithCompletionHandler:(id)a3;
- (void)getAccessoryDiagnosticCountersWithCompletion:(id)a3;
- (void)getAccessoryDiagnosticEventsWithCompletion:(id)a3;
- (void)handleRuntimeStateUpdate:(id)a3 completionHandler:(id)a4;
- (void)identifyWithCompletionHandler:(void *)completion;
- (void)initiateDiagnosticsTransferWithCompletionHandler:(id)a3;
- (void)initiateDiagnosticsTransferWithOptions:(id)a3 completionHandler:(id)a4;
- (void)installManagedConfigurationProfileWithData:(id)a3 completionHandler:(id)a4;
- (void)notifyClientsOfUpdatedSupportsAudioReturnChannel;
- (void)notifyDelegateOfAppDataUpdateForService:(id)a3;
- (void)notifyDelegateOfAudioDestinationControllerUpdate;
- (void)notifyDelegateOfAudioDestinationUpdate;
- (void)notifyDelegateUpdatedPreferredMediaUser;
- (void)notifyDelegateUpdatedSupportsJustSiri;
- (void)notifyDelegateUpdatedSupportsMediaContentProfile;
- (void)notifyDelegateUpdatedSupportsPreferredMediaUser;
- (void)notifyDelegateUpdatedSupportsRMVonAppleTV;
- (void)pairingIdentityWithPrivateKey:(BOOL)a3 completionHandler:(id)a4;
- (void)postConfigure;
- (void)queryAdvertisementInformationWithCompletionHandler:(id)a3;
- (void)queryLastSeenStatusWithCompletion:(id)a3;
- (void)queryLinkQualityWithCompletion:(id)a3;
- (void)recomputeAssistantIdentifier;
- (void)removeCHIPPairings:(id)a3 completion:(id)a4;
- (void)removeControlTarget:(id)a3 completionHandler:(id)a4;
- (void)removeCorrespondingSystemCommissionerPairingWithCompletion:(id)a3;
- (void)removeManagedConfigurationProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)resetControlTargetsWithCompletionHandler:(id)a3;
- (void)setAccessoryFlags:(id)a3;
- (void)setAccessoryInfoDataProvider:(id)a3;
- (void)setAccessoryProfiles:(id)a3;
- (void)setAccessoryReprovisionState:(unint64_t)a3;
- (void)setAccessorySettingsController:(id)a3;
- (void)setAccessorySettingsDataSource:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAdditionalSetupStatus:(unint64_t)a3;
- (void)setApplicationData:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setAssociationOptions:(int64_t)a3;
- (void)setAudioDestination:(id)a3;
- (void)setAudioDestinationController:(id)a3;
- (void)setBridgedAccessory:(BOOL)a3;
- (void)setBulletinBoardNotificationByEndpoint:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCHIPPairingModeActive:(BOOL)a3 withCompletion:(id)a4;
- (void)setCalibrationStatus:(unint64_t)a3;
- (void)setCategory:(id)a3;
- (void)setCertificationStatus:(int64_t)a3;
- (void)setCommissioningID:(id)a3;
- (void)setConfiguredName:(id)a3;
- (void)setContext:(id)a3;
- (void)setControlTargetUUIDs:(id)a3;
- (void)setControllable:(BOOL)a3;
- (void)setCurrentAccessory:(BOOL)a3;
- (void)setCurrentServices:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDevice:(id)a3;
- (void)setDeviceIRKData:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setFirmwareUpdateAvailable:(BOOL)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setHasOnboardedForNaturalLighting:(BOOL)a3;
- (void)setHasOnboardedForNaturalLightingWithCompletion:(id)a3;
- (void)setHasSymptomsHandler:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setHomePodVariant:(unint64_t)a3;
- (void)setKnownToSystemCommissioner:(BOOL)a3;
- (void)setManufacturer:(id)a3;
- (void)setMfiCertifiedACWG:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setNetworkProtectionGroupUUID:(id)a3;
- (void)setNodeID:(id)a3;
- (void)setPaired:(BOOL)a3;
- (void)setPeerIdentifier:(id)a3;
- (void)setPendingConfigurationIdentifier:(id)a3;
- (void)setPreferredMediaUserUUID:(id)a3;
- (void)setPreferredUserSelectionType:(unint64_t)a3;
- (void)setProductColor:(int64_t)a3;
- (void)setProductID:(id)a3;
- (void)setReachable:(BOOL)a3;
- (void)setReachableTransports:(int64_t)a3;
- (void)setReaderGroupSubIdentifierACWG:(id)a3;
- (void)setReaderIDACWG:(id)a3;
- (void)setRemoteLoginHandler:(id)a3;
- (void)setRequiresThreadRouter:(BOOL)a3;
- (void)setRoom:(id)a3;
- (void)setRootPublicKey:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSettingsAdapter:(id)a3;
- (void)setSoftwareUpdateController:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setSupportedDiagnostics:(id)a3;
- (void)setSupportedStereoPairVersions:(unint64_t)a3;
- (void)setSupportsAccessCodes:(BOOL)a3;
- (void)setSupportsAnnounce:(BOOL)a3;
- (void)setSupportsAudioAnalysis:(BOOL)a3;
- (void)setSupportsAudioReturnChannel:(BOOL)a3;
- (void)setSupportsCHIP:(BOOL)a3;
- (void)setSupportsCompanionInitiatedObliterate:(BOOL)a3;
- (void)setSupportsCompanionInitiatedRestart:(BOOL)a3;
- (void)setSupportsCoordinationDoorbellChime:(BOOL)a3;
- (void)setSupportsDiagnosticsTransfer:(BOOL)a3;
- (void)setSupportsDoorbellChime:(BOOL)a3;
- (void)setSupportsDropIn:(BOOL)a3;
- (void)setSupportsHomeLevelLocationServiceSetting:(BOOL)a3;
- (void)setSupportsIdentify:(BOOL)a3;
- (void)setSupportsJustSiri:(BOOL)a3;
- (void)setSupportsManagedConfigurationProfile:(BOOL)a3;
- (void)setSupportsMediaAccessControl:(BOOL)a3;
- (void)setSupportsMediaActions:(BOOL)a3;
- (void)setSupportsMediaContentProfile:(BOOL)a3;
- (void)setSupportsMessagedHomePodSettings:(BOOL)a3;
- (void)setSupportsMultiUser:(BOOL)a3;
- (void)setSupportsMusicAlarm:(BOOL)a3;
- (void)setSupportsNativeMatter:(BOOL)a3;
- (void)setSupportsPreferredMediaUser:(BOOL)a3;
- (void)setSupportsPrimaryUserInfoSubscription:(BOOL)a3;
- (void)setSupportsRMVonAppleTV:(BOOL)a3;
- (void)setSupportsSoftwareUpdateV2:(BOOL)a3;
- (void)setSupportsTargetControl:(BOOL)a3;
- (void)setSupportsTargetController:(BOOL)a3;
- (void)setSupportsThirdPartyMusic:(BOOL)a3;
- (void)setSupportsUWBUnlock:(BOOL)a3;
- (void)setSupportsUserMediaSettings:(BOOL)a3;
- (void)setSupportsWalletKey:(BOOL)a3;
- (void)setSuspendCapable:(BOOL)a3;
- (void)setSuspendedState:(unint64_t)a3;
- (void)setSymptomsHandler:(id)a3;
- (void)setTargetControllerHardwareSupport:(BOOL)a3;
- (void)setTransportTypes:(unint64_t)a3;
- (void)setUniqueIdentifiersForBridgedAccessories:(id)a3;
- (void)setVendorID:(id)a3;
- (void)setWeekDaySchedulesPerUserCapacity:(id)a3;
- (void)setWifiNetworkInfo:(id)a3;
- (void)setYearDaySchedulesPerUserCapacity:(id)a3;
- (void)unconfigureInfoDataProviderWithOptions:(unint64_t)a3;
- (void)updateAccessoryInfo:(id)a3;
- (void)updateAccessoryName:(id)a3 completionHandler:(id)a4;
- (void)updateApplicationData:(id)a3 completionHandler:(id)a4;
- (void)updateApplicationData:(id)a3 forService:(id)a4 completionHandler:(id)a5;
- (void)updateAudioDestinationSupportedOptions:(unint64_t)a3 completion:(id)a4;
- (void)updateName:(NSString *)name completionHandler:(void *)completion;
- (void)updatePendingConfigurationIdentifier:(id)a3 completionHandler:(id)a4;
- (void)updatePreferredMediaUser:(id)a3 completionHandler:(id)a4;
- (void)updatePreferredMediaUserSelectionType:(unint64_t)a3 user:(id)a4 completionHandler:(id)a5;
- (void)updateSettingWithKeyPath:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)updateSettingsAdapterSettingReflected:(BOOL)a3;
- (void)updateShouldProcessTransactionRemovalWithValue:(BOOL)a3 completion:(id)a4;
- (void)validatePairingAuthMethodWithCompletion:(id)a3;
- (void)wakeSuspendedAccessoryWithWakeType:(unint64_t)a3 completion:(id)a4;
@end

@implementation HMAccessory

- (id)siriEndpointProfile
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(HMAccessory *)self accessoryProfiles];
  v3 = [v2 array];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(id *)(*((void *)&v13 + 1) + 8 * v8);
      objc_opt_class();
      id v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
      id v11 = v10;

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    id v9 = 0;
  }

  return v9;
}

- (id)mediaProfile
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(HMAccessory *)self accessoryProfiles];
  v3 = [v2 array];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(id *)(*((void *)&v13 + 1) + 8 * v8);
      objc_opt_class();
      id v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
      id v11 = v10;

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    id v9 = 0;
  }

  return v9;
}

- (void)_handleCharacteristicsUpdated:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 messagePayload];
  uint64_t v6 = objc_msgSend(v5, "hmf_dictionaryForKey:", @"kCharacteristicAndValueKey");

  if (!v6) {
    goto LABEL_56;
  }
  uint64_t v7 = [v4 headers];
  v65 = objc_msgSend(v7, "hmf_dateForKey:", @"HMXPCMessageSentDateKey");

  v64 = +[HMHAPMetadata getSharedInstance];
  v63 = [(HMAccessory *)self delegate];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = v6;
  uint64_t v57 = [obj countByEnumeratingWithState:&v92 objects:v103 count:16];
  if (!v57) {
    goto LABEL_54;
  }
  v54 = v6;
  id v55 = v4;
  int v66 = 0;
  uint64_t v56 = *(void *)v93;
  v69 = self;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v93 != v56) {
        objc_enumerationMutation(obj);
      }
      uint64_t v59 = v8;
      uint64_t v9 = *(void *)(*((void *)&v92 + 1) + 8 * v8);
      v60 = [obj objectForKeyedSubscript:v9];
      id v10 = objc_msgSend(v60, "hmf_dictionaryForKey:", @"kModifiedCharacteristicsForAccessoryKey");
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v70 = v10;
      uint64_t v11 = [v70 countByEnumeratingWithState:&v88 objects:v102 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v67 = *(void *)v89;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v89 != v67) {
              objc_enumerationMutation(v70);
            }
            uint64_t v14 = *(void *)(*((void *)&v88 + 1) + 8 * i);
            long long v15 = [v70 objectForKeyedSubscript:v14];
            long long v16 = [v15 objectForKeyedSubscript:@"kCharacteristicValue"];
            v17 = objc_msgSend(v15, "hmf_dateForKey:", @"kCharacteristicNotificationEnableTime");
            uint64_t v18 = [(HMAccessory *)self _findCharacteristic:v14 forService:v9];
            if (v18)
            {
              v19 = [MEMORY[0x1E4F1CA98] null];
              int v20 = [v16 isEqual:v19];

              if (v20)
              {

                long long v16 = 0;
              }
              v21 = [v18 value];
              if (HMFEqualObjects())
              {
LABEL_21:
              }
              else
              {
                v22 = [v18 characteristicType];
                char v23 = [v64 shouldNotCacheCharacteristicOfType:v22];

                if ((v23 & 1) == 0)
                {
                  v21 = [v18 service];
                  v24 = [v21 accessory];
                  if (v24 && (objc_opt_respondsToSelector() & 1) != 0)
                  {
                    v61 = [(HMAccessory *)v69 context];
                    v25 = [v61 delegateCaller];
                    v83[0] = MEMORY[0x1E4F143A8];
                    v83[1] = 3221225472;
                    v83[2] = __45__HMAccessory__handleCharacteristicsUpdated___block_invoke;
                    v83[3] = &unk_1E5944F20;
                    id v84 = v63;
                    id v85 = v24;
                    id v86 = v21;
                    id v87 = v18;
                    [v25 invokeBlock:v83];
                  }
                  goto LABEL_21;
                }
              }
              [v18 _updateValue:v16 valueUpdatedDate:v65];
              if (v17) {
                [v18 setNotificationEnabledTime:v17];
              }
            }

            self = v69;
          }
          uint64_t v12 = [v70 countByEnumeratingWithState:&v88 objects:v102 count:16];
        }
        while (v12);
      }

      v26 = objc_msgSend(v60, "hmf_arrayForKey:", @"kRemovedCharacteristicIDsForAccessoryKey");
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v27 = v26;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v79 objects:v101 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v80;
        int v31 = v66;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v80 != v30) {
              objc_enumerationMutation(v27);
            }
            v33 = [(HMAccessory *)self _findCharacteristic:*(void *)(*((void *)&v79 + 1) + 8 * j) forService:v9];
            if (v33)
            {
              v34 = [(HMAccessory *)self _findService:v9];
              [v34 _removeCharacteristic:v33];

              int v31 = 1;
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v79 objects:v101 count:16];
        }
        while (v29);
      }
      else
      {
        int v31 = v66;
      }
      int v66 = v31;
      v62 = v27;

      v35 = objc_msgSend(v60, "hmf_dictionaryForKey:", @"kAddedCharacteristicsForAccessoryKey");
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v36 = v35;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v75 objects:v100 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v68 = *(void *)v76;
        do
        {
          for (uint64_t k = 0; k != v38; ++k)
          {
            if (*(void *)v76 != v68) {
              objc_enumerationMutation(v36);
            }
            uint64_t v40 = *(void *)(*((void *)&v75 + 1) + 8 * k);
            v41 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v42 = objc_opt_class();
            v43 = [v36 objectForKeyedSubscript:v40];
            id v74 = 0;
            v44 = [v41 unarchivedObjectOfClass:v42 fromData:v43 error:&v74];
            id v45 = v74;

            if (v44)
            {
              v46 = [(HMAccessory *)self _findService:v9];
              [v46 _addCharacteristic:v44];
              v47 = [(HMAccessory *)self context];
              objc_msgSend(v44, "__configureWithContext:service:", v47, v46);

              int v66 = 1;
            }
            else
            {
              v48 = (void *)MEMORY[0x19F3A64A0]();
              v49 = self;
              v50 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                v51 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v97 = v51;
                __int16 v98 = 2112;
                id v99 = v45;
                _os_log_impl(&dword_19D1A8000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive characteristic from added characteristics array: %@", buf, 0x16u);
              }
              self = v69;
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v75 objects:v100 count:16];
        }
        while (v38);
      }

      uint64_t v8 = v59 + 1;
    }
    while (v59 + 1 != v57);
    uint64_t v57 = [obj countByEnumeratingWithState:&v92 objects:v103 count:16];
  }
  while (v57);

  uint64_t v6 = v54;
  id v4 = v55;
  if (v66 & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v52 = [(HMAccessory *)self context];
    v53 = [v52 delegateCaller];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __45__HMAccessory__handleCharacteristicsUpdated___block_invoke_1289;
    v71[3] = &unk_1E5945628;
    id v72 = v63;
    v73 = self;
    [v53 invokeBlock:v71];

    obuint64_t j = v72;
LABEL_54:
  }
LABEL_56:
}

- (id)lightProfiles
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v4 = [(HMAccessory *)self profiles];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(HMAccessory *)self profiles];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        id v13 = v12;

        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v14 = (void *)[v5 copy];

  return v14;
}

- (NSArray)cameraProfiles
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(HMAccessory *)self profiles];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
        id v11 = v10;

        if (v11) {
          objc_msgSend(v3, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = (void *)[v3 copy];

  return (NSArray *)v12;
}

- (id)_findService:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(HMAccessory *)self services];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 instanceID];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)services
{
  v2 = [(HMAccessory *)self currentServices];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMMutableArray)currentServices
{
  return self->_currentServices;
}

- (NSArray)profiles
{
  v2 = [(HMAccessory *)self accessoryProfiles];
  id v3 = [v2 array];

  return (NSArray *)v3;
}

- (HMAccessoryCategory)category
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_category;
  BOOL supportsTargetController = self->_supportsTargetController;
  os_unfair_lock_unlock(p_lock);
  id v6 = [(HMAccessoryCategory *)v4 categoryType];
  int v7 = [v6 isEqual:@"0FBA259B-05AC-46F2-875F-204ABB6D9FE7"];

  if (v7)
  {
    uint64_t v8 = +[HMHAPMetadata getSharedInstance];
    id v9 = v8;
    if (supportsTargetController)
    {
      uint64_t v10 = [v8 categoryForCategoryUUIDString:@"770ADB51-8848-491A-BFA3-C34EA096CC92"];

      id v4 = (HMAccessoryCategory *)v10;
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      char v11 = [(HMAccessory *)self accessoryProfiles];
      uint64_t v12 = [v11 array];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(id *)(*((void *)&v21 + 1) + 8 * i);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0 && v17)
            {
              uint64_t v19 = [v9 categoryForCategoryUUIDString:@"C9EE63DB-2FF7-4514-826A-2FC2F0D4C9F0"];

              id v4 = (HMAccessoryCategory *)v19;
              goto LABEL_15;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
  }

  return v4;
}

- (HMMutableArray)accessoryProfiles
{
  return self->_accessoryProfiles;
}

- (id)_findCharacteristic:(id)a3 forService:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(HMAccessory *)self _findService:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = objc_msgSend(v7, "characteristics", 0);
    id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v14 = [v13 instanceID];
          char v15 = [v14 isEqual:v6];

          if (v15)
          {
            id v10 = v13;
            goto LABEL_12;
          }
        }
        id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (NSUUID)uniqueIdentifier
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    uint64_t v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  int v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)delegate
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);

  return WeakRetained;
}

- (BOOL)mfiCertifiedACWG
{
  return self->_mfiCertifiedACWG;
}

- (BOOL)isAdditionalSetupRequired
{
  unint64_t v3 = [(HMAccessory *)self additionalSetupStatus];
  if (v3) {
    LOBYTE(v3) = [(HMAccessory *)self additionalSetupStatus] == 1;
  }
  return v3;
}

- (unint64_t)additionalSetupStatus
{
  return self->_additionalSetupStatus;
}

- (NSArray)uniqueIdentifiersForBridgedAccessories
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_uniqueIdentifiersForBridgedAccessories;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMApplicationData)applicationData
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_applicationData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (unint64_t)suspendedState
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t suspendedState = self->_suspendedState;
  os_unfair_lock_unlock(p_lock);
  return suspendedState;
}

- (BOOL)bridgedAccessory
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_bridgedAccessory;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isFirmwareUpdateAvailable
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_firmwareUpdateAvailable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int64_t)certificationStatus
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t certificationStatus = self->_certificationStatus;
  os_unfair_lock_unlock(p_lock);
  return certificationStatus;
}

- (unint64_t)accessoryReprovisionState
{
  return self->_accessoryReprovisionState;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsSoftwareUpdateV2
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsSoftwareUpdateV2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_handleAccessoryNotificationsUpdated:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33 = self;
  uint64_t v5 = [(HMAccessory *)self context];
  id v6 = [v5 pendingRequests];

  int v7 = [v4 identifier];
  uint64_t v30 = v6;
  v41 = [v6 removeCompletionBlockForIdentifier:v7];

  int v31 = v4;
  [v4 dictionaryForKey:@"kModifiedNotificationsForAccessoryKey"];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  id v8 = 0;
  if (v34)
  {
    uint64_t v32 = *(void *)v53;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v53 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v9;
        uint64_t v10 = *(void *)(*((void *)&v52 + 1) + 8 * v9);
        uint64_t v11 = [(HMAccessory *)v33 home];
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
        uint64_t v42 = [v11 accessoryWithUUID:v12];

        uint64_t v13 = objc_msgSend(obj, "hmf_dictionaryForKey:", v10);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v39 = v13;
        uint64_t v38 = [v13 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (v38)
        {
          uint64_t v37 = *(void *)v49;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v49 != v37) {
                objc_enumerationMutation(v39);
              }
              uint64_t v40 = v14;
              uint64_t v43 = *(void *)(*((void *)&v48 + 1) + 8 * v14);
              char v15 = objc_msgSend(v39, "hmf_dictionaryForKey:");
              long long v44 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v56 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v45;
                do
                {
                  for (uint64_t i = 0; i != v17; ++i)
                  {
                    if (*(void *)v45 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                    long long v21 = [v42 _findCharacteristic:v20 forService:v43];
                    uint64_t v22 = objc_msgSend(v15, "hmf_dictionaryForKey:", v20);
                    long long v23 = [v22 errorFromDataForKey:@"kCharacteristicErrorDataKey"];
                    long long v24 = v23;
                    if (v23)
                    {
                      v25 = v8;
                      id v8 = v23;
                    }
                    else
                    {
                      id v26 = v8;
                      uint64_t v27 = objc_msgSend(v22, "hmf_BOOLForKey:", @"kCharacteristicNotificationEnableKey");
                      v25 = objc_msgSend(v22, "hmf_dateForKey:", @"kCharacteristicNotificationEnableTime");
                      [v21 setNotificationEnabled:v27];
                      if (v25) {
                        [v21 setNotificationEnabledTime:v25];
                      }
                      if (v41) {
                        [v21 setNotificationEnabledByThisClient:v27];
                      }
                      id v8 = v26;
                    }
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v56 count:16];
                }
                while (v17);
              }

              uint64_t v14 = v40 + 1;
            }
            while (v40 + 1 != v38);
            uint64_t v38 = [v39 countByEnumeratingWithState:&v48 objects:v57 count:16];
          }
          while (v38);
        }

        uint64_t v9 = v36 + 1;
      }
      while (v36 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v34);
  }
  if (v41)
  {
    uint64_t v28 = [(HMAccessory *)v33 context];
    uint64_t v29 = [v28 delegateCaller];
    [v29 callCompletion:v41 error:v8];
  }
}

- (HMHome)home
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);

  return (HMHome *)WeakRetained;
}

- (HMAccessory)initWithCoder:(id)a3
{
  uint64_t v180 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hm_decodeAndCacheUUIDFromStringForKey:", @"accessoryUUID");
  if (v5)
  {
    id v6 = [(HMAccessory *)self initWithUUID:v5];
    if (v6)
    {
      int v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
      objc_storeWeak((id *)&v6->_home, v7);

      uint64_t v8 = objc_msgSend(v4, "hm_decodeHMAccessoryCategoryAndCacheForKey:", @"HM.accessoryCategory");
      category = v6->_category;
      v6->_category = (HMAccessoryCategory *)v8;

      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryRoom"];
      objc_storeWeak((id *)&v6->_room, v10);

      v6->_bridgedAccessory = [v4 decodeBoolForKey:@"isBridged"];
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryName"];
      name = v6->_name;
      v6->_name = (NSString *)v11;

      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryConfiguredName"];
      configuredName = v6->_configuredName;
      v6->_configuredName = (NSString *)v13;

      uint64_t v15 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"accessoryServerIdentifier");
      deviceIdentifier = v6->_deviceIdentifier;
      v6->_deviceIdentifier = (NSString *)v15;

      uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.pendingConfigurationIdentifier"];
      pendingConfigurationIdentifier = v6->_pendingConfigurationIdentifier;
      v6->_pendingConfigurationIdentifier = (NSString *)v17;

      v6->_paired = [v4 decodeBoolForKey:@"paired"];
      v6->_reachable = [v4 decodeBoolForKey:@"reachable"];
      v6->_reachableTransports = [v4 decodeIntegerForKey:@"HM.reachability"];
      v6->_transportTypes = [v4 decodeIntegerForKey:@"HM.accessoryTransportTypes"];
      v6->_supportsIdentify = [v4 decodeBoolForKey:@"HM.supportsIdentify"];
      v6->_currentAccessory = [v4 decodeBoolForKey:@"HM.currentAccessory"];
      uint64_t v19 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"HM.manufacturer");
      manufacturer = v6->_manufacturer;
      v6->_manufacturer = (NSString *)v19;

      uint64_t v21 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"HM.model");
      model = v6->_model;
      v6->_model = (NSString *)v21;

      int v23 = [v4 decodeBoolForKey:@"HMA.supportsCHIP"];
      v6->_supportsCHIP = v23;
      if (v23) {
        long long v24 = @"HM.displayableFirmwareVersion";
      }
      else {
        long long v24 = @"HM.firmwareVersion";
      }
      uint64_t v25 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", v24);
      firmwareVersion = v6->_firmwareVersion;
      v6->_firmwareVersion = (NSString *)v25;

      uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.serialNumber"];
      serialNumber = v6->_serialNumber;
      v6->_serialNumber = (NSString *)v27;

      uint64_t v29 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"HM.bundleID");
      bundleID = v6->_bundleID;
      v6->_bundleID = (NSString *)v29;

      uint64_t v31 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"HM.storeID");
      storeID = v6->_storeID;
      v6->_storeID = (NSString *)v31;

      v6->_firmwareUpdateAvailable = [v4 decodeBoolForKey:@"HM.firmwareUpdateAvailable"];
      if ([v4 containsValueForKey:@"HM.accessoryReprovisionState"]) {
        v6->_accessoryReprovisionState = (int)[v4 decodeInt32ForKey:@"HM.accessoryReprovisionState"];
      }
      v33 = (void *)MEMORY[0x1E4F1CAD0];
      v175[0] = objc_opt_class();
      v175[1] = objc_opt_class();
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:2];
      v35 = [v33 setWithArray:v34];
      uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"services"];

      v164 = (void *)v36;
      [(HMMutableArray *)v6->_currentServices setArray:v36];
      int v37 = [v4 decodeBoolForKey:@"suspendCapable"];
      v6->_suspendCapable = v37;
      if (v37) {
        v6->_reachable = 1;
      }
      if ([v4 containsValueForKey:@"HM.suspendedState"]) {
        v6->_unint64_t suspendedState = [v4 decodeIntegerForKey:@"HM.suspendedState"];
      }
      if ([v4 containsValueForKey:@"HM.certificationStatus"]) {
        uint64_t v38 = [v4 decodeIntegerForKey:@"HM.certificationStatus"];
      }
      else {
        uint64_t v38 = 0;
      }
      v6->_int64_t certificationStatus = v38;
      uint64_t v43 = (void *)MEMORY[0x1E4F1CAD0];
      v174[0] = objc_opt_class();
      v174[1] = objc_opt_class();
      long long v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v174 count:2];
      long long v45 = [v43 setWithArray:v44];
      long long v46 = [v4 decodeObjectOfClasses:v45 forKey:@"controlTargets"];

      v162 = v46;
      uint64_t v47 = objc_msgSend(v46, "na_map:", &__block_literal_global_34595);
      controlTargetUUIDs = v6->_controlTargetUUIDs;
      v6->_controlTargetUUIDs = (NSArray *)v47;

      v6->_associationOptions = [v4 decodeIntegerForKey:@"HM.associationOptions"];
      long long v49 = (void *)MEMORY[0x1E4F1CAD0];
      v173[0] = objc_opt_class();
      v173[1] = objc_opt_class();
      long long v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:2];
      long long v51 = [v49 setWithArray:v50];
      long long v52 = [v4 decodeObjectOfClasses:v51 forKey:@"identifiersForBridgedAccessories"];

      v163 = v52;
      if ([v52 count])
      {
        long long v53 = [MEMORY[0x1E4F1CA48] array];
        long long v165 = 0u;
        long long v166 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        id v54 = v52;
        uint64_t v55 = [v54 countByEnumeratingWithState:&v165 objects:v172 count:16];
        if (v55)
        {
          uint64_t v56 = v55;
          uint64_t v57 = *(void *)v166;
          do
          {
            for (uint64_t i = 0; i != v56; ++i)
            {
              if (*(void *)v166 != v57) {
                objc_enumerationMutation(v54);
              }
              uint64_t v59 = objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", *(void *)(*((void *)&v165 + 1) + 8 * i));
              [(NSArray *)v53 addObject:v59];
            }
            uint64_t v56 = [v54 countByEnumeratingWithState:&v165 objects:v172 count:16];
          }
          while (v56);
        }

        uniqueIdentifiersForBridgedAccessories = v6->_uniqueIdentifiersForBridgedAccessories;
        v6->_uniqueIdentifiersForBridgedAccessories = v53;
      }
      v61 = [[HMApplicationData alloc] initWithDictionaryFromCoder:v4 key:@"HM.appData"];
      applicationData = v6->_applicationData;
      v6->_applicationData = v61;

      uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryFlagsCodingKey"];
      v161 = (void *)v63;
      if (v63)
      {
        objc_storeStrong((id *)&v6->_accessoryFlags, (id)v63);
        if ([(NSNumber *)v6->_accessoryFlags integerValue]) {
          uint64_t v64 = 1;
        }
        else {
          uint64_t v64 = 2;
        }
        v6->_additionalSetupStatus = v64;
        if (([(NSNumber *)v6->_accessoryFlags integerValue] & 2) != 0) {
          uint64_t v63 = 1;
        }
        else {
          uint64_t v63 = 2;
        }
      }
      else
      {
        v6->_additionalSetupStatus = 0;
      }
      v6->_calibrationStatus = v63;
      v65 = (void *)MEMORY[0x1E4F1CAD0];
      v171[0] = objc_opt_class();
      v171[1] = objc_opt_class();
      int v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:2];
      uint64_t v67 = [v65 setWithArray:v66];
      uint64_t v68 = [v4 decodeObjectOfClasses:v67 forKey:@"HM.accessoryProfiles"];

      v69 = [(HMAccessory *)v6 accessoryProfiles];
      id v70 = +[HMAccessory _cameraProfilesForAccessoryProfiles:v68];
      [v69 addObjectsFromArray:v70];

      v71 = [(HMAccessory *)v6 accessoryProfiles];
      id v72 = +[HMAccessory _mediaProfilesForAccessoryProfiles:v68];
      [v71 addObjectsFromArray:v72];

      v73 = [(HMAccessory *)v6 accessoryProfiles];
      id v74 = [MEMORY[0x1E4F1CAD0] setWithArray:v68];
      long long v75 = +[HMAccessory _lightProfilesForAccessoryProfiles:v74];
      long long v76 = [v75 allObjects];
      [v73 addObjectsFromArray:v76];

      long long v77 = [(HMAccessory *)v6 accessoryProfiles];
      long long v78 = +[HMAccessory _siriEndpointProfilesForAccessoryProfiles:v68];
      [v77 addObjectsFromArray:v78];

      long long v79 = [(HMAccessory *)v6 accessoryProfiles];
      if (HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken != -1) {
        dispatch_once(&HMIsCurrentProcessSPIEntitled_spiEntitledOnceToken, &__block_literal_global_149);
      }
      long long v80 = +[HMAccessory televisionProfilesForAccessoryServices:v164 isSPIEntitled:HMIsCurrentProcessSPIEntitled_spiEntitled];
      [v79 addObjectsFromArray:v80];

      long long v81 = [(HMAccessory *)v6 accessoryProfiles];
      long long v82 = [(HMAccessory *)v6 uniqueIdentifier];
      v83 = +[HMAccessory _networkConfigurationProfilesForCoder:v4 accessoryIdentifier:v82];
      [v81 addObjectsFromArray:v83];

      id v84 = [(HMAccessory *)v6 accessoryProfiles];
      id v85 = +[HMAccessory _doorbellProfilesForAccessoryProfiles:v68];
      [v84 addObjectsFromArray:v85];

      uint64_t v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.settings"];
      if (v86)
      {
        id v87 = [[HMAccessorySettingGroup alloc] initWithInternal:v86];
        long long v88 = [[HMAccessorySettings alloc] initWithSettingsContainer:v6 settingsControl:v6 rootGroup:v87];
        settings = v6->_settings;
        v6->_settings = v88;
      }
      uint64_t v90 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.device"];
      device = v6->_device;
      v6->_device = (HMDevice *)v90;

      uint64_t v92 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.deviceIRK"];
      deviceIRKData = v6->_deviceIRKData;
      v6->_deviceIRKData = (NSData *)v92;

      uint64_t v94 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.softwareVersion"];
      softwareVersion = v6->_softwareVersion;
      v6->_softwareVersion = (HMFSoftwareVersion *)v94;

      if ([v4 containsValueForKey:@"HM.accountIdentifier"])
      {
        uint64_t v96 = objc_msgSend(v4, "hm_decodeAndCacheUUIDForKey:", @"HM.accountIdentifier");
        accountIdentifier = v6->_accountIdentifier;
        v6->_accountIdentifier = (NSUUID *)v96;
      }
      v6->_controllable = [v4 decodeBoolForKey:@"HMA.controllable"];
      if ([v4 containsValueForKey:@"HM.softwareUpdate"])
      {
        __int16 v98 = [[HMSoftwareUpdateController alloc] initWithAccessory:v6];
        softwareUpdateController = v6->_softwareUpdateController;
        v6->_softwareUpdateController = v98;

        v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.softwareUpdate"];
        if (v100) {
          [(HMSoftwareUpdateController *)v6->_softwareUpdateController setAvailableUpdate:v100];
        }
      }
      v160 = (void *)v86;
      uint64_t v101 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.remoteLoginHandler"];
      remoteLoginHandler = v6->_remoteLoginHandler;
      v6->_remoteLoginHandler = (HMRemoteLoginHandler *)v101;

      v6->_hasSymptomsHandler = [v4 decodeBoolForKey:@"HM.hasSymptomsHandler"];
      v6->_supportsMediaAccessControl = [v4 decodeBoolForKey:@"HMA.supportsMediaAccessControl"];
      v6->_knownToSystemCommissioner = [v4 decodeBoolForKey:@"HMA.knownToSystemCommissioner"];
      uint64_t v103 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.rootPublicKey"];
      rootPublicKey = v6->_rootPublicKey;
      v6->_rootPublicKey = (NSData *)v103;

      uint64_t v105 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.nodeID"];
      nodeID = v6->_nodeID;
      v6->_nodeID = (NSNumber *)v105;

      uint64_t v107 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.commissioningID"];
      commissioningID = v6->_commissioningID;
      v6->_commissioningID = (NSUUID *)v107;

      uint64_t v109 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.vendorID"];
      vendorID = v6->_vendorID;
      v6->_vendorID = (NSNumber *)v109;

      uint64_t v111 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.productID"];
      productID = v6->_productID;
      v6->_productID = (NSNumber *)v111;

      uint64_t v113 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.matterNodeID"];
      matterNodeID = v6->_matterNodeID;
      v6->_matterNodeID = (NSNumber *)v113;

      v6->_requiresThreadRouter = [v4 decodeBoolForKey:@"HMA.requiresThreadRouter"];
      v6->_supportsNativeMatter = [v4 decodeBoolForKey:@"HMA.supportsNativeMatter"];
      uint64_t v115 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.wifiNetworkInfo"];
      wifiNetworkInfo = v6->_wifiNetworkInfo;
      v6->_wifiNetworkInfo = (HMFWiFiNetworkInfo *)v115;

      v6->_supportsTargetControl = [v4 decodeBoolForKey:@"HMCT.supportsTargetControl"];
      v6->_BOOL supportsTargetController = [v4 decodeBoolForKey:@"HMCT.supportsTargetController"];
      v6->_targetControllerHardwareSupport = [v4 decodeBoolForKey:@"HMCT.targetControllerHardwareSupport"];
      v6->_supportsMultiUser = [v4 decodeBoolForKey:@"HMA.supportsMultiUser"];
      v6->_supportsHomeLevelLocationServiceSetting = [v4 decodeBoolForKey:@"HMA.HomeLevelLocationServiceSetting"];
      v6->_supportsAudioReturnChannel = [v4 decodeBoolForKey:@"HMA.supportsAudioReturnChannel"];
      v6->_supportsCompanionInitiatedRestart = [v4 decodeBoolForKey:@"HMA.supportsCompanionInitiatedRestart"];
      v6->_supportsCompanionInitiatedObliterate = [v4 decodeBoolForKey:@"HMA.supportsCompanionInitiatedObliterate"];
      v6->_supportsMusicAlarm = [v4 decodeBoolForKey:@"HMA.SupportsMusicAlarm"];
      v6->_supportsMediaContentProfile = [v4 decodeBoolForKey:@"HM.ac.mediacontentprofile"];
      v117 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.protectionGroupUID"];
      if (v117)
      {
        uint64_t v118 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v117];
        networkProtectionGroupUUID = v6->_networkProtectionGroupUUID;
        v6->_networkProtectionGroupUUID = (NSUUID *)v118;
      }
      v120 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAudioDestinationControllerDataCodingKey"];
      if (v120)
      {
        v121 = [[HMMediaDestinationController alloc] initWithControllerData:v120];
        audioDestinationController = v6->_audioDestinationController;
        v6->_audioDestinationController = v121;
      }
      else
      {
        audioDestinationController = v6->_audioDestinationController;
        v6->_audioDestinationController = 0;
      }

      uint64_t v123 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryAudioDestinationCodingKey"];
      audioDestination = v6->_audioDestination;
      v6->_audioDestination = (HMMediaDestination *)v123;

      v125 = [(HMAccessory *)v6 category];
      v126 = [v125 categoryType];
      int v127 = [v126 isEqual:@"1D8FD40E-7CAE-4AD5-9973-977D18890DE2"];

      if (v127)
      {
        uint64_t v128 = [v4 decodeBoolForKey:@"HMA.audioAnalysisEventBulletinBoardNotificationEnabled"];
        v129 = (void *)MEMORY[0x1E4F1CAD0];
        v170[0] = objc_opt_class();
        v170[1] = objc_opt_class();
        v130 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:2];
        v131 = [v129 setWithArray:v130];
        v132 = [v4 decodeObjectOfClasses:v131 forKey:@"HMA.audioAnalysisEventBulletinBoardNotificationCondition"];

        v133 = [(HMAccessory *)v6 home];
        v134 = +[HMPredicateUtilities rewritePredicateForClient:v132 home:v133];

        v135 = [[HMAudioAnalysisEventBulletinBoardNotification alloc] initWithEnabled:v128 condition:v134 accessoryIdentifier:v5];
        audioAnalysisEventBulletinBoardNotification = v6->_audioAnalysisEventBulletinBoardNotification;
        v6->_audioAnalysisEventBulletinBoardNotification = v135;
      }
      v6->_supportsAudioAnalysis = objc_msgSend(v4, "decodeBoolForKey:", @"HMA.SupportsAudioAnalysis", v68);
      v6->_supportsDropIn = [v4 decodeBoolForKey:@"HMA.SupportsDropIn"];
      v6->_supportsAnnounce = [v4 decodeBoolForKey:@"HMA.SupportsAnnounce"];
      v6->_supportsMediaActions = [v4 decodeBoolForKey:@"HMA.SupportsMediaActions"];
      v6->_supportsAccessCodes = [v4 decodeBoolForKey:@"HMAccessorySupportsAccessCodeCodingKey"];
      v6->_supportsWalletKey = [v4 decodeBoolForKey:@"HMAccessorySupportsWalletCodingKey"];
      v6->_supportsUWBUnlocuint64_t k = [v4 decodeBoolForKey:@"HMAccessorySupportsUWBUnlockCodingKey"];
      uint64_t v137 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryReaderGroupSubIdentifierACWGCodingKey"];
      readerGroupSubIdentifierACWG = v6->_readerGroupSubIdentifierACWG;
      v6->_readerGroupSubIdentifierACWG = (NSData *)v137;

      uint64_t v139 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryReaderIDACWGCodingKey"];
      readerIDACWG = v6->_readerIDACWG;
      v6->_readerIDACWG = (NSData *)v139;

      v6->_mfiCertifiedACWG = [v4 decodeBoolForKey:@"HMAccessoryMFiCertifiedACWGCodingKey"];
      uint64_t v141 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryWeekDayScheduleCapacityCodingKey"];
      weekDaySchedulesPerUserCapacity = v6->_weekDaySchedulesPerUserCapacity;
      v6->_weekDaySchedulesPerUserCapacity = (NSNumber *)v141;

      uint64_t v143 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAccessoryYearDayScheduleCapacityCodingKey"];
      yearDaySchedulesPerUserCapacity = v6->_yearDaySchedulesPerUserCapacity;
      v6->_yearDaySchedulesPerUserCapacity = (NSNumber *)v143;

      v6->_supportsDoorbellChime = [v4 decodeBoolForKey:@"HMA.SupportsDoorbellChime"];
      v6->_supportsCoordinationDoorbellChime = [v4 decodeBoolForKey:@"HMA.SupportsCoordinationDoorbellChime"];
      v6->_supportsUserMediaSettings = [v4 decodeBoolForKey:@"HMA.SupportsUserMediaSetting"];
      v6->_supportsThirdPartyMusic = [v4 decodeBoolForKey:@"HMA.supportsThirdPartyMusic"];
      v6->_supportsPreferredMediaUser = [v4 decodeBoolForKey:@"HM.ac.supportsPreferredMediaUser"];
      v6->_supportsMessagedHomePodSettings = [v4 decodeBoolForKey:@"HMA.HMAccessorySupportsMessagedHomePodSettingsCodingKey"];
      v6->_supportsPrimaryUserInfoSubscription = [v4 decodeBoolForKey:@"HMA.HMAccessorySupportsPrimaryUserInfoSubscriptionCodingKey"];
      if (!v6->_supportsMessagedHomePodSettings)
      {
        uint64_t v145 = objc_msgSend(v4, "hm_decodeAndCacheUUIDForKey:", @"HM.ac.preferredMediaUser");
        preferredMediaUserUUID = v6->_preferredMediaUserUUID;
        v6->_preferredMediaUserUUID = (NSUUID *)v145;

        v147 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.ac.preferredUserSelection"];
        v6->_preferredUserSelectionType = [v147 unsignedIntegerValue];
      }
      v6->_supportsDiagnosticsTransfer = [v4 decodeBoolForKey:@"HMA.diagnosticsTransferSupportCodingKey"];
      uint64_t v148 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.supportedDiagnosticsCodingKey"];
      supportedDiagnostics = v6->_supportedDiagnostics;
      v6->_supportedDiagnostics = (HMSupportedAccessoryDiagnostics *)v148;

      if ([v4 containsValueForKey:@"HM.supportedStereoPairVersionsCodingKey"])
      {
        v150 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.supportedStereoPairVersionsCodingKey"];
        v6->_supportedStereoPairVersions = [v150 unsignedIntegerValue];
      }
      if ([v4 containsValueForKey:@"HM.homePodVariantCodingKey"])
      {
        v151 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.homePodVariantCodingKey"];
        v6->_homePodVariant = [v151 unsignedIntegerValue];
      }
      v152 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.hasOnboardedForNaturalLightingKey"];
      v6->_hasOnboardedForNaturalLighting = [v152 BOOLValue];
      v6->_supportsManagedConfigurationProfile = [v4 decodeBoolForKey:@"HMA.ManagedConfigurationProfileCodingKey"];
      v6->_productColor = [v4 decodeIntegerForKey:@"HM.productColor"];
      v6->_supportsSoftwareUpdateV2 = [v4 decodeBoolForKey:@"HMA.SupportsSoftwareUpdateV2CodingKey"];
      v6->_supportsRMVonAppleTV = [v4 decodeBoolForKey:@"HM.ac.supportsRMVonAppleTV"];
      v6->_supportsJustSiruint64_t i = [v4 decodeBoolForKey:@"HM.ac.supportsJustSiri"];
      if ([v4 containsValueForKey:@"HM.BulletinBoardNotification"])
      {
        v153 = (void *)MEMORY[0x1E4F1CAD0];
        v169[0] = objc_opt_class();
        v169[1] = objc_opt_class();
        v169[2] = objc_opt_class();
        v154 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:3];
        v155 = [v153 setWithArray:v154];
        uint64_t v156 = [v4 decodeObjectOfClasses:v155 forKey:@"HM.BulletinBoardNotification"];
        bulletinBoardNotificationByEndpoint = v6->_bulletinBoardNotificationByEndpoint;
        v6->_bulletinBoardNotificationByEndpoint = (NSDictionary *)v156;
      }
    }
    self = v6;
    uint64_t v42 = self;
  }
  else
  {
    id v39 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v177 = v41;
      __int16 v178 = 2112;
      uint64_t v179 = 0;
      _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@", buf, 0x16u);
    }
    uint64_t v42 = 0;
  }

  return v42;
}

- (HMAccessory)initWithUUID:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMAccessory;
  id v6 = [(HMAccessory *)&v16 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uuid, a3);
    uint64_t v8 = +[HMMutableArray array];
    currentServices = v7->_currentServices;
    v7->_currentServices = (HMMutableArray *)v8;

    uint64_t v10 = +[HMMutableArray array];
    accessoryProfiles = v7->_accessoryProfiles;
    v7->_accessoryProfiles = (HMMutableArray *)v10;

    controlTargetUUIDs = v7->_controlTargetUUIDs;
    v7->_controlTargetUUIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v13 = objc_alloc_init(HMApplicationData);
    applicationData = v7->_applicationData;
    v7->_applicationData = v13;

    v7->_additionalSetupStatus = 0;
    v7->_calibrationStatus = 0;
  }

  return v7;
}

- (void)handleRuntimeStateUpdate:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMAccessory *)self context];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HMAccessory_handleRuntimeStateUpdate_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2080;
      uint64_t v21 = "-[HMAccessory handleRuntimeStateUpdate:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 592, 1);
}

+ (id)_siriEndpointProfilesForAccessoryProfiles:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(id *)(*((void *)&v15 + 1) + 8 * i);
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
          uint64_t v12 = [HMSiriEndpointProfile alloc];
          uint64_t v13 = -[HMSiriEndpointProfile initWithSiriEndpointProfile:](v12, "initWithSiriEndpointProfile:", v11, (void)v15);
          uint64_t v19 = v13;
          id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];

          goto LABEL_15;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_15:

  return v7;
}

+ (id)_networkConfigurationProfilesForCoder:(id)a3 accessoryIdentifier:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 decodeBoolForKey:@"HMA.supportsNetworkProtection"]) {
    goto LABEL_4;
  }
  uint64_t v7 = [v5 decodeIntegerForKey:@"HMA.targetNetworkProtectionMode"];
  uint64_t v8 = [v5 decodeIntegerForKey:@"HMA.currentNetworkProtectionMode"];
  uint64_t v9 = [v5 decodeBoolForKey:@"HMA.networkRestricted"];
  char v10 = [v5 decodeBoolForKey:@"HMA.supportsWiFiReconfiguration"];
  uint64_t v11 = [v5 decodeIntegerForKey:@"HMA.wifiCredentialType"];
  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  uint64_t v14 = [v12 setWithArray:v13];
  long long v15 = [v5 decodeObjectOfClasses:v14 forKey:@"HMA.allowedHosts"];

  long long v16 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.networkAccessViolation"];
  LOBYTE(v20) = v10;
  long long v17 = [[HMNetworkConfigurationProfile alloc] initWithAccessoryIdentifier:v6 targetProtection:v7 currentProtection:v8 networkAccessRestricted:v9 allowedHosts:v15 accessViolation:v16 supportsWiFiReconfiguration:v20 credentialType:v11];

  if (v17)
  {
    uint64_t v21 = v17;
    long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  }
  else
  {
LABEL_4:
    long long v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

+ (id)_mediaProfilesForAccessoryProfiles:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(id *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v10 = v9;
        }
        else {
          char v10 = 0;
        }
        id v11 = v10;

        if (v11)
        {
          uint64_t v12 = [HMMediaProfile alloc];
          uint64_t v13 = -[HMMediaProfile initWithMediaProfile:](v12, "initWithMediaProfile:", v11, (void)v15);
          uint64_t v19 = v13;
          uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];

          goto LABEL_15;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_15:

  return v7;
}

+ (id)_lightProfilesForAccessoryProfiles:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
        id v12 = v11;

        if (v12)
        {
          uint64_t v13 = [HMLightProfile alloc];
          uint64_t v14 = -[HMLightProfile initWithLightProfile:](v13, "initWithLightProfile:", v12, (void)v17);
          [v4 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  long long v15 = (void *)[v4 copy];

  return v15;
}

+ (id)_doorbellProfilesForAccessoryProfiles:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
        id v12 = v11;

        if (v12)
        {
          uint64_t v13 = [HMDoorbellChimeProfile alloc];
          uint64_t v14 = -[HMDoorbellChimeProfile initWithDoorbellChimeProfile:](v13, "initWithDoorbellChimeProfile:", v12, (void)v17);
          [v4 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  long long v15 = (void *)[v4 copy];

  return v15;
}

+ (id)_cameraProfilesForAccessoryProfiles:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
        id v12 = v11;

        if (v12)
        {
          uint64_t v13 = [HMCameraProfile alloc];
          uint64_t v14 = -[HMCameraProfile initWithCameraProfile:](v13, "initWithCameraProfile:", v12, (void)v17);
          [v4 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  long long v15 = (void *)[v4 copy];

  return v15;
}

- (HMRoom)room
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_room);
  os_unfair_lock_unlock(p_lock);

  return (HMRoom *)WeakRetained;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isCurrentAccessory
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_currentAccessory;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)serialNumber
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_serialNumber;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)model
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_model;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)manufacturer
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_manufacturer;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)firmwareVersion
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_firmwareVersion;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)supportsWalletKey
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsWalletKey;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMSymptomsHandler)symptomsHandler
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_symptomsHandler;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)deviceIdentifier
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_deviceIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSString)configuredName
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_configuredName;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)supportsAudioAnalysis
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsAudioAnalysis;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)supportsIdentify
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsIdentify;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)postConfigure
{
  if ([(HMAccessory *)self supportsMessagedHomePodSettings])
  {
    [(HMAccessory *)self configureSettingsAdapterIfNeeded];
    uint64_t v3 = 5;
  }
  else
  {
    if (![(HMAccessory *)self supportsPrimaryUserInfoSubscription]) {
      goto LABEL_6;
    }
    uint64_t v3 = 4;
  }
  [(HMAccessory *)self configureInfoDataProviderIfNeededWithOption:v3];
LABEL_6:
  id v4 = [(HMAccessory *)self remoteLoginHandler];
  [v4 postConfigure];
}

- (BOOL)supportsPrimaryUserInfoSubscription
{
  return self->_supportsPrimaryUserInfoSubscription;
}

- (BOOL)supportsMessagedHomePodSettings
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsMessagedHomePodSettings;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v55 = [(HMAccessory *)self audioDestination];
  uint64_t v8 = [(HMAccessory *)self deviceIRKData];
  id v9 = [(HMAccessory *)self device];
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v45 = HMFGetLogIdentifier();
    if (v55) {
      uint64_t v13 = @" audioDestination: ";
    }
    else {
      uint64_t v13 = &stru_1EEE9DD88;
    }
    if (v55) {
      uint64_t v14 = v55;
    }
    else {
      uint64_t v14 = &stru_1EEE9DD88;
    }
    long long v15 = @" device: ";
    if (!v9) {
      long long v15 = &stru_1EEE9DD88;
    }
    long long v48 = v15;
    long long v49 = v13;
    if (v9) {
      long long v16 = v9;
    }
    else {
      long long v16 = &stru_1EEE9DD88;
    }
    long long v51 = v16;
    long long v52 = v14;
    long long v17 = @" deviceIRKData: ";
    if (!v8) {
      long long v17 = &stru_1EEE9DD88;
    }
    uint64_t v47 = v17;
    if (v8) {
      long long v18 = v8;
    }
    else {
      long long v18 = &stru_1EEE9DD88;
    }
    long long v50 = v18;
    [(HMAccessory *)v11 remoteLoginHandler];
    long long v19 = v54 = v8;
    id v20 = v7;
    if (v19) {
      uint64_t v21 = @" remoteLogin";
    }
    else {
      uint64_t v21 = &stru_1EEE9DD88;
    }
    uint64_t v22 = [(HMAccessory *)v11 remoteLoginHandler];
    long long v53 = v10;
    int v23 = (void *)v22;
    *(_DWORD *)buf = 138546434;
    if (v22) {
      long long v24 = (__CFString *)v22;
    }
    else {
      long long v24 = &stru_1EEE9DD88;
    }
    v65 = v46;
    __int16 v66 = 2112;
    uint64_t v67 = v11;
    __int16 v68 = 2112;
    id v69 = v6;
    __int16 v70 = 2112;
    v71 = v49;
    __int16 v72 = 2112;
    v73 = v52;
    __int16 v74 = 2112;
    long long v75 = v48;
    __int16 v76 = 2112;
    long long v77 = v51;
    __int16 v78 = 2112;
    long long v79 = v47;
    __int16 v80 = 2112;
    long long v81 = v50;
    __int16 v82 = 2112;
    v83 = v21;
    id v7 = v20;
    __int16 v84 = 2112;
    id v85 = v24;
    __int16 v86 = 2112;
    id v87 = v20;
    __int16 v88 = 2048;
    id v89 = v20;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Configuring accessory: %@ context: %@%@%@%@%@%@%@%@%@ home: %@, %p", buf, 0x84u);

    id v10 = v53;
    uint64_t v8 = v54;
  }
  [(HMAccessory *)v11 setContext:v6];
  [(HMAccessory *)v11 setHome:v7];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v25 = [(HMAccessory *)v11 services];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v60 != v28) {
          objc_enumerationMutation(v25);
        }
        objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * i), "__configureWithContext:accessory:", v6, v11);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v27);
  }

  [(HMAccessory *)v11 _configureProfilesWithContext:v6];
  uint64_t v30 = [(HMAccessory *)v11 settings];
  [v30 _configureWithContext:v6];

  uint64_t v31 = [(HMAccessory *)v11 softwareUpdateController];
  [v31 configureWithContext:v6 accessory:v11];

  uint64_t v32 = [(HMAccessory *)v11 remoteLoginHandler];
  [v32 _configureWithContext:v6 accessory:v11];

  if ([(HMAccessory *)v11 hasSymptomsHandler]) {
    [(HMAccessory *)v11 _createSymptomsHandler];
  }
  v33 = [(HMAccessory *)v11 audioDestinationController];
  [v33 configureWithContext:v6 dataSource:v11];

  uint64_t v34 = v11;
  v35 = [(HMAccessory *)v34 context];
  uint64_t v36 = [v35 messageDispatcher];

  if (v7)
  {
    if (v36)
    {
      [v36 registerForMessage:@"kAccessoryNameChangedNotificationKey" receiver:v34 selector:sel__handleRenamed_];
      [v36 registerForMessage:@"HMA.pairingStateChanged" receiver:v34 selector:sel__handlePairingStateChanged_];
      [v36 registerForMessage:@"kCharacteristicValueUpdatedNotificationKey" receiver:v34 selector:sel__handleCharacteristicValueUpdated_];
      if ((_os_feature_enabled_impl() & 1) == 0) {
        [v36 registerForMessage:@"kCharacteristicsUpdatedNotificationKey" receiver:v34 selector:sel__handleCharacteristicsUpdated_];
      }
      [v36 registerForMessage:@"kAccessoryNotificationsUpdatedNotificationKey" receiver:v34 selector:sel__handleAccessoryNotificationsUpdated_];
      [v36 registerForMessage:@"kAccessoryFlagsChangedNotificationKey" receiver:v34 selector:sel__handleAccessoryFlagsChanged_];
      [v36 registerForMessage:@"kServiceRenamedNotificationKey" receiver:v34 selector:sel__handleServiceRenamed_];
      [v36 registerForMessage:@"kServiceDefaultNameUpdatedNotificationKey" receiver:v34 selector:sel__handleServiceDefaultNameUpdate_];
      [v36 registerForMessage:@"kServiceSubtypeUpdatedNotificationKey" receiver:v34 selector:sel__handleServiceSubtype_];
      [v36 registerForMessage:@"kServiceConfigurationStateUpdatedNotificationKey" receiver:v34 selector:sel__handleServiceConfigurationState_];
      [v36 registerForMessage:@"HM.acu" receiver:v34 selector:sel__handleAccessoryControllableChanged_];
      [v36 registerForMessage:@"HM.us" receiver:v34 selector:sel__handleRootSettingsUpdated_];
      int v37 = [(HMAccessory *)v34 remoteLoginHandler];
      [v37 registerForMessages];

      [v36 registerForMessage:@"HMCT.capabilities" receiver:v34 selector:sel__handleTargetControlSupportUpdatedMessage_];
      [v36 registerForMessage:@"supportsMultiUser" receiver:v34 selector:sel__handleMultiUserSupportUpdatedMessage_];
      [v36 registerForMessage:@"HMAccessorySupportsCompanionInitiatedRestartMessageKey" receiver:v34 selector:sel__handleSupportsCompanionInitiatedRestartUpdatedMessage_];
      [v36 registerForMessage:@"HMAccessorySupportsCompanionInitiatedObliterateMessageKey" receiver:v34 selector:sel__handleSupportsCompanionInitiatedObliterateUpdatedMessage_];
      [v36 registerForMessage:@"HMServiceMediaSourceIdentifierUpdatedNotification" receiver:v34 selector:sel__handleServiceMediaSourceIdentifierUpdated_];
      [v36 registerForMessage:@"HMAccessoryPairingIdentityUpdatedNotification" receiver:v34 selector:sel__handlePairingIdentityUpdate_];
      uint64_t v38 = @"HMA.requiresThreadRouterUpdateMessage";
      id v39 = &selRef__handleRequiresThreadRouterUpdateMessage_;
      uint64_t v40 = @"HMA.diagnosticsTransferUpdate";
      v41 = &selRef__handleSupportsDiagnosticsTransferUpdateMessage_;
      goto LABEL_41;
    }
  }
  else if (v36)
  {
    uint64_t v38 = @"kAccessoryNameChangedNotificationKey";
    id v39 = &selRef__handleRenamed_;
    uint64_t v40 = @"kAccessoryCategoryChangedNotificationKey";
    v41 = &selRef__handleAccessoryCategoryChanged_;
LABEL_41:
    [v36 registerForMessage:v40 receiver:v34 selector:*v41];
    [v36 registerForMessage:v38 receiver:v34 selector:*v39];
  }

  uint64_t v42 = [(HMAccessory *)v34 audioAnalysisEventBulletinBoardNotification];
  objc_msgSend(v42, "__configureWithContext:", v6);

  uint64_t v43 = [(HMAccessory *)v34 bulletinBoardNotificationByEndpoint];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __43__HMAccessory___configureWithContext_home___block_invoke;
  v56[3] = &unk_1E5942878;
  id v57 = v6;
  v58 = v34;
  id v44 = v6;
  objc_msgSend(v43, "na_each:", v56);
}

- (id)softwareUpdateController
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_softwareUpdateController;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMRemoteLoginHandler)remoteLoginHandler
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_remoteLoginHandler;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)hasSymptomsHandler
{
  return self->_hasSymptomsHandler;
}

- (HMDevice)device
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_device;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSData)deviceIRKData
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_deviceIRKData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSDictionary)bulletinBoardNotificationByEndpoint
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_bulletinBoardNotificationByEndpoint;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMMediaDestination)audioDestination
{
  return (HMMediaDestination *)objc_getProperty(self, a2, 608, 1);
}

- (HMMediaDestinationController)audioDestinationController
{
  return (HMMediaDestinationController *)objc_getProperty(self, a2, 600, 1);
}

- (HMAudioAnalysisEventBulletinBoardNotification)audioAnalysisEventBulletinBoardNotification
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_audioAnalysisEventBulletinBoardNotification;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_configureProfilesWithContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(HMAccessory *)self accessoryProfiles];
  id v6 = [v5 array];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) accessoryProfile];
        objc_msgSend(v11, "__configureWithContext:accessory:", v4, self);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (HMAccessorySettings)settings
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_settings;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setHome:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setContext:(id)a3
{
}

- (id)_handleMultipleCharacteristicsUpdated:(id)a3 message:(id)a4 informDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v48 = a4;
  uint64_t v9 = [(HMAccessory *)self delegate];
  uint64_t v42 = (void *)v9;
  BOOL v47 = v5 && v9 && (objc_opt_respondsToSelector() & 1) != 0;
  v41 = +[HMHAPMetadata getSharedInstance];
  long long v51 = [MEMORY[0x1E4F1CA48] array];
  id v53 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v53 setNumberStyle:1];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v8;
  uint64_t v38 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v67;
    long long v49 = self;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v67 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        id v54 = objc_msgSend(v53, "numberFromString:", v11, v37);
        uint64_t v43 = -[HMAccessory _findService:](self, "_findService:");
        if (v43)
        {
          uint64_t v40 = i;
          long long v12 = objc_msgSend(obj, "hmf_dictionaryForKey:", v11);
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v56 = v12;
          uint64_t v55 = [v56 countByEnumeratingWithState:&v62 objects:v70 count:16];
          if (v55)
          {
            uint64_t v52 = *(void *)v63;
            do
            {
              for (uint64_t j = 0; j != v55; ++j)
              {
                if (*(void *)v63 != v52) {
                  objc_enumerationMutation(v56);
                }
                uint64_t v14 = *(void *)(*((void *)&v62 + 1) + 8 * j);
                long long v15 = [v53 numberFromString:v14];
                long long v16 = [(HMAccessory *)self _findCharacteristic:v15 forService:v54];
                if (v16)
                {
                  uint64_t v17 = objc_msgSend(v56, "hmf_dictionaryForKey:", v14);
                  long long v18 = [v17 objectForKeyedSubscript:@"kCharacteristicValue"];
                  long long v19 = [MEMORY[0x1E4F1CA98] null];
                  int v20 = [v18 isEqual:v19];

                  if (v20)
                  {

                    long long v18 = 0;
                  }
                  uint64_t v21 = [v17 errorFromDataForKey:@"kCharacteristicErrorDataKey"];
                  uint64_t v22 = [[HMCharacteristicRequest alloc] initWithCharacteristic:v16];
                  int v23 = [[HMCharacteristicResponse alloc] initWithRequest:v22 value:v18 error:v21];
                  [v51 addObject:v23];
                  if (!v21)
                  {
                    long long v50 = [v16 value];
                    long long v24 = [v48 headers];
                    uint64_t v25 = objc_msgSend(v24, "hmf_dateForKey:", @"HMXPCMessageSentDateKey");

                    [v16 _updateValue:v18 valueUpdatedDate:v25];
                    if (v47)
                    {
                      if (!HMFEqualObjects()
                        || ([v16 characteristicType],
                            uint64_t v26 = objc_claimAutoreleasedReturnValue(),
                            int v45 = [v41 shouldNotCacheCharacteristicOfType:v26],
                            v26,
                            v45))
                      {
                        long long v46 = [(HMAccessory *)v49 context];
                        id v44 = [v46 delegateCaller];
                        v57[0] = MEMORY[0x1E4F143A8];
                        v57[1] = 3221225472;
                        v57[2] = __76__HMAccessory__handleMultipleCharacteristicsUpdated_message_informDelegate___block_invoke;
                        v57[3] = &unk_1E5944F20;
                        id v58 = v42;
                        long long v59 = v49;
                        id v60 = v43;
                        id v61 = v16;
                        [v44 invokeBlock:v57];
                      }
                    }

                    self = v49;
                  }
                }
                else
                {
                  uint64_t v27 = (void *)MEMORY[0x19F3A64A0]();
                  uint64_t v28 = self;
                  uint64_t v29 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v30 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    __int16 v72 = v30;
                    __int16 v73 = 2112;
                    __int16 v74 = v15;
                    _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find characteristic for characteristic updated characteristic ID: %@", buf, 0x16u);
                  }
                }
              }
              uint64_t v55 = [v56 countByEnumeratingWithState:&v62 objects:v70 count:16];
            }
            while (v55);
          }

          uint64_t i = v40;
        }
        else
        {
          uint64_t v31 = (void *)MEMORY[0x19F3A64A0]();
          uint64_t v32 = self;
          v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v72 = v34;
            __int16 v73 = 2112;
            __int16 v74 = v54;
            _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find service for characteristic updated service ID: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v38);
  }

  v35 = (void *)[v51 copy];

  return v35;
}

- (NSString)pendingConfigurationIdentifier
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_pendingConfigurationIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSArray)attributeDescriptions
{
  v45[11] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMAccessory *)self room];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v44 = [(HMAccessory *)self name];
  uint64_t v43 = (void *)[v4 initWithName:@"Name" value:v44];
  v45[0] = v43;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v42 = [(HMAccessory *)self uniqueIdentifier];
  v41 = (void *)[v5 initWithName:@"Identifier" value:v42];
  v45[1] = v41;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMAccessory *)self isReachable];
  id v39 = HMFBooleanToString();
  uint64_t v38 = (void *)[v6 initWithName:@"Reachable" value:v39];
  v45[2] = v38;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v8 = NSString;
  uint64_t v40 = v3;
  uint64_t v37 = [v3 uuid];
  uint64_t v36 = [v3 name];
  v35 = [v8 stringWithFormat:@"%@/%@", v37, v36];
  uint64_t v34 = (void *)[v7 initWithName:@"room" value:v35];
  v45[3] = v34;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMAccessory *)self isControllable];
  v33 = HMFBooleanToString();
  uint64_t v32 = (void *)[v9 initWithName:@"Controllable" value:v33];
  v45[4] = v32;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMAccessory transportTypes](self, "transportTypes"));
  uint64_t v30 = (void *)[v10 initWithName:@"TransportTypes" value:v31];
  v45[5] = v30;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMAccessory *)self supportsCHIP];
  uint64_t v29 = HMFBooleanToString();
  uint64_t v28 = (void *)[v11 initWithName:@"Supports CHIP" value:v29];
  v45[6] = v28;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMAccessory *)self knownToSystemCommissioner];
  long long v13 = HMFBooleanToString();
  uint64_t v14 = (void *)[v12 initWithName:@"KTSC" value:v13];
  v45[7] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  long long v16 = NSNumber;
  uint64_t v17 = [(HMAccessory *)self rootPublicKey];
  long long v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "hash"));
  long long v19 = (void *)[v15 initWithName:@"Root Public Key (HASH)" value:v18];
  v45[8] = v19;
  id v20 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v21 = [(HMAccessory *)self nodeID];
  uint64_t v22 = (void *)[v20 initWithName:@"NodeID" value:v21];
  v45[9] = v22;
  id v23 = objc_alloc(MEMORY[0x1E4F653F8]);
  long long v24 = [(HMAccessory *)self matterNodeID];
  uint64_t v25 = (void *)[v23 initWithName:@"Matter NodeID" value:v24];
  v45[10] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:11];

  return (NSArray *)v26;
}

- (NSString)name
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)matterNodeID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_matterNodeID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)supportsCHIP
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsCHIP;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)transportTypes
{
  return self->_transportTypes;
}

- (NSData)rootPublicKey
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_rootPublicKey;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)nodeID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_nodeID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)knownToSystemCommissioner
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_knownToSystemCommissioner;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isControllable
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_controllable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

uint64_t __58__HMAccessory_handleRuntimeStateUpdate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _handleConnectivityChanged:*(void *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "profiles", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) handleRuntimeStateUpdate:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleConnectivityChanged:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_numberForKey:", @"kAccessoryIsReachableKey");
  uint64_t v6 = v5;
  if (!v5
    || (int v7 = [v5 BOOLValue],
        uint64_t v8 = [(HMAccessory *)self suspendCapable] | v7,
        v8 == [(HMAccessory *)self isReachable]))
  {
    int v15 = 0;
  }
  else
  {
    long long v9 = (void *)MEMORY[0x19F3A64A0]();
    long long v10 = self;
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      [(HMAccessory *)v10 isReachable];
      uint64_t v13 = HMFBooleanToString();
      uint64_t v14 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      id v39 = v12;
      __int16 v40 = 2112;
      v41 = v13;
      __int16 v42 = 2112;
      uint64_t v43 = v14;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating isReachable from %@ to %@", buf, 0x20u);
    }
    [(HMAccessory *)v10 setReachable:v8];
    int v15 = 1;
  }
  long long v16 = objc_msgSend(v4, "hmf_numberForKey:", @"HM.suspendedState");
  uint64_t v17 = v16;
  if (v16
    && (uint64_t v18 = [v16 unsignedIntegerValue], v18 != -[HMAccessory suspendedState](self, "suspendedState")))
  {
    [(HMAccessory *)self setSuspendedState:v18];
  }
  else if (!v15)
  {
    goto LABEL_15;
  }
  long long v19 = [(HMAccessory *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v20 = [(HMAccessory *)self context];
    uint64_t v21 = [v20 delegateCaller];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __42__HMAccessory__handleConnectivityChanged___block_invoke;
    v35[3] = &unk_1E5945628;
    id v36 = v19;
    uint64_t v37 = self;
    [v21 invokeBlock:v35];
  }
LABEL_15:
  uint64_t v22 = objc_msgSend(v4, "hmf_numberForKey:", @"controllable");
  id v23 = v22;
  if (v22)
  {
    uint64_t v24 = [v22 BOOLValue];
    if (v24 != [(HMAccessory *)self isControllable])
    {
      [(HMAccessory *)self setControllable:v24];
      [(HMAccessory *)self _notifyDelegatesOfUpdatedControllable];
    }
  }
  uint64_t v25 = objc_msgSend(v4, "hmf_numberForKey:", @"HM.accessoryReachableTransports");
  if (v25)
  {
    int64_t v26 = [(HMAccessory *)self reachableTransports];
    if (v26 != [v25 integerValue])
    {
      -[HMAccessory setReachableTransports:](self, "setReachableTransports:", [v25 integerValue]);
      uint64_t v27 = [(HMAccessory *)self delegate];
      if ([v27 conformsToProtocol:&unk_1EEF70C88]) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = 0;
      }
      id v29 = v28;

      if (objc_opt_respondsToSelector())
      {
        uint64_t v30 = [(HMAccessory *)self context];
        uint64_t v31 = [v30 delegateCaller];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __42__HMAccessory__handleConnectivityChanged___block_invoke_2;
        v32[3] = &unk_1E5945628;
        id v33 = v29;
        uint64_t v34 = self;
        [v31 invokeBlock:v32];
      }
    }
  }
}

- (BOOL)isReachable
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (int64_t)reachableTransports
{
  return self->_reachableTransports;
}

- (BOOL)suspendCapable
{
  return self->_suspendCapable;
}

- (BOOL)supportsUWBUnlock
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsUWBUnlock;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)supportsAccessCodes
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsAccessCodes;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)televisionProfiles
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(HMAccessory *)self profiles];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v10 = v9;
        }
        else {
          long long v10 = 0;
        }
        id v11 = v10;

        if (v11) {
          objc_msgSend(v3, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = (void *)[v3 copy];

  return (NSArray *)v12;
}

- (id)logIdentifier
{
  v2 = [(HMAccessory *)self uniqueIdentifier];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t353 != -1) {
    dispatch_once(&logCategory__hmf_once_t353, &__block_literal_global_1284);
  }
  v2 = (void *)logCategory__hmf_once_v354;

  return v2;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)setDelegate:(id)delegate
{
  p_locuint64_t k = &self->_lock;
  id v5 = delegate;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __26__HMAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v354;
  logCategory__hmf_once_v354 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)televisionProfilesForAccessoryServices:(id)a3 isSPIEntitled:(BOOL)a4
{
  sub_19D1EA0D8(0, &qword_1EB4F2078);
  unint64_t v5 = sub_19D457388();
  _sSo11HMAccessoryC7HomeKitE18televisionProfiles3for13isSPIEntitledSaySo0A7ProfileCGSaySo9HMServiceCG_SbtFZ_0(v5, a4);
  swift_bridgeObjectRelease();
  sub_19D1EA0D8(0, &qword_1EB4F2080);
  uint64_t v6 = (void *)sub_19D457378();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)wakeSuspendedAccessoryWithWakeType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = [(HMAccessory *)self context];
  if (!v7)
  {
    uint64_t v36 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory(WoL) wakeSuspendedAccessoryWithWakeType:completion:]", @"completion"];
    uint64_t v37 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v38 = self;
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      __int16 v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v40;
      __int16 v51 = 2112;
      uint64_t v52 = (const char *)v36;
      _os_log_impl(&dword_19D1A8000, v39, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v41 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v36 userInfo:0];
    objc_exception_throw(v41);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    if (a3 < 2)
    {
      id v48 = @"HMA.suspendedAccessoryWakeType";
      id v20 = [NSNumber numberWithUnsignedInteger:a3];
      long long v49 = v20;
      long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];

      id v21 = objc_alloc(MEMORY[0x1E4F65488]);
      uint64_t v22 = [(HMAccessory *)self uuid];
      id v23 = (void *)[v21 initWithTarget:v22];

      uint64_t v24 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryWakeSuspendedAccessoryMessage" destination:v23 payload:v10];
      id v25 = objc_alloc(MEMORY[0x1E4F653F0]);
      int64_t v26 = NSString;
      uint64_t v27 = MEMORY[0x19F3A5D00](self, a2);
      uint64_t v28 = [v26 stringWithFormat:@"%@, %s:%ld", v27, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/PowerManagement/HMAccessory+WoL.m", 46];
      id v29 = (void *)[v25 initWithName:v28];
      *(void *)buf = v29;

      id v30 = v29;
      [(HMAccessory *)self uuid];

      uint64_t v31 = [(HMAccessory *)self category];
      [v31 categoryType];

      id v32 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMAccessory suspendedState](self, "suspendedState"));
      [(HMAccessory *)self isReachable];
      id v33 = (id)[NSNumber numberWithUnsignedInteger:a3];

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __66__HMAccessory_WoL__wakeSuspendedAccessoryWithWakeType_completion___block_invoke;
      v42[3] = &unk_1E593F980;
      id v43 = *(id *)buf;
      uint64_t v44 = self;
      unint64_t v47 = a3;
      id v34 = v9;
      id v45 = v34;
      id v46 = v7;
      [v24 setResponseHandler:v42];
      [v24 setActivity:*(void *)buf];
      v35 = [v34 messageDispatcher];
      [v35 sendMessage:v24];

      __HMFActivityScopeLeave();
    }
    else
    {
      long long v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:3 userInfo:0];
      id v11 = (void *)MEMORY[0x19F3A64A0]();
      id v12 = self;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        long long v14 = HMFGetLogIdentifier();
        long long v15 = [NSNumber numberWithUnsignedInteger:a3];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v14;
        __int16 v51 = 2112;
        uint64_t v52 = v15;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Waking suspended accessory with invalid type: %@", buf, 0x16u);
      }
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    }
  }
  else
  {
    long long v16 = (void *)MEMORY[0x19F3A64A0]();
    long long v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v19;
      __int16 v51 = 2080;
      uint64_t v52 = "-[HMAccessory(WoL) wakeSuspendedAccessoryWithWakeType:completion:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    long long v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

void __66__HMAccessory_WoL__wakeSuspendedAccessoryWithWakeType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) begin];
  id v16 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 32);
  [*(id *)(a1 + 40) uuid];

  uint64_t v8 = [*(id *)(a1 + 40) category];
  [v8 categoryType];

  id v9 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "suspendedState"));
  [*(id *)(a1 + 40) isReachable];
  id v10 = (id)[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  [v5 domain];

  [v5 code];
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    long long v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Did receive response to wake command with error: %@", buf, 0x16u);
  }
  long long v15 = [*(id *)(a1 + 48) delegateCaller];
  [v15 callCompletion:*(void *)(a1 + 56) error:v5];

  __HMFActivityScopeLeave();
}

- (HMDoorbellChimeProfile)doorbellChimeProfile
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(HMAccessory *)self accessoryProfiles];
  uint64_t v3 = [v2 array];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(id *)(*((void *)&v13 + 1) + 8 * v8);
      objc_opt_class();
      id v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
      id v11 = v10;

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    id v9 = 0;
  }

  return (HMDoorbellChimeProfile *)v9;
}

+ (unint64_t)networkRouterStatusFromWiFiSatelliteStatus:(int64_t)a3
{
  unint64_t v3 = 0x40000000;
  if (a3 != 2) {
    unint64_t v3 = 1;
  }
  if (a3 == 1) {
    return 0;
  }
  else {
    return v3;
  }
}

+ (unint64_t)networkRouterStatusFromRouterStatus:(int64_t)a3 wanStatusListData:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 == 1)
  {
    unint64_t v7 = 0x20000000;
  }
  else
  {
    id v33 = 0;
    uint64_t v8 = +[HMNetworkRouterWANStatusList parsedFromData:v6 error:&v33];
    id v9 = v33;
    if (v8)
    {
      id v10 = [v8 statuses];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __84__HMAccessory_NetworkRouter__networkRouterStatusFromRouterStatus_wanStatusListData___block_invoke;
      v32[3] = &__block_descriptor_40_e41_B32__0__HMNetworkRouterWANStatus_8Q16_B24l;
      void v32[4] = a1;
      id v11 = objc_msgSend(v10, "hmf_objectPassingTest:", v32);

      if (v11)
      {
        id v12 = [v11 status];
        long long v13 = [v12 value];

        if (v13)
        {
          unint64_t v7 = 0;
          if ([v13 unsignedIntegerValue])
          {
            uint64_t v14 = 1;
            do
            {
              if (([v13 unsignedIntegerValue] & v14) != 0)
              {
                if (v14 > 31)
                {
                  uint64_t v15 = v7 | 0x80;
                  uint64_t v16 = v7 | 0x100;
                  if (v14 != 256) {
                    uint64_t v16 = v7;
                  }
                  if (v14 != 128) {
                    uint64_t v15 = v16;
                  }
                  uint64_t v17 = v7 | 0x20;
                  uint64_t v18 = v7 | 0x40;
                  if (v14 != 64) {
                    uint64_t v18 = v7;
                  }
                  if (v14 != 32) {
                    uint64_t v17 = v18;
                  }
                  if (v14 <= 127) {
                    unint64_t v7 = v17;
                  }
                  else {
                    unint64_t v7 = v15;
                  }
                }
                else
                {
                  switch(v14)
                  {
                    case 1:
                      v7 |= 1uLL;
                      break;
                    case 2:
                      v7 |= 2uLL;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 7:
                      break;
                    case 4:
                      v7 |= 4uLL;
                      break;
                    case 8:
                      v7 |= 8uLL;
                      break;
                    default:
                      if (v14 == 16) {
                        v7 |= 0x10uLL;
                      }
                      break;
                  }
                }
              }
              v14 *= 2;
            }
            while (v14 - 1 < (unint64_t)[v13 unsignedIntegerValue]);
          }
        }
        else
        {
          uint64_t v27 = (void *)MEMORY[0x19F3A64A0]();
          id v28 = a1;
          id v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            id v30 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v35 = v30;
            __int16 v36 = 2112;
            id v37 = v11;
            _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine network router status because main WAN status TLV has a nil status value: %@", buf, 0x16u);
          }
          unint64_t v7 = 1;
        }
      }
      else
      {
        id v23 = (void *)MEMORY[0x19F3A64A0]();
        id v24 = a1;
        id v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          int64_t v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v35 = v26;
          _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine network router status because main WAN status could not be found in WAN status list", buf, 0xCu);
        }
        unint64_t v7 = 1;
      }
    }
    else
    {
      __int16 v19 = (void *)MEMORY[0x19F3A64A0]();
      id v20 = a1;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v35 = v22;
        __int16 v36 = 2112;
        id v37 = v6;
        __int16 v38 = 2112;
        id v39 = v9;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse WAN status list from data %@: %@", buf, 0x20u);
      }
      unint64_t v7 = 1;
    }
  }
  return v7;
}

BOOL __84__HMAccessory_NetworkRouter__networkRouterStatusFromRouterStatus_wanStatusListData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 value];

  if (v5)
  {
    uint64_t v6 = [v5 unsignedIntegerValue];
    BOOL v7 = v6 == HMNetworkRouterWANIdentifierMain;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@WAN status TLV has a nil identifier value: %@", (uint8_t *)&v13, 0x16u);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_audioDestinationController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_accessoryProfiles, 0);
  objc_storeStrong((id *)&self->_settingsAdapter, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryInfoDataProvider, 0);
  objc_storeStrong((id *)&self->_currentServices, 0);
  objc_storeStrong((id *)&self->_accessorySettingsController, 0);
  objc_storeStrong((id *)&self->_accessorySettingsDataSource, 0);
  objc_storeStrong((id *)&self->_bulletinBoardNotificationByEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteLoginHandler, 0);
  objc_storeStrong((id *)&self->_deviceIRKData, 0);
  objc_storeStrong((id *)&self->_pendingConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedDiagnostics, 0);
  objc_storeStrong((id *)&self->_audioAnalysisEventBulletinBoardNotification, 0);
  objc_storeStrong((id *)&self->_yearDaySchedulesPerUserCapacity, 0);
  objc_storeStrong((id *)&self->_weekDaySchedulesPerUserCapacity, 0);
  objc_storeStrong((id *)&self->_readerIDACWG, 0);
  objc_storeStrong((id *)&self->_readerGroupSubIdentifierACWG, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserUUID, 0);
  objc_storeStrong((id *)&self->_networkProtectionGroupUUID, 0);
  objc_storeStrong((id *)&self->_symptomsHandler, 0);
  objc_storeStrong((id *)&self->_controlTargetUUIDs, 0);
  objc_storeStrong((id *)&self->_wifiNetworkInfo, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_commissioningID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryFlags, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiersForBridgedAccessories, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_matterNodeID, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_room);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_softwareUpdateController, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setAudioDestination:(id)a3
{
}

- (void)setAudioDestinationController:(id)a3
{
}

- (void)setAccessoryProfiles:(id)a3
{
}

- (void)setAccessoryReprovisionState:(unint64_t)a3
{
  self->_accessoryReprovisionState = a3;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setSettingsAdapter:(id)a3
{
}

- (HMAccessorySettingsAdapter)settingsAdapter
{
  return (HMAccessorySettingsAdapter *)objc_getProperty(self, a2, 568, 1);
}

- (void)setSupportsHomeLevelLocationServiceSetting:(BOOL)a3
{
  self->_supportsHomeLevelLocationServiceSetting = a3;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  return self->_supportsHomeLevelLocationServiceSetting;
}

- (void)setPeerIdentifier:(id)a3
{
}

- (NSUUID)peerIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 560, 1);
}

- (void)setSupportsMediaContentProfile:(BOOL)a3
{
  self->_supportsMediaContentProfile = a3;
}

- (BOOL)supportsMediaContentProfile
{
  return self->_supportsMediaContentProfile;
}

- (void)setAccessoryInfoDataProvider:(id)a3
{
}

- (HMAccessoryInfoDataProvider)accessoryInfoDataProvider
{
  return (HMAccessoryInfoDataProvider *)objc_getProperty(self, a2, 552, 1);
}

- (void)setCurrentServices:(id)a3
{
}

- (void)setReachableTransports:(int64_t)a3
{
  self->_reachableTransports = a3;
}

- (void)setAccessorySettingsController:(id)a3
{
}

- (HMAccessorySettingsController)accessorySettingsController
{
  return self->_accessorySettingsController;
}

- (void)setAccessorySettingsDataSource:(id)a3
{
}

- (HMAccessorySettingsDataSource)accessorySettingsDataSource
{
  return self->_accessorySettingsDataSource;
}

- (void)setSupportsPrimaryUserInfoSubscription:(BOOL)a3
{
  self->_supportsPrimaryUserInfoSubscription = a3;
}

- (void)setAssistantIdentifier:(id)a3
{
}

- (NSNumber)yearDaySchedulesPerUserCapacity
{
  return self->_yearDaySchedulesPerUserCapacity;
}

- (NSNumber)weekDaySchedulesPerUserCapacity
{
  return self->_weekDaySchedulesPerUserCapacity;
}

- (void)setMfiCertifiedACWG:(BOOL)a3
{
  self->_mfiCertifiedACWG = a3;
}

- (void)setHasSymptomsHandler:(BOOL)a3
{
  self->_hasSymptomsHandler = a3;
}

- (void)setAssociationOptions:(int64_t)a3
{
  self->_associationOptions = a3;
}

- (void)setAccessoryFlags:(id)a3
{
}

- (NSNumber)accessoryFlags
{
  return self->_accessoryFlags;
}

- (void)setCalibrationStatus:(unint64_t)a3
{
  self->_calibrationStatus = a3;
}

- (unint64_t)calibrationStatus
{
  return self->_calibrationStatus;
}

- (void)setAdditionalSetupStatus:(unint64_t)a3
{
  self->_additionalSetupStatus = a3;
}

- (void)setTransportTypes:(unint64_t)a3
{
  self->_transportTypes = a3;
}

- (void)accessoryInfoDataProvider:(id)a3 didReceiveUpdatesForAccessoryWithIdentifier:(id)a4 primaryUserInfo:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v35 = 138543618;
    __int16 v36 = v14;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Did receive update primaryUserInfo: %@", (uint8_t *)&v35, 0x16u);
  }
  if (![(HMAccessory *)v12 supportsMessagedHomePodSettings])
  {
    int64_t v26 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v27 = v12;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      int v35 = 138543362;
      __int16 v36 = v29;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error processing primary user info as supportsMessagedHomePodSettings is disabled", (uint8_t *)&v35, 0xCu);
    }
    goto LABEL_12;
  }
  if (![v10 selectionType])
  {
    id v30 = [v10 uuidString];
    if (v30)
    {

      goto LABEL_15;
    }
  }
  if ([v10 selectionType] == 1)
  {
    __int16 v15 = [v10 uuidString];
    BOOL v16 = v15 == 0;

    if (v16)
    {
LABEL_15:
      int64_t v26 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v27 = v12;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        id v32 = [v10 uuidString];
        id v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "selectionType"));
        int v35 = 138543874;
        __int16 v36 = v31;
        __int16 v37 = 2112;
        id v38 = v32;
        __int16 v39 = 2112;
        uint64_t v40 = v33;
        _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected preferred media user UUID: %@, selectionType: %@", (uint8_t *)&v35, 0x20u);
      }
LABEL_12:

      goto LABEL_26;
    }
  }
  os_unfair_lock_lock_with_options();
  uint64_t v17 = [(NSUUID *)v12->_preferredMediaUserUUID UUIDString];
  uint64_t v18 = [v10 uuidString];
  char v19 = HMFEqualObjects();

  if ((v19 & 1) == 0)
  {
    id v20 = [v10 uuidString];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      preferredMediaUserUUID = v12->_preferredMediaUserUUID;
      v12->_preferredMediaUserUUID = 0;
    }
    else
    {
      id v22 = objc_alloc(MEMORY[0x1E4F29128]);
      preferredMediaUserUUID = [v10 uuidString];
      uint64_t v24 = [v22 initWithUUIDString:preferredMediaUserUUID];
      id v25 = v12->_preferredMediaUserUUID;
      v12->_preferredMediaUserUUID = (NSUUID *)v24;
    }
  }
  unint64_t preferredUserSelectionType = v12->_preferredUserSelectionType;
  if (preferredUserSelectionType == [v10 selectionType])
  {
    os_unfair_lock_unlock(&v12->_lock);
    if (v19) {
      goto LABEL_26;
    }
  }
  else
  {
    v12->_unint64_t preferredUserSelectionType = [v10 selectionType];
    os_unfair_lock_unlock(&v12->_lock);
  }
  [(HMAccessory *)v12 notifyDelegateUpdatedPreferredMediaUser];
LABEL_26:
}

- (void)accessoryInfoDataProvider:(id)a3 didReceiveUpdatesForAccessoryWithIdentifier:(id)a4 wifiNetworkInfo:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(HMAccessory *)self supportsMessagedHomePodSettings])
  {
    __int16 v15 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v16 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      char v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v19;
      id v20 = "%{public}@Error processing wifi info as supportsMessagedHomePodSettings is disabled";
      BOOL v21 = v18;
      os_log_type_t v22 = OS_LOG_TYPE_ERROR;
      uint32_t v23 = 12;
      goto LABEL_8;
    }
LABEL_12:

    goto LABEL_13;
  }
  id v11 = [(HMAccessory *)self uniqueIdentifier];
  char v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v9);

  if ((v12 & 1) == 0)
  {
    __int16 v15 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v16 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      char v19 = HMFGetLogIdentifier();
      uint64_t v24 = [(HMAccessory *)v16 uniqueIdentifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v19;
      __int16 v41 = 2112;
      id v42 = v24;
      __int16 v43 = 2112;
      id v44 = v9;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory identifier %@ is not same as delegate call identifier %@", buf, 0x20u);

      goto LABEL_11;
    }
    goto LABEL_12;
  }
  int v13 = [(HMAccessory *)self wifiNetworkInfo];
  char v14 = [v13 isEqualToNetworkInfo:v10];

  __int16 v15 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v16 = self;
  uint64_t v17 = HMFGetOSLogHandle();
  uint64_t v18 = v17;
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      char v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v19;
      __int16 v41 = 2112;
      id v42 = v10;
      id v20 = "%{public}@Received WiFi network info %@ but it is same as current one";
      BOOL v21 = v18;
      os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
      uint32_t v23 = 22;
LABEL_8:
      _os_log_impl(&dword_19D1A8000, v21, v22, v20, buf, v23);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = v25;
    __int16 v41 = 2112;
    id v42 = v10;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Received new WiFi network info %@", buf, 0x16u);
  }
  [(HMAccessory *)v16 setWifiNetworkInfo:v10];
  int64_t v26 = [(HMAccessory *)v16 delegate];
  if ([v26 conformsToProtocol:&unk_1EEF70C88]) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = 0;
  }
  id v28 = v27;

  if (objc_opt_respondsToSelector())
  {
    id v29 = (void *)MEMORY[0x19F3A64A0]();
    id v30 = v16;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v32;
      __int16 v41 = 2112;
      id v42 = v28;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_INFO, "%{public}@Notifying client of accessory did update WiFi network with delegate: %@", buf, 0x16u);
    }
    id v33 = [(HMAccessory *)v30 context];
    id v34 = [v33 delegateCaller];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __101__HMAccessory_accessoryInfoDataProvider_didReceiveUpdatesForAccessoryWithIdentifier_wifiNetworkInfo___block_invoke;
    v35[3] = &unk_1E5945650;
    id v36 = v28;
    __int16 v37 = v30;
    id v38 = v10;
    [v34 invokeBlock:v35];
  }
LABEL_13:
}

uint64_t __101__HMAccessory_accessoryInfoDataProvider_didReceiveUpdatesForAccessoryWithIdentifier_wifiNetworkInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateWifiNetworkInfo:*(void *)(a1 + 48)];
}

- (void)updateSettingsAdapterSettingReflected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMAccessory *)self settingsAdapter];

  if (v5)
  {
    id v10 = [(HMAccessory *)self settingsAdapter];
    [v10 updateSettingsReflected:v3];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v12 = v9;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Attempt to update adapter settings reflected with nil adapter", buf, 0xCu);
    }
  }
}

- (void)updateSettingWithKeyPath:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = [(HMAccessory *)self settingsAdapter];

  if (v11)
  {
    char v12 = [(HMAccessory *)self settingsAdapter];
    [v12 updateWithKeyPath:v8 value:v9 completionHandler:v10];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    char v14 = self;
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Calling update setting with settings adapter object being nil", (uint8_t *)&v17, 0xCu);
    }
    char v12 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8 reason:@"Adapter is nil" suggestion:@"Configure adapter before use it"];
    v10[2](v10, v12);
  }
}

- (void)adapter:(id)a3 didUpdateSettingKeyPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMAccessory *)self context];
  id v9 = [v8 delegateCaller];

  if (v9)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__HMAccessory_adapter_didUpdateSettingKeyPaths___block_invoke;
    v10[3] = &unk_1E59449A0;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    [v9 invokeBlock:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __48__HMAccessory_adapter_didUpdateSettingKeyPaths___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained settings];
  id v4 = [v3 delegate];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [WeakRetained settings];
    [v4 settingsWillUpdate:v5];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
          id v12 = objc_msgSend(WeakRetained, "settings", (void)v19);
          uint64_t v13 = [WeakRetained uniqueIdentifier];
          [v4 settings:v12 didUpdateForIdentifier:v13 keyPath:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v8);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    char v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = WeakRetained;
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings did update: %@", buf, 0x16u);
    }
    uint64_t v18 = [v15 settings];
    [v4 settingsDidUpdate:v18];
  }
}

- (void)adapter:(id)a3 didUpdateSettings:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMAccessory *)self settings];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v12;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Attempt to set root group to non-nil settings.", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    [(HMAccessory *)self setSettings:v7];
    uint64_t v13 = [(HMAccessory *)self settings];
    [(HMAccessory *)self _notifyDelegateOfUpdatedSettings:v13];
  }
}

- (void)configureSettingsAdapterWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessory *)self settingsAdapter];
  [v5 configureWithCompletionHandler:v4];
}

- (void)createSettingsAdapterWithDataSource:(id)a3 controller:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [HMAccessorySettingsAdapter alloc];
  id v12 = [(HMAccessory *)self home];
  uint64_t v13 = [v12 uniqueIdentifier];
  int v14 = [(HMAccessory *)self context];
  id v15 = [v14 queue];
  uint64_t v16 = [(HMAccessory *)self uniqueIdentifier];
  uint64_t v18 = [(HMAccessorySettingsAdapter *)v11 initWithHomeIdentifier:v13 dataSource:v10 controller:v9 workQueue:v15 settingsContainer:self containerIdentifier:v16 containerType:1 settingsControl:self context:v8];

  [(HMAccessory *)self setSettingsAdapter:v18];
  int v17 = [(HMAccessory *)self settingsAdapter];
  [v17 setDelegate:self];
}

- (NSString)shortDescription
{
  v2 = [(HMAccessory *)self uniqueIdentifier];
  BOOL v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (void)_invokeDidUpdateSupportsUWBUnlockDelegate:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMAccessory *)self context];
  if (v5)
  {
    id v6 = [(HMAccessory *)self delegate];
    if ([v6 conformsToProtocol:&unk_1EEF70C88]) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (objc_opt_respondsToSelector())
    {
      id v9 = [v5 delegateCaller];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__HMAccessory__invokeDidUpdateSupportsUWBUnlockDelegate___block_invoke;
      v14[3] = &unk_1E5944D60;
      id v15 = v8;
      uint64_t v16 = self;
      BOOL v17 = a3;
      [v9 invokeBlock:v14];
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v19 = v13;
      __int16 v20 = 2080;
      long long v21 = "-[HMAccessory _invokeDidUpdateSupportsUWBUnlockDelegate:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __57__HMAccessory__invokeDidUpdateSupportsUWBUnlockDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateSupportsUWBUnlock:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_invokeDidUpdateSupportsWalletKeyDelegate:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMAccessory *)self context];
  if (v5)
  {
    id v6 = [(HMAccessory *)self delegate];
    if ([v6 conformsToProtocol:&unk_1EEF70C88]) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (objc_opt_respondsToSelector())
    {
      id v9 = [v5 delegateCaller];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __57__HMAccessory__invokeDidUpdateSupportsWalletKeyDelegate___block_invoke;
      v14[3] = &unk_1E5944D60;
      id v15 = v8;
      uint64_t v16 = self;
      BOOL v17 = a3;
      [v9 invokeBlock:v14];
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v19 = v13;
      __int16 v20 = 2080;
      long long v21 = "-[HMAccessory _invokeDidUpdateSupportsWalletKeyDelegate:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __57__HMAccessory__invokeDidUpdateSupportsWalletKeyDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateSupportsWalletKey:*(unsigned __int8 *)(a1 + 48)];
}

- (void)initiateDiagnosticsTransferWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v29 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory initiateDiagnosticsTransferWithOptions:completionHandler:]", @"completion"];
    id v30 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v31 = self;
    id v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v33;
      __int16 v40 = 2112;
      __int16 v41 = (const char *)v29;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v34 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v29 userInfo:0];
    objc_exception_throw(v34);
  }
  id v8 = (void (**)(void, void, void))v7;
  id v9 = [(HMAccessory *)self context];
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  id v12 = HMFGetOSLogHandle();
  uint64_t v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      id v15 = [(HMAccessory *)v11 uuid];
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v14;
      __int16 v40 = 2112;
      __int16 v41 = v15;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Dispatching a message to request diagnostics transfer: %@", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v17 = [(HMAccessory *)v11 uuid];
    uint64_t v18 = [v17 UUIDString];
    [v16 setObject:v18 forKeyedSubscript:@"kAccessoryUUID"];

    if (v6)
    {
      long long v19 = encodeRootObject(v6);
      [v16 setObject:v19 forKeyedSubscript:@"kAccessoryDiagnosticsOptions"];
    }
    else
    {
      [v16 setObject:0 forKeyedSubscript:@"kAccessoryDiagnosticsOptions"];
    }
    id v21 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v22 = objc_alloc(MEMORY[0x1E4F65488]);
    uint32_t v23 = [(HMAccessory *)v11 uuid];
    uint64_t v24 = (void *)[v22 initWithTarget:v23];
    __int16 v25 = (void *)[v21 initWithName:@"HMA.diagnosticsTransferRequest" destination:v24 payload:v16];

    id v26 = [v25 identifier];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __72__HMAccessory_initiateDiagnosticsTransferWithOptions_completionHandler___block_invoke;
    v35[3] = &unk_1E5945510;
    void v35[4] = v11;
    id v36 = v26;
    __int16 v37 = v8;
    id v27 = v26;
    [v25 setResponseHandler:v35];
    uint64_t v28 = [v9 messageDispatcher];
    [v28 sendMessage:v25];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v20;
      __int16 v40 = 2080;
      __int16 v41 = "-[HMAccessory initiateDiagnosticsTransferWithOptions:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@nil context - %s", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    ((void (**)(void, void *, void))v8)[2](v8, v16, 0);
  }
}

void __72__HMAccessory_initiateDiagnosticsTransferWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    __int16 v37 = v10;
    __int16 v38 = 2112;
    id v39 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Message response received for %@", buf, 0x16u);
  }
  if (v5)
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = *(id *)(a1 + 32);
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v37 = v15;
      __int16 v38 = 2112;
      id v39 = v5;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@diagnostics transfer request failed with error %@", buf, 0x16u);
    }
    uint64_t v16 = [*(id *)(a1 + 32) context];
    id v17 = [v16 delegateCaller];
    [v17 callCompletion:*(void *)(a1 + 48) error:v5 obj:0];
  }
  else
  {
    uint64_t v16 = objc_msgSend(v6, "hmf_dataForKey:", @"HMA.diagnosticsMetaDataCodingKey");
    if (v16)
    {
      id v35 = 0;
      uint64_t v18 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v16 error:&v35];
      id v17 = v35;
      long long v19 = (void *)MEMORY[0x19F3A64A0]();
      id v20 = *(id *)(a1 + 32);
      id v21 = HMFGetOSLogHandle();
      id v22 = v21;
      if (v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint32_t v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v37 = v23;
          __int16 v38 = 2112;
          id v39 = v18;
          _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@diagnostics transfer completed successfully with metadata: %@", buf, 0x16u);
        }
        uint64_t v24 = [*(id *)(a1 + 32) context];
        __int16 v25 = [v24 delegateCaller];
        id v26 = v25;
        uint64_t v27 = *(void *)(a1 + 48);
        id v28 = 0;
        uint64_t v29 = v18;
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v37 = v34;
          __int16 v38 = 2112;
          id v39 = 0;
          _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive diagnostics metadata from encoded metadata: %@", buf, 0x16u);
        }
        uint64_t v24 = [*(id *)(a1 + 32) context];
        __int16 v25 = [v24 delegateCaller];
        id v26 = v25;
        uint64_t v27 = *(void *)(a1 + 48);
        id v28 = v17;
        uint64_t v29 = 0;
      }
      [v25 callCompletion:v27 error:v28 obj:v29];
    }
    else
    {
      id v30 = (void *)MEMORY[0x19F3A64A0]();
      id v31 = *(id *)(a1 + 32);
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v37 = v33;
        _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@nil encodedMetadata", buf, 0xCu);
      }
      id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      uint64_t v18 = [*(id *)(a1 + 32) context];
      uint64_t v24 = [v18 delegateCaller];
      [v24 callCompletion:*(void *)(a1 + 48) error:v17 obj:0];
    }
  }
}

- (void)initiateDiagnosticsTransferWithCompletionHandler:(id)a3
{
}

- (void)setSupportedDiagnostics:(id)a3
{
  id v4 = (HMSupportedAccessoryDiagnostics *)a3;
  os_unfair_lock_lock_with_options();
  supportedDiagnostics = self->_supportedDiagnostics;
  self->_supportedDiagnostics = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMSupportedAccessoryDiagnostics)supportedDiagnostics
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_supportedDiagnostics;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_handleSupportsDiagnosticsTransferUpdateMessage:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 BOOLForKey:@"HMA.diagnosticsTransferSupport"];
  v23[0] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v7 = [v4 unarchivedObjectForKey:@"HMA.supportedDiagnosticsCodingKey" ofClasses:v6];

  if (v5 != [(HMAccessory *)self supportsDiagnosticsTransfer]
    || ([(HMAccessory *)self supportedDiagnostics],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7 != v8))
  {
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      [(HMAccessory *)v10 supportsDiagnosticsTransfer];
      id v13 = HMFBooleanToString();
      int v14 = HMFBooleanToString();
      int v15 = 138544130;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      id v20 = v14;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating supportsDiagnostics from %@ to %@, full diagnostics support is %@", (uint8_t *)&v15, 0x2Au);
    }
    [(HMAccessory *)v10 setSupportsDiagnosticsTransfer:v5];
    [(HMAccessory *)v10 setSupportedDiagnostics:v7];
    [(HMAccessory *)v10 _notifyClientsOfDiagnosticsTransferSupportUpdate];
  }
}

- (void)_notifyClientsOfDiagnosticsTransferSupportUpdate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of accessory diagnostics transfer support update: %@", buf, 0x16u);
    }
    id v8 = [(HMAccessory *)v5 context];
    id v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__HMAccessory__notifyClientsOfDiagnosticsTransferSupportUpdate__block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v3;
    id v12 = v5;
    [v9 invokeBlock:v10];
  }
}

uint64_t __63__HMAccessory__notifyClientsOfDiagnosticsTransferSupportUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateDiagnosticsTransferSupport:*(void *)(a1 + 40)];
}

- (void)setSupportsDiagnosticsTransfer:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsDiagnosticsTransfer = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsDiagnosticsTransfer
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsDiagnosticsTransfer;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)mediaDestinationController:(id)a3 destinationWithIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMAccessory *)self home];
  id v9 = [v8 mediaDestinationsWithHomeTheaterSupportedOptions];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__HMAccessory_mediaDestinationController_destinationWithIdentifier___block_invoke;
  v17[3] = &unk_1E5942A08;
  id v10 = v7;
  id v18 = v10;
  id v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", v17);
  if (!v11)
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v20 = v15;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@No destination found in destinations: %@ home: %@", buf, 0x20u);
    }
  }

  return v11;
}

uint64_t __68__HMAccessory_mediaDestinationController_destinationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 audioDestinationIdentifier];
  id v4 = [*(id *)(a1 + 32) UUIDString];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)updateAudioDestinationSupportedOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138543618;
    id v35 = v10;
    __int16 v36 = 2112;
    __int16 v37 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending update audio destination support options message with options: %@", buf, 0x16u);
  }
  id v12 = [(HMAccessory *)v8 context];
  id v13 = [v12 messageDispatcher];
  if (v13)
  {
    id v32 = @"HMMediaDestinationSupportedOptionsPayloadKey";
    int v14 = [NSNumber numberWithUnsignedInteger:a3];
    id v33 = v14;
    __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

    id v16 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v17 = [(HMAccessory *)v8 audioDestination];
    id v18 = [v17 uniqueIdentifier];
    __int16 v19 = (void *)[v16 initWithTarget:v18];

    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F654B0]) initWithName:@"HMMediaDestinationUpdateSupportedOptionsRequestMessage" destination:v19 payload:v15];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    id v28 = __65__HMAccessory_updateAudioDestinationSupportedOptions_completion___block_invoke;
    uint64_t v29 = &unk_1E5944EF0;
    id v30 = v8;
    id v31 = v6;
    [v20 setResponseHandler:&v26];
    __int16 v21 = objc_msgSend(v20, "copy", v26, v27, v28, v29, v30);
    [v13 sendMessage:v21];
  }
  else
  {
    id v22 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v23 = v8;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v25;
      __int16 v36 = 2112;
      __int16 v37 = v12;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to update destination support options due to no message dispatcher given by context: %@", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    [(HMAccessory *)v23 callCompletionHandler:v6 error:v15];
  }
}

void __65__HMAccessory_updateAudioDestinationSupportedOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v11;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Update destination supported options request message responded with error: %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 32) callCompletionHandler:*(void *)(a1 + 40) error:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      int v14 = v12;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Update destination supported options request message succeeded", (uint8_t *)&v13, 0xCu);
    }
    [*(id *)(a1 + 32) callCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (void)setHasOnboardedForNaturalLighting:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasOnboardedForNaturalLighting = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasOnboardedForNaturalLighting
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasOnboardedForNaturalLighting;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSUUID)audioDestinationGroupIdentifier
{
  v2 = [(HMAccessory *)self audioDestination];
  BOOL v3 = [v2 audioGroupIdentifier];

  return (NSUUID *)v3;
}

- (NSArray)audioDestinationMediaProfiles
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(HMAccessory *)self mediaProfile];
  BOOL v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (NSString)audioDestinationParentIdentifier
{
  uint64_t v2 = [(HMAccessory *)self uuid];
  BOOL v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (BOOL)supportsAudioGroup
{
  uint64_t v2 = [(HMAccessory *)self audioDestination];
  char v3 = [v2 containsSupportedOptions:8];

  return v3;
}

- (BOOL)supportsAudioDestination
{
  uint64_t v2 = [(HMAccessory *)self audioDestination];
  char v3 = [v2 containsHomeTheaterSupportedOptions];

  return v3;
}

- (int64_t)audioDestinationType
{
  uint64_t v2 = [(HMAccessory *)self audioDestination];

  return v2 != 0;
}

- (NSString)audioDestinationIdentifier
{
  uint64_t v2 = [(HMAccessory *)self audioDestination];
  char v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)callCompletionHandler:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(HMAccessory *)self context];
    id v9 = [v8 delegateCaller];
    id v10 = v9;
    if (v9)
    {
      [v9 callCompletion:v6 error:v7];
    }
    else
    {
      __int16 v15 = (void *)MEMORY[0x19F3A64A0]();
      id v16 = self;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        int v19 = 138543618;
        id v20 = v18;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no delegate caller given by context: %@", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v14;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to call client completion handler due to no handler provided", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)callCompletionHandler:(id)a3
{
}

- (void)setNetworkProtectionGroupUUID:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  networkProtectionGroupUUID = self->_networkProtectionGroupUUID;
  self->_networkProtectionGroupUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)networkProtectionGroupUUID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_networkProtectionGroupUUID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_notifyClientsOfSupportsMusicAlarmUpdate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v14 = v7;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports creating music alarms update: %@", buf, 0x16u);
    }
    id v8 = [(HMAccessory *)v5 context];
    id v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__HMAccessory__notifyClientsOfSupportsMusicAlarmUpdate__block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v3;
    id v12 = v5;
    [v9 invokeBlock:v10];
  }
}

uint64_t __55__HMAccessory__notifyClientsOfSupportsMusicAlarmUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateSupportsMusicAlarm:*(void *)(a1 + 40)];
}

- (void)_handleSupportsCompanionInitiatedObliterateUpdatedMessage:(id)a3
{
  uint64_t v4 = [a3 BOOLForKey:@"HMAccessorySupportsCompanionInitiatedObliterateMessageKey"];
  if (v4 != [(HMAccessory *)self supportsCompanionInitiatedObliterate])
  {
    [(HMAccessory *)self setSupportsCompanionInitiatedObliterate:v4];
    [(HMAccessory *)self _notifyClientsOfSupportsCompanionInitiatedObliterateUpdate];
  }
}

- (void)_notifyClientsOfSupportsCompanionInitiatedObliterateUpdate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v14 = v7;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports companion initiated obliterate update: %@", buf, 0x16u);
    }
    id v8 = [(HMAccessory *)v5 context];
    id v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__HMAccessory__notifyClientsOfSupportsCompanionInitiatedObliterateUpdate__block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v3;
    id v12 = v5;
    [v9 invokeBlock:v10];
  }
}

uint64_t __73__HMAccessory__notifyClientsOfSupportsCompanionInitiatedObliterateUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateSupportsCompanionInitiatedObliterate:*(void *)(a1 + 40)];
}

- (void)_handleSupportsCompanionInitiatedRestartUpdatedMessage:(id)a3
{
  uint64_t v4 = [a3 BOOLForKey:@"HMAccessorySupportsCompanionInitiatedRestartMessageKey"];
  if (v4 != [(HMAccessory *)self supportsCompanionInitiatedRestart])
  {
    [(HMAccessory *)self setSupportsCompanionInitiatedRestart:v4];
    [(HMAccessory *)self _notifyClientsOfSupportsCompanionInitiatedRestartUpdate];
  }
}

- (void)_notifyClientsOfSupportsCompanionInitiatedRestartUpdate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v14 = v7;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports companion initiated restart update: %@", buf, 0x16u);
    }
    id v8 = [(HMAccessory *)v5 context];
    id v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__HMAccessory__notifyClientsOfSupportsCompanionInitiatedRestartUpdate__block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v3;
    id v12 = v5;
    [v9 invokeBlock:v10];
  }
}

uint64_t __70__HMAccessory__notifyClientsOfSupportsCompanionInitiatedRestartUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateSupportsCompanionInitiatedRestart:*(void *)(a1 + 40)];
}

- (void)_handleMultiUserSupportUpdatedMessage:(id)a3
{
  uint64_t v4 = [a3 BOOLForKey:@"supportsMultiUser"];
  if (v4 != [(HMAccessory *)self supportsMultiUser])
  {
    [(HMAccessory *)self setSupportsMultiUser:v4];
    [(HMAccessory *)self _notifyClientsOfMultiUserSupportUpdate];
  }
}

- (void)_notifyClientsOfHomeLevelLocationServiceSettingSupportUpdate
{
  char v3 = [(HMAccessory *)self context];
  uint64_t v4 = [v3 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__HMAccessory__notifyClientsOfHomeLevelLocationServiceSettingSupportUpdate__block_invoke;
  v5[3] = &unk_1E59452E8;
  v5[4] = self;
  [v4 invokeBlock:v5];
}

void __75__HMAccessory__notifyClientsOfHomeLevelLocationServiceSettingSupportUpdate__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _privateDelegate];
  char v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543618;
    id v8 = v6;
    __int16 v9 = 2112;
    id v10 = v2;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying client of home level location service setting support update using delegate: %@", (uint8_t *)&v7, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [v2 accessoryDidUpdateHomeLevelLocationServiceSettingSupport:*(void *)(a1 + 32)];
  }
}

- (void)_notifyClientsOfMultiUserSupportUpdate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v14 = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying client of multi-user support update", buf, 0xCu);
    }
    id v8 = [(HMAccessory *)v5 context];
    __int16 v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__HMAccessory__notifyClientsOfMultiUserSupportUpdate__block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v3;
    id v12 = v5;
    [v9 invokeBlock:v10];
  }
}

uint64_t __53__HMAccessory__notifyClientsOfMultiUserSupportUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateMultiUserSupport:*(void *)(a1 + 40)];
}

- (void)notifyClientsOfUpdatedSupportsAudioReturnChannel
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMAccessory *)self _privateDelegate];
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of accessory did update supports audio return: %@", buf, 0x16u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(HMAccessory *)v5 context];
    __int16 v9 = [v8 delegateCaller];
    if (v9)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__HMAccessory_notifyClientsOfUpdatedSupportsAudioReturnChannel__block_invoke;
      v14[3] = &unk_1E5945628;
      id v15 = v3;
      id v16 = v5;
      [v9 invokeBlock:v14];
    }
    else
    {
      id v10 = (void *)MEMORY[0x19F3A64A0]();
      id v11 = v5;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v18 = v13;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify clients of accessory did update supports audio return due to no delegate caller", buf, 0xCu);
      }
    }
  }
}

uint64_t __63__HMAccessory_notifyClientsOfUpdatedSupportsAudioReturnChannel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateAudioReturnChannelSupport:*(void *)(a1 + 40)];
}

- (void)_handleTargetControlSupportUpdatedMessage:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 BOOLForKey:@"supportsTargetControl"];
  int v5 = v4 ^ [(HMAccessory *)self supportsTargetControl];
  if (v5 == 1) {
    [(HMAccessory *)self setSupportsTargetControl:v4];
  }
  uint64_t v6 = [v8 BOOLForKey:@"supportsTargetController"];
  if (v6 != [(HMAccessory *)self supportsTargetController])
  {
    [(HMAccessory *)self setSupportsTargetController:v6];
    int v5 = 1;
  }
  uint64_t v7 = [v8 BOOLForKey:@"targetControllerHardwareSupport"];
  if (v7 == [(HMAccessory *)self targetControllerHardwareSupport])
  {
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    [(HMAccessory *)self setTargetControllerHardwareSupport:v7];
  }
  [(HMAccessory *)self _notifyClientsOfTargetControlSupportUpdate];
LABEL_9:
}

- (void)resetControlTargetsWithCompletionHandler:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMAccessory *)self context];
  if (!v4)
  {
    uint64_t v30 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory resetControlTargetsWithCompletionHandler:]", @"completion"];
    id v31 = (void *)MEMORY[0x19F3A64A0]();
    id v32 = self;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v43 = v34;
      __int16 v44 = 2112;
      uint64_t v45 = (const char *)v30;
      _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v35 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v30 userInfo:0];
    objc_exception_throw(v35);
  }
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    uint64_t v7 = [(HMAccessory *)self home];
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v40 = @"reset";
      uint64_t v41 = MEMORY[0x1E4F1CBF0];
      __int16 v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id v10 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v11 = objc_alloc(MEMORY[0x1E4F65488]);
      id v12 = [(HMAccessory *)self uuid];
      int v13 = (void *)[v11 initWithTarget:v12];
      int v14 = (void *)[v10 initWithName:@"HMCT.configure" destination:v13 payload:v9];

      id v15 = [(HMAccessory *)self context];
      id v16 = [v15 pendingRequests];

      uint64_t v17 = [v14 identifier];
      id v18 = _Block_copy(v4);
      [v16 addCompletionBlock:v18 forIdentifier:v17];

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __56__HMAccessory_resetControlTargetsWithCompletionHandler___block_invoke;
      v36[3] = &unk_1E59450E8;
      id v37 = v16;
      id v38 = v17;
      id v19 = v6;
      id v39 = v19;
      id v20 = v17;
      id v21 = v16;
      [v14 setResponseHandler:v36];
      id v22 = [v19 messageDispatcher];
      [v22 sendMessage:v14];
    }
    else
    {
      uint64_t v27 = [(HMAccessory *)self context];
      id v28 = [v27 delegateCaller];
      uint64_t v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      [v28 callCompletion:v4 error:v29];

      id v8 = 0;
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v43 = v26;
      __int16 v44 = 2080;
      uint64_t v45 = "-[HMAccessory resetControlTargetsWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
  }
}

void __56__HMAccessory_resetControlTargetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    uint64_t v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 error:v5];
  }
}

- (void)removeControlTarget:(id)a3 completionHandler:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMAccessory *)self context];
  if (!v7)
  {
    uint64_t v43 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory removeControlTarget:completionHandler:]", @"completion"];
    __int16 v44 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v45 = self;
    uint64_t v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      unint64_t v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v56 = v47;
      __int16 v57 = 2112;
      id v58 = (const char *)v43;
      _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v48 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v43 userInfo:0];
    objc_exception_throw(v48);
  }
  __int16 v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = [(HMAccessory *)self home];
    if (!v10)
    {
      id v35 = [(HMAccessory *)self context];
      __int16 v36 = [v35 delegateCaller];
      id v37 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      [v36 callCompletion:v7 error:v37];

      id v11 = 0;
      goto LABEL_14;
    }
    id v11 = (void *)v10;
    id v12 = [v6 uuid];

    if (v12)
    {
      int v13 = [v6 home];
      char v14 = [v11 isEqual:v13];

      if (v14)
      {
        uint64_t v53 = @"remove";
        id v15 = [v6 uuid];
        id v16 = [v15 UUIDString];
        id v54 = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];

        id v18 = objc_alloc(MEMORY[0x1E4F654B0]);
        id v19 = objc_alloc(MEMORY[0x1E4F65488]);
        id v20 = [(HMAccessory *)self uuid];
        id v21 = (void *)[v19 initWithTarget:v20];
        id v22 = (void *)[v18 initWithName:@"HMCT.configure" destination:v21 payload:v17];

        uint64_t v23 = [(HMAccessory *)self context];
        uint64_t v24 = [v23 pendingRequests];

        uint64_t v25 = [v22 identifier];
        uint64_t v26 = _Block_copy(v7);
        [v24 addCompletionBlock:v26 forIdentifier:v25];

        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __53__HMAccessory_removeControlTarget_completionHandler___block_invoke;
        v49[3] = &unk_1E59450E8;
        id v50 = v24;
        id v51 = v25;
        id v27 = v9;
        id v52 = v27;
        id v28 = v25;
        id v29 = v24;
        [v22 setResponseHandler:v49];
        uint64_t v30 = [v27 messageDispatcher];
        [v30 sendMessage:v22];

        goto LABEL_14;
      }
      id v38 = [(HMAccessory *)self context];
      id v39 = [v38 delegateCaller];
      uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = 11;
    }
    else
    {
      id v38 = [(HMAccessory *)self context];
      id v39 = [v38 delegateCaller];
      uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = 20;
    }
    uint64_t v42 = [v40 hmErrorWithCode:v41];
    [v39 callCompletion:v7 error:v42];

    goto LABEL_14;
  }
  id v31 = (void *)MEMORY[0x19F3A64A0]();
  id v32 = self;
  id v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    id v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v56 = v34;
    __int16 v57 = 2080;
    id v58 = "-[HMAccessory removeControlTarget:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  (*((void (**)(id, void *))v7 + 2))(v7, v11);
LABEL_14:
}

void __53__HMAccessory_removeControlTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    id v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 error:v5];
  }
}

- (void)addControlTarget:(id)a3 completionHandler:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMAccessory *)self context];
  if (!v7)
  {
    uint64_t v43 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory addControlTarget:completionHandler:]", @"completion"];
    __int16 v44 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v45 = self;
    uint64_t v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      unint64_t v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v56 = v47;
      __int16 v57 = 2112;
      id v58 = (const char *)v43;
      _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v48 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v43 userInfo:0];
    objc_exception_throw(v48);
  }
  __int16 v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = [(HMAccessory *)self home];
    if (!v10)
    {
      id v35 = [(HMAccessory *)self context];
      __int16 v36 = [v35 delegateCaller];
      id v37 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      [v36 callCompletion:v7 error:v37];

      id v11 = 0;
      goto LABEL_14;
    }
    id v11 = (void *)v10;
    id v12 = [v6 uuid];

    if (v12)
    {
      int v13 = [v6 home];
      char v14 = [v11 isEqual:v13];

      if (v14)
      {
        uint64_t v53 = @"add";
        id v15 = [v6 uuid];
        id v16 = [v15 UUIDString];
        id v54 = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];

        id v18 = objc_alloc(MEMORY[0x1E4F654B0]);
        id v19 = objc_alloc(MEMORY[0x1E4F65488]);
        id v20 = [(HMAccessory *)self uuid];
        id v21 = (void *)[v19 initWithTarget:v20];
        id v22 = (void *)[v18 initWithName:@"HMCT.configure" destination:v21 payload:v17];

        uint64_t v23 = [(HMAccessory *)self context];
        uint64_t v24 = [v23 pendingRequests];

        uint64_t v25 = [v22 identifier];
        uint64_t v26 = _Block_copy(v7);
        [v24 addCompletionBlock:v26 forIdentifier:v25];

        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __50__HMAccessory_addControlTarget_completionHandler___block_invoke;
        v49[3] = &unk_1E59450E8;
        id v50 = v24;
        id v51 = v25;
        id v27 = v9;
        id v52 = v27;
        id v28 = v25;
        id v29 = v24;
        [v22 setResponseHandler:v49];
        uint64_t v30 = [v27 messageDispatcher];
        [v30 sendMessage:v22];

        goto LABEL_14;
      }
      id v38 = [(HMAccessory *)self context];
      id v39 = [v38 delegateCaller];
      uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = 11;
    }
    else
    {
      id v38 = [(HMAccessory *)self context];
      id v39 = [v38 delegateCaller];
      uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = 20;
    }
    uint64_t v42 = [v40 hmErrorWithCode:v41];
    [v39 callCompletion:v7 error:v42];

    goto LABEL_14;
  }
  id v31 = (void *)MEMORY[0x19F3A64A0]();
  id v32 = self;
  id v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    id v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v56 = v34;
    __int16 v57 = 2080;
    id v58 = "-[HMAccessory addControlTarget:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  (*((void (**)(id, void *))v7 + 2))(v7, v11);
LABEL_14:
}

void __50__HMAccessory_addControlTarget_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    id v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 error:v5];
  }
}

- (void)_notifyDelegateOfRemovedControlTarget:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v4 name];
      *(_DWORD *)buf = 138543618;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed control target - %@", buf, 0x16u);
    }
    id v11 = [(HMAccessory *)v7 context];
    id v12 = [v11 delegateCaller];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__HMAccessory__notifyDelegateOfRemovedControlTarget___block_invoke;
    v13[3] = &unk_1E5945650;
    id v14 = v5;
    id v15 = v7;
    id v16 = v4;
    [v12 invokeBlock:v13];
  }
}

uint64_t __53__HMAccessory__notifyDelegateOfRemovedControlTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didRemoveControlTarget:*(void *)(a1 + 48)];
}

- (void)_notifyDelegateOfAddedControlTarget:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v9 = HMFGetLogIdentifier();
      uint64_t v10 = [v4 name];
      *(_DWORD *)buf = 138543618;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added target - %@", buf, 0x16u);
    }
    id v11 = [(HMAccessory *)v7 context];
    id v12 = [v11 delegateCaller];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__HMAccessory__notifyDelegateOfAddedControlTarget___block_invoke;
    v13[3] = &unk_1E5945650;
    id v14 = v5;
    id v15 = v7;
    id v16 = v4;
    [v12 invokeBlock:v13];
  }
}

uint64_t __51__HMAccessory__notifyDelegateOfAddedControlTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didAddControlTarget:*(void *)(a1 + 48)];
}

- (void)_notifyClientsOfTargetControlSupportUpdate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v14 = v7;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying client of target control support update", buf, 0xCu);
    }
    uint64_t v8 = [(HMAccessory *)v5 context];
    __int16 v9 = [v8 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__HMAccessory__notifyClientsOfTargetControlSupportUpdate__block_invoke;
    v10[3] = &unk_1E5945628;
    id v11 = v3;
    id v12 = v5;
    [v9 invokeBlock:v10];
  }
}

uint64_t __57__HMAccessory__notifyClientsOfTargetControlSupportUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateTargetControlSupport:*(void *)(a1 + 40)];
}

- (BOOL)_updateHasSymptomsHandler:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HMAccessory *)self _privateDelegate];
  if (![(HMAccessory *)self hasSymptomsHandler] && v3)
  {
    [(HMAccessory *)self setHasSymptomsHandler:1];
    [(HMAccessory *)self _createSymptomsHandler];
    id v6 = [(HMAccessory *)self context];
    id v7 = [v6 queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__HMAccessory__updateHasSymptomsHandler___block_invoke;
    v14[3] = &unk_1E5945628;
    uint64_t v8 = (id *)v15;
    v15[0] = v5;
    v15[1] = self;
    __int16 v9 = v14;
LABEL_7:
    dispatch_async(v7, v9);

    BOOL v10 = 1;
    goto LABEL_8;
  }
  BOOL v10 = 0;
  if ([(HMAccessory *)self hasSymptomsHandler] && !v3)
  {
    [(HMAccessory *)self setHasSymptomsHandler:0];
    [(HMAccessory *)self setSymptomsHandler:0];
    id v6 = [(HMAccessory *)self context];
    id v7 = [v6 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__HMAccessory__updateHasSymptomsHandler___block_invoke_2;
    v12[3] = &unk_1E5945628;
    uint64_t v8 = (id *)v13;
    v13[0] = v5;
    v13[1] = self;
    __int16 v9 = v12;
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

void __41__HMAccessory__updateHasSymptomsHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added symptoms handler", buf, 0xCu);
    }
    id v6 = [*(id *)(a1 + 40) context];
    id v7 = [v6 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__HMAccessory__updateHasSymptomsHandler___block_invoke_1302;
    v10[3] = &unk_1E5945628;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = v8;
    uint64_t v12 = v9;
    [v7 invokeBlock:v10];
  }
}

void __41__HMAccessory__updateHasSymptomsHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
    id v3 = *(id *)(a1 + 40);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed symptoms handler", buf, 0xCu);
    }
    id v6 = [*(id *)(a1 + 40) context];
    id v7 = [v6 delegateCaller];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__HMAccessory__updateHasSymptomsHandler___block_invoke_1304;
    v10[3] = &unk_1E5945628;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = v8;
    uint64_t v12 = v9;
    [v7 invokeBlock:v10];
  }
}

uint64_t __41__HMAccessory__updateHasSymptomsHandler___block_invoke_1304(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidRemoveSymptomsHandler:*(void *)(a1 + 40)];
}

void __41__HMAccessory__updateHasSymptomsHandler___block_invoke_1302(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 symptomsHandler];
  [v1 accessory:v2 didAddSymptomsHandler:v3];
}

- (void)_createSymptomsHandler
{
  id v3 = [[HMSymptomsHandler alloc] initWithAccessory:self];
  [(HMAccessory *)self setSymptomsHandler:v3];

  id v4 = [(HMAccessory *)self symptomsHandler];
  [v4 configure];
}

- (void)setSymptomsHandler:(id)a3
{
  id v4 = (HMSymptomsHandler *)a3;
  os_unfair_lock_lock_with_options();
  symptomsHandler = self->_symptomsHandler;
  self->_symptomsHandler = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)_privateDelegate
{
  uint64_t v2 = [(HMAccessory *)self delegate];
  if ([v2 conformsToProtocol:&unk_1EEF70C88]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_notifyDelegatesOfUpdatedControllable
{
  id v3 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(HMAccessory *)self context];
    id v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __52__HMAccessory__notifyDelegatesOfUpdatedControllable__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    id v8 = self;
    [v5 invokeBlock:v6];
  }
}

uint64_t __52__HMAccessory__notifyDelegatesOfUpdatedControllable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateControllable:*(void *)(a1 + 40)];
}

- (void)_notifyDelegatesOfUpdatedCalibrationStatus
{
  id v3 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(HMAccessory *)self context];
    id v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __57__HMAccessory__notifyDelegatesOfUpdatedCalibrationStatus__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    id v8 = self;
    [v5 invokeBlock:v6];
  }
}

uint64_t __57__HMAccessory__notifyDelegatesOfUpdatedCalibrationStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateCalibrationStatus:*(void *)(a1 + 40)];
}

- (void)_notifyDelegatesOfAdditionalSetupRequiredChange
{
  id v3 = [(HMAccessory *)self _privateDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(HMAccessory *)self context];
    id v5 = [v4 delegateCaller];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __62__HMAccessory__notifyDelegatesOfAdditionalSetupRequiredChange__block_invoke;
    v6[3] = &unk_1E5945628;
    id v7 = v3;
    id v8 = self;
    [v5 invokeBlock:v6];
  }
}

uint64_t __62__HMAccessory__notifyDelegatesOfAdditionalSetupRequiredChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateAdditionalSetupRequired:*(void *)(a1 + 40)];
}

- (void)_handleAccessoryControllableChanged:(id)a3
{
  -[HMAccessory setControllable:](self, "setControllable:", [a3 BOOLForKey:@"controllable"]);

  [(HMAccessory *)self _notifyDelegatesOfUpdatedControllable];
}

- (void)notifyDelegateOfAppDataUpdateForService:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  if (v5)
  {
    id v6 = [(HMAccessory *)self _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v7 = [v5 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__HMAccessory_notifyDelegateOfAppDataUpdateForService___block_invoke;
      block[3] = &unk_1E5945650;
      block[4] = self;
      id v13 = v6;
      id v14 = v4;
      dispatch_async(v7, block);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v16 = v11;
      __int16 v17 = 2080;
      id v18 = "-[HMAccessory notifyDelegateOfAppDataUpdateForService:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __55__HMAccessory_notifyDelegateOfAppDataUpdateForService___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __55__HMAccessory_notifyDelegateOfAppDataUpdateForService___block_invoke_2;
  v6[3] = &unk_1E5945650;
  id v4 = a1[5];
  id v5 = a1[4];
  id v7 = v4;
  id v8 = v5;
  id v9 = a1[6];
  [v3 invokeBlock:v6];
}

uint64_t __55__HMAccessory_notifyDelegateOfAppDataUpdateForService___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateApplicationDataForService:*(void *)(a1 + 48)];
}

- (void)_updateApplicationData:(id)a3 forService:(id)a4 completionHandler:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v41 = a4;
  id v9 = a5;
  BOOL v10 = [(HMAccessory *)self context];
  if (v10)
  {
    uint64_t v40 = [(HMAccessory *)self home];
    if (v40)
    {
      id v39 = [MEMORY[0x1E4F1CA60] dictionary];
      if (v8)
      {
        id v11 = [v8 dictionary];
        [v39 setObject:v11 forKeyedSubscript:@"kAppDataInformationKey"];
      }
      uint64_t v12 = self;
      id v13 = v12;
      if (v41)
      {
        id v14 = (HMAccessory *)v41;

        uint64_t v15 = [(HMAccessory *)v14 instanceID];
        [v39 setObject:v15 forKeyedSubscript:@"kServiceInstanceID"];

        id v38 = [(HMAccessory *)v14 uuid];
      }
      else
      {
        id v38 = [(HMAccessory *)v12 messageTargetUUID];
        id v14 = v13;
      }
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F65488]) initWithTarget:v38];
      uint64_t v24 = (void *)MEMORY[0x1E4F654B0];
      uint64_t v25 = (void *)[v39 copy];
      id v37 = (void *)v23;
      uint64_t v26 = [v24 messageWithName:@"kSetAppDataRequestKey" destination:v23 payload:v25];

      objc_initWeak((id *)buf, v13);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__HMAccessory__updateApplicationData_forService_completionHandler___block_invoke;
      aBlock[3] = &unk_1E5944AB8;
      objc_copyWeak(&v50, (id *)buf);
      id v27 = v14;
      unint64_t v47 = v27;
      id v48 = v8;
      id v49 = v9;
      id v28 = _Block_copy(aBlock);
      id v29 = [(HMAccessory *)v13 context];
      uint64_t v30 = [v29 pendingRequests];

      id v31 = [v26 identifier];
      id v32 = _Block_copy(v28);
      [v30 addCompletionBlock:v32 forIdentifier:v31];

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __67__HMAccessory__updateApplicationData_forService_completionHandler___block_invoke_2;
      v42[3] = &unk_1E5945510;
      id v33 = v30;
      id v43 = v33;
      id v34 = v31;
      id v44 = v34;
      id v35 = v28;
      id v45 = v35;
      [v26 setResponseHandler:v42];
      __int16 v36 = [v10 messageDispatcher];
      [v36 sendMessage:v26 completionHandler:0];

      objc_destroyWeak(&v50);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v20 = [(HMAccessory *)self context];
      uint64_t v21 = [v20 delegateCaller];
      id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      [v21 callCompletion:v9 error:v22];
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v52 = v19;
      __int16 v53 = 2080;
      id v54 = "-[HMAccessory _updateApplicationData:forService:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __67__HMAccessory__updateApplicationData_forService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v8 = WeakRetained;
  if (!v4)
  {
    [*(id *)(a1 + 32) setApplicationData:*(void *)(a1 + 40)];
    id WeakRetained = v8;
  }
  id v6 = [WeakRetained context];
  id v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 48) error:v4];
}

void __67__HMAccessory__updateApplicationData_forService_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)updateApplicationData:(id)a3 forService:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMAccessory *)self context];
  if (!v10)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory updateApplicationData:forService:completionHandler:]", @"completion"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v23;
      __int16 v31 = 2112;
      id v32 = (const char *)v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = [v11 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__HMAccessory_updateApplicationData_forService_completionHandler___block_invoke;
    block[3] = &unk_1E5944360;
    block[4] = self;
    id v26 = v8;
    id v27 = v9;
    id v28 = v10;
    dispatch_async(v13, block);
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v17;
      __int16 v31 = 2080;
      id v32 = "-[HMAccessory updateApplicationData:forService:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v10 + 2))(v10, v18);
  }
}

uint64_t __66__HMAccessory_updateApplicationData_forService_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateApplicationData:*(void *)(a1 + 40) forService:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)updateApplicationData:(id)a3 completionHandler:(id)a4
{
}

- (void)_handleAccessoryCategoryChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 dataForKey:@"kAccessoryCategory"];
  if (v5)
  {
    id v12 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v12];
    id v7 = v12;
    if (v6)
    {
      [(HMAccessory *)self setCategory:v6];
    }
    else
    {
      id v8 = (void *)MEMORY[0x19F3A64A0]();
      id v9 = self;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v14 = v11;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory category from data: %@", buf, 0x16u);
      }
    }
  }
}

- (void)_handleServiceMediaSourceIdentifierUpdated:(id)a3
{
  id v4 = a3;
  id v8 = [v4 numberForKey:@"mediaSourceIdentifier"];
  id v5 = [v4 numberForKey:@"kServiceInstanceID"];

  if (v8 && v5)
  {
    id v6 = [(HMAccessory *)self _findService:v5];
    id v7 = v6;
    if (v6) {
      [v6 _handleMediaSourceIdentifierUpdated:v8];
    }
  }
}

- (void)_handleServiceConfigurationState:(id)a3
{
  id v4 = a3;
  id v5 = [v4 numberForKey:@"kServiceConfigurationState"];
  id v6 = [v4 numberForKey:@"kServiceInstanceID"];
  id v7 = [(HMAccessory *)self context];
  id v8 = [v7 pendingRequests];

  id v9 = [v4 identifier];

  id v10 = [v8 removeCompletionBlockForIdentifier:v9];

  if (v5 && v6)
  {
    id v11 = [(HMAccessory *)self services];
    id v12 = objc_msgSend(v11, "hmf_firstObjectWithInstanceID:", v6);

    if (v12)
    {
      objc_msgSend(v12, "_handleUpdateConfigurationState:", +[HMService _mapToServiceConfigurationStateFromIsConfiguredValue:](HMService, "_mapToServiceConfigurationStateFromIsConfiguredValue:", v5));
      if (v10)
      {
        id v13 = [(HMAccessory *)self context];
        id v14 = [v13 delegateCaller];
        [v14 callCompletion:v10 error:0];
      }
      else
      {
        __int16 v15 = [(HMAccessory *)self _privateDelegate];
        if (objc_opt_respondsToSelector())
        {
          id v16 = [(HMAccessory *)self context];
          uint64_t v17 = [v16 delegateCaller];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __48__HMAccessory__handleServiceConfigurationState___block_invoke;
          v18[3] = &unk_1E5945650;
          id v19 = v15;
          id v20 = self;
          id v21 = v12;
          [v17 invokeBlock:v18];
        }
      }
    }
  }
}

uint64_t __48__HMAccessory__handleServiceConfigurationState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateConfigurationStateForService:*(void *)(a1 + 48)];
}

- (void)_handleServiceSubtype:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stringForKey:@"kServiceSubtype"];
  id v6 = [v4 numberForKey:@"kServiceInstanceID"];
  id v7 = [(HMAccessory *)self context];
  id v8 = [v7 pendingRequests];

  id v9 = [v4 identifier];

  id v10 = [v8 removeCompletionBlockForIdentifier:v9];

  if (v5 && v6)
  {
    id v11 = [(HMAccessory *)self services];
    id v12 = objc_msgSend(v11, "hmf_firstObjectWithInstanceID:", v6);

    if (v12)
    {
      [v12 _handleUpdateServiceSubtype:v5];
      if (v10)
      {
        id v13 = [(HMAccessory *)self context];
        id v14 = [v13 delegateCaller];
        [v14 callCompletion:v10 error:0];
      }
      else
      {
        __int16 v15 = [(HMAccessory *)self _privateDelegate];
        if (objc_opt_respondsToSelector())
        {
          id v16 = [(HMAccessory *)self context];
          uint64_t v17 = [v16 delegateCaller];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __37__HMAccessory__handleServiceSubtype___block_invoke;
          v18[3] = &unk_1E5945650;
          id v19 = v15;
          id v20 = self;
          id v21 = v12;
          [v17 invokeBlock:v18];
        }
      }
    }
  }
}

uint64_t __37__HMAccessory__handleServiceSubtype___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateServiceSubtypeForService:*(void *)(a1 + 48)];
}

- (void)_handleServiceDefaultNameUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stringForKey:@"kServiceName"];
  id v6 = [v4 numberForKey:@"kServiceInstanceID"];
  id v7 = [(HMAccessory *)self context];
  id v8 = [v7 pendingRequests];

  id v9 = [v4 identifier];

  id v10 = [v8 removeCompletionBlockForIdentifier:v9];

  if (v5 && v6)
  {
    id v11 = [(HMAccessory *)self services];
    id v12 = objc_msgSend(v11, "hmf_firstObjectWithInstanceID:", v6);

    if (v12)
    {
      [v12 _handleUpdateDefaultName:v5];
      if (v10)
      {
        id v13 = [(HMAccessory *)self context];
        id v14 = [v13 delegateCaller];
        [v14 callCompletion:v10 error:0];
      }
      else
      {
        __int16 v15 = [(HMAccessory *)self _privateDelegate];
        if (objc_opt_respondsToSelector())
        {
          id v16 = [(HMAccessory *)self context];
          uint64_t v17 = [v16 delegateCaller];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __47__HMAccessory__handleServiceDefaultNameUpdate___block_invoke;
          v18[3] = &unk_1E5945650;
          id v19 = v15;
          id v20 = self;
          id v21 = v12;
          [v17 invokeBlock:v18];
        }
      }
    }
  }
}

uint64_t __47__HMAccessory__handleServiceDefaultNameUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateDefaultNameForService:*(void *)(a1 + 48)];
}

- (void)_handleServiceRenamed:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stringForKey:@"kServiceName"];
  id v6 = [v4 numberForKey:@"kServiceInstanceID"];
  id v7 = [(HMAccessory *)self context];
  id v8 = [v7 pendingRequests];

  id v9 = [v4 identifier];

  id v10 = [v8 removeCompletionBlockForIdentifier:v9];

  if (v5 && v6)
  {
    id v11 = [(HMAccessory *)self services];
    id v12 = objc_msgSend(v11, "hmf_firstObjectWithInstanceID:", v6);

    if (v12)
    {
      [v12 _handleUpdateName:v5];
      if (v10)
      {
        id v13 = [(HMAccessory *)self context];
        id v14 = [v13 delegateCaller];
        [v14 callCompletion:v10 error:0];
      }
      else
      {
        __int16 v15 = [(HMAccessory *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          id v16 = [(HMAccessory *)self context];
          uint64_t v17 = [v16 delegateCaller];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __37__HMAccessory__handleServiceRenamed___block_invoke;
          v18[3] = &unk_1E5945650;
          id v19 = v15;
          id v20 = self;
          id v21 = v12;
          [v17 invokeBlock:v18];
        }
      }
    }
  }
}

uint64_t __37__HMAccessory__handleServiceRenamed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateNameForService:*(void *)(a1 + 48)];
}

- (void)_deleteSiriHistoryWithCompletion:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  if (!v4)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory _deleteSiriHistoryWithCompletion:]", @"completion"];
    id v24 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v27;
      __int16 v35 = 2112;
      __int16 v36 = (const char *)v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    dispatch_assert_queue_V2(v7);

    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v34 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending delete siri history request", buf, 0xCu);
    }
    id v12 = [(HMAccessory *)v9 siriEndpointProfile];
    id v13 = v12;
    if (v12)
    {
      [v12 deleteSiriHistoryWithCompletionHandler:v4];
    }
    else
    {
      id v18 = [v6 messageDispatcher];
      id v19 = objc_alloc(MEMORY[0x1E4F65488]);
      id v20 = [(HMAccessory *)v9 uuid];
      id v21 = (void *)[v19 initWithTarget:v20];

      id v22 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryDeleteSiriHistoryRequestMessage" destination:v21 payload:0];
      objc_initWeak((id *)buf, v9);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke;
      v29[3] = &unk_1E59441D8;
      objc_copyWeak(&v32, (id *)buf);
      id v30 = v6;
      id v31 = v4;
      [v22 setResponseHandler:v29];
      [v18 sendMessage:v22 completionHandler:0];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);

      id v13 = 0;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v34 = v17;
      __int16 v35 = 2080;
      __int16 v36 = "-[HMAccessory _deleteSiriHistoryWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
  }
}

void __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v12;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history request responded with error: %@", buf, 0x16u);
    }
    id v13 = [a1[4] delegateCaller];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke_1290;
    v19[3] = &unk_1E59454E8;
    id v14 = &v21;
    id v21 = a1[5];
    id v20 = v5;
    [v13 invokeBlock:v19];

    __int16 v15 = v20;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v16;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Delete siri history request responded", buf, 0xCu);
    }
    __int16 v15 = [a1[4] delegateCaller];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke_1291;
    v17[3] = &unk_1E59454C0;
    id v14 = &v18;
    id v18 = a1[5];
    [v15 invokeBlock:v17];
  }
}

uint64_t __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke_1290(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __48__HMAccessory__deleteSiriHistoryWithCompletion___block_invoke_1291(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteSiriHistoryWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory deleteSiriHistoryWithCompletion:]", @"completion"];
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v17;
      __int16 v23 = 2112;
      __int16 v24 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__HMAccessory_deleteSiriHistoryWithCompletion___block_invoke;
    block[3] = &unk_1E59454E8;
    block[4] = self;
    id v20 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v11;
      __int16 v23 = 2080;
      __int16 v24 = "-[HMAccessory deleteSiriHistoryWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

uint64_t __47__HMAccessory_deleteSiriHistoryWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSiriHistoryWithCompletion:*(void *)(a1 + 40)];
}

- (void)_auditPairingsWithCompletionHandler:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMAccessory *)self context];
  if (!v4)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory _auditPairingsWithCompletionHandler:]", @"completionHandler"];
    __int16 v23 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v26;
      __int16 v32 = 2112;
      uint64_t v33 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    uint64_t v7 = [(HMAccessory *)self home];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v10 = objc_alloc(MEMORY[0x1E4F65488]);
      id v11 = [(HMAccessory *)self uuid];
      id v12 = (void *)[v10 initWithTarget:v11];
      uint64_t v13 = (void *)[v9 initWithName:@"HMA.auditPairings" destination:v12 payload:0];

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __51__HMAccessory__auditPairingsWithCompletionHandler___block_invoke;
      v28[3] = &unk_1E5944EF0;
      v28[4] = self;
      id v29 = v4;
      [v13 setResponseHandler:v28];
      id v14 = [v6 messageDispatcher];
      [v14 sendMessage:v13];
    }
    else
    {
      id v19 = [(HMAccessory *)self context];
      id v20 = [v19 delegateCaller];
      id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v20 callCompletion:v4 error:v21];

      id v8 = 0;
    }
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v18;
      __int16 v32 = 2080;
      uint64_t v33 = "-[HMAccessory _auditPairingsWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
  }
}

void __51__HMAccessory__auditPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v6 = [v3 context];
    uint64_t v5 = [v6 delegateCaller];
    [v5 callCompletion:*(void *)(a1 + 40) error:v4];
  }
}

- (void)_listPairingsWithCompletionHandler:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v26);
  }
  uint64_t v5 = v4;
  id v6 = [(HMAccessory *)self home];
  uint64_t v7 = [(HMAccessory *)self context];
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v10 = objc_alloc(MEMORY[0x1E4F65488]);
      id v11 = [(HMAccessory *)self uuid];
      id v12 = (void *)[v10 initWithTarget:v11];
      uint64_t v13 = (void *)[v9 initWithName:@"kListPairingsRequestKey" destination:v12 payload:0];

      id v14 = [v8 pendingRequests];
      __int16 v15 = [v13 identifier];
      id v16 = _Block_copy(v5);
      [v14 addCompletionBlock:v16 forIdentifier:v15];

      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      id v29 = __50__HMAccessory__listPairingsWithCompletionHandler___block_invoke;
      id v30 = &unk_1E59441B0;
      id v31 = v14;
      id v32 = v15;
      uint64_t v33 = self;
      id v34 = v5;
      id v17 = v15;
      id v18 = v14;
      [v13 setResponseHandler:&v27];
      id v19 = objc_msgSend(v8, "messageDispatcher", v27, v28, v29, v30);
      [v19 sendMessage:v13];
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v23 = self;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v36 = v25;
        __int16 v37 = 2080;
        id v38 = "-[HMAccessory _listPairingsWithCompletionHandler:]";
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
      }
    }
  }
  else
  {
    id v20 = [v7 delegateCaller];
    id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
    [v20 callCompletion:v5 obj:0 error:v21];
  }
}

void __50__HMAccessory__listPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectForKeyedSubscript:@"kDescriptionKey"];
  }
  id v7 = (id)[*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 56))
  {
    id v8 = [*(id *)(a1 + 48) context];
    id v9 = [v8 delegateCaller];
    [v9 callCompletion:*(void *)(a1 + 56) obj:v6 error:v10];
  }
}

- (BOOL)_updateFromAccessory:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  unint64_t v5 = [(HMAccessory *)self transportTypes];
  uint64_t v6 = [v4 transportTypes];
  BOOL v7 = v5 == v6;
  BOOL v8 = v5 != v6;
  if (!v7) {
    -[HMAccessory setTransportTypes:](self, "setTransportTypes:", [v4 transportTypes]);
  }
  os_unfair_lock_unlock(&self->_lock);
  int v9 = [(HMAccessory *)self knownToSystemCommissioner];
  if (v9 != [v4 knownToSystemCommissioner])
  {
    -[HMAccessory setKnownToSystemCommissioner:](self, "setKnownToSystemCommissioner:", [v4 knownToSystemCommissioner]);
    BOOL v8 = 1;
  }
  id v10 = [(HMAccessory *)self serialNumber];
  id v11 = [v4 serialNumber];
  char v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = [v4 serialNumber];
    [(HMAccessory *)self setSerialNumber:v13];

    BOOL v8 = 1;
  }
  id v14 = [(HMAccessory *)self productID];
  __int16 v15 = [v4 productID];
  char v16 = [v14 isEqualToNumber:v15];

  if ((v16 & 1) == 0)
  {
    id v17 = [v4 productID];
    [(HMAccessory *)self setProductID:v17];

    BOOL v8 = 1;
  }
  id v18 = [(HMAccessory *)self vendorID];
  id v19 = [v4 vendorID];
  char v20 = [v18 isEqualToNumber:v19];

  if ((v20 & 1) == 0)
  {
    id v21 = [v4 vendorID];
    [(HMAccessory *)self setVendorID:v21];

    BOOL v8 = 1;
  }
  uint64_t v22 = [(HMAccessory *)self nodeID];
  __int16 v23 = [v4 nodeID];
  char v24 = [v22 isEqualToNumber:v23];

  if ((v24 & 1) == 0)
  {
    uint64_t v25 = [v4 nodeID];
    [(HMAccessory *)self setNodeID:v25];

    BOOL v8 = 1;
  }
  int v26 = [(HMAccessory *)self requiresThreadRouter];
  if (v26 != [v4 requiresThreadRouter])
  {
    -[HMAccessory setRequiresThreadRouter:](self, "setRequiresThreadRouter:", [v4 requiresThreadRouter]);
    BOOL v8 = 1;
  }
  uint64_t v27 = [(HMAccessory *)self rootPublicKey];
  uint64_t v28 = [v4 rootPublicKey];
  char v29 = [v27 isEqualToData:v28];

  if ((v29 & 1) == 0)
  {
    id v30 = [v4 rootPublicKey];
    [(HMAccessory *)self setRootPublicKey:v30];

    BOOL v8 = 1;
  }

  return v8;
}

- (void)_identifyWithCompletionHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(HMAccessory *)self context];
  if (v5)
  {
    int v26 = @"kAccessoryUUID";
    uint64_t v6 = [(HMAccessory *)self uuid];
    BOOL v7 = [v6 UUIDString];
    uint64_t v27 = v7;
    BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    id v9 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v10 = objc_alloc(MEMORY[0x1E4F65488]);
    id v11 = [(HMAccessory *)self uuid];
    char v12 = (void *)[v10 initWithTarget:v11];
    uint64_t v13 = (void *)[v9 initWithName:@"kIdentifyAccessoryRequestKey" destination:v12 payload:v8];

    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __46__HMAccessory__identifyWithCompletionHandler___block_invoke;
    __int16 v23 = &unk_1E5944EF0;
    id v14 = v5;
    id v24 = v14;
    id v25 = v4;
    [v13 setResponseHandler:&v20];
    __int16 v15 = objc_msgSend(v14, "messageDispatcher", v20, v21, v22, v23);
    [v15 sendMessage:v13];
  }
  else
  {
    char v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v29 = v19;
      __int16 v30 = 2080;
      id v31 = "-[HMAccessory _identifyWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __46__HMAccessory__identifyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 40) error:v4];
}

- (void)identifyWithCompletionHandler:(void *)completion
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = completion;
  id v5 = [(HMAccessory *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory identifyWithCompletionHandler:]", @"completion"];
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v15 = self;
    char v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  uint64_t v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HMAccessory_identifyWithCompletionHandler___block_invoke;
    block[3] = &unk_1E59454E8;
    block[4] = self;
    id v20 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      id v24 = "-[HMAccessory identifyWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    char v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v4 + 2))(v4, v12);
  }
}

uint64_t __45__HMAccessory_identifyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _identifyWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)setSupportsIdentify:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsIdentify = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)updateAccessoryInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessory *)self delegate];
  if ([v5 conformsToProtocol:&unk_1EEF70C88]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  BOOL v8 = objc_msgSend(v4, "hmf_stringForKey:", @"kAccessoryVendorInfoBundleIDKey");
  id v9 = [(HMAccessory *)self bundleID];
  char v10 = HMFEqualObjects();

  if ((v10 & 1) == 0)
  {
    [(HMAccessory *)self setBundleID:v8];
    if (objc_opt_respondsToSelector())
    {
      id v11 = [(HMAccessory *)self context];
      char v12 = [v11 delegateCaller];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __35__HMAccessory_updateAccessoryInfo___block_invoke;
      v51[3] = &unk_1E5945650;
      id v52 = v7;
      __int16 v53 = self;
      id v54 = v8;
      [v12 invokeBlock:v51];
    }
  }
  uint64_t v13 = objc_msgSend(v4, "hmf_stringForKey:", @"kAccessoryVendorInfoStoreIDKey");
  id v14 = [(HMAccessory *)self storeID];
  char v15 = HMFEqualObjects();

  if ((v15 & 1) == 0)
  {
    [(HMAccessory *)self setStoreID:v13];
    if (objc_opt_respondsToSelector())
    {
      char v16 = [(HMAccessory *)self context];
      id v17 = [v16 delegateCaller];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __35__HMAccessory_updateAccessoryInfo___block_invoke_2;
      v47[3] = &unk_1E5945650;
      id v48 = v7;
      id v49 = self;
      id v50 = v13;
      [v17 invokeBlock:v47];
    }
  }
  uint64_t v18 = objc_msgSend(v4, "hmf_BOOLForKey:", @"kAccessoryVendorInfoFirmwareUpdateAvailableKey");
  if (v18 != [(HMAccessory *)self isFirmwareUpdateAvailable])
  {
    [(HMAccessory *)self setFirmwareUpdateAvailable:v18];
    if (objc_opt_respondsToSelector())
    {
      id v19 = [(HMAccessory *)self context];
      id v20 = [v19 delegateCaller];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __35__HMAccessory_updateAccessoryInfo___block_invoke_3;
      v43[3] = &unk_1E5944D60;
      id v44 = v7;
      id v45 = self;
      char v46 = v18;
      [v20 invokeBlock:v43];
    }
  }
  uint64_t v21 = objc_msgSend(v4, "hmf_stringForKey:", @"kAccessoryInfoManufacturerKey", v13);
  uint64_t v22 = [(HMAccessory *)self manufacturer];
  char v23 = HMFEqualObjects();

  if ((v23 & 1) == 0) {
    [(HMAccessory *)self setManufacturer:v21];
  }
  id v24 = v7;
  uint64_t v25 = objc_msgSend(v4, "hmf_stringForKey:", @"kAccessoryInfoModelKey");
  int v26 = [(HMAccessory *)self model];
  char v27 = HMFEqualObjects();

  if ((v27 & 1) == 0) {
    [(HMAccessory *)self setModel:v25];
  }
  uint64_t v28 = v8;
  char v29 = objc_msgSend(v4, "hmf_stringForKey:", @"kAccessoryInfoFirmwareVersionKey");
  __int16 v30 = [(HMAccessory *)self firmwareVersion];
  char v31 = HMFEqualObjects();

  if ((v31 & 1) == 0)
  {
    [(HMAccessory *)self setFirmwareVersion:v29];
    uint64_t v32 = [(HMAccessory *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v33 = [(HMAccessory *)self context];
      id v34 = [v33 delegateCaller];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __35__HMAccessory_updateAccessoryInfo___block_invoke_4;
      v39[3] = &unk_1E5945650;
      id v40 = v32;
      id v41 = self;
      id v42 = v29;
      [v34 invokeBlock:v39];
    }
  }
  __int16 v35 = objc_msgSend(v4, "hmf_stringForKey:", @"kAccessoryInfoSerialNumberKey");
  __int16 v36 = [(HMAccessory *)self serialNumber];
  char v37 = HMFEqualObjects();

  if ((v37 & 1) == 0) {
    [(HMAccessory *)self setSerialNumber:v35];
  }
}

uint64_t __35__HMAccessory_updateAccessoryInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateBundleID:*(void *)(a1 + 48)];
}

uint64_t __35__HMAccessory_updateAccessoryInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateStoreID:*(void *)(a1 + 48)];
}

uint64_t __35__HMAccessory_updateAccessoryInfo___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateFirmwareUpdateAvailable:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __35__HMAccessory_updateAccessoryInfo___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateFirmwareVersion:*(void *)(a1 + 48)];
}

- (void)_handleAccessoryFlagsChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 messagePayload];
  uint64_t v6 = objc_msgSend((id)v5, "hmf_numberForKey:", @"HM.accessoryFlagsKey");

  LOBYTE(v5) = [v6 integerValue];
  unint64_t v7 = [(HMAccessory *)self additionalSetupStatus];
  if (v5)
  {
    if (v7 == 1) {
      goto LABEL_7;
    }
    uint64_t v8 = 1;
  }
  else
  {
    if (v7 == 2) {
      goto LABEL_7;
    }
    uint64_t v8 = 2;
  }
  [(HMAccessory *)self setAdditionalSetupStatus:v8];
  [(HMAccessory *)self _notifyDelegatesOfAdditionalSetupRequiredChange];
LABEL_7:
  char v9 = [v6 integerValue];
  unint64_t v10 = [(HMAccessory *)self calibrationStatus];
  if ((v9 & 2) != 0)
  {
    if (v10 != 1)
    {
      id v11 = (void *)MEMORY[0x19F3A64A0]();
      char v16 = self;
      uint64_t v13 = HMFGetOSLogHandle();
      uint64_t v15 = 1;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        int v18 = 138543362;
        id v19 = v17;
        uint64_t v15 = 1;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Calibration Status updated to  HMAccessoryCalibrationStatusInProgress", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_15;
    }
  }
  else if (v10 != 2)
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    char v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v18 = 138543362;
      id v19 = v14;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Calibration Status updated to  HMAccessoryCalibrationStatusComplete", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v15 = 2;
LABEL_15:

    [(HMAccessory *)self setCalibrationStatus:v15];
    [(HMAccessory *)self _notifyDelegatesOfUpdatedCalibrationStatus];
  }
  [(HMAccessory *)self setAccessoryFlags:v6];
}

uint64_t __45__HMAccessory__handleCharacteristicsUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) service:*(void *)(a1 + 48) didUpdateValueForCharacteristic:*(void *)(a1 + 56)];
}

uint64_t __45__HMAccessory__handleCharacteristicsUpdated___block_invoke_1289(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateServices:*(void *)(a1 + 40)];
}

uint64_t __42__HMAccessory__handleConnectivityChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateReachability:*(void *)(a1 + 40)];
}

uint64_t __42__HMAccessory__handleConnectivityChanged___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateReachableTransports:*(void *)(a1 + 40)];
}

- (void)_handlePairingStateChanged:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:@"kAccessoryIsPairedKey"];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 BOOLValue];
    if (v7 != [(HMAccessory *)self paired])
    {
      uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
      char v9 = self;
      unint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        [(HMAccessory *)v9 paired];
        char v12 = HMFBooleanToString();
        uint64_t v13 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        uint64_t v21 = v11;
        __int16 v22 = 2112;
        char v23 = v12;
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating isPaired from %@ to %@", buf, 0x20u);
      }
      [(HMAccessory *)v9 setPaired:v7];
      id v14 = [(HMAccessory *)v9 delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = [(HMAccessory *)v9 context];
        char v16 = [v15 delegateCaller];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __42__HMAccessory__handlePairingStateChanged___block_invoke;
        v17[3] = &unk_1E5945628;
        id v18 = v14;
        id v19 = v9;
        [v16 invokeBlock:v17];
      }
    }
  }
}

uint64_t __42__HMAccessory__handlePairingStateChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateReachability:*(void *)(a1 + 40)];
}

- (void)_handleRenamed:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 stringForKey:@"kAccessoryName"];
  uint64_t v6 = [(HMAccessory *)self context];
  uint64_t v7 = [v6 pendingRequests];

  uint64_t v8 = [v4 identifier];
  char v9 = [v7 removeCompletionBlockForIdentifier:v8];

  if (v5)
  {
    unint64_t v10 = [(HMAccessory *)self name];
    char v11 = HMFEqualObjects();

    if (v11)
    {
      if (!v9) {
        goto LABEL_11;
      }
    }
    else
    {
      char v12 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v15;
        __int16 v29 = 2112;
        __int16 v30 = v5;
        _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updated name: %@", buf, 0x16u);
      }
      [(HMAccessory *)v13 setName:v5];
      if (!v9)
      {
        id v16 = [(HMAccessory *)v13 delegate];
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_10;
        }
        id v18 = (void *)MEMORY[0x19F3A64A0]();
        id v19 = v13;
        uint64_t v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v28 = v21;
          _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated name", buf, 0xCu);
        }
        __int16 v22 = [(HMAccessory *)v19 context];
        char v23 = [v22 delegateCaller];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __30__HMAccessory__handleRenamed___block_invoke;
        v24[3] = &unk_1E5945628;
        id v16 = v16;
        id v25 = v16;
        uint64_t v26 = v19;
        [v23 invokeBlock:v24];

        id v17 = v25;
LABEL_9:

LABEL_10:
        goto LABEL_11;
      }
    }
    id v16 = [(HMAccessory *)self context];
    id v17 = [v16 delegateCaller];
    [v17 callCompletion:v9 error:0];
    goto LABEL_9;
  }
LABEL_11:
}

uint64_t __30__HMAccessory__handleRenamed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateName:*(void *)(a1 + 40)];
}

- (void)_handleCharacteristicValueUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:@"kServiceInstanceID"];
  uint64_t v6 = [v4 numberForKey:@"kCharacteristicInstanceID"];
  uint64_t v7 = [v4 messagePayload];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"kCharacteristicValue"];

  char v9 = [v4 errorForKey:@"kCharacteristicErrorDataKey"];
  unint64_t v10 = [(HMAccessory *)self context];
  char v11 = [v10 pendingRequests];

  char v12 = [v4 identifier];
  uint64_t v13 = [v11 removeCompletionBlockForIdentifier:v12];

  if (v5 && v6 && v8)
  {
    id v14 = [(HMAccessory *)self services];
    uint64_t v15 = objc_msgSend(v14, "hmf_firstObjectWithInstanceID:", v5);

    if (v15)
    {
      __int16 v30 = v9;
      id v16 = [v15 characteristics];
      id v17 = objc_msgSend(v16, "hmf_firstObjectWithInstanceID:", v6);

      uint64_t v31 = v17;
      if (v17)
      {
        id v18 = [MEMORY[0x1E4F1CA98] null];

        char v27 = v15;
        if (v8 == v18)
        {

          uint64_t v8 = 0;
        }
        uint64_t v29 = [v17 value];
        id v19 = [v4 headers];
        uint64_t v20 = objc_msgSend(v19, "hmf_dateForKey:", @"HMXPCMessageSentDateKey");

        uint64_t v28 = (void *)v20;
        [v17 _updateValue:v8 valueUpdatedDate:v20];
        if (v13)
        {
          uint64_t v21 = [(HMAccessory *)self context];
          __int16 v22 = [v21 delegateCaller];
          char v9 = v30;
          [v22 callCompletion:v13 error:v30];

          char v23 = (void *)v29;
          uint64_t v15 = v27;
        }
        else
        {
          char v9 = v30;
          char v23 = (void *)v29;
          uint64_t v15 = v27;
          if ((HMFEqualObjects() & 1) == 0)
          {
            uint64_t v26 = [(HMAccessory *)self delegate];
            if (objc_opt_respondsToSelector())
            {
              id v25 = [(HMAccessory *)self context];
              __int16 v24 = [v25 delegateCaller];
              v32[0] = MEMORY[0x1E4F143A8];
              v32[1] = 3221225472;
              v32[2] = __49__HMAccessory__handleCharacteristicValueUpdated___block_invoke;
              v32[3] = &unk_1E5944F20;
              id v33 = v26;
              id v34 = self;
              id v35 = v27;
              id v36 = v31;
              [v24 invokeBlock:v32];

              char v23 = (void *)v29;
            }
          }
        }
      }
      else
      {
        char v9 = v30;
      }
    }
  }
}

uint64_t __49__HMAccessory__handleCharacteristicValueUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) service:*(void *)(a1 + 48) didUpdateValueForCharacteristic:*(void *)(a1 + 56)];
}

- (void)notifyDelegateUpdatedSupportsMediaContentProfile
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessory *)self context];
  id v4 = [v3 delegateCaller];
  if (v4)
  {
    uint64_t v5 = [(HMAccessory *)self delegate];
    if ([v5 conformsToProtocol:&unk_1EEF70C88]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      [(HMAccessory *)v9 supportsMediaContentProfile];
      char v12 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      char v23 = v12;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated supportsMediaContentProfile: %@, delegate: %@", buf, 0x20u);
    }
    if (objc_opt_respondsToSelector())
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __63__HMAccessory_notifyDelegateUpdatedSupportsMediaContentProfile__block_invoke;
      v17[3] = &unk_1E5945628;
      id v18 = v7;
      id v19 = v9;
      [v4 invokeBlock:v17];
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      char v23 = v3;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated supportsMediaContentProfile support due to missing delegateCaller: %@", buf, 0x16u);
    }
  }
}

uint64_t __63__HMAccessory_notifyDelegateUpdatedSupportsMediaContentProfile__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateSupportsMediaContentProfile:*(void *)(a1 + 40)];
}

- (void)notifyDelegateUpdatedSupportsJustSiri
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessory *)self context];
  id v4 = [v3 delegateCaller];
  if (v4)
  {
    uint64_t v5 = [(HMAccessory *)self delegate];
    if ([v5 conformsToProtocol:&unk_1EEF70C88]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      [(HMAccessory *)v9 supportsJustSiri];
      char v12 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      char v23 = v12;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated supportsJustSiri: %@, delegate: %@", buf, 0x20u);
    }
    if (objc_opt_respondsToSelector())
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__HMAccessory_notifyDelegateUpdatedSupportsJustSiri__block_invoke;
      v17[3] = &unk_1E5945628;
      id v18 = v7;
      id v19 = v9;
      [v4 invokeBlock:v17];
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      char v23 = v3;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated supportsJustSiri support due to missing delegateCaller: %@", buf, 0x16u);
    }
  }
}

uint64_t __52__HMAccessory_notifyDelegateUpdatedSupportsJustSiri__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateSupportsJustSiri:*(void *)(a1 + 40)];
}

- (void)notifyDelegateUpdatedSupportsRMVonAppleTV
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessory *)self context];
  id v4 = [v3 delegateCaller];
  if (v4)
  {
    uint64_t v5 = [(HMAccessory *)self delegate];
    if ([v5 conformsToProtocol:&unk_1EEF70C88]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      [(HMAccessory *)v9 supportsRMVonAppleTV];
      char v12 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      char v23 = v12;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated supportsRMVonAppleTV: %@, delegate: %@", buf, 0x20u);
    }
    if (objc_opt_respondsToSelector())
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __56__HMAccessory_notifyDelegateUpdatedSupportsRMVonAppleTV__block_invoke;
      v17[3] = &unk_1E5945628;
      id v18 = v7;
      id v19 = v9;
      [v4 invokeBlock:v17];
    }
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      char v23 = v3;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated supportsRMVonAppleTV support due to missing delegateCaller: %@", buf, 0x16u);
    }
  }
}

uint64_t __56__HMAccessory_notifyDelegateUpdatedSupportsRMVonAppleTV__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateSupportsRMVonAppleTV:*(void *)(a1 + 40)];
}

- (void)notifyDelegateUpdatedPreferredMediaUser
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessory *)self context];
  id v4 = [v3 delegateCaller];
  if (v4)
  {
    uint64_t v5 = [(HMAccessory *)self delegate];
    if ([v5 conformsToProtocol:&unk_1EEF70C88]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated preferred media user: %@", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector())
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __54__HMAccessory_notifyDelegateUpdatedPreferredMediaUser__block_invoke;
      v16[3] = &unk_1E5945628;
      id v17 = v7;
      id v18 = v9;
      [v4 invokeBlock:v16];
    }
  }
  else
  {
    char v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated preferred media user missing delegateCaller: %@", buf, 0x16u);
    }
  }
}

uint64_t __54__HMAccessory_notifyDelegateUpdatedPreferredMediaUser__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdatePreferredMediaUser:*(void *)(a1 + 40)];
}

- (void)notifyDelegateUpdatedSupportsPreferredMediaUser
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessory *)self context];
  id v4 = [v3 delegateCaller];
  if (v4)
  {
    uint64_t v5 = [(HMAccessory *)self delegate];
    if ([v5 conformsToProtocol:&unk_1EEF70C88]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated support for preferred media user: %@", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector())
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __62__HMAccessory_notifyDelegateUpdatedSupportsPreferredMediaUser__block_invoke;
      v16[3] = &unk_1E5945628;
      id v17 = v7;
      id v18 = v9;
      [v4 invokeBlock:v16];
    }
  }
  else
  {
    char v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of updated preferred media user support due to missing delegateCaller: %@", buf, 0x16u);
    }
  }
}

uint64_t __62__HMAccessory_notifyDelegateUpdatedSupportsPreferredMediaUser__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateSupportsPreferredMediaUser:*(void *)(a1 + 40)];
}

- (void)notifyDelegateOfAudioDestinationControllerUpdate
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessory *)self context];
  id v4 = [v3 delegateCaller];
  if (v4)
  {
    uint64_t v5 = [(HMAccessory *)self delegate];
    if ([v5 conformsToProtocol:&unk_1EEF70C88]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did update audio destination controller using private delegate: %@", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector())
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__HMAccessory_notifyDelegateOfAudioDestinationControllerUpdate__block_invoke;
      v16[3] = &unk_1E5945628;
      id v17 = v7;
      id v18 = v9;
      [v4 invokeBlock:v16];
    }
  }
  else
  {
    char v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of audio destination controller update due to missing delegate caller from context: %@", buf, 0x16u);
    }
  }
}

uint64_t __63__HMAccessory_notifyDelegateOfAudioDestinationControllerUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateAudioDestinationController:*(void *)(a1 + 40)];
}

- (void)notifyDelegateOfAudioDestinationUpdate
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessory *)self context];
  id v4 = [v3 delegateCaller];
  if (v4)
  {
    uint64_t v5 = [(HMAccessory *)self delegate];
    if ([v5 conformsToProtocol:&unk_1EEF70C88]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    char v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did update audio destination using private delegate: %@", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector())
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __53__HMAccessory_notifyDelegateOfAudioDestinationUpdate__block_invoke;
      v16[3] = &unk_1E5945628;
      id v17 = v7;
      id v18 = v9;
      [v4 invokeBlock:v16];
    }
  }
  else
  {
    char v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of audio destination update due to missing delegate caller from context: %@", buf, 0x16u);
    }
  }
}

uint64_t __53__HMAccessory_notifyDelegateOfAudioDestinationUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateAudioDestination:*(void *)(a1 + 40)];
}

- (void)_mergeProfiles:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMAccessory *)self accessoryProfiles];
  id v7 = [v6 array];
  uint64_t v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  char v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __30__HMAccessory__mergeProfiles___block_invoke;
  v27[3] = &unk_1E59429D0;
  v27[4] = self;
  [v9 enumerateObjectsUsingBlock:v27];

  unint64_t v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __30__HMAccessory__mergeProfiles___block_invoke_1267;
  v26[3] = &unk_1E59429D0;
  v26[4] = self;
  [v10 enumerateObjectsUsingBlock:v26];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  char v11 = [(HMObjectMergeCollection *)v8 finalObjects];
  char v12 = [(HMAccessory *)self accessoryProfiles];
  [v12 setArray:v11];

  uint64_t v13 = [(HMObjectMergeCollection *)v8 removedObjects];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __30__HMAccessory__mergeProfiles___block_invoke_1268;
  v25[3] = &unk_1E59429D0;
  v25[4] = self;
  [v13 enumerateObjectsUsingBlock:v25];

  id v14 = [(HMObjectMergeCollection *)v8 addedObjects];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __30__HMAccessory__mergeProfiles___block_invoke_1270;
  v24[3] = &unk_1E59429D0;
  void v24[4] = self;
  [v14 enumerateObjectsUsingBlock:v24];

  if ([(HMObjectMergeCollection *)v8 isModified])
  {
    uint64_t v15 = [(HMAccessory *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0)
    {
      id v16 = (void *)MEMORY[0x19F3A64A0]();
      id v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v19;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Delegate does not implement accessory profile methods, calling didUpdateServices:. This                             behavior is not documented and will be removed in the near future. Please adopt                             accessory:didAddProfile: and/or accessory:didRemoveProfile:.", buf, 0xCu);
      }
      uint64_t v20 = [(HMAccessory *)v17 context];
      __int16 v21 = [v20 queue];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __30__HMAccessory__mergeProfiles___block_invoke_1274;
      void v22[3] = &unk_1E5945628;
      v22[4] = v17;
      id v23 = v15;
      dispatch_async(v21, v22);
    }
  }
}

void __30__HMAccessory__mergeProfiles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    unint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed accessory profile via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = [v3 accessoryProfile];
  [v8 _unconfigure];
}

void __30__HMAccessory__mergeProfiles___block_invoke_1267(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v10 = 138543618;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added accessory profile via merge: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = [v3 accessoryProfile];
  int v9 = [*(id *)(a1 + 32) context];
  objc_msgSend(v8, "__configureWithContext:accessory:", v9, *(void *)(a1 + 32));
}

void __30__HMAccessory__mergeProfiles___block_invoke_1268(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__HMAccessory__mergeProfiles___block_invoke_2;
    block[3] = &unk_1E5945650;
    block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __30__HMAccessory__mergeProfiles___block_invoke_1270(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) context];
    uint64_t v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__HMAccessory__mergeProfiles___block_invoke_2_1272;
    block[3] = &unk_1E5945650;
    block[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v9 = v4;
    dispatch_async(v6, block);
  }
}

void __30__HMAccessory__mergeProfiles___block_invoke_1274(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __30__HMAccessory__mergeProfiles___block_invoke_2_1275;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __30__HMAccessory__mergeProfiles___block_invoke_2_1275(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateServices:*(void *)(a1 + 40)];
}

void __30__HMAccessory__mergeProfiles___block_invoke_2_1272(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__HMAccessory__mergeProfiles___block_invoke_3_1273;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __30__HMAccessory__mergeProfiles___block_invoke_3_1273(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added profile: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) accessory:*(void *)(a1 + 32) didAddProfile:*(void *)(a1 + 40)];
}

void __30__HMAccessory__mergeProfiles___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__HMAccessory__mergeProfiles___block_invoke_3;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

uint64_t __30__HMAccessory__mergeProfiles___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client of removed profile: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) accessory:*(void *)(a1 + 32) didRemoveProfile:*(void *)(a1 + 40)];
}

- (BOOL)_mergeRemoteLoginHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMAccessory *)self remoteLoginHandler];

  if (!v4 || v5)
  {
    uint64_t v12 = [(HMAccessory *)self remoteLoginHandler];

    char v11 = 0;
    if (v4 && v12)
    {
      id v13 = [(HMAccessory *)self remoteLoginHandler];
      char v11 = [v13 mergeFromNewObject:v4];
    }
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Merging new remote login handler: %@", (uint8_t *)&v15, 0x16u);
    }
    [(HMAccessory *)v7 setRemoteLoginHandler:v4];
    __int16 v10 = [(HMAccessory *)v7 context];
    [v4 _configureWithContext:v10 accessory:v7];

    [v4 registerForMessages];
    [v4 postConfigure];
    char v11 = 1;
  }

  return v11;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v660 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  v579 = [(HMAccessory *)self home];
  if (!v6)
  {
    LOBYTE(v48) = 0;
    goto LABEL_379;
  }
  id v576 = v4;
  id v7 = [v6 services];
  BOOL v8 = [(HMAccessory *)self _mergeServices:v7];

  id v9 = [v6 controlTargetUUIDs];
  BOOL v10 = [(HMAccessory *)self _mergeControlTargetUUIDs:v9];

  LODWORD(v9) = [(HMAccessory *)self supportsTargetControl];
  if (v9 == [v6 supportsTargetControl]
    && (int v11 = [(HMAccessory *)self supportsTargetController],
        v11 == [v6 supportsTargetController])
    && (int v12 = [(HMAccessory *)self targetControllerHardwareSupport],
        v12 == [v6 targetControllerHardwareSupport]))
  {
    int v15 = v10 || v8;
  }
  else
  {
    -[HMAccessory setSupportsTargetControl:](self, "setSupportsTargetControl:", [v6 supportsTargetControl]);
    -[HMAccessory setSupportsTargetController:](self, "setSupportsTargetController:", [v6 supportsTargetController]);
    -[HMAccessory setTargetControllerHardwareSupport:](self, "setTargetControllerHardwareSupport:", [v6 targetControllerHardwareSupport]);
    id v13 = [(HMAccessory *)self context];
    uint64_t v14 = [v13 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__HMAccessory_mergeFromNewObject___block_invoke;
    block[3] = &unk_1E59452E8;
    block[4] = self;
    dispatch_async(v14, block);

    int v15 = 1;
  }
  int v16 = [(HMAccessory *)self supportsMultiUser];
  if (v16 != [v6 supportsMultiUser])
  {
    -[HMAccessory setSupportsMultiUser:](self, "setSupportsMultiUser:", [v6 supportsMultiUser]);
    __int16 v17 = [(HMAccessory *)self context];
    id v18 = [v17 queue];
    v650[0] = MEMORY[0x1E4F143A8];
    v650[1] = 3221225472;
    v650[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2;
    v650[3] = &unk_1E59452E8;
    v650[4] = self;
    dispatch_async(v18, v650);
  }
  int v19 = [(HMAccessory *)self supportsHomeLevelLocationServiceSetting];
  if (v19 != [v6 supportsHomeLevelLocationServiceSetting])
  {
    uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v21 = self;
    HMFGetOSLogHandle();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      [v6 supportsHomeLevelLocationServiceSetting];
      HMFBooleanToString();
      __int16 v24 = (char *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v653 = v23;
      __int16 v654 = 2112;
      v655 = v24;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating supports home level location service setting: %@", buf, 0x16u);
    }
    -[HMAccessory setSupportsHomeLevelLocationServiceSetting:](v21, "setSupportsHomeLevelLocationServiceSetting:", [v6 supportsHomeLevelLocationServiceSetting]);
    id v25 = [(HMAccessory *)v21 context];
    uint64_t v26 = [v25 queue];
    v649[0] = MEMORY[0x1E4F143A8];
    v649[1] = 3221225472;
    v649[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1080;
    v649[3] = &unk_1E59452E8;
    v649[4] = v21;
    dispatch_async(v26, v649);
  }
  int v27 = [(HMAccessory *)self supportsAudioReturnChannel];
  if (v27 != [v6 supportsAudioReturnChannel])
  {
    uint64_t v28 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v29 = self;
    HMFGetOSLogHandle();
    uint64_t v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      [v6 supportsAudioReturnChannel];
      HMFBooleanToString();
      uint64_t v32 = (char *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v653 = v31;
      __int16 v654 = 2112;
      v655 = v32;
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating supports audio return channel: %@", buf, 0x16u);
    }
    -[HMAccessory setSupportsAudioReturnChannel:](v29, "setSupportsAudioReturnChannel:", [v6 supportsAudioReturnChannel]);
    id v33 = [(HMAccessory *)v29 context];
    id v34 = [v33 queue];
    v648[0] = MEMORY[0x1E4F143A8];
    v648[1] = 3221225472;
    v648[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1081;
    v648[3] = &unk_1E59452E8;
    v648[4] = v29;
    dispatch_async(v34, v648);
  }
  int v35 = [(HMAccessory *)self supportsCompanionInitiatedRestart];
  if (v35 != [v6 supportsCompanionInitiatedRestart])
  {
    -[HMAccessory setSupportsCompanionInitiatedRestart:](self, "setSupportsCompanionInitiatedRestart:", [v6 supportsCompanionInitiatedRestart]);
    id v36 = [(HMAccessory *)self context];
    char v37 = [v36 queue];
    v647[0] = MEMORY[0x1E4F143A8];
    v647[1] = 3221225472;
    v647[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1082;
    v647[3] = &unk_1E59452E8;
    v647[4] = self;
    dispatch_async(v37, v647);
  }
  int v38 = [(HMAccessory *)self supportsCompanionInitiatedObliterate];
  if (v38 != [v6 supportsCompanionInitiatedObliterate])
  {
    -[HMAccessory setSupportsCompanionInitiatedObliterate:](self, "setSupportsCompanionInitiatedObliterate:", [v6 supportsCompanionInitiatedObliterate]);
    uint64_t v39 = [(HMAccessory *)self context];
    id v40 = [v39 queue];
    v646[0] = MEMORY[0x1E4F143A8];
    v646[1] = 3221225472;
    v646[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_3;
    v646[3] = &unk_1E59452E8;
    v646[4] = self;
    dispatch_async(v40, v646);
  }
  int v41 = [(HMAccessory *)self supportsMusicAlarm];
  if (v41 != [v6 supportsMusicAlarm])
  {
    -[HMAccessory setSupportsMusicAlarm:](self, "setSupportsMusicAlarm:", [v6 supportsMusicAlarm]);
    id v42 = [(HMAccessory *)self context];
    id v43 = [v42 queue];
    v645[0] = MEMORY[0x1E4F143A8];
    v645[1] = 3221225472;
    v645[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_4;
    v645[3] = &unk_1E59452E8;
    v645[4] = self;
    dispatch_async(v43, v645);
  }
  int v44 = [(HMAccessory *)self supportsAnnounce];
  if (v44 != [v6 supportsAnnounce])
  {
    -[HMAccessory setSupportsAnnounce:](self, "setSupportsAnnounce:", [v6 supportsAnnounce]);
    id v45 = [(HMAccessory *)self _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      char v46 = [(HMAccessory *)self context];
      unint64_t v47 = [v46 queue];
      v643[0] = MEMORY[0x1E4F143A8];
      v643[1] = 3221225472;
      v643[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_5;
      v643[3] = &unk_1E5945628;
      v643[4] = self;
      id v644 = v45;
      dispatch_async(v47, v643);
    }
    else
    {
      id v49 = (void *)MEMORY[0x19F3A64A0]();
      id v50 = self;
      HMFGetOSLogHandle();
      id v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        id v653 = v52;
        __int16 v654 = 2112;
        v655 = (const char *)v45;
        _os_log_impl(&dword_19D1A8000, v51, OS_LOG_TYPE_INFO, "%{public}@Delegate does not implement supports announce update: %@", buf, 0x16u);
      }
    }
  }
  int v53 = [(HMAccessory *)self supportsMediaActions];
  if (v53 != [v6 supportsMediaActions])
  {
    -[HMAccessory setSupportsMediaActions:](self, "setSupportsMediaActions:", [v6 supportsMediaActions]);
    id v54 = [(HMAccessory *)self _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v55 = [(HMAccessory *)self context];
      id v56 = [v55 queue];
      v641[0] = MEMORY[0x1E4F143A8];
      v641[1] = 3221225472;
      v641[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1085;
      v641[3] = &unk_1E5945628;
      v641[4] = self;
      id v642 = v54;
      dispatch_async(v56, v641);
    }
    else
    {
      __int16 v57 = (void *)MEMORY[0x19F3A64A0]();
      id v58 = self;
      HMFGetOSLogHandle();
      uint64_t v59 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        id v653 = v60;
        __int16 v654 = 2112;
        v655 = (const char *)v54;
        _os_log_impl(&dword_19D1A8000, v59, OS_LOG_TYPE_INFO, "%{public}@Delegate does not implement supports media actions update: %@", buf, 0x16u);
      }
    }
  }
  int v61 = [(HMAccessory *)self supportsDropIn];
  if (v61 != [v6 supportsDropIn])
  {
    -[HMAccessory setSupportsDropIn:](self, "setSupportsDropIn:", [v6 supportsDropIn]);
    long long v62 = [(HMAccessory *)self _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      long long v63 = [(HMAccessory *)self context];
      long long v64 = [v63 queue];
      v639[0] = MEMORY[0x1E4F143A8];
      v639[1] = 3221225472;
      v639[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1088;
      v639[3] = &unk_1E5945628;
      v639[4] = self;
      id v640 = v62;
      dispatch_async(v64, v639);
    }
    else
    {
      long long v65 = (void *)MEMORY[0x19F3A64A0]();
      long long v66 = self;
      HMFGetOSLogHandle();
      long long v67 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v68 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        id v653 = v68;
        __int16 v654 = 2112;
        v655 = (const char *)v62;
        _os_log_impl(&dword_19D1A8000, v67, OS_LOG_TYPE_INFO, "%{public}@Delegate does not implement supports drop in update: %@", buf, 0x16u);
      }
    }
  }
  int v69 = [(HMAccessory *)self supportsAudioAnalysis];
  if (v69 != [v6 supportsAudioAnalysis])
  {
    -[HMAccessory setSupportsAudioAnalysis:](self, "setSupportsAudioAnalysis:", [v6 supportsAudioAnalysis]);
    __int16 v70 = [(HMAccessory *)self _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      v71 = [(HMAccessory *)self context];
      __int16 v72 = [v71 queue];
      v637[0] = MEMORY[0x1E4F143A8];
      v637[1] = 3221225472;
      v637[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1091;
      v637[3] = &unk_1E5945628;
      v637[4] = self;
      id v638 = v70;
      dispatch_async(v72, v637);
    }
    else
    {
      __int16 v73 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v74 = self;
      HMFGetOSLogHandle();
      long long v75 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v76 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        id v653 = v76;
        __int16 v654 = 2112;
        v655 = (const char *)v70;
        _os_log_impl(&dword_19D1A8000, v75, OS_LOG_TYPE_INFO, "%{public}@Delegate does not implement supports audio analysis update: %@", buf, 0x16u);
      }
    }
  }
  int v77 = [(HMAccessory *)self supportsThirdPartyMusic];
  if (v77 != [v6 supportsThirdPartyMusic])
  {
    -[HMAccessory setSupportsThirdPartyMusic:](self, "setSupportsThirdPartyMusic:", [v6 supportsThirdPartyMusic]);
    __int16 v78 = [(HMAccessory *)self _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      long long v79 = [(HMAccessory *)self context];
      __int16 v80 = [v79 queue];
      v635[0] = MEMORY[0x1E4F143A8];
      v635[1] = 3221225472;
      v635[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1094;
      v635[3] = &unk_1E5945628;
      v635[4] = self;
      id v636 = v78;
      dispatch_async(v80, v635);
    }
  }
  int v81 = [(HMAccessory *)self supportsDoorbellChime];
  if (v81 != [v6 supportsDoorbellChime])
  {
    -[HMAccessory setSupportsDoorbellChime:](self, "setSupportsDoorbellChime:", [v6 supportsDoorbellChime]);
    __int16 v82 = [(HMAccessory *)self _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      v83 = [(HMAccessory *)self context];
      __int16 v84 = [v83 queue];
      v633[0] = MEMORY[0x1E4F143A8];
      v633[1] = 3221225472;
      v633[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1097;
      v633[3] = &unk_1E5945628;
      v633[4] = self;
      id v634 = v82;
      dispatch_async(v84, v633);
    }
  }
  int v85 = [(HMAccessory *)self supportsUserMediaSettings];
  if (v85 != [v6 supportsUserMediaSettings])
  {
    -[HMAccessory setSupportsUserMediaSettings:](self, "setSupportsUserMediaSettings:", [v6 supportsUserMediaSettings]);
    __int16 v86 = [(HMAccessory *)self _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v87 = [(HMAccessory *)self context];
      __int16 v88 = [v87 queue];
      v631[0] = MEMORY[0x1E4F143A8];
      v631[1] = 3221225472;
      v631[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1100;
      v631[3] = &unk_1E5945628;
      v631[4] = self;
      id v632 = v86;
      dispatch_async(v88, v631);
    }
  }
  id v89 = [(HMAccessory *)self name];
  uint64_t v90 = [v6 name];
  char v91 = HMFEqualObjects();

  if ((v91 & 1) == 0)
  {
    uint64_t v92 = (void *)MEMORY[0x19F3A64A0]();
    long long v93 = self;
    HMFGetOSLogHandle();
    uint64_t v94 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v95 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v96 = [v6 name];
      *(_DWORD *)buf = 138543618;
      id v653 = v95;
      __int16 v654 = 2112;
      v655 = v96;
      _os_log_impl(&dword_19D1A8000, v94, OS_LOG_TYPE_DEFAULT, "%{public}@Updated name: %@", buf, 0x16u);
    }
    v97 = [v6 name];
    [(HMAccessory *)v93 setName:v97];

    __int16 v98 = [(HMAccessory *)v93 delegate];
    id v99 = (void *)MEMORY[0x19F3A64A0]();
    v100 = v93;
    HMFGetOSLogHandle();
    uint64_t v101 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v102 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v653 = v102;
      __int16 v654 = 2112;
      v655 = v98;
      _os_log_impl(&dword_19D1A8000, v101, OS_LOG_TYPE_INFO, "%{public}@Notifying client of accessory did update name with delegate: %@", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v103 = [(HMAccessory *)v100 context];
      uint64_t v104 = [v103 queue];
      v629[0] = MEMORY[0x1E4F143A8];
      v629[1] = 3221225472;
      v629[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1103;
      v629[3] = &unk_1E5945628;
      v629[4] = v100;
      v630 = v98;
      dispatch_async(v104, v629);
    }
    int v15 = 1;
  }
  uint64_t v105 = [(HMAccessory *)self configuredName];
  v106 = [v6 configuredName];
  char v107 = HMFEqualObjects();

  if ((v107 & 1) == 0)
  {
    v108 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v109 = self;
    HMFGetOSLogHandle();
    v110 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v111 = (id)objc_claimAutoreleasedReturnValue();
      v112 = [v6 configuredName];
      *(_DWORD *)buf = 138543618;
      id v653 = v111;
      __int16 v654 = 2112;
      v655 = v112;
      _os_log_impl(&dword_19D1A8000, v110, OS_LOG_TYPE_INFO, "%{public}@Updated configured name: %@", buf, 0x16u);
    }
    uint64_t v113 = [v6 configuredName];
    [(HMAccessory *)v109 setConfiguredName:v113];

    v114 = [(HMAccessory *)v109 delegate];
    uint64_t v115 = (void *)MEMORY[0x19F3A64A0]();
    v116 = v109;
    HMFGetOSLogHandle();
    v117 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v118 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v653 = v118;
      __int16 v654 = 2112;
      v655 = v114;
      _os_log_impl(&dword_19D1A8000, v117, OS_LOG_TYPE_INFO, "%{public}@Notifying client of accessory did update configured name with delegate: %@", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector())
    {
      v119 = [(HMAccessory *)v116 context];
      v120 = [v119 queue];
      v627[0] = MEMORY[0x1E4F143A8];
      v627[1] = 3221225472;
      v627[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1105;
      v627[3] = &unk_1E5945628;
      v627[4] = v116;
      v628 = v114;
      dispatch_async(v120, v627);
    }
  }
  v121 = [(HMAccessory *)self applicationData];
  v122 = [v6 applicationData];
  char v123 = HMFEqualObjects();

  if ((v123 & 1) == 0)
  {
    v124 = (void *)MEMORY[0x19F3A64A0]();
    v125 = self;
    HMFGetOSLogHandle();
    v126 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v127 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v653 = v127;
      _os_log_impl(&dword_19D1A8000, v126, OS_LOG_TYPE_INFO, "%{public}@Updated application data", buf, 0xCu);
    }
    uint64_t v128 = [v6 applicationData];
    [(HMAccessory *)v125 setApplicationData:v128];

    v129 = [(HMAccessory *)v125 _privateDelegate];
    v130 = (void *)MEMORY[0x19F3A64A0]();
    v131 = v125;
    HMFGetOSLogHandle();
    v132 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v133 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v653 = v133;
      __int16 v654 = 2112;
      v655 = v129;
      _os_log_impl(&dword_19D1A8000, v132, OS_LOG_TYPE_INFO, "%{public}@Notifying client of accessory did update application data with delegate: %@", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector())
    {
      v134 = [(HMAccessory *)v131 context];
      v135 = [v134 queue];
      v625[0] = MEMORY[0x1E4F143A8];
      v625[1] = 3221225472;
      v625[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1108;
      v625[3] = &unk_1E5945628;
      v625[4] = v131;
      v626 = v129;
      dispatch_async(v135, v625);
    }
    int v15 = 1;
  }
  v136 = [v6 room];
  uint64_t v137 = [(HMAccessory *)self room];
  v138 = [v137 uuid];
  v577 = v136;
  uint64_t v139 = [v136 uuid];
  char v140 = [v138 isEqual:v139];

  if ((v140 & 1) == 0)
  {
    uint64_t v141 = [v577 uuid];
    v142 = [v579 roomWithUUID:v141];

    if (v142)
    {
      [(HMAccessory *)self setRoom:v142];
    }
    else
    {
      uint64_t v143 = (void *)MEMORY[0x19F3A64A0]();
      v144 = self;
      HMFGetOSLogHandle();
      uint64_t v145 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v146 = (id)objc_claimAutoreleasedReturnValue();
        v147 = [v577 uuid];
        *(_DWORD *)buf = 138543618;
        id v653 = v146;
        __int16 v654 = 2112;
        v655 = v147;
        _os_log_impl(&dword_19D1A8000, v145, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find HMRoom for updated room UUID via merge: %@", buf, 0x16u);
      }
    }
    uint64_t v148 = [v579 delegate];
    v149 = (void *)MEMORY[0x19F3A64A0]();
    v150 = self;
    HMFGetOSLogHandle();
    v151 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v152 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      id v653 = v152;
      __int16 v654 = 2112;
      v655 = v142;
      __int16 v656 = 2112;
      id v657 = v150;
      __int16 v658 = 2112;
      v659 = v148;
      _os_log_impl(&dword_19D1A8000, v151, OS_LOG_TYPE_INFO, "%{public}@Notifying client did update room: %@ for accessory: %@ delegate: %@", buf, 0x2Au);
    }
    if (objc_opt_respondsToSelector())
    {
      v153 = [(HMAccessory *)v150 context];
      v154 = [v153 queue];
      v621[0] = MEMORY[0x1E4F143A8];
      v621[1] = 3221225472;
      v621[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1112;
      v621[3] = &unk_1E5944F20;
      v621[4] = v150;
      id v622 = v148;
      id v623 = v579;
      v624 = v142;
      dispatch_async(v154, v621);
    }
    int v15 = 1;
  }
  BOOL v155 = [(HMAccessory *)self paired];
  int v156 = v155 ^ [v6 paired];
  if (v156 == 1)
  {
    -[HMAccessory setPaired:](self, "setPaired:", [v6 paired]);
    int v15 = 1;
  }
  unint64_t v157 = [(HMAccessory *)self suspendedState];
  if (v157 != [v6 suspendedState])
  {
    -[HMAccessory setSuspendedState:](self, "setSuspendedState:", [v6 suspendedState]);
    int v156 = 1;
    int v15 = 1;
  }
  int v158 = [(HMAccessory *)self supportsAccessCodes];
  if (v158 != [v6 supportsAccessCodes])
  {
    -[HMAccessory setSupportsAccessCodes:](self, "setSupportsAccessCodes:", [v6 supportsAccessCodes]);
    int v15 = 1;
  }
  int v159 = [(HMAccessory *)self supportsWalletKey];
  if (v159 != [v6 supportsWalletKey])
  {
    -[HMAccessory setSupportsWalletKey:](self, "setSupportsWalletKey:", [v6 supportsWalletKey]);
    v160 = [(HMAccessory *)self context];
    v161 = [v160 queue];
    v620[0] = MEMORY[0x1E4F143A8];
    v620[1] = 3221225472;
    v620[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_3_1114;
    v620[3] = &unk_1E59452E8;
    v620[4] = self;
    dispatch_async(v161, v620);

    int v15 = 1;
  }
  int v162 = [(HMAccessory *)self supportsUWBUnlock];
  if (v162 != [v6 supportsUWBUnlock])
  {
    -[HMAccessory setSupportsUWBUnlock:](self, "setSupportsUWBUnlock:", [v6 supportsUWBUnlock]);
    v163 = [(HMAccessory *)self context];
    v164 = [v163 queue];
    v619[0] = MEMORY[0x1E4F143A8];
    v619[1] = 3221225472;
    v619[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_4_1115;
    v619[3] = &unk_1E59452E8;
    v619[4] = self;
    dispatch_async(v164, v619);

    int v15 = 1;
  }
  long long v165 = [(HMAccessory *)self readerGroupSubIdentifierACWG];
  long long v166 = [v6 readerGroupSubIdentifierACWG];
  char v167 = HMFEqualObjects();

  if ((v167 & 1) == 0)
  {
    long long v168 = (void *)MEMORY[0x19F3A64A0]();
    v169 = self;
    HMFGetOSLogHandle();
    v170 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v171 = (id)objc_claimAutoreleasedReturnValue();
      v172 = [(HMAccessory *)v169 readerGroupSubIdentifierACWG];
      v173 = [v6 readerGroupSubIdentifierACWG];
      *(_DWORD *)buf = 138543874;
      id v653 = v171;
      __int16 v654 = 2112;
      v655 = v172;
      __int16 v656 = 2112;
      id v657 = v173;
      _os_log_impl(&dword_19D1A8000, v170, OS_LOG_TYPE_INFO, "%{public}@Updating readerGroupSubIdentifierACWG from %@ to %@", buf, 0x20u);
    }
    v174 = [v6 readerGroupSubIdentifierACWG];
    [(HMAccessory *)v169 setReaderGroupSubIdentifierACWG:v174];

    int v15 = 1;
  }
  v175 = [(HMAccessory *)self readerIDACWG];
  v176 = [v6 readerIDACWG];
  char v177 = HMFEqualObjects();

  if ((v177 & 1) == 0)
  {
    __int16 v178 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v179 = self;
    HMFGetOSLogHandle();
    uint64_t v180 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v181 = (id)objc_claimAutoreleasedReturnValue();
      v182 = [(HMAccessory *)v179 readerIDACWG];
      v183 = [v6 readerIDACWG];
      *(_DWORD *)buf = 138543874;
      id v653 = v181;
      __int16 v654 = 2112;
      v655 = v182;
      __int16 v656 = 2112;
      id v657 = v183;
      _os_log_impl(&dword_19D1A8000, v180, OS_LOG_TYPE_INFO, "%{public}@Updating readerIDACWG from %@ to %@", buf, 0x20u);
    }
    v184 = [v6 readerIDACWG];
    [(HMAccessory *)v179 setReaderIDACWG:v184];

    int v15 = 1;
  }
  v185 = [(HMAccessory *)self weekDaySchedulesPerUserCapacity];
  v186 = [v6 weekDaySchedulesPerUserCapacity];
  char v187 = HMFEqualObjects();

  if ((v187 & 1) == 0)
  {
    v188 = (void *)MEMORY[0x19F3A64A0]();
    v189 = self;
    HMFGetOSLogHandle();
    v190 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v191 = (id)objc_claimAutoreleasedReturnValue();
      v192 = [(HMAccessory *)v189 weekDaySchedulesPerUserCapacity];
      v193 = [v6 weekDaySchedulesPerUserCapacity];
      *(_DWORD *)buf = 138543874;
      id v653 = v191;
      __int16 v654 = 2112;
      v655 = v192;
      __int16 v656 = 2112;
      id v657 = v193;
      _os_log_impl(&dword_19D1A8000, v190, OS_LOG_TYPE_INFO, "%{public}@Updating weekDaySchedulesPerUserCapacity from %@ to %@", buf, 0x20u);
    }
    v194 = [v6 weekDaySchedulesPerUserCapacity];
    [(HMAccessory *)v189 setWeekDaySchedulesPerUserCapacity:v194];

    int v15 = 1;
  }
  v195 = [(HMAccessory *)self yearDaySchedulesPerUserCapacity];
  v196 = [v6 yearDaySchedulesPerUserCapacity];
  char v197 = HMFEqualObjects();

  if ((v197 & 1) == 0)
  {
    v198 = (void *)MEMORY[0x19F3A64A0]();
    v199 = self;
    HMFGetOSLogHandle();
    v200 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v201 = (id)objc_claimAutoreleasedReturnValue();
      v202 = [(HMAccessory *)v199 yearDaySchedulesPerUserCapacity];
      v203 = [v6 yearDaySchedulesPerUserCapacity];
      *(_DWORD *)buf = 138543874;
      id v653 = v201;
      __int16 v654 = 2112;
      v655 = v202;
      __int16 v656 = 2112;
      id v657 = v203;
      _os_log_impl(&dword_19D1A8000, v200, OS_LOG_TYPE_INFO, "%{public}@Updating yearDaySchedulesPerUserCapacity from %@ to %@", buf, 0x20u);
    }
    v204 = [v6 yearDaySchedulesPerUserCapacity];
    [(HMAccessory *)v199 setYearDaySchedulesPerUserCapacity:v204];

    int v15 = 1;
  }
  int v205 = [(HMAccessory *)self suspendCapable];
  if (v205 != [v6 suspendCapable])
  {
    if ([(HMAccessory *)self suspendCapable]) {
      [(HMAccessory *)self setReachable:1];
    }
    -[HMAccessory setSuspendCapable:](self, "setSuspendCapable:", [v6 suspendCapable]);
    int v15 = 1;
  }
  if ([(HMAccessory *)self suspendCapable]) {
    [v6 setReachable:1];
  }
  int v206 = [(HMAccessory *)self isReachable];
  if (v206 == [v6 isReachable])
  {
    if (!v156) {
      goto LABEL_141;
    }
  }
  else
  {
    v207 = (void *)MEMORY[0x19F3A64A0]();
    v208 = self;
    HMFGetOSLogHandle();
    v209 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v210 = (id)objc_claimAutoreleasedReturnValue();
      [(HMAccessory *)v208 isReachable];
      HMFBooleanToString();
      v211 = (char *)(id)objc_claimAutoreleasedReturnValue();
      [v6 isReachable];
      HMFBooleanToString();
      id v212 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v653 = v210;
      __int16 v654 = 2112;
      v655 = v211;
      __int16 v656 = 2112;
      id v657 = v212;
      _os_log_impl(&dword_19D1A8000, v209, OS_LOG_TYPE_INFO, "%{public}@Updating isReachable from %@ to %@", buf, 0x20u);
    }
    -[HMAccessory setReachable:](v208, "setReachable:", [v6 isReachable]);
    int v15 = 1;
  }
  v213 = [(HMAccessory *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v214 = [(HMAccessory *)self context];
    v215 = [v214 queue];
    v617[0] = MEMORY[0x1E4F143A8];
    v617[1] = 3221225472;
    v617[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1117;
    v617[3] = &unk_1E5945628;
    v617[4] = self;
    id v618 = v213;
    dispatch_async(v215, v617);
  }
LABEL_141:
  int64_t v216 = [(HMAccessory *)self reachableTransports];
  v217 = &unk_19D47B000;
  if (v216 != [v6 reachableTransports])
  {
    -[HMAccessory setReachableTransports:](self, "setReachableTransports:", [v6 reachableTransports]);
    v218 = [(HMAccessory *)self delegate];
    if ([v218 conformsToProtocol:&unk_1EEF70C88]) {
      v219 = v218;
    }
    else {
      v219 = 0;
    }
    id v220 = v219;

    if (objc_opt_respondsToSelector())
    {
      v221 = [(HMAccessory *)self context];
      v222 = [v221 queue];
      v615[0] = MEMORY[0x1E4F143A8];
      v615[1] = 3221225472;
      v615[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_3_1120;
      v615[3] = &unk_1E5945628;
      v615[4] = self;
      id v616 = v220;
      dispatch_async(v222, v615);
    }
    int v15 = 1;
  }
  int v223 = [(HMAccessory *)self isControllable];
  if (v223 != [v6 isControllable])
  {
    -[HMAccessory setControllable:](self, "setControllable:", [v6 isControllable]);
    v224 = [(HMAccessory *)self context];
    v225 = [v224 queue];
    v614[0] = MEMORY[0x1E4F143A8];
    v614[1] = 3221225472;
    v614[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_5_1122;
    v614[3] = &unk_1E59452E8;
    v614[4] = self;
    dispatch_async(v225, v614);

    int v15 = 1;
  }
  unint64_t v226 = [(HMAccessory *)self accessoryReprovisionState];
  if (v226 != [v6 accessoryReprovisionState])
  {
    -[HMAccessory setAccessoryReprovisionState:](self, "setAccessoryReprovisionState:", [v6 accessoryReprovisionState]);
    v227 = [v579 delegate];
    if ([v227 conformsToProtocol:&unk_1EEF70488]) {
      v228 = v227;
    }
    else {
      v228 = 0;
    }
    id v229 = v228;

    if (objc_opt_respondsToSelector())
    {
      v230 = [(HMAccessory *)self context];
      v231 = [v230 queue];
      v611[0] = MEMORY[0x1E4F143A8];
      v611[1] = 3221225472;
      v611[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_6_1236;
      v611[3] = &unk_1E5945650;
      v611[4] = self;
      id v612 = v229;
      id v613 = v579;
      dispatch_async(v231, v611);
    }
    int v15 = 1;
  }
  v232 = [(HMAccessory *)self firmwareVersion];
  v233 = [v6 firmwareVersion];
  char v234 = HMFEqualObjects();

  if ((v234 & 1) == 0)
  {
    v235 = [v6 firmwareVersion];
    [(HMAccessory *)self setFirmwareVersion:v235];

    v236 = [(HMAccessory *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v237 = [(HMAccessory *)self context];
      v238 = [v237 queue];
      v609[0] = MEMORY[0x1E4F143A8];
      v609[1] = 3221225472;
      v609[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_8;
      v609[3] = &unk_1E5945628;
      v609[4] = self;
      id v610 = v236;
      dispatch_async(v238, v609);
    }
  }
  v239 = [(HMAccessory *)self delegate];
  if ([v239 conformsToProtocol:&unk_1EEF70C88]) {
    v240 = v239;
  }
  else {
    v240 = 0;
  }
  id v241 = v240;

  v242 = [(HMAccessory *)self bundleID];
  v243 = [v6 bundleID];
  char v244 = HMFEqualObjects();

  if ((v244 & 1) == 0)
  {
    v245 = [v6 bundleID];
    [(HMAccessory *)self setBundleID:v245];

    if (objc_opt_respondsToSelector())
    {
      v246 = [(HMAccessory *)self context];
      v247 = [v246 queue];
      v607[0] = MEMORY[0x1E4F143A8];
      v607[1] = 3221225472;
      v607[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_10;
      v607[3] = &unk_1E5945628;
      v607[4] = self;
      id v608 = v241;
      dispatch_async(v247, v607);
    }
  }
  v248 = [(HMAccessory *)self storeID];
  v249 = [v6 storeID];
  char v250 = HMFEqualObjects();

  if ((v250 & 1) == 0)
  {
    v251 = [v6 storeID];
    [(HMAccessory *)self setStoreID:v251];

    if (objc_opt_respondsToSelector())
    {
      v252 = [(HMAccessory *)self context];
      v253 = [v252 queue];
      v605[0] = MEMORY[0x1E4F143A8];
      v605[1] = 3221225472;
      v605[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_12;
      v605[3] = &unk_1E5945628;
      v605[4] = self;
      id v606 = v241;
      dispatch_async(v253, v605);
    }
  }
  int v254 = [(HMAccessory *)self isFirmwareUpdateAvailable];
  if (v254 != [v6 isFirmwareUpdateAvailable])
  {
    -[HMAccessory setFirmwareUpdateAvailable:](self, "setFirmwareUpdateAvailable:", [v6 isFirmwareUpdateAvailable]);
    if (objc_opt_respondsToSelector())
    {
      v255 = [(HMAccessory *)self context];
      v256 = [v255 queue];
      v603[0] = MEMORY[0x1E4F143A8];
      v603[1] = 3221225472;
      v603[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_14;
      v603[3] = &unk_1E5945628;
      v603[4] = self;
      id v604 = v241;
      dispatch_async(v256, v603);
    }
  }
  if ([v6 hasOnboardedForNaturalLighting]
    && ![(HMAccessory *)self hasOnboardedForNaturalLighting])
  {
    v257 = (void *)MEMORY[0x19F3A64A0]();
    v258 = self;
    HMFGetOSLogHandle();
    v259 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v259, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v260 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v653 = v260;
      _os_log_impl(&dword_19D1A8000, v259, OS_LOG_TYPE_INFO, "%{public}@Updating has onboarded accessory for natural lighting", buf, 0xCu);
    }
    [(HMAccessory *)v258 setHasOnboardedForNaturalLighting:1];
    if (objc_opt_respondsToSelector())
    {
      v261 = [(HMAccessory *)v258 context];
      v262 = [v261 queue];
      v601[0] = MEMORY[0x1E4F143A8];
      v601[1] = 3221225472;
      v601[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1242;
      v601[3] = &unk_1E5945628;
      v601[4] = v258;
      id v602 = v241;
      dispatch_async(v262, v601);
    }
  }
  int v263 = [(HMAccessory *)self supportsDiagnosticsTransfer];
  if (v263 != [v6 supportsDiagnosticsTransfer]
    || ([(HMAccessory *)self supportedDiagnostics],
        v264 = objc_claimAutoreleasedReturnValue(),
        [v6 supportedDiagnostics],
        v265 = objc_claimAutoreleasedReturnValue(),
        v265,
        v264,
        v264 != v265))
  {
    v266 = (void *)MEMORY[0x19F3A64A0]();
    v267 = self;
    HMFGetOSLogHandle();
    v268 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v268, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v269 = (id)objc_claimAutoreleasedReturnValue();
      v270 = [v6 supportedDiagnostics];
      *(_DWORD *)buf = 138543618;
      id v653 = v269;
      __int16 v654 = 2112;
      v655 = v270;
      _os_log_impl(&dword_19D1A8000, v268, OS_LOG_TYPE_INFO, "%{public}@Updating diagnostics support to %@", buf, 0x16u);
    }
    -[HMAccessory setSupportsDiagnosticsTransfer:](v267, "setSupportsDiagnosticsTransfer:", [v6 supportsDiagnosticsTransfer]);
    v271 = [v6 supportedDiagnostics];
    [(HMAccessory *)v267 setSupportedDiagnostics:v271];

    v272 = [(HMAccessory *)v267 context];
    v273 = [v272 queue];
    v600[0] = MEMORY[0x1E4F143A8];
    v600[1] = 3221225472;
    v600[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1244;
    v600[3] = &unk_1E59452E8;
    v600[4] = v267;
    dispatch_async(v273, v600);
  }
  int v274 = [(HMAccessory *)self isCurrentAccessory];
  if (v274 != [v6 isCurrentAccessory]) {
    -[HMAccessory setCurrentAccessory:](self, "setCurrentAccessory:", [v6 isCurrentAccessory]);
  }
  v275 = [(HMAccessory *)self manufacturer];
  v276 = [v6 manufacturer];
  char v277 = HMFEqualObjects();

  if ((v277 & 1) == 0)
  {
    v278 = [v6 manufacturer];
    [(HMAccessory *)self setManufacturer:v278];
  }
  v279 = [(HMAccessory *)self model];
  v280 = [v6 model];
  char v281 = HMFEqualObjects();

  if ((v281 & 1) == 0)
  {
    v282 = [v6 model];
    [(HMAccessory *)self setModel:v282];
  }
  v283 = [(HMAccessory *)self serialNumber];
  v284 = [v6 serialNumber];
  char v285 = HMFEqualObjects();

  if ((v285 & 1) == 0)
  {
    v286 = [v6 serialNumber];
    [(HMAccessory *)self setSerialNumber:v286];
  }
  v287 = [(HMAccessory *)self accountIdentifier];
  v288 = [v6 accountIdentifier];
  char v289 = HMFEqualObjects();

  if ((v289 & 1) == 0)
  {
    v290 = [v6 accountIdentifier];
    [(HMAccessory *)self setAccountIdentifier:v290];
  }
  int v291 = [(HMAccessory *)self supportsIdentify];
  if (v291 != [v6 supportsIdentify]) {
    -[HMAccessory setSupportsIdentify:](self, "setSupportsIdentify:", [v6 supportsIdentify]);
  }
  v292 = [(HMAccessory *)self accessoryFlags];
  v293 = [v6 accessoryFlags];
  char v294 = HMFEqualObjects();

  if ((v294 & 1) == 0)
  {
    v295 = [v6 accessoryFlags];
    if ([v295 integerValue]) {
      uint64_t v296 = 1;
    }
    else {
      uint64_t v296 = 2;
    }

    if ([(HMAccessory *)self additionalSetupStatus] != v296)
    {
      [(HMAccessory *)self setAdditionalSetupStatus:v296];
      v297 = [(HMAccessory *)self context];
      v298 = [v297 queue];
      v599[0] = MEMORY[0x1E4F143A8];
      v599[1] = 3221225472;
      v599[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1245;
      v599[3] = &unk_1E59452E8;
      v599[4] = self;
      dispatch_async(v298, v599);

      int v15 = 1;
    }
    v299 = [v6 accessoryFlags];
    char v300 = [v299 integerValue];
    if ((v300 & 2) != 0) {
      uint64_t v301 = 1;
    }
    else {
      uint64_t v301 = 2;
    }

    if ([(HMAccessory *)self calibrationStatus] != v301)
    {
      v302 = (void *)MEMORY[0x19F3A64A0]();
      v303 = self;
      HMFGetOSLogHandle();
      v304 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v304, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v305 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v306 = [(HMAccessory *)v303 calibrationStatus];
        v307 = "Unknown";
        if (v306 == 1) {
          v307 = "InProgress";
        }
        if (v306 == 2) {
          v307 = "Complete";
        }
        *(_DWORD *)buf = 138543874;
        id v653 = v305;
        __int16 v654 = 2080;
        v655 = v307;
        if ((v300 & 2) != 0) {
          v308 = "InProgress";
        }
        else {
          v308 = "Complete";
        }
        __int16 v656 = 2080;
        id v657 = (id)v308;
        _os_log_impl(&dword_19D1A8000, v304, OS_LOG_TYPE_INFO, "%{public}@Calibration Status updated from %s to %s", buf, 0x20u);
      }
      [(HMAccessory *)v303 setCalibrationStatus:v301];
      v309 = [(HMAccessory *)v303 context];
      v310 = [v309 queue];
      v598[0] = MEMORY[0x1E4F143A8];
      v598[1] = 3221225472;
      v598[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1246;
      v598[3] = &unk_1E59452E8;
      v598[4] = v303;
      dispatch_async(v310, v598);

      int v15 = 1;
    }
    v311 = [v6 accessoryFlags];
    [(HMAccessory *)self setAccessoryFlags:v311];

    -[HMAccessory setCalibrationStatus:](self, "setCalibrationStatus:", [v6 calibrationStatus]);
  }
  int64_t v312 = [(HMAccessory *)self certificationStatus];
  if (v312 != [v6 certificationStatus]) {
    -[HMAccessory setCertificationStatus:](self, "setCertificationStatus:", [v6 certificationStatus]);
  }
  -[HMAccessory setBridgedAccessory:](self, "setBridgedAccessory:", [v6 bridgedAccessory]);
  v313 = [v6 uniqueIdentifiersForBridgedAccessories];
  [(HMAccessory *)self setUniqueIdentifiersForBridgedAccessories:v313];

  v314 = [(HMAccessory *)self category];
  v315 = [v6 category];
  char v316 = HMFEqualObjects();

  if ((v316 & 1) == 0)
  {
    v317 = (void *)MEMORY[0x19F3A64A0]();
    v318 = self;
    HMFGetOSLogHandle();
    v319 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v319, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v320 = (id)objc_claimAutoreleasedReturnValue();
      v321 = [(HMAccessory *)v318 category];
      v322 = [v6 category];
      *(_DWORD *)buf = 138543874;
      id v653 = v320;
      __int16 v654 = 2112;
      v655 = v321;
      __int16 v656 = 2112;
      id v657 = v322;
      _os_log_impl(&dword_19D1A8000, v319, OS_LOG_TYPE_INFO, "%{public}@Updating category: %@ with new category: %@", buf, 0x20u);
    }
    v323 = [v6 category];
    [(HMAccessory *)v318 setCategory:v323];

    int v15 = 1;
  }
  v324 = [v6 accessoryProfiles];
  v325 = [v324 array];
  [(HMAccessory *)self _mergeProfiles:v325];

  if (![(HMAccessory *)self supportsMessagedHomePodSettings]
    && ([v6 supportsMessagedHomePodSettings] & 1) == 0)
  {
    v326 = [v6 settings];
    v327 = [(HMAccessory *)self settings];
    char v328 = (v326 == 0) ^ (v327 != 0);

    v329 = (void *)MEMORY[0x19F3A64A0]();
    if (v328)
    {
      v330 = [(HMAccessory *)self settings];
      int v331 = [v330 mergeFromNewObject:v326];

      if (v331)
      {
        v332 = (void *)MEMORY[0x19F3A64A0]();
        v333 = self;
        HMFGetOSLogHandle();
        v334 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v334, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v335 = (id)objc_claimAutoreleasedReturnValue();
          v336 = [v326 longDescription];
          *(_DWORD *)buf = 138543618;
          id v653 = v335;
          __int16 v654 = 2112;
          v655 = v336;
          _os_log_impl(&dword_19D1A8000, v334, OS_LOG_TYPE_INFO, "%{public}@Merged settings: %@", buf, 0x16u);
        }
        int v15 = 1;
        v217 = (void *)&unk_19D47B000;
      }
    }
    else
    {
      v337 = self;
      HMFGetOSLogHandle();
      v338 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v338, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v339 = (id)objc_claimAutoreleasedReturnValue();
        v340 = [v326 longDescription];
        *(_DWORD *)buf = 138543618;
        id v653 = v339;
        __int16 v654 = 2112;
        v655 = v340;
        _os_log_impl(&dword_19D1A8000, v338, OS_LOG_TYPE_DEFAULT, "%{public}@Updating settings: %@", buf, 0x16u);
      }
      [(HMAccessory *)v337 setSettings:v326];
      v341 = [(HMAccessory *)v337 context];
      v342 = [v341 queue];
      v596[0] = MEMORY[0x1E4F143A8];
      v596[1] = 3221225472;
      v596[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1247;
      v596[3] = &unk_1E5945628;
      v596[4] = v337;
      id v597 = v326;
      dispatch_async(v342, v596);

      int v15 = 1;
    }
  }
  v343 = [v6 device];
  v344 = [(HMAccessory *)self device];
  char v345 = HMFEqualObjects();

  if (v345)
  {
    v346 = [(HMAccessory *)self device];
    int v347 = [v346 mergeFromNewObject:v343];

    if (!v347) {
      goto LABEL_245;
    }
  }
  else
  {
    v348 = (void *)MEMORY[0x19F3A64A0]();
    v349 = self;
    HMFGetOSLogHandle();
    v350 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v350, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v351 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v653 = v351;
      __int16 v654 = 2112;
      v655 = v343;
      _os_log_impl(&dword_19D1A8000, v350, OS_LOG_TYPE_INFO, "%{public}@Updating device: %@", buf, 0x16u);
    }
    [(HMAccessory *)v349 setDevice:v343];
  }
  if (objc_opt_respondsToSelector())
  {
    v352 = [(HMAccessory *)self context];
    v353 = [v352 queue];
    v594[0] = MEMORY[0x1E4F143A8];
    v594[1] = v217[269];
    v594[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1249;
    v594[3] = &unk_1E5945628;
    v594[4] = self;
    id v595 = v241;
    dispatch_async(v353, v594);
  }
  int v15 = 1;
LABEL_245:

  v354 = [(HMAccessory *)self deviceIRKData];
  v355 = [v6 deviceIRKData];
  char v356 = HMFEqualObjects();

  if ((v356 & 1) == 0)
  {
    v357 = (void *)MEMORY[0x19F3A64A0]();
    v358 = self;
    HMFGetOSLogHandle();
    v359 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v359, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v360 = (id)objc_claimAutoreleasedReturnValue();
      v361 = [v6 deviceIRKData];
      *(_DWORD *)buf = 138543618;
      id v653 = v360;
      __int16 v654 = 2112;
      v655 = v361;
      _os_log_impl(&dword_19D1A8000, v359, OS_LOG_TYPE_INFO, "%{public}@Updating deviceIRKData: %@", buf, 0x16u);
    }
    v362 = [v6 deviceIRKData];
    [(HMAccessory *)v358 setDeviceIRKData:v362];

    int v15 = 1;
  }
  v363 = [v6 softwareVersion];
  v364 = [(HMAccessory *)self softwareVersion];
  char v365 = HMFEqualObjects();

  if ((v365 & 1) == 0)
  {
    [(HMAccessory *)self setSoftwareVersion:v363];
    if (objc_opt_respondsToSelector())
    {
      v366 = [(HMAccessory *)self context];
      v367 = [v366 queue];
      v591[0] = MEMORY[0x1E4F143A8];
      v591[1] = v217[269];
      v591[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1252;
      v591[3] = &unk_1E5945650;
      v591[4] = self;
      id v592 = v241;
      id v593 = v363;
      dispatch_async(v367, v591);
    }
    int v15 = 1;
  }
  v368 = [(HMAccessory *)self softwareUpdateController];

  v369 = [v6 softwareUpdateController];
  v370 = v369;
  if (!v368)
  {
    [(HMAccessory *)self setSoftwareUpdateController:v369];

    v371 = [(HMAccessory *)self softwareUpdateController];
    v372 = [(HMAccessory *)self context];
    [v371 configureWithContext:v372 accessory:self];
    goto LABEL_257;
  }

  if (v370)
  {
    v371 = [(HMAccessory *)self softwareUpdateController];
    v372 = [v6 softwareUpdateController];
    [v371 mergeFromNewObject:v372];
LABEL_257:

    goto LABEL_259;
  }
  [(HMAccessory *)self setSoftwareUpdateController:0];
LABEL_259:
  v373 = [v6 remoteLoginHandler];
  BOOL v374 = [(HMAccessory *)self _mergeRemoteLoginHandler:v373];

  BOOL v375 = -[HMAccessory _updateHasSymptomsHandler:](self, "_updateHasSymptomsHandler:", [v6 hasSymptomsHandler]);
  int v376 = [(HMAccessory *)self supportsMediaAccessControl];
  if (v376 == [v6 supportsMediaAccessControl])
  {
    LODWORD(v48) = (v375 || v374) | v15;
  }
  else
  {
    -[HMAccessory setSupportsMediaAccessControl:](self, "setSupportsMediaAccessControl:", [v6 supportsMediaAccessControl]);
    LODWORD(v48) = 1;
  }
  int v377 = [(HMAccessory *)self supportsMediaContentProfile];
  if (v377 != [v6 supportsMediaContentProfile])
  {
    v378 = (void *)MEMORY[0x19F3A64A0]();
    id v48 = self;
    HMFGetOSLogHandle();
    v379 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v379, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v380 = (id)objc_claimAutoreleasedReturnValue();
      [(HMAccessory *)v48 supportsMediaContentProfile];
      HMFBooleanToString();
      v381 = (char *)(id)objc_claimAutoreleasedReturnValue();
      [v6 supportsMediaContentProfile];
      HMFBooleanToString();
      id v382 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v653 = v380;
      __int16 v654 = 2112;
      v655 = v381;
      __int16 v656 = 2112;
      id v657 = v382;
      _os_log_impl(&dword_19D1A8000, v379, OS_LOG_TYPE_INFO, "%{public}@Updating supportsMediaContentProfile from %@ to %@", buf, 0x20u);
    }
    -[HMAccessory setSupportsMediaContentProfile:](v48, "setSupportsMediaContentProfile:", [v6 supportsMediaContentProfile]);
    v383 = [(HMAccessory *)v48 context];
    v384 = [v383 queue];
    v590[0] = MEMORY[0x1E4F143A8];
    v217 = &unk_19D47B000;
    v590[1] = 3221225472;
    v590[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1254;
    v590[3] = &unk_1E59452E8;
    v590[4] = v48;
    dispatch_async(v384, v590);

    LODWORD(v48) = 1;
  }
  int v385 = [(HMAccessory *)self supportsCHIP];
  if (v385 != [v6 supportsCHIP])
  {
    v386 = (void *)MEMORY[0x19F3A64A0]();
    id v48 = self;
    HMFGetOSLogHandle();
    v387 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v387, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v388 = (id)objc_claimAutoreleasedReturnValue();
      [(HMAccessory *)v48 supportsCHIP];
      HMFBooleanToString();
      v389 = (char *)(id)objc_claimAutoreleasedReturnValue();
      [v6 supportsCHIP];
      HMFBooleanToString();
      id v390 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v653 = v388;
      __int16 v654 = 2112;
      v655 = v389;
      __int16 v656 = 2112;
      id v657 = v390;
      _os_log_impl(&dword_19D1A8000, v387, OS_LOG_TYPE_INFO, "%{public}@Updating supportsCHIP from %@ to %@", buf, 0x20u);
    }
    -[HMAccessory setSupportsCHIP:](v48, "setSupportsCHIP:", [v6 supportsCHIP]);
    LODWORD(v48) = 1;
    v217 = (void *)&unk_19D47B000;
  }
  int v391 = [(HMAccessory *)self knownToSystemCommissioner];
  if (v391 != [v6 knownToSystemCommissioner])
  {
    v392 = (void *)MEMORY[0x19F3A64A0]();
    id v48 = self;
    HMFGetOSLogHandle();
    v393 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v393, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v394 = (id)objc_claimAutoreleasedReturnValue();
      [(HMAccessory *)v48 knownToSystemCommissioner];
      HMFBooleanToString();
      v395 = (char *)(id)objc_claimAutoreleasedReturnValue();
      [v6 knownToSystemCommissioner];
      HMFBooleanToString();
      id v396 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v653 = v394;
      __int16 v654 = 2112;
      v655 = v395;
      __int16 v656 = 2112;
      id v657 = v396;
      _os_log_impl(&dword_19D1A8000, v393, OS_LOG_TYPE_INFO, "%{public}@Updating knownToSystemCommissioner from %@ to %@", buf, 0x20u);
    }
    -[HMAccessory setKnownToSystemCommissioner:](v48, "setKnownToSystemCommissioner:", [v6 knownToSystemCommissioner]);
    LODWORD(v48) = 1;
    v217 = (void *)&unk_19D47B000;
  }
  v397 = [(HMAccessory *)self rootPublicKey];
  v398 = [v6 rootPublicKey];
  char v399 = HMFEqualObjects();

  id v578 = v241;
  if ((v399 & 1) == 0)
  {
    v400 = (void *)MEMORY[0x19F3A64A0]();
    v401 = self;
    HMFGetOSLogHandle();
    v402 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v402, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v403 = (id)objc_claimAutoreleasedReturnValue();
      v575 = v400;
      v404 = NSNumber;
      v405 = [(HMAccessory *)v401 rootPublicKey];
      objc_msgSend(v404, "numberWithUnsignedInteger:", objc_msgSend(v405, "hash"));
      v406 = (char *)objc_claimAutoreleasedReturnValue();
      v407 = v363;
      v408 = NSNumber;
      v409 = [v6 rootPublicKey];
      v410 = objc_msgSend(v408, "numberWithUnsignedInteger:", objc_msgSend(v409, "hash"));
      *(_DWORD *)buf = 138543874;
      id v653 = v403;
      __int16 v654 = 2112;
      v655 = v406;
      __int16 v656 = 2112;
      id v657 = v410;
      _os_log_impl(&dword_19D1A8000, v402, OS_LOG_TYPE_INFO, "%{public}@Updating Root Public Key (Hash) from %@ to %@", buf, 0x20u);

      v363 = v407;
      id v241 = v578;

      v400 = v575;
    }

    LODWORD(v48) = 1;
    v217 = (void *)&unk_19D47B000;
  }
  v411 = [(HMAccessory *)self nodeID];
  v412 = [v6 nodeID];
  char v413 = HMFEqualObjects();

  if ((v413 & 1) == 0)
  {
    id v48 = (HMAccessory *)MEMORY[0x19F3A64A0]();
    v414 = self;
    HMFGetOSLogHandle();
    v415 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v415, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v416 = (id)objc_claimAutoreleasedReturnValue();
      v417 = [(HMAccessory *)v414 nodeID];
      v418 = [v6 nodeID];
      *(_DWORD *)buf = 138543874;
      id v653 = v416;
      __int16 v654 = 2112;
      v655 = v417;
      __int16 v656 = 2112;
      id v657 = v418;
      _os_log_impl(&dword_19D1A8000, v415, OS_LOG_TYPE_INFO, "%{public}@Updating NodeID from %@ to %@", buf, 0x20u);

      id v241 = v578;
    }

    LODWORD(v48) = 1;
  }
  v419 = [(HMAccessory *)self commissioningID];
  v420 = [v6 commissioningID];
  char v421 = HMFEqualObjects();

  if ((v421 & 1) == 0)
  {
    id v48 = (HMAccessory *)MEMORY[0x19F3A64A0]();
    v422 = self;
    HMFGetOSLogHandle();
    v423 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v423, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v424 = (id)objc_claimAutoreleasedReturnValue();
      v425 = [(HMAccessory *)v422 commissioningID];
      v426 = [v6 commissioningID];
      *(_DWORD *)buf = 138543874;
      id v653 = v424;
      __int16 v654 = 2112;
      v655 = v425;
      __int16 v656 = 2112;
      id v657 = v426;
      _os_log_impl(&dword_19D1A8000, v423, OS_LOG_TYPE_INFO, "%{public}@Updating commissioningID from %@ to %@", buf, 0x20u);

      id v241 = v578;
    }

    LODWORD(v48) = 1;
  }
  v427 = [(HMAccessory *)self vendorID];
  v428 = [v6 vendorID];
  char v429 = HMFEqualObjects();

  if ((v429 & 1) == 0)
  {
    id v48 = (HMAccessory *)MEMORY[0x19F3A64A0]();
    v430 = self;
    HMFGetOSLogHandle();
    v431 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v431, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v432 = (id)objc_claimAutoreleasedReturnValue();
      v433 = [(HMAccessory *)v430 vendorID];
      v434 = [v6 vendorID];
      *(_DWORD *)buf = 138543874;
      id v653 = v432;
      __int16 v654 = 2112;
      v655 = v433;
      __int16 v656 = 2112;
      id v657 = v434;
      _os_log_impl(&dword_19D1A8000, v431, OS_LOG_TYPE_INFO, "%{public}@Updating vendorID from %@ to %@", buf, 0x20u);

      id v241 = v578;
    }

    LODWORD(v48) = 1;
  }
  v435 = [(HMAccessory *)self productID];
  v436 = [v6 productID];
  char v437 = HMFEqualObjects();

  if ((v437 & 1) == 0)
  {
    id v48 = (HMAccessory *)MEMORY[0x19F3A64A0]();
    v438 = self;
    HMFGetOSLogHandle();
    v439 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v439, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v440 = (id)objc_claimAutoreleasedReturnValue();
      v441 = [(HMAccessory *)v438 productID];
      v442 = [v6 productID];
      *(_DWORD *)buf = 138543874;
      id v653 = v440;
      __int16 v654 = 2112;
      v655 = v441;
      __int16 v656 = 2112;
      id v657 = v442;
      _os_log_impl(&dword_19D1A8000, v439, OS_LOG_TYPE_INFO, "%{public}@Updating productID from %@ to %@", buf, 0x20u);

      id v241 = v578;
    }

    LODWORD(v48) = 1;
  }
  v443 = [v6 bulletinBoardNotificationByEndpoint];
  BOOL v444 = [(HMAccessory *)self _mergeBulletinBoardNotificationByEndpoint:v443];

  if (v444)
  {
    id v48 = (HMAccessory *)MEMORY[0x19F3A64A0]();
    v445 = self;
    HMFGetOSLogHandle();
    v446 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v446, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v447 = (id)objc_claimAutoreleasedReturnValue();
      v448 = [v6 bulletinBoardNotificationByEndpoint];
      *(_DWORD *)buf = 138543618;
      id v653 = v447;
      __int16 v654 = 2112;
      v655 = v448;
      _os_log_impl(&dword_19D1A8000, v446, OS_LOG_TYPE_INFO, "%{public}@Updated matter bulletin board notification to %@", buf, 0x16u);

      id v241 = v578;
    }

    LODWORD(v48) = 1;
  }
  int v449 = [(HMAccessory *)self requiresThreadRouter];
  if (v449 != [v6 requiresThreadRouter])
  {
    v450 = (void *)MEMORY[0x19F3A64A0]();
    id v48 = self;
    HMFGetOSLogHandle();
    v451 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v451, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v452 = (id)objc_claimAutoreleasedReturnValue();
      [(HMAccessory *)v48 requiresThreadRouter];
      HMFBooleanToString();
      v453 = (char *)(id)objc_claimAutoreleasedReturnValue();
      [v6 requiresThreadRouter];
      HMFBooleanToString();
      id v454 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v653 = v452;
      __int16 v654 = 2112;
      v655 = v453;
      __int16 v656 = 2112;
      id v657 = v454;
      _os_log_impl(&dword_19D1A8000, v451, OS_LOG_TYPE_INFO, "%{public}@Updating requiresThreadRouter from %@ to %@", buf, 0x20u);
    }
    -[HMAccessory setRequiresThreadRouter:](v48, "setRequiresThreadRouter:", [v6 requiresThreadRouter]);
    LODWORD(v48) = 1;
    v217 = &unk_19D47B000;
  }
  if (![(HMAccessory *)self supportsMessagedHomePodSettings])
  {
    v455 = [(HMAccessory *)self wifiNetworkInfo];
    v456 = [v6 wifiNetworkInfo];
    char v457 = HMFEqualObjects();

    if ((v457 & 1) == 0)
    {
      v458 = [v6 wifiNetworkInfo];
      [(HMAccessory *)self setWifiNetworkInfo:v458];

      LODWORD(v48) = 1;
    }
  }
  v459 = [(HMAccessory *)self networkProtectionGroupUUID];
  v460 = [v6 networkProtectionGroupUUID];
  char v461 = HMFEqualObjects();

  if ((v461 & 1) == 0)
  {
    v462 = [v6 networkProtectionGroupUUID];
    [(HMAccessory *)self setNetworkProtectionGroupUUID:v462];

    LODWORD(v48) = 1;
  }
  v463 = [(HMAccessory *)self audioDestination];
  v464 = [v6 audioDestination];
  char v465 = HMFEqualObjects();

  if ((v465 & 1) == 0)
  {
    v466 = (void *)MEMORY[0x19F3A64A0]();
    id v48 = self;
    HMFGetOSLogHandle();
    v467 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v467, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v468 = (id)objc_claimAutoreleasedReturnValue();
      v469 = [(HMAccessory *)v48 audioDestination];
      v470 = [v6 audioDestination];
      *(_DWORD *)buf = 138543874;
      id v653 = v468;
      __int16 v654 = 2112;
      v655 = v469;
      __int16 v656 = 2112;
      id v657 = v470;
      _os_log_impl(&dword_19D1A8000, v467, OS_LOG_TYPE_INFO, "%{public}@Updating audio destination: %@ new audio destination: %@", buf, 0x20u);

      id v241 = v578;
    }

    v471 = [v6 audioDestination];
    [(HMAccessory *)v48 setAudioDestination:v471];

    v472 = [(HMAccessory *)v48 context];
    v473 = [v472 queue];
    v589[0] = MEMORY[0x1E4F143A8];
    v589[1] = v217[269];
    v589[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1255;
    v589[3] = &unk_1E59452E8;
    v589[4] = v48;
    dispatch_async(v473, v589);

    LODWORD(v48) = 1;
  }
  v474 = [(HMAccessory *)self audioDestinationController];

  v475 = [v6 audioDestinationController];
  v476 = v475;
  if (v474)
  {

    if (v476)
    {
      v477 = [(HMAccessory *)self audioDestinationController];
      v478 = [v6 audioDestinationController];
      int v479 = [v477 mergeFromNewObject:v478];

      if (!v479) {
        goto LABEL_325;
      }
      v480 = (void *)MEMORY[0x19F3A64A0]();
      v481 = self;
      HMFGetOSLogHandle();
      v482 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v482, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v483 = (id)objc_claimAutoreleasedReturnValue();
        v484 = [(HMAccessory *)v481 audioDestinationController];
        *(_DWORD *)buf = 138543618;
        id v653 = v483;
        __int16 v654 = 2112;
        v655 = v484;
        _os_log_impl(&dword_19D1A8000, v482, OS_LOG_TYPE_INFO, "%{public}@Updated audio destination controller: %@ due to accessory merge", buf, 0x16u);
      }
      v485 = [(HMAccessory *)v481 context];
      v486 = [v485 queue];
      v487 = v486;
      v587[0] = MEMORY[0x1E4F143A8];
      v587[1] = v217[269];
      v587[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1257;
      v587[3] = &unk_1E59452E8;
      v587[4] = v481;
      v488 = v587;
    }
    else
    {
      v497 = (void *)MEMORY[0x19F3A64A0]();
      v498 = self;
      HMFGetOSLogHandle();
      v499 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v499, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v500 = (id)objc_claimAutoreleasedReturnValue();
        v501 = [(HMAccessory *)v498 audioDestinationController];
        *(_DWORD *)buf = 138543618;
        id v653 = v500;
        __int16 v654 = 2112;
        v655 = v501;
        _os_log_impl(&dword_19D1A8000, v499, OS_LOG_TYPE_INFO, "%{public}@Removing audio destination controller: %@ due to accessory merge", buf, 0x16u);
      }
      v502 = [(HMAccessory *)v498 audioDestinationController];
      [v502 unconfigure];

      [(HMAccessory *)v498 setAudioDestinationController:0];
      v485 = [(HMAccessory *)v498 context];
      v486 = [v485 queue];
      v487 = v486;
      v588[0] = MEMORY[0x1E4F143A8];
      v588[1] = v217[269];
      v588[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1256;
      v588[3] = &unk_1E59452E8;
      v588[4] = v498;
      v488 = v588;
    }
  }
  else
  {

    if (!v476) {
      goto LABEL_325;
    }
    v489 = (void *)MEMORY[0x19F3A64A0]();
    v490 = self;
    HMFGetOSLogHandle();
    v491 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v491, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v492 = (id)objc_claimAutoreleasedReturnValue();
      v493 = [v6 audioDestinationController];
      *(_DWORD *)buf = 138543618;
      id v653 = v492;
      __int16 v654 = 2112;
      v655 = v493;
      _os_log_impl(&dword_19D1A8000, v491, OS_LOG_TYPE_INFO, "%{public}@Adding new audio destination controller: %@ due to accessory merge", buf, 0x16u);
    }
    v494 = [v6 audioDestinationController];
    [(HMAccessory *)v490 setAudioDestinationController:v494];

    v495 = [(HMAccessory *)v490 audioDestinationController];
    v496 = [(HMAccessory *)v490 context];
    [v495 configureWithContext:v496 dataSource:v490];

    v485 = [(HMAccessory *)v490 context];
    v486 = [v485 queue];
    v487 = v486;
    v586[0] = MEMORY[0x1E4F143A8];
    v586[1] = v217[269];
    v586[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1258;
    v586[3] = &unk_1E59452E8;
    v586[4] = v490;
    v488 = v586;
  }
  dispatch_async(v486, v488);

  LODWORD(v48) = 1;
LABEL_325:
  v503 = [v6 audioAnalysisEventBulletinBoardNotification];

  if (v503)
  {
    v504 = [(HMAccessory *)self audioAnalysisEventBulletinBoardNotification];
    v505 = [v6 audioAnalysisEventBulletinBoardNotification];
    LODWORD(v48) = v48 | [v504 mergeFromNewObject:v505];
  }
  if ([(HMAccessory *)self supportsMessagedHomePodSettings]
    || ([v6 supportsMessagedHomePodSettings] & 1) != 0)
  {
    goto LABEL_341;
  }
  unint64_t v506 = [(HMAccessory *)self preferredUserSelectionType];
  uint64_t v507 = [v6 preferredUserSelectionType];
  if (v506 != v507)
  {
    id v48 = (HMAccessory *)MEMORY[0x19F3A64A0](-[HMAccessory setPreferredUserSelectionType:](self, "setPreferredUserSelectionType:", [v6 preferredUserSelectionType]));
    v508 = self;
    HMFGetOSLogHandle();
    v509 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v509, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v510 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "preferredUserSelectionType"));
      v511 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v653 = v510;
      __int16 v654 = 2112;
      v655 = v511;
      _os_log_impl(&dword_19D1A8000, v509, OS_LOG_TYPE_INFO, "%{public}@Updating Preferred User selection type to%@", buf, 0x16u);

      id v241 = v578;
    }

    LOBYTE(v48) = 1;
  }
  v512 = [(HMAccessory *)self preferredMediaUserUUID];
  v513 = [v6 preferredMediaUserUUID];
  char v514 = HMFEqualObjects();

  if (v514)
  {
    BOOL v515 = v506 == v507;
    v217 = (void *)&unk_19D47B000;
    if (v515) {
      goto LABEL_341;
    }
  }
  else
  {
    v516 = [v6 preferredMediaUserUUID];
    [(HMAccessory *)self setPreferredMediaUserUUID:v516];

    id v48 = (HMAccessory *)MEMORY[0x19F3A64A0]();
    v517 = self;
    HMFGetOSLogHandle();
    v518 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v518, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v519 = (id)objc_claimAutoreleasedReturnValue();
      v520 = [v6 preferredMediaUserUUID];
      *(_DWORD *)buf = 138543618;
      id v653 = v519;
      __int16 v654 = 2112;
      v655 = v520;
      _os_log_impl(&dword_19D1A8000, v518, OS_LOG_TYPE_INFO, "%{public}@Updating Preferred Media User to %@", buf, 0x16u);

      id v241 = v578;
    }

    LOBYTE(v48) = 1;
    v217 = &unk_19D47B000;
  }
  v521 = [(HMAccessory *)self context];
  v522 = [v521 queue];
  v585[0] = MEMORY[0x1E4F143A8];
  v585[1] = v217[269];
  v585[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1259;
  v585[3] = &unk_1E59452E8;
  v585[4] = self;
  dispatch_async(v522, v585);

LABEL_341:
  int v523 = [(HMAccessory *)self supportsPrimaryUserInfoSubscription];
  if (v523 != [v6 supportsPrimaryUserInfoSubscription])
  {
    -[HMAccessory setSupportsPrimaryUserInfoSubscription:](self, "setSupportsPrimaryUserInfoSubscription:", [v6 supportsPrimaryUserInfoSubscription]);
    if ([(HMAccessory *)self supportsPrimaryUserInfoSubscription]) {
      [(HMAccessory *)self configureInfoDataProviderIfNeededWithOption:4];
    }
    else {
      [(HMAccessory *)self unconfigureInfoDataProviderWithOptions:4];
    }
    LOBYTE(v48) = 1;
  }
  int v524 = [(HMAccessory *)self supportsPreferredMediaUser];
  if (v524 != [v6 supportsPreferredMediaUser])
  {
    v525 = (void *)MEMORY[0x19F3A64A0](-[HMAccessory setSupportsPreferredMediaUser:](self, "setSupportsPreferredMediaUser:", [v6 supportsPreferredMediaUser]));
    id v48 = self;
    HMFGetOSLogHandle();
    v526 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v526, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v527 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(NSNumber, "numberWithBool:", -[HMAccessory supportsPreferredMediaUser](v48, "supportsPreferredMediaUser"));
      v528 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v653 = v527;
      __int16 v654 = 2112;
      v655 = v528;
      _os_log_impl(&dword_19D1A8000, v526, OS_LOG_TYPE_INFO, "%{public}@Updating supports Preferred Media User to %@", buf, 0x16u);
    }
    v529 = [(HMAccessory *)v48 context];
    v530 = [v529 queue];
    v584[0] = MEMORY[0x1E4F143A8];
    v584[1] = v217[269];
    v584[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1260;
    v584[3] = &unk_1E59452E8;
    v584[4] = v48;
    dispatch_async(v530, v584);

    LOBYTE(v48) = 1;
  }
  v531 = [(HMAccessory *)self pendingConfigurationIdentifier];
  v532 = [v6 pendingConfigurationIdentifier];
  char v533 = HMFEqualObjects();

  if ((v533 & 1) == 0)
  {
    v534 = (void *)MEMORY[0x19F3A64A0]();
    v535 = self;
    HMFGetOSLogHandle();
    v536 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v536, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v537 = (id)objc_claimAutoreleasedReturnValue();
      v538 = [(HMAccessory *)v535 pendingConfigurationIdentifier];
      v539 = [v6 pendingConfigurationIdentifier];
      *(_DWORD *)buf = 138543874;
      id v653 = v537;
      __int16 v654 = 2112;
      v655 = v538;
      __int16 v656 = 2112;
      id v657 = v539;
      _os_log_impl(&dword_19D1A8000, v536, OS_LOG_TYPE_INFO, "%{public}@Updating pendingConfigurationIdentifier from %@ to %@", buf, 0x20u);

      id v241 = v578;
    }

    v540 = [v6 pendingConfigurationIdentifier];
    [(HMAccessory *)v535 setPendingConfigurationIdentifier:v540];

    if (objc_opt_respondsToSelector())
    {
      v541 = [(HMAccessory *)v535 context];
      v542 = [v541 queue];
      v582[0] = MEMORY[0x1E4F143A8];
      v582[1] = v217[269];
      v582[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1262;
      v582[3] = &unk_1E5945628;
      v582[4] = v535;
      id v583 = v241;
      dispatch_async(v542, v582);
    }
    LOBYTE(v48) = 1;
  }
  int v543 = [(HMAccessory *)self supportsManagedConfigurationProfile];
  if (v543 != [v6 supportsManagedConfigurationProfile])
  {
    v544 = (void *)MEMORY[0x19F3A64A0]();
    id v48 = self;
    HMFGetOSLogHandle();
    v545 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v545, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v546 = (id)objc_claimAutoreleasedReturnValue();
      [(HMAccessory *)v48 supportsManagedConfigurationProfile];
      HMFBooleanToString();
      v547 = (char *)(id)objc_claimAutoreleasedReturnValue();
      [v6 supportsManagedConfigurationProfile];
      HMFBooleanToString();
      id v548 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v653 = v546;
      __int16 v654 = 2112;
      v655 = v547;
      __int16 v656 = 2112;
      id v657 = v548;
      _os_log_impl(&dword_19D1A8000, v545, OS_LOG_TYPE_INFO, "%{public}@Updating supportsManagedConfigurationProfile from %@ to %@", buf, 0x20u);
    }
    -[HMAccessory setSupportsManagedConfigurationProfile:](v48, "setSupportsManagedConfigurationProfile:", [v6 supportsManagedConfigurationProfile]);
    LOBYTE(v48) = 1;
    v217 = (void *)&unk_19D47B000;
  }
  int64_t v549 = [(HMAccessory *)self productColor];
  if (v549 != [v6 productColor])
  {
    -[HMAccessory setProductColor:](self, "setProductColor:", [v6 productColor]);
    LOBYTE(v48) = 1;
  }
  int v550 = [(HMAccessory *)self supportsMessagedHomePodSettings];
  if (v550 != [v6 supportsMessagedHomePodSettings])
  {
    v551 = (void *)MEMORY[0x19F3A64A0]();
    v552 = self;
    HMFGetOSLogHandle();
    v553 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v553, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v554 = (id)objc_claimAutoreleasedReturnValue();
      [(HMAccessory *)v552 supportsMessagedHomePodSettings];
      HMFBooleanToString();
      v555 = (char *)(id)objc_claimAutoreleasedReturnValue();
      [v6 supportsMessagedHomePodSettings];
      HMFBooleanToString();
      id v556 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v653 = v554;
      __int16 v654 = 2112;
      v655 = v555;
      __int16 v656 = 2112;
      id v657 = v556;
      _os_log_impl(&dword_19D1A8000, v553, OS_LOG_TYPE_DEFAULT, "%{public}@Updating supportsMessagedHomePodSettings from %@ to %@", buf, 0x20u);
    }
    -[HMAccessory setSupportsMessagedHomePodSettings:](v552, "setSupportsMessagedHomePodSettings:", [v6 supportsMessagedHomePodSettings]);
    if ([(HMAccessory *)v552 supportsMessagedHomePodSettings])
    {
      [(HMAccessory *)v552 configureSettingsAdapterIfNeeded];
      [(HMAccessory *)v552 configureInfoDataProviderIfNeededWithOption:5];
    }
    LOBYTE(v48) = 1;
    v217 = (void *)&unk_19D47B000;
  }
  int v557 = [(HMAccessory *)self supportsSoftwareUpdateV2];
  if (v557 != [v6 supportsSoftwareUpdateV2])
  {
    -[HMAccessory setSupportsSoftwareUpdateV2:](self, "setSupportsSoftwareUpdateV2:", [v6 supportsSoftwareUpdateV2]);
    LOBYTE(v48) = 1;
  }
  int v558 = [(HMAccessory *)self supportsRMVonAppleTV];
  if (v558 != [v6 supportsRMVonAppleTV])
  {
    v559 = (void *)MEMORY[0x19F3A64A0]();
    id v48 = self;
    HMFGetOSLogHandle();
    v560 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v560, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v561 = (id)objc_claimAutoreleasedReturnValue();
      [(HMAccessory *)v48 supportsRMVonAppleTV];
      HMFBooleanToString();
      v562 = (char *)(id)objc_claimAutoreleasedReturnValue();
      [v6 supportsRMVonAppleTV];
      HMFBooleanToString();
      id v563 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v653 = v561;
      __int16 v654 = 2112;
      v655 = v562;
      __int16 v656 = 2112;
      id v657 = v563;
      _os_log_impl(&dword_19D1A8000, v560, OS_LOG_TYPE_INFO, "%{public}@Updating supportsRMVonAppleTV from %@ to %@", buf, 0x20u);
    }
    -[HMAccessory setSupportsRMVonAppleTV:](v48, "setSupportsRMVonAppleTV:", [v6 supportsRMVonAppleTV]);
    v564 = [(HMAccessory *)v48 context];
    v565 = [v564 queue];
    v581[0] = MEMORY[0x1E4F143A8];
    v217 = &unk_19D47B000;
    v581[1] = 3221225472;
    v581[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1264;
    v581[3] = &unk_1E59452E8;
    v581[4] = v48;
    dispatch_async(v565, v581);

    LOBYTE(v48) = 1;
  }
  int v566 = [(HMAccessory *)self supportsJustSiri];
  if (v566 != [v6 supportsJustSiri])
  {
    id v48 = (HMAccessory *)MEMORY[0x19F3A64A0]();
    v567 = self;
    HMFGetOSLogHandle();
    v568 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v568, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v569 = (id)objc_claimAutoreleasedReturnValue();
      [(HMAccessory *)v567 supportsJustSiri];
      HMFBooleanToString();
      v570 = (char *)(id)objc_claimAutoreleasedReturnValue();
      [v6 supportsJustSiri];
      HMFBooleanToString();
      id v571 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v653 = v569;
      __int16 v654 = 2112;
      v655 = v570;
      __int16 v656 = 2112;
      id v657 = v571;
      _os_log_impl(&dword_19D1A8000, v568, OS_LOG_TYPE_INFO, "%{public}@Updating supportsJustSiri from %@ to %@", buf, 0x20u);
    }
    -[HMAccessory setSupportsJustSiri:](v567, "setSupportsJustSiri:", [v6 supportsJustSiri]);
    v572 = [(HMAccessory *)v567 context];
    v573 = [v572 queue];
    v580[0] = MEMORY[0x1E4F143A8];
    v580[1] = v217[269];
    v580[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_1265;
    v580[3] = &unk_1E59452E8;
    v580[4] = v567;
    dispatch_async(v573, v580);

    LOBYTE(v48) = 1;
  }

  id v4 = v576;
LABEL_379:

  return (char)v48;
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyClientsOfTargetControlSupportUpdate];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyClientsOfMultiUserSupportUpdate];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1080(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyClientsOfHomeLevelLocationServiceSettingSupportUpdate];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1081(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyClientsOfUpdatedSupportsAudioReturnChannel];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1082(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyClientsOfSupportsCompanionInitiatedRestartUpdate];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyClientsOfSupportsCompanionInitiatedObliterateUpdate];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyClientsOfSupportsMusicAlarmUpdate];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_6;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1085(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1086;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1088(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1089;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1091(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1092;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1094(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1095;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1097(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1098;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1100(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1101;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1103(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1104;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1105(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1106;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1108(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1109;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1112(id *a1)
{
  uint64_t v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1113;
  v6[3] = &unk_1E5944F20;
  id v7 = a1[5];
  id v8 = a1[6];
  id v4 = a1[7];
  id v5 = a1[4];
  id v9 = v4;
  id v10 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_3_1114(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 supportsWalletKey];

  return [v1 _invokeDidUpdateSupportsWalletKeyDelegate:v2];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_4_1115(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 supportsUWBUnlock];

  return [v1 _invokeDidUpdateSupportsUWBUnlockDelegate:v2];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1117(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1118;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_3_1120(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_4_1121;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_5_1122(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegatesOfUpdatedControllable];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_6_1236(id *a1)
{
  uint64_t v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_7;
  v6[3] = &unk_1E5945650;
  id v7 = a1[5];
  id v4 = a1[6];
  id v5 = a1[4];
  id v8 = v4;
  id v9 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_9;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_11;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_13;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_14(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_15;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1242(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1243;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1244(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyClientsOfDiagnosticsTransferSupportUpdate];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1245(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegatesOfAdditionalSetupRequiredChange];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1246(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegatesOfUpdatedCalibrationStatus];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1247(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfUpdatedSettings:*(void *)(a1 + 40)];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1249(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1250;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1252(id *a1)
{
  uint64_t v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1253;
  v6[3] = &unk_1E5945650;
  id v4 = a1[5];
  id v5 = a1[4];
  id v7 = v4;
  id v8 = v5;
  id v9 = a1[6];
  [v3 invokeBlock:v6];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1254(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateUpdatedSupportsMediaContentProfile];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1255(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfAudioDestinationUpdate];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1256(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfAudioDestinationControllerUpdate];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1257(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfAudioDestinationControllerUpdate];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1258(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfAudioDestinationControllerUpdate];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1259(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateUpdatedPreferredMediaUser];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1260(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateUpdatedSupportsPreferredMediaUser];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_1262(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __34__HMAccessory_mergeFromNewObject___block_invoke_2_1263;
  v6[3] = &unk_1E5945628;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1264(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateUpdatedSupportsRMVonAppleTV];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_1265(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateUpdatedSupportsJustSiri];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1263(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdatePendingConfigurationIdentifier:*(void *)(a1 + 40)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1253(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateSoftwareVersion:*(void *)(a1 + 48)];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_2_1250(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 device];
  [v1 accessory:v2 didUpdateDevice:v3];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1243(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidSetHasOnboardedForNaturalLighting:*(void *)(a1 + 40)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_15(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 isFirmwareUpdateAvailable];

  return [v1 accessory:v2 didUpdateFirmwareUpdateAvailable:v3];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_13(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 storeID];
  [v1 accessory:v2 didUpdateStoreID:v3];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_11(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 bundleID];
  [v1 accessory:v2 didUpdateBundleID:v3];
}

void __34__HMAccessory_mergeFromNewObject___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [v2 firmwareVersion];
  [v1 accessory:v2 didUpdateFirmwareVersion:v3];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateReprovisionStateForAccessory:*(void *)(a1 + 48)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_4_1121(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateReachableTransports:*(void *)(a1 + 40)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1118(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateReachability:*(void *)(a1 + 40)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1113(uint64_t a1)
{
  return [*(id *)(a1 + 32) home:*(void *)(a1 + 40) didUpdateRoom:*(void *)(a1 + 48) forAccessory:*(void *)(a1 + 56)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1109(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateApplicationData:*(void *)(a1 + 40)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1106(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateName:*(void *)(a1 + 40)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1104(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryDidUpdateName:*(void *)(a1 + 40)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1101(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports user media settings update: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) accessoryDidUpdateSupportsUserMediaSettings:*(void *)(a1 + 32)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1098(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports doorbell chime update: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) accessoryDidUpdateSupportsDoorbellChime:*(void *)(a1 + 32)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1095(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports third party music update: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) accessoryDidUpdateSupportsThirdPartyMusic:*(void *)(a1 + 32)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1092(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports audio analysis update: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) accessoryDidUpdateSupportsAudioAnalysis:*(void *)(a1 + 32)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1089(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports drop in update: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) accessoryDidUpdateSupportsDropIn:*(void *)(a1 + 32)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_2_1086(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports media actions update: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) accessoryDidUpdateSupportsMediaActions:*(void *)(a1 + 32)];
}

uint64_t __34__HMAccessory_mergeFromNewObject___block_invoke_6(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of supports announce update: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) accessoryDidUpdateSupportsAnnounce:*(void *)(a1 + 32)];
}

- (BOOL)_mergeControlTargetUUIDs:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v6 = [(HMAccessory *)self controlTargetUUIDs];
  if (v6)
  {
    id v7 = [(HMAccessory *)self controlTargetUUIDs];
    int v8 = [v5 setWithArray:v7];
  }
  else
  {
    int v8 = [v5 setWithArray:MEMORY[0x1E4F1CBF0]];
  }

  if (v4) {
    id v9 = v4;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  __int16 v10 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
  if ([(HMAccessory *)self supportsTargetController])
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v58 = v14;
      __int16 v59 = 2112;
      id v60 = v8;
      __int16 v61 = 2112;
      long long v62 = v10;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Merging current control targets %@ with new control targets %@", buf, 0x20u);
    }
  }
  int v41 = v4;
  [(HMAccessory *)self setControlTargetUUIDs:v4];
  int v38 = (void *)[v8 mutableCopy];
  [v38 minusSet:v10];
  uint64_t v39 = v10;
  int v15 = (void *)[v10 mutableCopy];
  id v40 = v8;
  [v15 minusSet:v8];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  BOOL v37 = v16 != 0;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v52 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        __int16 v21 = [(HMAccessory *)self home];
        id v22 = [v21 accessoryWithUUID:v20];
        if (v22)
        {
          id v23 = [(HMAccessory *)self context];
          __int16 v24 = [v23 queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __40__HMAccessory__mergeControlTargetUUIDs___block_invoke;
          block[3] = &unk_1E5945628;
          block[4] = self;
          id v50 = v22;
          dispatch_async(v24, block);
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v17);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v25 = v38;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v45 + 1) + 8 * j);
        id v31 = [(HMAccessory *)self home];
        uint64_t v32 = [v31 accessoryWithUUID:v30];
        if (v32)
        {
          id v33 = [(HMAccessory *)self context];
          id v34 = [v33 queue];
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __40__HMAccessory__mergeControlTargetUUIDs___block_invoke_2;
          v43[3] = &unk_1E5945628;
          void v43[4] = self;
          id v44 = v32;
          dispatch_async(v34, v43);
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v27);
    BOOL v35 = 1;
  }
  else
  {
    BOOL v35 = v37;
  }

  return v35;
}

uint64_t __40__HMAccessory__mergeControlTargetUUIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfAddedControlTarget:*(void *)(a1 + 40)];
}

uint64_t __40__HMAccessory__mergeControlTargetUUIDs___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfRemovedControlTarget:*(void *)(a1 + 40)];
}

- (BOOL)_mergeServices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMAccessory *)self currentServices];
  id v7 = [v6 array];
  int v8 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v7 newObjects:v4];

  id v9 = [(HMObjectMergeCollection *)v8 removedObjects];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __30__HMAccessory__mergeServices___block_invoke;
  v21[3] = &unk_1E59429A8;
  v21[4] = self;
  [v9 enumerateObjectsUsingBlock:v21];

  __int16 v10 = [(HMObjectMergeCollection *)v8 addedObjects];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __30__HMAccessory__mergeServices___block_invoke_1076;
  v20[3] = &unk_1E59429A8;
  v20[4] = self;
  [v10 enumerateObjectsUsingBlock:v20];

  [(HMObjectMergeCollection *)v8 mergeCommonObjects];
  BOOL v11 = [(HMObjectMergeCollection *)v8 isModified];
  if (v11)
  {
    uint64_t v12 = [(HMObjectMergeCollection *)v8 finalObjects];
    id v13 = [(HMAccessory *)self currentServices];
    [v13 setArray:v12];

    uint64_t v14 = [(HMAccessory *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      int v15 = [(HMAccessory *)self context];
      uint64_t v16 = [v15 queue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __30__HMAccessory__mergeServices___block_invoke_1078;
      v18[3] = &unk_1E5945628;
      void v18[4] = self;
      id v19 = v14;
      dispatch_async(v16, v18);
    }
  }

  return v11;
}

void __30__HMAccessory__mergeServices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed service via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  [v3 _unconfigure];
}

void __30__HMAccessory__mergeServices___block_invoke_1076(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v9 = 138543618;
    __int16 v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added service via merge: %@", (uint8_t *)&v9, 0x16u);
  }
  int v8 = [*(id *)(a1 + 32) context];
  objc_msgSend(v3, "__configureWithContext:accessory:", v8, *(void *)(a1 + 32));
}

void __30__HMAccessory__mergeServices___block_invoke_1078(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__HMAccessory__mergeServices___block_invoke_2;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

uint64_t __30__HMAccessory__mergeServices___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling accessoryDidUpdateServices", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 40) accessoryDidUpdateServices:*(void *)(a1 + 32)];
}

- (BOOL)_mergeBulletinBoardNotificationByEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  id v5 = [(HMAccessory *)self bulletinBoardNotificationByEndpoint];
  int v6 = HMFEqualObjects();

  if (v6)
  {
    int v7 = *((unsigned __int8 *)v29 + 24);
  }
  else
  {
    int v8 = [(HMAccessory *)self bulletinBoardNotificationByEndpoint];
    uint64_t v9 = (void *)[v8 mutableCopy];
    __int16 v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v12 = v11;

    uint64_t v13 = [(HMAccessory *)self bulletinBoardNotificationByEndpoint];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __57__HMAccessory__mergeBulletinBoardNotificationByEndpoint___block_invoke;
    v23[3] = &unk_1E5942958;
    id v14 = v4;
    id v24 = v14;
    id v25 = self;
    id v15 = v12;
    id v26 = v15;
    uint64_t v27 = &v28;
    objc_msgSend(v13, "na_each:", v23);

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__HMAccessory__mergeBulletinBoardNotificationByEndpoint___block_invoke_1073;
    v19[3] = &unk_1E5942980;
    id v16 = v15;
    id v20 = v16;
    __int16 v21 = self;
    id v22 = &v28;
    objc_msgSend(v14, "na_each:", v19);
    uint64_t v17 = (void *)[v16 copy];
    [(HMAccessory *)self setBulletinBoardNotificationByEndpoint:v17];

    int v7 = *((unsigned __int8 *)v29 + 24);
  }
  _Block_object_dispose(&v28, 8);

  return v7 != 0;
}

void __57__HMAccessory__mergeBulletinBoardNotificationByEndpoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (!v7)
  {
    int v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 40);
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing matter bulletin board via merge: %@", (uint8_t *)&v12, 0x16u);
    }
    [v6 _unconfigure];
    [*(id *)(a1 + 48) setObject:0 forKeyedSubscript:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __57__HMAccessory__mergeBulletinBoardNotificationByEndpoint___block_invoke_1073(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  int v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 40);
  __int16 v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v7)
  {
    if (v11)
    {
      id v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding new matter bulletin board via merge: %@", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
    uint64_t v16 = [*(id *)(a1 + 40) context];
    objc_msgSend(v6, "__configureWithContext:accessory:", v16, *(void *)(a1 + 40));

    goto LABEL_9;
  }
  if (v11)
  {
    int v12 = HMFGetLogIdentifier();
    int v17 = 138543618;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating matter bulletin board via merge: %@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  char v14 = [v13 mergeFromNewObject:v6];

  if (v14) {
LABEL_9:
  }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

id __29__HMAccessory_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

uint64_t __76__HMAccessory__handleMultipleCharacteristicsUpdated_message_informDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) service:*(void *)(a1 + 48) didUpdateValueForCharacteristic:*(void *)(a1 + 56)];
}

- (void)_updateName:(id)a3 forService:(id)a4 completionHandler:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMAccessory *)self context];
  if (!v10)
  {
    uint64_t v38 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory _updateName:forService:completionHandler:]", @"completion"];
    uint64_t v39 = (void *)MEMORY[0x19F3A64A0]();
    id v40 = self;
    int v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      id v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v60 = v42;
      __int16 v61 = 2112;
      long long v62 = (const char *)v38;
      _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v43 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v38 userInfo:0];
    objc_exception_throw(v43);
  }
  int v12 = (void *)v11;
  if (v11)
  {
    uint64_t v13 = [(HMAccessory *)self home];
    if (v13)
    {
      char v14 = [v9 name];
      int v15 = [v14 isEqual:v8];

      if (v15)
      {
        uint64_t v16 = [(HMAccessory *)self context];
        int v17 = [v16 delegateCaller];
        [v17 callCompletion:v10 error:0];
      }
      else
      {
        long long v46 = [v9 accessoryUUID];
        id v25 = (void *)[v8 copy];
        long long v45 = (void *)[objc_alloc(MEMORY[0x1E4F65488]) initWithTarget:v46];
        id v26 = (void *)MEMORY[0x1E4F654B0];
        v57[0] = @"kServiceInstanceID";
        uint64_t v27 = [v9 instanceID];
        v57[1] = @"kServiceName";
        v58[0] = v27;
        v58[1] = v25;
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
        long long v47 = [v26 messageWithName:@"kRenameServiceRequestKey" destination:v45 payload:v28];

        objc_initWeak((id *)buf, v9);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __56__HMAccessory__updateName_forService_completionHandler___block_invoke;
        aBlock[3] = &unk_1E5944AB8;
        objc_copyWeak(&v56, (id *)buf);
        id v44 = v25;
        id v53 = v44;
        long long v54 = self;
        id v55 = v10;
        uint64_t v29 = _Block_copy(aBlock);
        uint64_t v30 = [(HMAccessory *)self context];
        char v31 = [v30 pendingRequests];

        uint64_t v32 = [v47 identifier];
        id v33 = _Block_copy(v29);
        [v31 addCompletionBlock:v33 forIdentifier:v32];

        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __56__HMAccessory__updateName_forService_completionHandler___block_invoke_2;
        v48[3] = &unk_1E5945510;
        id v34 = v31;
        id v49 = v34;
        id v35 = v32;
        id v50 = v35;
        id v36 = v29;
        id v51 = v36;
        [v47 setResponseHandler:v48];
        BOOL v37 = [v12 messageDispatcher];
        [v37 sendMessage:v47 completionHandler:0];

        objc_destroyWeak(&v56);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      id v22 = [(HMAccessory *)self context];
      id v23 = [v22 delegateCaller];
      id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v23 callCompletion:v10 error:v24];

      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v60 = v21;
      __int16 v61 = 2080;
      long long v62 = "-[HMAccessory _updateName:forService:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }
}

void __56__HMAccessory__updateName_forService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  if (!v4)
  {
    [WeakRetained setConfiguredName:*(void *)(a1 + 32)];
    [WeakRetained setName:*(void *)(a1 + 32)];
  }
  id v5 = [*(id *)(a1 + 40) context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 48) error:v4];
}

void __56__HMAccessory__updateName_forService_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_updateAuthorizationData:(id)a3 forService:(id)a4 characteristic:(id)a5 completionHandler:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(HMAccessory *)self context];
  if (!v13)
  {
    uint64_t v42 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory _updateAuthorizationData:forService:characteristic:completionHandler:]", @"completion"];
    id v43 = (void *)MEMORY[0x19F3A64A0]();
    id v44 = self;
    long long v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      long long v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v58 = v46;
      __int16 v59 = 2112;
      id v60 = (const char *)v42;
      _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v47 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v42 userInfo:0];
    objc_exception_throw(v47);
  }
  int v15 = (void *)v14;
  if (v14)
  {
    uint64_t v16 = [(HMAccessory *)self home];
    int v17 = v16;
    if (v16)
    {
      long long v48 = v15;
      v55[0] = @"kHomeUUID";
      uint64_t v18 = [v16 uuid];
      uint64_t v19 = [v18 UUIDString];
      id v20 = v11;
      uint64_t v21 = (void *)v19;
      v56[0] = v19;
      v55[1] = @"kServiceInstanceID";
      id v50 = v20;
      id v22 = [v20 instanceID];
      v56[1] = v22;
      v55[2] = @"kCharacteristicInstanceID";
      id v49 = v12;
      id v23 = [v12 instanceID];
      v56[2] = v23;
      v55[3] = @"kAuthorizationDataKey";
      id v24 = v10;
      if (!v10)
      {
        id v24 = [MEMORY[0x1E4F1C9B8] data];
      }
      v56[3] = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:4];
      if (!v10) {

      }
      id v26 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v27 = objc_alloc(MEMORY[0x1E4F65488]);
      uint64_t v28 = [(HMAccessory *)self uuid];
      uint64_t v29 = (void *)[v27 initWithTarget:v28];
      uint64_t v30 = (void *)v25;
      char v31 = (void *)[v26 initWithName:@"HMAccessoryUpdateCharacteristicAuthorizationDataMessage" destination:v29 payload:v25];

      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __84__HMAccessory__updateAuthorizationData_forService_characteristic_completionHandler___block_invoke;
      v51[3] = &unk_1E5945510;
      uint64_t v32 = v49;
      id v52 = v49;
      int v15 = v48;
      id v33 = v48;
      id v53 = v33;
      id v54 = v13;
      [v31 setResponseHandler:v51];
      id v34 = [v33 messageDispatcher];
      [v34 sendMessage:v31];

      id v11 = v50;
    }
    else
    {
      uint64_t v39 = [(HMAccessory *)self context];
      id v40 = [v39 delegateCaller];
      [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      v41 = uint64_t v32 = v12;
      [v40 callCompletion:v13 error:v41];
    }
  }
  else
  {
    uint64_t v32 = v12;
    id v35 = (void *)MEMORY[0x19F3A64A0]();
    id v36 = self;
    BOOL v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v58 = v38;
      __int16 v59 = 2080;
      id v60 = "-[HMAccessory _updateAuthorizationData:forService:characteristic:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v13 + 2))(v13, v17);
  }
}

void __84__HMAccessory__updateAuthorizationData_forService_characteristic_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if (!v6) {
    objc_msgSend(*(id *)(a1 + 32), "setHasAuthorizationData:", objc_msgSend(a3, "hmf_BOOLForKey:", @"kCharacteristicAuthDataPresentKey"));
  }
  id v5 = [*(id *)(a1 + 40) delegateCaller];
  [v5 callCompletion:*(void *)(a1 + 48) error:v6];
}

- (void)_updateAssociatedServiceType:(id)a3 forService:(id)a4 completionHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = (char *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x19F3A64A0]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    long long v46 = v14;
    __int16 v47 = 2112;
    long long v48 = v8;
    __int16 v49 = 2112;
    id v50 = v9;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating service type: %@, for service: %@", buf, 0x20u);
  }
  uint64_t v15 = [(HMAccessory *)v12 context];
  if (!v10)
  {
    uint64_t v31 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory _updateAssociatedServiceType:forService:completionHandler:]", @"completion"];
    uint64_t v32 = (void *)MEMORY[0x19F3A64A0]();
    id v33 = v12;
    id v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v46 = v35;
      __int16 v47 = 2112;
      long long v48 = (const char *)v31;
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v36 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v31 userInfo:0];
    objc_exception_throw(v36);
  }
  uint64_t v16 = (void *)v15;
  if (v15)
  {
    uint64_t v17 = [(HMAccessory *)v12 home];
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      BOOL v37 = [(HMAccessory *)v12 uuid];
      v43[0] = @"kHomeUUID";
      uint64_t v19 = [v18 uuid];
      id v20 = [v19 UUIDString];
      v44[0] = v20;
      v43[1] = @"kServiceInstanceID";
      uint64_t v21 = [v9 instanceID];
      v43[2] = @"kServiceType";
      v44[1] = v21;
      v44[2] = v8;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];
      id v22 = v9;
      v24 = id v23 = v8;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __73__HMAccessory__updateAssociatedServiceType_forService_completionHandler___block_invoke;
      v38[3] = &unk_1E5942B08;
      v38[4] = v12;
      uint64_t v39 = v23;
      id v40 = v16;
      id v42 = v10;
      id v41 = v22;
      -[_HMContext sendMessage:target:payload:responseHandler:](v40, @"kSetAssociatedServiceTypeRequestKey", v37, v24, v38);

      id v8 = v23;
      id v9 = v22;
    }
    else
    {
      uint64_t v29 = [v16 delegateCaller];
      uint64_t v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12 userInfo:0];
      [v29 callCompletion:v10 error:v30];

      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x19F3A64A0]();
    id v26 = v12;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v46 = v28;
      __int16 v47 = 2080;
      long long v48 = "-[HMAccessory _updateAssociatedServiceType:forService:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v10 + 2))(v10, v18);
  }
}

void __73__HMAccessory__updateAssociatedServiceType_forService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (v5)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 40);
      int v28 = 138543874;
      uint64_t v29 = v11;
      __int16 v30 = 2112;
      uint64_t v31 = v12;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to update associated service type: %@ with error: %@", (uint8_t *)&v28, 0x20u);
    }
    id v13 = [*(id *)(a1 + 48) delegateCaller];
    [v13 callCompletion:*(void *)(a1 + 64) error:v5];
  }
  else
  {
    id v13 = objc_msgSend(v6, "hmf_stringForKey:", @"kServiceType");
    uint64_t v14 = objc_msgSend(v7, "hmf_numberForKey:", @"kServiceInstanceID");
    uint64_t v15 = [*(id *)(a1 + 32) services];
    uint64_t v16 = objc_msgSend(v15, "hmf_firstObjectWithInstanceID:", v14);

    if (!v16)
    {
      uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
      id v18 = *(id *)(a1 + 32);
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        int v28 = 138543874;
        uint64_t v29 = v20;
        __int16 v30 = 2112;
        uint64_t v31 = v14;
        __int16 v32 = 2112;
        id v33 = v13;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Service not found for instance id: %@ updated service type: %@", (uint8_t *)&v28, 0x20u);
      }
    }
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]([v16 _handleUpdateAssociatedServiceType:v13]);
    id v22 = *(id *)(a1 + 32);
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      uint64_t v25 = *(void **)(a1 + 40);
      id v26 = *(void **)(a1 + 56);
      int v28 = 138543874;
      uint64_t v29 = v24;
      __int16 v30 = 2112;
      uint64_t v31 = v25;
      __int16 v32 = 2112;
      id v33 = v26;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@Successfully updated associated service type: %@, for service: %@", (uint8_t *)&v28, 0x20u);
    }
    id v27 = [*(id *)(a1 + 48) delegateCaller];
    [v27 callCompletion:*(void *)(a1 + 64) error:0];
  }
}

- (id)_findServiceWithUniqueIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HMAccessory *)self services];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 uniqueIdentifier];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setRemoteLoginHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (HMRemoteLoginHandler *)a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    char v11 = v8;
    __int16 v12 = 2112;
    long long v13 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting remote login handler: %@", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  remoteLoginHandler = v6->_remoteLoginHandler;
  v6->_remoteLoginHandler = v4;

  os_unfair_lock_unlock(&v6->_lock);
}

- (void)_updateRoom:(id)a3 completionHandler:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMAccessory *)self context];
  if (!v7)
  {
    uint64_t v39 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory _updateRoom:completionHandler:]", @"completion"];
    id v40 = (void *)MEMORY[0x19F3A64A0]();
    id v41 = self;
    id v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v60 = v43;
      __int16 v61 = 2112;
      long long v62 = (const char *)v39;
      _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v44 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v39 userInfo:0];
    objc_exception_throw(v44);
  }
  id v9 = v8;
  if (v8)
  {
    int v10 = [v8 delegateCaller];
    if (v6)
    {
      __int16 v47 = [(HMAccessory *)self home];
      char v11 = [(HMAccessory *)self room];
      __int16 v12 = v11;
      if (v47)
      {
        if ([v11 isEqual:v6])
        {
          [v10 callCompletion:v7 error:0];
        }
        else
        {
          id v23 = objc_alloc(MEMORY[0x1E4F65488]);
          id v24 = [(HMAccessory *)self messageTargetUUID];
          long long v45 = (void *)[v23 initWithTarget:v24];

          uint64_t v25 = (void *)MEMORY[0x1E4F654B0];
          __int16 v57 = @"kRoomUUID";
          id v26 = [v6 uuid];
          id v27 = [v26 UUIDString];
          id v58 = v27;
          int v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          long long v46 = [v25 messageWithName:@"kUpdateRoomForAccessoryRequestKey" destination:v45 payload:v28];

          objc_initWeak((id *)buf, self);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __45__HMAccessory__updateRoom_completionHandler___block_invoke;
          aBlock[3] = &unk_1E5944AB8;
          objc_copyWeak(&v56, (id *)buf);
          id v53 = v6;
          id v54 = v10;
          id v29 = v7;
          id v55 = v29;
          __int16 v30 = _Block_copy(aBlock);
          uint64_t v31 = [(HMAccessory *)self context];
          __int16 v32 = [v31 pendingRequests];

          id v33 = [v46 identifier];
          uint64_t v34 = _Block_copy(v29);
          [v32 addCompletionBlock:v34 forIdentifier:v33];

          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __45__HMAccessory__updateRoom_completionHandler___block_invoke_2;
          v48[3] = &unk_1E5945510;
          id v35 = v32;
          id v49 = v35;
          id v36 = v33;
          id v50 = v36;
          id v37 = v30;
          id v51 = v37;
          [v46 setResponseHandler:v48];
          uint64_t v38 = [v9 messageDispatcher];
          [v38 sendMessage:v46 completionHandler:0];

          objc_destroyWeak(&v56);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
        if (!v11)
        {
          uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
          uint64_t v19 = self;
          id v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            id v60 = v21;
            __int16 v61 = 2112;
            long long v62 = 0;
            __int16 v63 = 2112;
            uint64_t v64 = 0;
            _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@No room for accessory!!!! home %@, room %@", buf, 0x20u);
          }
        }
        id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
        [v10 callCompletion:v7 error:v22];
      }
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
      [v10 callCompletion:v7 error:v17];
    }
  }
  else
  {
    long long v13 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v14 = self;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v60 = v16;
      __int16 v61 = 2080;
      long long v62 = "-[HMAccessory _updateRoom:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

void __45__HMAccessory__updateRoom_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = v6;
  id v5 = WeakRetained;
  if (!v6)
  {
    [WeakRetained setRoom:*(void *)(a1 + 32)];
    id v4 = 0;
  }
  [*(id *)(a1 + 40) callCompletion:*(void *)(a1 + 48) error:v4];
}

void __45__HMAccessory__updateRoom_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_readValueForCharacteristic:(id)a3 completionHandler:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(HMAccessory *)self context];
  if (!v8)
  {
    uint64_t v48 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory _readValueForCharacteristic:completionHandler:]", @"completion"];
    id v49 = (void *)MEMORY[0x19F3A64A0]();
    id v50 = self;
    id v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      id v52 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v73 = v52;
      __int16 v74 = 2112;
      long long v75 = (const char *)v48;
      _os_log_impl(&dword_19D1A8000, v51, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v53 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v48 userInfo:0];
    objc_exception_throw(v53);
  }
  int v10 = (void *)v9;
  if (v9)
  {
    if (v7)
    {
      char v11 = [v7 service];
      if (v11)
      {
        __int16 v12 = [(HMAccessory *)self home];
        if (v12)
        {
          long long v13 = [v7 properties];
          char v14 = [v13 containsObject:@"HMCharacteristicPropertyReadable"];

          if (v14)
          {
            id v15 = objc_alloc(MEMORY[0x1E4F653F0]);
            long long v16 = NSString;
            uint64_t v17 = MEMORY[0x19F3A5D00](self, a2);
            uint64_t v18 = [v16 stringWithFormat:@"%@, %s:%ld", v17, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMAccessory.m", 3543];
            id v56 = (void *)[v15 initWithName:v18];

            __int16 v59 = [v7 instanceID];
            id v58 = [v7 characteristicType];
            [v11 accessoryUUID];

            v70[0] = @"kAccessoryUUID";
            id v54 = [v11 accessoryUUID];
            uint64_t v19 = [v54 UUIDString];
            v71[0] = v19;
            v70[1] = @"kServiceInstanceID";
            id v20 = [v11 instanceID];
            v71[1] = v20;
            v70[2] = @"kCharacteristicInstanceID";
            uint64_t v21 = [v7 instanceID];
            v71[2] = v21;
            v70[3] = @"kHomeUUID";
            [v12 uuid];
            id v22 = v61 = v12;
            id v23 = [v22 UUIDString];
            v71[3] = v23;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:4];
            __int16 v57 = v60 = v11;

            id v24 = objc_alloc(MEMORY[0x1E4F654B0]);
            id v25 = objc_alloc(MEMORY[0x1E4F65488]);
            id v26 = [v61 messageTargetUUID];
            id v27 = (void *)[v25 initWithTarget:v26];
            int v28 = (void *)[v24 initWithName:@"kCharacteristicReadRequestKey" destination:v27 payload:v57];

            [v28 setActivity:v56];
            id v29 = [(HMAccessory *)self context];
            __int16 v30 = [v29 pendingRequests];

            uint64_t v31 = [v28 identifier];
            __int16 v32 = _Block_copy(v8);
            [v30 addCompletionBlock:v32 forIdentifier:v31];

            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __61__HMAccessory__readValueForCharacteristic_completionHandler___block_invoke;
            v62[3] = &unk_1E5942928;
            id v63 = v56;
            uint64_t v64 = self;
            id v65 = v59;
            id v66 = v58;
            id v67 = v30;
            id v68 = v31;
            id v33 = v10;
            id v69 = v33;
            id v55 = v31;
            id v34 = v30;
            id v35 = v58;
            id v36 = v59;
            id v37 = v56;
            [v28 setResponseHandler:v62];
            uint64_t v38 = [v33 messageDispatcher];
            [v38 sendMessage:v28];

            [v37 end];
            __int16 v12 = v61;

            char v11 = v60;
LABEL_18:

            goto LABEL_19;
          }
          id v43 = [(HMAccessory *)self context];
          id v44 = [v43 delegateCaller];
          long long v45 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v46 = 6;
        }
        else
        {
          id v43 = [(HMAccessory *)self context];
          id v44 = [v43 delegateCaller];
          long long v45 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v46 = 12;
        }
        __int16 v47 = [v45 errorWithDomain:@"HMErrorDomain" code:v46 userInfo:0];
        [v44 callCompletion:v8 error:v47];
      }
      else
      {
        __int16 v12 = [(HMAccessory *)self context];
        id v43 = [v12 delegateCaller];
        id v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
        [v43 callCompletion:v8 error:v44];
      }
    }
    else
    {
      char v11 = [(HMAccessory *)self context];
      __int16 v12 = [v11 delegateCaller];
      id v43 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
      [v12 callCompletion:v8 error:v43];
    }

    goto LABEL_18;
  }
  uint64_t v39 = (void *)MEMORY[0x19F3A64A0]();
  id v40 = self;
  id v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    id v42 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v73 = v42;
    __int16 v74 = 2080;
    long long v75 = "-[HMAccessory _readValueForCharacteristic:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  char v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  (*((void (**)(id, void *))v8 + 2))(v8, v11);
LABEL_19:
}

void __61__HMAccessory__readValueForCharacteristic_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) begin];
  [*(id *)(a1 + 40) uuid];

  [v5 domain];
  [v5 code];
  if (v5)
  {
    id v3 = [*(id *)(a1 + 64) removeCompletionBlockForIdentifier:*(void *)(a1 + 72)];
    id v4 = [*(id *)(a1 + 80) delegateCaller];
    [v4 callCompletion:v3 error:v5];
  }
  [*(id *)(a1 + 32) end];
}

- (void)_writeValue:(id)a3 forCharacteristic:(id)a4 service:(id)a5 completionHandler:(id)a6
{
  v91[5] = *MEMORY[0x1E4F143B8];
  char v11 = (char *)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(HMAccessory *)self context];
  if (!v14)
  {
    uint64_t v57 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory _writeValue:forCharacteristic:service:completionHandler:]", @"completion"];
    id v58 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v59 = self;
    id v60 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      __int16 v61 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v85 = v61;
      __int16 v86 = 2112;
      id v87 = (const char *)v57;
      _os_log_impl(&dword_19D1A8000, v60, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v62 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v57 userInfo:0];
    objc_exception_throw(v62);
  }
  long long v16 = (void *)v15;
  if (v15)
  {
    aBlocuint64_t k = v14;
    uint64_t v17 = [(HMAccessory *)self home];
    __int16 v73 = (void *)v17;
    __int16 v74 = v16;
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      id v19 = objc_alloc(MEMORY[0x1E4F653F0]);
      id v20 = NSString;
      uint64_t v21 = MEMORY[0x19F3A5D00](self, a2);
      id v22 = [v20 stringWithFormat:@"%@, %s:%ld", v21, "/Library/Caches/com.apple.xbs/Sources/HomeKit/Sources/HomeKit/HMAccessory.m", 3473];
      id v63 = (void *)[v19 initWithName:v22];

      uint64_t v64 = [v12 instanceID];
      id v65 = [v12 characteristicType];
      [(HMAccessory *)self uuid];

      id v69 = [v18 messageTargetUUID];
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F65488]) initWithTarget:v69];
      id v67 = (void *)MEMORY[0x1E4F654B0];
      v90[0] = @"kAccessoryUUID";
      id v24 = [v13 accessoryUUID];
      id v25 = [v24 UUIDString];
      v91[0] = v25;
      v91[1] = v11;
      __int16 v72 = v11;
      v90[1] = @"kCharacteristicValue";
      v90[2] = @"kServiceInstanceID";
      id v70 = v13;
      id v26 = [v13 instanceID];
      v91[2] = v26;
      v90[3] = @"kCharacteristicInstanceID";
      id v71 = v12;
      id v27 = [v12 instanceID];
      v91[3] = v27;
      v90[4] = @"kHomeUUID";
      int v28 = [v18 uuid];
      id v29 = [v28 UUIDString];
      v91[4] = v29;
      __int16 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:5];
      uint64_t v31 = v67;
      id v68 = (void *)v23;
      __int16 v32 = [v31 messageWithName:@"kCharacteristicWriteRequestKey" destination:v23 payload:v30];

      [v32 setActivity:v63];
      id v33 = [(HMAccessory *)self context];
      id v34 = [v33 pendingRequests];

      id v35 = [v32 identifier];
      id v36 = _Block_copy(aBlock);
      [v34 addCompletionBlock:v36 forIdentifier:v35];

      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __71__HMAccessory__writeValue_forCharacteristic_service_completionHandler___block_invoke;
      v76[3] = &unk_1E5942928;
      id v37 = v63;
      id v77 = v37;
      __int16 v78 = self;
      id v38 = v64;
      id v79 = v38;
      id v39 = v65;
      id v80 = v39;
      id v66 = v34;
      id v81 = v66;
      id v40 = v35;
      id v82 = v40;
      id v41 = v74;
      id v83 = v41;
      id v42 = (void *)MEMORY[0x19F3A64A0]([v32 setResponseHandler:v76]);
      id v43 = self;
      id v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        long long v45 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        int v85 = v45;
        __int16 v86 = 2112;
        id v87 = v72;
        __int16 v88 = 2112;
        id v89 = v71;
        _os_log_impl(&dword_19D1A8000, v44, OS_LOG_TYPE_INFO, "%{public}@Sending message to write value %@ for characteristic: %@", buf, 0x20u);
      }
      uint64_t v46 = [v41 messageDispatcher];
      [v46 sendMessage:v32];

      [v37 end];
      id v12 = v71;
      char v11 = (char *)v72;
      id v13 = v70;
      id v14 = aBlock;
    }
    else
    {
      id v53 = (void *)MEMORY[0x19F3A64A0]();
      id v54 = self;
      id v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        id v56 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v85 = v56;
        __int16 v86 = 2112;
        id v87 = (const char *)v12;
        _os_log_impl(&dword_19D1A8000, v55, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic %@: home is nil", buf, 0x16u);
      }
      id v37 = [(HMAccessory *)v54 context];
      id v38 = [v37 delegateCaller];
      id v39 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      id v14 = aBlock;
      [v38 callCompletion:aBlock error:v39];
    }

    id v52 = v73;
    long long v16 = v74;
  }
  else
  {
    __int16 v47 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v48 = self;
    id v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = id v50 = v14;
      *(_DWORD *)buf = 138543618;
      int v85 = v51;
      __int16 v86 = 2080;
      id v87 = "-[HMAccessory _writeValue:forCharacteristic:service:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v49, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

      id v14 = v50;
    }

    id v52 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v14 + 2))(v14, v52);
  }
}

void __71__HMAccessory__writeValue_forCharacteristic_service_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) begin];
  [*(id *)(a1 + 40) uuid];

  [v5 domain];
  [v5 code];
  if (v5)
  {
    id v3 = [*(id *)(a1 + 64) removeCompletionBlockForIdentifier:*(void *)(a1 + 72)];
    id v4 = [*(id *)(a1 + 80) delegateCaller];
    [v4 callCompletion:v3 error:v5];
  }
  [*(id *)(a1 + 32) end];
}

- (void)_updateName:(id)a3 completionHandler:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMAccessory *)self context];
  if (!v7)
  {
    uint64_t v34 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory _updateName:completionHandler:]", @"completion"];
    id v35 = (void *)MEMORY[0x19F3A64A0]();
    id v36 = self;
    id v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v49 = v38;
      __int16 v50 = 2112;
      id v51 = (const char *)v34;
      _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v39 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v34 userInfo:0];
    objc_exception_throw(v39);
  }
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    unint64_t v10 = [v6 length];
    if (HMMaxLengthForNaming__hmf_once_t7 != -1) {
      dispatch_once(&HMMaxLengthForNaming__hmf_once_t7, &__block_literal_global_55_24575);
    }
    if (v10 > HMMaxLengthForNaming__hmf_once_v8)
    {
      char v11 = (void *)MEMORY[0x19F3A64A0]();
      id v12 = self;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v49 = v14;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
      }
      uint64_t v15 = [v9 delegateCaller];
      long long v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:46];
      [v15 callCompletion:v7 error:v16];

      goto LABEL_22;
    }
    uint64_t v15 = (void *)[v6 copy];
    uint64_t v21 = [(HMAccessory *)self home];
    if (v21)
    {
      id v22 = [(HMAccessory *)self name];
      int v23 = HMFEqualObjects();

      if (!v23)
      {
        if (v6)
        {
          uint64_t v46 = @"kAccessoryName";
          __int16 v47 = v15;
          uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        }
        else
        {
          id v44 = @"kAccessoryNameResetKey";
          uint64_t v45 = MEMORY[0x1E4F1CC38];
          uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        }
        int v28 = (void *)v27;
        id v29 = objc_alloc(MEMORY[0x1E4F65488]);
        __int16 v30 = [(HMAccessory *)self messageTargetUUID];
        uint64_t v31 = (void *)[v29 initWithTarget:v30];

        __int16 v32 = [MEMORY[0x1E4F654B0] messageWithName:@"kRenameAccessoryRequestKey" destination:v31 payload:v28];
        objc_initWeak((id *)buf, self);
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __45__HMAccessory__updateName_completionHandler___block_invoke;
        v40[3] = &unk_1E59441D8;
        objc_copyWeak(&v43, (id *)buf);
        id v41 = v15;
        id v42 = v7;
        [v32 setResponseHandler:v40];
        id v33 = [v9 messageDispatcher];
        [v33 sendMessage:v32 completionHandler:0];

        objc_destroyWeak(&v43);
        objc_destroyWeak((id *)buf);

        goto LABEL_21;
      }
      id v24 = [(HMAccessory *)self context];
      id v25 = [v24 delegateCaller];
      [v25 callCompletion:v7 error:0];
    }
    else
    {
      id v24 = [(HMAccessory *)self context];
      id v25 = [v24 delegateCaller];
      id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:12 userInfo:0];
      [v25 callCompletion:v7 error:v26];
    }
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v49 = v20;
    __int16 v50 = 2080;
    id v51 = "-[HMAccessory _updateName:completionHandler:]";
    _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  (*((void (**)(id, void *))v7 + 2))(v7, v15);
LABEL_22:
}

void __45__HMAccessory__updateName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (!v5)
  {
    [WeakRetained setConfiguredName:*(void *)(a1 + 32)];
    uint64_t v8 = objc_msgSend(v12, "hmf_stringForKey:", @"kAccessoryName");
    uint64_t v9 = v8;
    if (!v8) {
      uint64_t v9 = *(void **)(a1 + 32);
    }
    [v7 setName:v9];
  }
  unint64_t v10 = [v7 context];
  char v11 = [v10 delegateCaller];
  [v11 callCompletion:*(void *)(a1 + 40) error:v5];
}

- (void)updateAccessoryName:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMAccessory *)self context];
  if (!v7)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory updateAccessoryName:completionHandler:]", @"completion"];
    uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      id v29 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  uint64_t v9 = (void *)v8;
  unint64_t v10 = [(HMAccessory *)self context];

  if (v10)
  {
    char v11 = [v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HMAccessory_updateAccessoryName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v24 = v6;
    id v25 = v7;
    dispatch_async(v11, block);
  }
  else
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v15;
      __int16 v28 = 2080;
      id v29 = "-[HMAccessory updateAccessoryName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    long long v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
  }
}

uint64_t __53__HMAccessory_updateAccessoryName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateName:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)updateName:(NSString *)name completionHandler:(void *)completion
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = name;
  id v7 = completion;
  uint64_t v8 = [(HMAccessory *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory updateName:completionHandler:]", @"completion"];
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      id v29 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  uint64_t v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__HMAccessory_updateName_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    int v23 = v6;
    id v24 = self;
    id v25 = v7;
    dispatch_async(v10, block);

    char v11 = v23;
  }
  else
  {
    id v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v15;
      __int16 v28 = 2080;
      id v29 = "-[HMAccessory updateName:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    char v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v11);
  }
}

void __44__HMAccessory_updateName_completionHandler___block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v2, "_updateName:completionHandler:");
  }
  else
  {
    id v7 = [v2 context];
    id v4 = [v7 delegateCaller];
    uint64_t v5 = a1[6];
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:20 userInfo:0];
    [v4 callCompletion:v5 error:v6];
  }
}

- (void)setCertificationStatus:(int64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_int64_t certificationStatus = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setApplicationData:(id)a3
{
  id v4 = (HMApplicationData *)a3;
  os_unfair_lock_lock_with_options();
  applicationData = self->_applicationData;
  self->_applicationData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)associationOptions
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t associationOptions = self->_associationOptions;
  os_unfair_lock_unlock(p_lock);
  return associationOptions;
}

- (void)setSuspendedState:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t suspendedState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setSuspendCapable:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_suspendCapable = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSuspendCapable
{
  uint64_t v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_suspendCapable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isBlocked
{
  return 0;
}

- (void)clearMatterCredentialWithType:(int64_t)a3 forUserIndex:(int64_t)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = [(HMAccessory *)self context];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F65488]);
    unint64_t v10 = [(HMAccessory *)self messageTargetUUID];
    char v11 = (void *)[v9 initWithTarget:v10];

    id v12 = (void *)MEMORY[0x1E4F654B0];
    int v23 = @"index";
    id v13 = [NSNumber numberWithInteger:a4];
    id v24 = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v15 = [v12 messageWithName:@"homeutil_clearUser" destination:v11 payload:v14];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__HMAccessory_clearMatterCredentialWithType_forUserIndex_completion___block_invoke;
    v21[3] = &unk_1E5943468;
    id v22 = v7;
    [v15 setResponseHandler:v21];
    uint64_t v16 = [v8 messageDispatcher];
    [v16 sendMessage:v15];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2080;
      __int16 v28 = "-[HMAccessory clearMatterCredentialWithType:forUserIndex:completion:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __69__HMAccessory_clearMatterCredentialWithType_forUserIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearMatterUserWithIndex:(int64_t)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMAccessory *)self context];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F65488]);
    id v9 = [(HMAccessory *)self messageTargetUUID];
    unint64_t v10 = (void *)[v8 initWithTarget:v9];

    char v11 = (void *)MEMORY[0x1E4F654B0];
    id v22 = @"index";
    id v12 = [NSNumber numberWithInteger:a3];
    int v23 = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v14 = [v11 messageWithName:@"homeutil_clearUser" destination:v10 payload:v13];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __51__HMAccessory_clearMatterUserWithIndex_completion___block_invoke;
    v20[3] = &unk_1E5943468;
    id v21 = v6;
    [v14 setResponseHandler:v20];
    uint64_t v15 = [v7 messageDispatcher];
    [v15 sendMessage:v14];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2080;
      __int16 v27 = "-[HMAccessory clearMatterUserWithIndex:completion:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __51__HMAccessory_clearMatterUserWithIndex_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dumpMatterUsersWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMAccessory *)self context];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F65488]);
    id v7 = [(HMAccessory *)self messageTargetUUID];
    id v8 = (void *)[v6 initWithTarget:v7];

    id v9 = [MEMORY[0x1E4F654B0] messageWithName:@"homeutil_getAllUsers" destination:v8 payload:0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __45__HMAccessory_dumpMatterUsersWithCompletion___block_invoke;
    v15[3] = &unk_1E5943468;
    id v16 = v4;
    [v9 setResponseHandler:v15];
    unint64_t v10 = [v5 messageDispatcher];
    [v10 sendMessage:v9];
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      id v20 = "-[HMAccessory dumpMatterUsersWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __45__HMAccessory_dumpMatterUsersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v5 = a2;
    objc_msgSend(a3, "hmf_stringForKey:", @"users");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void (**)(uint64_t, void))(v6 + 16);
    id v8 = a2;
    v7(v6, 0);
  }
}

- (void)getAccessoryDiagnosticEventsWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F65488]);
    id v7 = [(HMAccessory *)self messageTargetUUID];
    id v8 = (void *)[v6 initWithTarget:v7];

    id v9 = [MEMORY[0x1E4F654B0] messageWithName:@"HMA.accessoryDiagnosticEvents" destination:v8 payload:0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __58__HMAccessory_getAccessoryDiagnosticEventsWithCompletion___block_invoke;
    v15[3] = &unk_1E5943468;
    id v16 = v4;
    [v9 setResponseHandler:v15];
    unint64_t v10 = [v5 messageDispatcher];
    [v10 sendMessage:v9];
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      id v20 = "-[HMAccessory getAccessoryDiagnosticEventsWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __58__HMAccessory_getAccessoryDiagnosticEventsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAccessoryDiagnosticCountersWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F65488]);
    id v7 = [(HMAccessory *)self messageTargetUUID];
    id v8 = (void *)[v6 initWithTarget:v7];

    id v9 = [MEMORY[0x1E4F654B0] messageWithName:@"HMA.accessoryDiagnosticCounters" destination:v8 payload:0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __60__HMAccessory_getAccessoryDiagnosticCountersWithCompletion___block_invoke;
    v15[3] = &unk_1E5943468;
    id v16 = v4;
    [v9 setResponseHandler:v15];
    unint64_t v10 = [v5 messageDispatcher];
    [v10 sendMessage:v9];
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      id v20 = "-[HMAccessory getAccessoryDiagnosticCountersWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __60__HMAccessory_getAccessoryDiagnosticCountersWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryLinkQualityWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      id v6 = objc_alloc(MEMORY[0x1E4F65488]);
      id v7 = [(HMAccessory *)self messageTargetUUID];
      id v8 = (void *)[v6 initWithTarget:v7];

      id v9 = [MEMORY[0x1E4F654B0] messageWithName:@"HMA.linkQualityRequest" destination:v8 payload:0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __46__HMAccessory_queryLinkQualityWithCompletion___block_invoke;
      v15[3] = &unk_1E5943468;
      id v16 = v4;
      [v9 setResponseHandler:v15];
      unint64_t v10 = [v5 messageDispatcher];
      [v10 sendMessage:v9];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:@"Feature is disabled" reason:@"Feature flag is disabled" suggestion:0];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
    }
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      id v20 = "-[HMAccessory queryLinkQualityWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __46__HMAccessory_queryLinkQualityWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v20 = a3;
  if (v20)
  {
    id v5 = a2;
    uint64_t v6 = objc_msgSend(v20, "hmf_BOOLForKey:", @"kAccessoryLinkQualitySupportedKey");
    objc_msgSend(v20, "hmf_stringForKey:", @"kAccessoryMacAddressKey");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = objc_msgSend(v20, "hmf_stringForKey:", @"kAccessoryNetworkNameKey");
    id v9 = [v20 allKeys];
    int v10 = [v9 containsObject:@"kAccessoryLinkLayerTypeKey"];

    if (v10)
    {
      char v11 = objc_msgSend(v20, "hmf_numberForKey:", @"kAccessoryLinkLayerTypeKey");
      uint64_t v12 = [v11 unsignedIntegerValue];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v15 = [v20 allKeys];
    int v16 = [v15 containsObject:@"kAccessoryLinkQualityKey"];

    if (v16)
    {
      uint64_t v17 = objc_msgSend(v20, "hmf_numberForKey:", @"kAccessoryLinkQualityKey");
      uint64_t v18 = [v17 unsignedIntegerValue];
    }
    else
    {
      uint64_t v18 = 0;
    }
    __int16 v19 = [[HMAccessoryLinkQualityResult alloc] initWithLinkQualitySupported:v6 linkLayerType:v12 macAddress:v7 networkName:v8 linkQuality:v18];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void (**)(uint64_t, void, id))(v13 + 16);
    id v7 = a2;
    v14(v13, 0, v7);
  }
}

- (void)queryLastSeenStatusWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      id v6 = objc_alloc(MEMORY[0x1E4F65488]);
      id v7 = [(HMAccessory *)self messageTargetUUID];
      id v8 = (void *)[v6 initWithTarget:v7];

      id v9 = [MEMORY[0x1E4F654B0] messageWithName:@"HMA.lastSeenStatusRequest" destination:v8 payload:0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __49__HMAccessory_queryLastSeenStatusWithCompletion___block_invoke;
      v15[3] = &unk_1E5943468;
      id v16 = v4;
      [v9 setResponseHandler:v15];
      int v10 = [v5 messageDispatcher];
      [v10 sendMessage:v9];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:@"Feature is disabled" reason:@"Feature flag is disabled" suggestion:0];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
    }
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      id v20 = "-[HMAccessory queryLastSeenStatusWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __49__HMAccessory_queryLastSeenStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v14 = v5;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_9;
  }
  id v6 = objc_msgSend(v5, "hmf_dateForKey:", @"kAccessoryLastSeenKey");
  id v7 = [v14 allKeys];
  int v8 = [v7 containsObject:@"kAccessoryLowBatteryStatusKey"];

  if (!v8)
  {
    uint64_t v10 = 0;
    if (v6) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 32);
    char v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    uint64_t v12 = *(void (**)(void))(v13 + 16);
    goto LABEL_8;
  }
  id v9 = objc_msgSend(v14, "hmf_numberForKey:", @"kAccessoryLowBatteryStatusKey");
  uint64_t v10 = [v9 unsignedIntegerValue];

  if (!v6) {
    goto LABEL_7;
  }
LABEL_5:
  char v11 = [[HMAccessoryLastSeenStatus alloc] initWithLastSeenDate:v6 batteryStatus:v10];
  uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_8:
  v12();

LABEL_9:
}

- (void)validatePairingAuthMethodWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F65488]);
    id v7 = [(HMAccessory *)self messageTargetUUID];
    int v8 = (void *)[v6 initWithTarget:v7];

    id v9 = [MEMORY[0x1E4F654B0] messageWithName:@"HMA.validateAuthMethod" destination:v8 payload:0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __55__HMAccessory_validatePairingAuthMethodWithCompletion___block_invoke;
    v15[3] = &unk_1E5943468;
    id v16 = v4;
    [v9 setResponseHandler:v15];
    uint64_t v10 = [v5 messageDispatcher];
    [v10 sendMessage:v9];
  }
  else
  {
    char v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      id v20 = "-[HMAccessory validatePairingAuthMethodWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __55__HMAccessory_validatePairingAuthMethodWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v5 = objc_msgSend(a3, "hmf_numberForKey:", @"HMA.authMethod");
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    if (v5)
    {
      (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, [v5 integerValue]);
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))(v6, v7, 5);
    }
  }
}

- (void)queryAdvertisementInformationWithCompletionHandler:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  if (v5)
  {
    uint64_t v21 = @"kAccessoryUUID";
    uint64_t v6 = [(HMAccessory *)self uuid];
    id v7 = [v6 UUIDString];
    id v22 = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];

    id v9 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v10 = objc_alloc(MEMORY[0x1E4F65488]);
    char v11 = [(HMAccessory *)self uuid];
    uint64_t v12 = (void *)[v10 initWithTarget:v11];
    uint64_t v13 = (void *)[v9 initWithName:@"kAccessoryAdvertisingParamsRequestKey" destination:v12 payload:v8];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__HMAccessory_queryAdvertisementInformationWithCompletionHandler___block_invoke;
    v19[3] = &unk_1E5943468;
    id v20 = v4;
    [v13 setResponseHandler:v19];
    id v14 = [v5 messageDispatcher];
    [v14 sendMessage:v13];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v24 = v18;
      __int16 v25 = 2080;
      __int16 v26 = "-[HMAccessory queryAdvertisementInformationWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __66__HMAccessory_queryAdvertisementInformationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = objc_msgSend(a3, "hmf_stringForKey:", @"kIdentifierKey");
  uint64_t v6 = (void *)v5;
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = [[HMAccessoryAdvertisementInfo alloc] initWithAccessoryIdentifier:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setControllable:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_controllable = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isCalibrating
{
  unint64_t v3 = [(HMAccessory *)self calibrationStatus];
  if (v3) {
    LOBYTE(v3) = [(HMAccessory *)self calibrationStatus] == 1;
  }
  return v3;
}

- (void)setFirmwareUpdateAvailable:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_firmwareUpdateAvailable = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setBundleID:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleID = self->_bundleID;
  self->_bundleID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)bundleID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_bundleID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setStoreID:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  storeID = self->_storeID;
  self->_storeID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)storeID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_storeID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)_valueForCharacteristic:(id)a3 ofService:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(a4, "characteristics", 0);
  id v7 = (void *)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v11 = [v10 characteristicType];
        int v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          uint64_t v13 = [v10 value];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v7 = [v10 value];
            goto LABEL_12;
          }
        }
      }
      id v7 = (void *)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (id)_accessoryInformationService
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [(HMAccessory *)self services];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = [v7 serviceType];
        int v9 = [v8 isEqualToString:@"0000003E-0000-1000-8000-0026BB765291"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)isUserNotifiedOfSoftwareUpdate
{
  return 1;
}

- (void)setSoftwareUpdateController:(id)a3
{
  uint64_t v4 = (HMSoftwareUpdateController *)a3;
  os_unfair_lock_lock_with_options();
  softwareUpdateController = self->_softwareUpdateController;
  self->_softwareUpdateController = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSoftwareVersion:(id)a3
{
  uint64_t v4 = (HMFSoftwareVersion *)a3;
  os_unfair_lock_lock_with_options();
  softwareVersion = self->_softwareVersion;
  self->_softwareVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMFSoftwareVersion)softwareVersion
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_softwareVersion;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDeviceIRKData:(id)a3
{
  uint64_t v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  deviceIRKData = self->_deviceIRKData;
  self->_deviceIRKData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDevice:(id)a3
{
  uint64_t v4 = (HMDevice *)a3;
  os_unfair_lock_lock_with_options();
  device = self->_device;
  self->_device = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)pairingIdentityWithPrivateKey:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    HMFBooleanToString();
    char v11 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    id v44 = v10;
    __int16 v45 = 2112;
    uint64_t v46 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching pairing identity with private key: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMAccessory *)v8 context];
  if (!v6)
  {
    uint64_t v33 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory pairingIdentityWithPrivateKey:completionHandler:]", @"completion"];
    uint64_t v34 = (void *)MEMORY[0x19F3A64A0]();
    id v35 = v8;
    id v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v44 = v37;
      __int16 v45 = 2112;
      uint64_t v46 = (const char *)v33;
      _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v38 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v33 userInfo:0];
    objc_exception_throw(v38);
  }
  long long v13 = (void *)v12;
  if (v12)
  {
    if (CFPreferencesGetAppBooleanValue(@"kHMDDemoModeStatusKey", @"com.apple.homed", 0))
    {
      long long v14 = (void *)MEMORY[0x19F3A64A0]();
      long long v15 = v8;
      long long v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v44 = v17;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@pairingIdentityWithPrivateKey completing with nil because demo mode is on.", buf, 0xCu);
      }
      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
    else
    {
      v41[0] = @"kAccessoryUUID";
      int v23 = [(HMAccessory *)v8 uuid];
      id v24 = [v23 UUIDString];
      v41[1] = @"includePrivateKey";
      v42[0] = v24;
      __int16 v25 = [NSNumber numberWithBool:v4];
      v42[1] = v25;
      __int16 v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];

      id v27 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v28 = objc_alloc(MEMORY[0x1E4F65488]);
      uint64_t v29 = [(HMAccessory *)v8 uuid];
      uint64_t v30 = (void *)[v28 initWithTarget:v29];
      uint64_t v31 = (void *)[v27 initWithName:@"HMA.pairingIdentity" destination:v30 payload:v26];

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke;
      v39[3] = &unk_1E5944EF0;
      void v39[4] = v8;
      id v40 = v6;
      [v31 setResponseHandler:v39];
      __int16 v32 = [v13 messageDispatcher];
      [v32 sendMessage:v31];
    }
  }
  else
  {
    long long v18 = (void *)MEMORY[0x19F3A64A0]();
    long long v19 = v8;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v44 = v21;
      __int16 v45 = 2080;
      uint64_t v46 = "-[HMAccessory pairingIdentityWithPrivateKey:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v22);
  }
}

void __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    long long v15 = objc_msgSend(v6, "hmf_dataForKey:", @"HM.pairingIdentity");
    if (v15)
    {
      id v35 = 0;
      long long v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v15 error:&v35];
      id v17 = v35;
      id v18 = v17;
      if (!v16)
      {
        int v23 = (void *)MEMORY[0x19F3A64A0]();
        id v24 = *(id *)(a1 + 32);
        __int16 v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          __int16 v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v40 = v26;
          __int16 v41 = 2112;
          id v42 = v18;
          _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive pairing identity for accessory from encoded pairing identity: %@", buf, 0x16u);
        }
        id v27 = [*(id *)(a1 + 32) context];
        id v28 = [v27 delegateCaller];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_1003;
        v33[3] = &unk_1E59454C0;
        id v34 = *(id *)(a1 + 40);
        [v28 invokeBlock:v33];

        id v22 = v34;
        goto LABEL_13;
      }
    }
    else
    {
      long long v16 = 0;
    }
    long long v19 = [*(id *)(a1 + 32) context];
    id v20 = [v19 delegateCaller];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_2;
    v29[3] = &unk_1E5944360;
    uint64_t v21 = *(void **)(a1 + 40);
    void v29[4] = *(void *)(a1 + 32);
    uint64_t v30 = v16;
    id v31 = 0;
    id v32 = v21;
    id v18 = v16;
    [v20 invokeBlock:v29];

    id v22 = v30;
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    char v11 = HMFGetLogIdentifier();
    uint64_t v12 = [*(id *)(a1 + 32) uuid];
    *(_DWORD *)buf = 138543874;
    id v40 = v11;
    __int16 v41 = 2112;
    id v42 = v12;
    __int16 v43 = 2112;
    id v44 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve pairing identity for accessory : %@ / %@", buf, 0x20u);
  }
  long long v13 = [*(id *)(a1 + 32) context];
  long long v14 = [v13 delegateCaller];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_1001;
  v36[3] = &unk_1E59454E8;
  id v38 = *(id *)(a1 + 40);
  id v37 = v5;
  [v14 invokeBlock:v36];

  long long v15 = v38;
LABEL_14:
}

uint64_t __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_1001(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_1003(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __63__HMAccessory_pairingIdentityWithPrivateKey_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  BOOL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) uuid];
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved pairing identity for accessory : %@ / %@", (uint8_t *)&v9, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_handlePairingIdentityUpdate:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  if (v5)
  {
    id v6 = [(HMAccessory *)self _privateDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [(HMAccessory *)self context];
      uint64_t v8 = [v7 delegateCaller];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __44__HMAccessory__handlePairingIdentityUpdate___block_invoke;
      v27[3] = &unk_1E5945628;
      v27[4] = self;
      id v28 = v6;
      [v8 invokeBlock:v27];
    }
    else
    {
      id v18 = (void *)MEMORY[0x19F3A64A0]();
      long long v19 = self;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v21;
        __int16 v31 = 2112;
        id v32 = (const char *)v6;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Did not call delegate for pairing identity, unregistered delegate: %@", buf, 0x16u);
      }
    }
    id v22 = (void *)MEMORY[0x19F3A64A0](v9, v10, v11, v12, v13);
    int v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v25;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@Posting notification for HMAccessoryPairingIdentityUpdatedNotification", buf, 0xCu);
    }
    __int16 v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 postNotificationName:@"HMAccessoryPairingIdentityUpdatedNotification" object:v23];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v17;
      __int16 v31 = 2080;
      id v32 = "-[HMAccessory _handlePairingIdentityUpdate:]";
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __44__HMAccessory__handlePairingIdentityUpdate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A64A0]();
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
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate for pairing identity update: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) accessoryDidUpdatePairingIdentity:*(void *)(a1 + 32)];
}

- (HMFPairingIdentity)pairingIdentity
{
  return 0;
}

- (void)installManagedConfigurationProfileWithData:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = [(HMAccessory *)self context];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F65488]);
      __int16 v10 = [(HMAccessory *)self messageTargetUUID];
      uint64_t v11 = (void *)[v9 initWithTarget:v10];

      uint64_t v29 = @"HMAccessory.mc.data";
      id v30 = v6;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      uint64_t v13 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryInstallManagedConfigurationProfileMessage" destination:v11 payload:v12];
      objc_initWeak((id *)location, self);
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      __int16 v25 = __76__HMAccessory_installManagedConfigurationProfileWithData_completionHandler___block_invoke;
      __int16 v26 = &unk_1E5944188;
      objc_copyWeak(&v28, (id *)location);
      id v27 = v7;
      [v13 setResponseHandler:&v23];
      uint64_t v14 = objc_msgSend(v8, "messageDispatcher", v23, v24, v25, v26);
      [v14 sendMessage:v13 completionHandler:0];

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)location);
    }
    else
    {
      long long v19 = (void *)MEMORY[0x19F3A64A0]();
      id v20 = self;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v22;
        __int16 v32 = 2080;
        uint64_t v33 = "-[HMAccessory installManagedConfigurationProfileWithData:completionHandler:]";
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
      }
      int v8 = 0;
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    long long v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543362;
      *(void *)&location[4] = v18;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil profileData", location, 0xCu);
    }
    int v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v8);
  }
}

void __76__HMAccessory_installManagedConfigurationProfileWithData_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      int v8 = (void *)MEMORY[0x19F3A64A0]();
      id v9 = WeakRetained;
      __int16 v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v15 = 138543618;
        long long v16 = v11;
        __int16 v17 = 2112;
        id v18 = v5;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Install managed configuration profiles responded with error: %@", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = objc_msgSend(v6, "hmf_stringForKey:", @"HMAccessory.mc.identifier");
      int v8 = (void *)MEMORY[0x19F3A64A0]();
      id v13 = WeakRetained;
      __int16 v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v15 = 138543618;
        long long v16 = v14;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Install managed configuration profiles succeeded: %@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeManagedConfigurationProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(HMAccessory *)self context];
    if (!v7)
    {
      uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory removeManagedConfigurationProfileWithIdentifier:completionHandler:]", @"completionHandler"];
      __int16 v25 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v26 = self;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v28;
        __int16 v36 = 2112;
        id v37 = (const char *)v24;
        _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
      }
      id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
      objc_exception_throw(v29);
    }
    id v9 = (void *)v8;
    if (v8)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F65488]);
      uint64_t v11 = [(HMAccessory *)self messageTargetUUID];
      uint64_t v12 = (void *)[v10 initWithTarget:v11];

      uint64_t v33 = @"HMAccessory.mc.identifier";
      id v34 = v6;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint64_t v14 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryRemoveManagedConfigurationProfileMessage" destination:v12 payload:v13];
      objc_initWeak((id *)location, self);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __81__HMAccessory_removeManagedConfigurationProfileWithIdentifier_completionHandler___block_invoke;
      v30[3] = &unk_1E5944188;
      objc_copyWeak(&v32, (id *)location);
      id v31 = v7;
      [v14 setResponseHandler:v30];
      int v15 = [v9 messageDispatcher];
      [v15 sendMessage:v14 completionHandler:0];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)location);
    }
    else
    {
      id v20 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = v23;
        __int16 v36 = 2080;
        id v37 = "-[HMAccessory removeManagedConfigurationProfileWithIdentifier:completionHandler:]";
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);
      }
      uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      (*((void (**)(id, void *))v7 + 2))(v7, v12);
    }
  }
  else
  {
    long long v16 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543362;
      *(void *)&location[4] = v19;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil identifier", location, 0xCu);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    (*((void (**)(id, void *))v7 + 2))(v7, v9);
  }
}

void __81__HMAccessory_removeManagedConfigurationProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = WeakRetained;
    uint64_t v12 = HMFGetOSLogHandle();
    id v13 = v12;
    if (v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v19 = 138543618;
        id v20 = v14;
        __int16 v21 = 2112;
        id v22 = v5;
        int v15 = "%{public}@Remove managed configuration profiles responded with error: %@";
        long long v16 = v13;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        uint32_t v18 = 22;
LABEL_7:
        _os_log_impl(&dword_19D1A8000, v16, v17, v15, (uint8_t *)&v19, v18);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v14;
      int v15 = "%{public}@Remove managed configuration profiles responded";
      long long v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
      uint32_t v18 = 12;
      goto LABEL_7;
    }
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5, v7, v8);
}

- (void)fetchManagedConfigurationProfilesWithCompletionHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMAccessory *)self context];
  if (!v4)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory fetchManagedConfigurationProfilesWithCompletionHandler:]", @"completionHandler"];
    os_log_type_t v17 = (void *)MEMORY[0x19F3A64A0]();
    uint32_t v18 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v20;
      __int16 v26 = 2112;
      id v27 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v8 = [(HMAccessory *)self messageTargetUUID];
    id v9 = (void *)[v7 initWithTarget:v8];

    id v10 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryFetchManagedConfigurationProfilesMessage" destination:v9 payload:0];
    objc_initWeak((id *)location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__HMAccessory_fetchManagedConfigurationProfilesWithCompletionHandler___block_invoke;
    void v22[3] = &unk_1E5944188;
    objc_copyWeak(&v24, (id *)location);
    id v23 = v4;
    [v10 setResponseHandler:v22];
    id v11 = [v6 messageDispatcher];
    [v11 sendMessage:v10 completionHandler:0];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v15;
      __int16 v26 = 2080;
      id v27 = "-[HMAccessory fetchManagedConfigurationProfilesWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
  }
}

void __70__HMAccessory_fetchManagedConfigurationProfilesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (v5)
  {
    if (WeakRetained)
    {
      id v9 = (void *)MEMORY[0x19F3A64A0]();
      id v10 = v8;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v12;
        __int16 v39 = 2112;
        id v40 = v5;
        _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetch managed configuration profiles responded with error: %@", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v13 = objc_msgSend(v6, "hmf_dataForKey:", @"HMAccessory.mc.profiles");
    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
      v43[0] = objc_opt_class();
      v43[1] = objc_opt_class();
      int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
      uint64_t v16 = [v14 setWithArray:v15];

      id v36 = 0;
      os_log_type_t v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v16 fromData:v13 error:&v36];
      id v18 = v36;
      if (v17)
      {
        if (v8)
        {
          int v19 = (void *)MEMORY[0x19F3A64A0]();
          id v20 = v8;
          id v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v33 = v18;
            id v22 = v34 = v19;
            id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
            *(_DWORD *)buf = 138543874;
            uint64_t v38 = v22;
            __int16 v39 = 2112;
            id v40 = v23;
            __int16 v41 = 2112;
            id v42 = v17;
            _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Fetch managed configuration profiles responded: %@, %@", buf, 0x20u);

            int v19 = v34;
            id v18 = v33;
          }
        }
        id v5 = 0;
      }
      else
      {
        if (v8)
        {
          id v29 = (void *)MEMORY[0x19F3A64A0]();
          id v30 = v8;
          id v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v32 = v35 = v29;
            *(_DWORD *)buf = 138543618;
            uint64_t v38 = v32;
            __int16 v39 = 2112;
            id v40 = v18;
            _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode profiles: %@", buf, 0x16u);

            id v29 = v35;
          }
        }
        id v5 = v18;
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      if (v8)
      {
        id v24 = (void *)MEMORY[0x19F3A64A0]();
        id v25 = v8;
        __int16 v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v38 = v27;
          __int16 v39 = 2112;
          id v40 = 0;
          _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Encoded profiles are nil: %@", buf, 0x16u);
        }
      }
      uint64_t v28 = *(void *)(a1 + 32);
      os_log_type_t v17 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      (*(void (**)(uint64_t, void, void *))(v28 + 16))(v28, 0, v17);
      id v5 = 0;
    }
  }
}

- (void)updatePreferredMediaUserSelectionType:(unint64_t)a3 user:(id)a4 completionHandler:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v38 = [(HMAccessory *)self context];
  if (!v9)
  {
    uint64_t v32 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory updatePreferredMediaUserSelectionType:user:completionHandler:]", @"completionHandler"];
    id v33 = (void *)MEMORY[0x19F3A64A0]();
    id v34 = self;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v48 = v36;
      __int16 v49 = 2112;
      __int16 v50 = (const char *)v32;
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v37 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v32 userInfo:0];
    objc_exception_throw(v37);
  }
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v38)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = [v8 uuid];
      uint64_t v16 = [v15 UUIDString];
      os_log_type_t v17 = [NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = v14;
      __int16 v49 = 2112;
      __int16 v50 = v16;
      __int16 v51 = 2112;
      uint64_t v52 = v17;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Updating preferredMediaUser: %@, type: %@", buf, 0x20u);
    }
    uint64_t v45 = @"HM.ac.usersel";
    id v18 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v46 = v18;
    int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v20 = (void *)[v19 mutableCopy];

    if (v8)
    {
      __int16 v43 = @"kUserUUIDKey";
      id v21 = [v8 uuid];
      id v22 = [v21 UUIDString];
      id v44 = v22;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      [v20 addEntriesFromDictionary:v23];
    }
    id v24 = objc_alloc(MEMORY[0x1E4F65488]);
    id v25 = [(HMAccessory *)v11 messageTargetUUID];
    __int16 v26 = (void *)[v24 initWithTarget:v25];

    id v27 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v28 = (void *)[v20 copy];
    id v29 = [v27 messageWithName:@"HM.ac.updatePreferredMediaUser" destination:v26 payload:v28];

    objc_initWeak((id *)buf, v11);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __76__HMAccessory_updatePreferredMediaUserSelectionType_user_completionHandler___block_invoke;
    v39[3] = &unk_1E59428F8;
    objc_copyWeak(v42, (id *)buf);
    id v40 = v8;
    v42[1] = (id)a3;
    id v41 = v9;
    [v29 setResponseHandler:v39];
    id v30 = [v38 messageDispatcher];
    [v30 sendMessage:v29];

    objc_destroyWeak(v42);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v48 = v31;
      __int16 v49 = 2080;
      __int16 v50 = "-[HMAccessory updatePreferredMediaUserSelectionType:user:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v9 + 2))(v9, v20);
  }
}

void __76__HMAccessory_updatePreferredMediaUserSelectionType_user_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = *(void **)(a1 + 32);
    if (v8)
    {
      uint64_t v9 = [v8 uuid];
      id v10 = (void *)v9;
      if (!v5)
      {
        if (v9)
        {
          [WeakRetained setPreferredMediaUserUUID:v9];
          uint64_t v11 = 1;
          goto LABEL_11;
        }
LABEL_10:
        [WeakRetained setPreferredMediaUserUUID:0];
        uint64_t v11 = 0;
        id v10 = 0;
LABEL_11:
        uint64_t v12 = (void *)MEMORY[0x19F3A64A0]([WeakRetained setPreferredUserSelectionType:v11]);
        id v17 = WeakRetained;
        uint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = HMFGetLogIdentifier();
          id v18 = [v17 preferredMediaUserUUID];
          int v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "preferredUserSelectionType"));
          *(_DWORD *)buf = 138543874;
          id v22 = v20;
          __int16 v23 = 2112;
          id v24 = v18;
          __int16 v25 = 2112;
          __int16 v26 = v19;
          _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updated preferredMediaUser on response to %@, type: %@", buf, 0x20u);
        }
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      if (!v5) {
        goto LABEL_10;
      }
      id v10 = 0;
    }
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = WeakRetained;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      uint64_t v16 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Updating preferredMediaUser on response to %@, type: %@ with error: %@", buf, 0x2Au);
    }
    goto LABEL_13;
  }
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updatePreferredMediaUser:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v6 = a4;
  if (!v12)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v10;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Must have valid user", buf, 0xCu);
    }
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide valid parameters" userInfo:0];
    objc_exception_throw(v11);
  }
  [(HMAccessory *)self updatePreferredMediaUserSelectionType:1 user:v12 completionHandler:v6];
}

- (void)_notifyDelegateOfUpdatedSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  id v6 = [v5 delegateCaller];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HMAccessory__notifyDelegateOfUpdatedSettings___block_invoke;
  v8[3] = &unk_1E5945628;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 invokeBlock:v8];
}

void __48__HMAccessory__notifyDelegateOfUpdatedSettings___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegate];
  if ([v2 conformsToProtocol:&unk_1EEF70C88]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (objc_opt_respondsToSelector())
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v28 = 138543618;
      uint64_t v29 = v8;
      __int16 v30 = 2112;
      uint64_t v31 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated settings: %@", (uint8_t *)&v28, 0x16u);
    }
    [v4 accessory:*(void *)(a1 + 32) didUpdateSettings:*(void *)(a1 + 40)];
  }

  id v10 = [*(id *)(a1 + 32) mediaProfile];
  id v11 = [v10 delegate];
  if ([v11 conformsToProtocol:&unk_1EEF6FEF0]) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 40);
      int v28 = 138543618;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@(MP) Notifying client of updated settings: %@", (uint8_t *)&v28, 0x16u);
    }
    [v13 mediaProfile:v10 didUpdateSettings:*(void *)(a1 + 40)];
  }

  int v19 = [*(id *)(a1 + 32) mediaProfile];
  id v20 = [v19 delegate];
  if ([v20 conformsToProtocol:&unk_1EEF690C8]) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  if (objc_opt_respondsToSelector())
  {
    __int16 v23 = (void *)MEMORY[0x19F3A64A0]();
    id v24 = *(id *)(a1 + 32);
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      __int16 v26 = HMFGetLogIdentifier();
      uint64_t v27 = *(void *)(a1 + 40);
      int v28 = 138543618;
      uint64_t v29 = v26;
      __int16 v30 = 2112;
      uint64_t v31 = v27;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_INFO, "%{public}@(MP) Notifying media object client of updated settings: %@", (uint8_t *)&v28, 0x16u);
    }
    [v22 mediaObject:v19 didUpdateSettings:*(void *)(a1 + 40)];
  }
}

- (void)_handleRootSettingsUpdated:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMAccessory *)self supportsMessagedHomePodSettings])
  {
    [v4 respondWithPayload:0];
  }
  else
  {
    id v5 = [v4 dataForKey:@"settings"];
    if (v5)
    {
      id v26 = 0;
      id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v26];
      id v7 = (HMAccessorySettingGroup *)v26;
      if (v6)
      {
        id v8 = [[HMAccessorySettingGroup alloc] initWithInternal:v6];
        uint64_t v9 = [(HMAccessory *)self settings];
        id v10 = (void *)MEMORY[0x19F3A64A0]();
        id v11 = self;
        id v12 = HMFGetOSLogHandle();
        id v13 = v12;
        if (v9)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            uint64_t v14 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            int v28 = v14;
            __int16 v29 = 2112;
            __int16 v30 = v8;
            _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Merging with new settings: %@", buf, 0x16u);
          }
          id v15 = [(HMAccessory *)v11 settings];
          [v15 mergeFromNewObject:v9];
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v25 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            int v28 = v25;
            __int16 v29 = 2112;
            __int16 v30 = v8;
            _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Adding new settings: %@", buf, 0x16u);
          }
          uint64_t v9 = [[HMAccessorySettings alloc] initWithSettingsContainer:v11 settingsControl:v11 rootGroup:v8];
          [(HMAccessory *)v11 setSettings:v9];
          [(HMAccessory *)v11 _notifyDelegateOfUpdatedSettings:v9];
        }
        [v4 respondWithPayload:0];
      }
      else
      {
        id v21 = (void *)MEMORY[0x19F3A64A0]();
        id v22 = self;
        __int16 v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          int v28 = v24;
          __int16 v29 = 2112;
          __int16 v30 = v7;
          _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory setting group from root group data: %@", buf, 0x16u);
        }
        id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        [v4 respondWithError:v8];
      }
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
      id v17 = self;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = HMFGetLogIdentifier();
        id v20 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        int v28 = v19;
        __int16 v29 = 2112;
        __int16 v30 = v20;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized root settings from message payload: %@", buf, 0x16u);
      }
      id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v4 respondWithError:v7];
    }
  }
}

- (NSUUID)preferredMediaUserUUID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_preferredMediaUserUUID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPreferredMediaUserUUID:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v6);
  id v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  preferredMediaUserUUID = self->_preferredMediaUserUUID;
  self->_preferredMediaUserUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setProductColor:(int64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_productColor = a3;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)productColor
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t productColor = self->_productColor;
  os_unfair_lock_unlock(p_lock);
  return productColor;
}

- (void)setPreferredUserSelectionType:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t preferredUserSelectionType = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)preferredUserSelectionType
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t preferredUserSelectionType = self->_preferredUserSelectionType;
  os_unfair_lock_unlock(p_lock);
  return preferredUserSelectionType;
}

- (id)preferredMediaUser
{
  id v3 = [(HMAccessory *)self home];
  id v4 = [v3 currentUser];
  id v5 = [(HMAccessory *)self preferredMediaUserUUID];
  id v6 = [v4 uuid];
  int v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);

  if (v7)
  {
    id v8 = v4;
  }
  else
  {
    uint64_t v9 = [v3 users];
    id v10 = [(HMAccessory *)self preferredMediaUserUUID];
    objc_msgSend(v9, "hmf_firstObjectWithUUID:", v10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)setSettings:(id)a3
{
  id v8 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_settings, a3);
    [v8 setSettingsControl:self];
    [v8 setSettingsContainerInternal:self];
    id v6 = [(HMAccessory *)self context];

    if (v6)
    {
      int v7 = [(HMAccessory *)self context];
      [v8 _configureWithContext:v7];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setPendingConfigurationIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  pendingConfigurationIdentifier = self->_pendingConfigurationIdentifier;
  self->_pendingConfigurationIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)recomputeAssistantIdentifier
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMAccessory *)self _recomputeAssistantIdentifier];
  os_unfair_lock_unlock(p_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(HMAccessory *)self services];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) recomputeAssistantIdentifier];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(HMAccessory *)self accessoryProfiles];
  uint64_t v9 = [v8 array];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) recomputeAssistantIdentifier];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (NSString)assistantIdentifier
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  assistantIdentifier = self->_assistantIdentifier;
  if (!assistantIdentifier)
  {
    [(HMAccessory *)self _recomputeAssistantIdentifier];
    assistantIdentifier = self->_assistantIdentifier;
  }
  uint64_t v5 = assistantIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)_recomputeAssistantIdentifier
{
  hm_assistantIdentifierWithSalts(@"AC", (uint64_t)self->_uuid, 0);
  id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  assistantIdentifier = self->_assistantIdentifier;
  self->_assistantIdentifier = v3;

  MEMORY[0x1F41817F8](v3, assistantIdentifier);
}

- (unint64_t)homePodVariant
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t homePodVariant = self->_homePodVariant;
  os_unfair_lock_unlock(p_lock);
  return homePodVariant;
}

- (void)setHomePodVariant:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t homePodVariant = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)supportedStereoPairVersions
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t supportedStereoPairVersions = self->_supportedStereoPairVersions;
  os_unfair_lock_unlock(p_lock);
  return supportedStereoPairVersions;
}

- (void)setSupportedStereoPairVersions:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t supportedStereoPairVersions = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setWifiNetworkInfo:(id)a3
{
  id v4 = (HMFWiFiNetworkInfo *)a3;
  os_unfair_lock_lock_with_options();
  wifiNetworkInfo = self->_wifiNetworkInfo;
  self->_wifiNetworkInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)targetControllers
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v24 = [(HMAccessory *)self home];
  id v3 = [v24 accessories];
  __int16 v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    uint64_t v26 = *(void *)v34;
    id v27 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v28 = v6;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        uint64_t v10 = [(HMAccessory *)self uuid];
        uint64_t v11 = [v9 uuid];
        char v12 = [v10 isEqual:v11];

        if ((v12 & 1) == 0
          && ([v9 supportsTargetControl] & 1) == 0
          && [v9 supportsTargetController])
        {
          long long v13 = [v9 controlTargets];
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v30;
            while (2)
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v30 != v17) {
                  objc_enumerationMutation(v14);
                }
                long long v19 = [*(id *)(*((void *)&v29 + 1) + 8 * i) uuid];
                long long v20 = [(HMAccessory *)self uuid];
                int v21 = [v19 isEqual:v20];

                if (v21)
                {
                  [v25 addObject:v9];
                  goto LABEL_19;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
LABEL_19:

          uint64_t v7 = v26;
          id v4 = v27;
          uint64_t v6 = v28;
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v6);
  }

  id v22 = (void *)[v25 copy];

  return v22;
}

- (id)controlTargets
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessory *)self home];
  uint64_t v23 = self;
  id v4 = [(HMAccessory *)self controlTargetUUIDs];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v26;
    *(void *)&long long v7 = 138543618;
    long long v21 = v7;
    id v22 = v5;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        char v12 = objc_msgSend(v3, "accessoryWithUUID:", v11, v21);
        if (v12)
        {
          [v5 addObject:v12];
        }
        else
        {
          uint64_t v13 = v9;
          id v14 = (void *)MEMORY[0x19F3A64A0]();
          uint64_t v15 = v23;
          uint64_t v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v17 = HMFGetLogIdentifier();
            long long v18 = [v11 UUIDString];
            *(_DWORD *)buf = v21;
            long long v30 = v17;
            __int16 v31 = 2112;
            long long v32 = v18;
            _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Unable to look up target accessory UUID for %@", buf, 0x16u);

            uint64_t v5 = v22;
          }

          uint64_t v9 = v13;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v8);
  }

  long long v19 = (void *)[v5 copy];

  return v19;
}

- (void)setControlTargetUUIDs:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSArray *)[v6 copy];
  controlTargetUUIDs = self->_controlTargetUUIDs;
  self->_controlTargetUUIDs = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)controlTargetUUIDs
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_controlTargetUUIDs;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)bulletinBoardNotificationForEndpoint:(id)a3
{
  id v4 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSDictionary *)self->_bulletinBoardNotificationByEndpoint objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)setBulletinBoardNotificationByEndpoint:(id)a3
{
  id v4 = (NSDictionary *)a3;
  os_unfair_lock_lock_with_options();
  bulletinBoardNotificationByEndpoint = self->_bulletinBoardNotificationByEndpoint;
  self->_bulletinBoardNotificationByEndpoint = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSupportsJustSiri:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsJustSiruint64_t i = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsJustSiri
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsJustSiri;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsRMVonAppleTV:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsRMVonAppleTV = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsRMVonAppleTV
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsRMVonAppleTV;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsSoftwareUpdateV2:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsSoftwareUpdateV2 = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsMessagedHomePodSettings:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsMessagedHomePodSettings = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsDropIn:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsDropIn = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsDropIn
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsDropIn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsAudioAnalysis:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsAudioAnalysis = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsManagedConfigurationProfile:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsManagedConfigurationProfile = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsManagedConfigurationProfile
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsManagedConfigurationProfile;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsPreferredMediaUser:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsPreferredMediaUser = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsPreferredMediaUser
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsPreferredMediaUser;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsThirdPartyMusic:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsThirdPartyMusic = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsThirdPartyMusic
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsThirdPartyMusic;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsCoordinationDoorbellChime:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsCoordinationDoorbellChime = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsCoordinationDoorbellChime
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsCoordinationDoorbellChime;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setYearDaySchedulesPerUserCapacity:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  yearDaySchedulesPerUserCapacity = self->_yearDaySchedulesPerUserCapacity;
  self->_yearDaySchedulesPerUserCapacity = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setWeekDaySchedulesPerUserCapacity:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  weekDaySchedulesPerUserCapacity = self->_weekDaySchedulesPerUserCapacity;
  self->_weekDaySchedulesPerUserCapacity = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setReaderIDACWG:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  readerIDACWG = self->_readerIDACWG;
  self->_readerIDACWG = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)readerIDACWG
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_readerIDACWG;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setReaderGroupSubIdentifierACWG:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  readerGroupSubIdentifierACWG = self->_readerGroupSubIdentifierACWG;
  self->_readerGroupSubIdentifierACWG = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)readerGroupSubIdentifierACWG
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_readerGroupSubIdentifierACWG;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSupportsUWBUnlock:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsUWBUnlocuint64_t k = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsWalletKey:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsWalletKey = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsAccessCodes:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsAccessCodes = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsUserMediaSettings:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsUserMediaSettings = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsUserMediaSettings
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsUserMediaSettings;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsDoorbellChime:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsDoorbellChime = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsDoorbellChime
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsDoorbellChime;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsMediaActions:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsMediaActions = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsMediaActions
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsMediaActions;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsAnnounce:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsAnnounce = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsAnnounce
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsAnnounce;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsMusicAlarm:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsMusicAlarm = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsMusicAlarm
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsMusicAlarm;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsCompanionInitiatedObliterate:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsCompanionInitiatedObliterate = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsCompanionInitiatedObliterate;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsCompanionInitiatedRestart:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsCompanionInitiatedRestart = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsCompanionInitiatedRestart
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsCompanionInitiatedRestart;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsAudioReturnChannel:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsAudioReturnChannel = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsAudioReturnChannel
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsAudioReturnChannel;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsMultiUser:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsMultiUser = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsMultiUser
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsMultiUser;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setTargetControllerHardwareSupport:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_targetControllerHardwareSupport = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)targetControllerHardwareSupport
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_targetControllerHardwareSupport;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsTargetController:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_BOOL supportsTargetController = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsTargetController
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsTargetController;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsTargetControl:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsTargetControl = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsTargetControl
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsTargetControl;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMFWiFiNetworkInfo)wifiNetworkInfo
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_wifiNetworkInfo;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_handleRequiresThreadRouterUpdateMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 BOOLForKey:@"HMA.requiresThreadRouterUpdate"];
  if (v5 != [(HMAccessory *)self requiresThreadRouter])
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    long long v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      [(HMAccessory *)v7 supportsDiagnosticsTransfer];
      uint64_t v10 = HMFBooleanToString();
      uint64_t v11 = HMFBooleanToString();
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating requiresThreadRouter from %@ to %@", (uint8_t *)&v12, 0x20u);
    }
    [(HMAccessory *)v7 setRequiresThreadRouter:v5];
  }
}

- (void)setRequiresThreadRouter:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_requiresThreadRouter = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)requiresThreadRouter
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_requiresThreadRouter;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setProductID:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  productID = self->_productID;
  self->_productID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)productID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_productID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setVendorID:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  vendorID = self->_vendorID;
  self->_vendorID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)vendorID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_vendorID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCommissioningID:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  commissioningID = self->_commissioningID;
  self->_commissioningID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)commissioningID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_commissioningID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setNodeID:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSNumber *)[v6 copy];
  nodeID = self->_nodeID;
  self->_nodeID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setRootPublicKey:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSData *)[v6 copy];
  rootPublicKey = self->_rootPublicKey;
  self->_rootPublicKey = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setKnownToSystemCommissioner:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_knownToSystemCommissioner = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsNativeMatter:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsNativeMatter = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsNativeMatter
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsNativeMatter;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSupportsCHIP:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsCHIP = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setSupportsMediaAccessControl:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsMediaAccessControl = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsMediaAccessControl
{
  id v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsMediaAccessControl;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSerialNumber:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  serialNumber = self->_serialNumber;
  self->_serialNumber = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setFirmwareVersion:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  firmwareVersion = self->_firmwareVersion;
  self->_firmwareVersion = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setManufacturer:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  manufacturer = self->_manufacturer;
  self->_manufacturer = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setModel:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  model = self->_model;
  self->_model = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setAccountIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v6);
  id v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  accountIdentifier = self->_accountIdentifier;
  self->_accountIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)accountIdentifier
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_accountIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setRoom:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_room, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setCategory:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:v6];
  category = self->_category;
  self->_category = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)bridgedAccessories
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessory *)self home];
  long long v21 = [(HMAccessory *)self uniqueIdentifiersForBridgedAccessories];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v18 = v3;
  obuint64_t j = [v3 accessories];
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = v21;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              __int16 v14 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              uint64_t v15 = [v8 uniqueIdentifier];
              LODWORD(v14) = [v14 isEqual:v15];

              if (v14) {
                [v4 addObject:v8];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  __int16 v16 = (void *)[v4 copy];

  return (NSArray *)v16;
}

- (void)setUniqueIdentifiersForBridgedAccessories:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSArray *)[v6 copy];
  uniqueIdentifiersForBridgedAccessories = self->_uniqueIdentifiersForBridgedAccessories;
  self->_uniqueIdentifiersForBridgedAccessories = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setBridgedAccessory:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_bridgedAccessory = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setReachable:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_reachable = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setCurrentAccessory:(BOOL)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_currentAccessory = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setDeviceIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setConfiguredName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateShouldProcessTransactionRemovalWithValue:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v7 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    long long v30 = v10;
    __int16 v31 = 2112;
    uint64_t v32 = v11;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending update should process tranaction removal value: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMAccessory *)v8 context];
  uint64_t v13 = [v12 messageDispatcher];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v15 = [(HMAccessory *)v8 messageTargetUUID];
    __int16 v16 = (void *)[v14 initWithTarget:v15];

    id v17 = objc_alloc(MEMORY[0x1E4F654B0]);
    long long v27 = @"HMAccessoryUpdateShouldProcessTransactionRemovalValuePayloadKey";
    uint64_t v18 = [NSNumber numberWithBool:v4];
    long long v28 = v18;
    long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v20 = (void *)[v17 initWithName:@"HMAccessoryUpdateShouldProcessTransactionRemovalValueRequestMessage" destination:v16 payload:v19];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __73__HMAccessory_updateShouldProcessTransactionRemovalWithValue_completion___block_invoke;
    v25[3] = &unk_1E5943468;
    id v26 = v6;
    [v20 setResponseHandler:v25];
    [v13 sendMessage:v20];
  }
  else
  {
    long long v21 = (void *)MEMORY[0x19F3A64A0]();
    long long v22 = v8;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v30 = v24;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to update should process removal value due to no message dispatcher", buf, 0xCu);
    }
    __int16 v16 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    (*((void (**)(id, void *))v6 + 2))(v6, v16);
  }
}

uint64_t __73__HMAccessory_updateShouldProcessTransactionRemovalWithValue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_unconfigure
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  BOOL v4 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (context)
  {
    if (v7)
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v8;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Unconfiguring accessory", buf, 0xCu);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = [(HMAccessory *)v5 services];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v13++) _unconfigure];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }

    id v14 = [(HMAccessory *)v5 currentServices];
    [v14 removeAllObjects];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v15 = [(HMAccessory *)v5 profiles];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [*(id *)(*((void *)&v27 + 1) + 8 * v19) accessoryProfile];
          [v20 _unconfigure];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v17);
    }

    long long v21 = [(HMAccessory *)v5 accessoryProfiles];
    [v21 removeAllObjects];

    long long v22 = [(HMAccessory *)v5 settingsAdapter];
    [v22 unconfigure];

    [(HMAccessory *)v5 unconfigureInfoDataProviderWithOptions:5];
    long long v23 = [(HMAccessory *)v5 context];
    long long v24 = [v23 messageDispatcher];
    [v24 deregisterReceiver:v5];

    [(HMAccessory *)v5 setContext:0];
    long long v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 removeObserver:v5];
  }
  else
  {
    if (v7)
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = v26;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", buf, 0xCu);
    }
  }
}

- (void)unconfigureInfoDataProviderWithOptions:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMAccessory *)self accessoryInfoDataProvider];

  id v6 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v7 = self;
  uint64_t v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v10;
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Unconfiguring info data provider with option: %lu", buf, 0x16u);
    }
    uint64_t v11 = [(HMAccessory *)v7 accessoryInfoDataProvider];
    uint64_t v12 = [(HMAccessory *)v7 home];
    uint64_t v13 = [v12 uniqueIdentifier];
    id v14 = [(HMAccessory *)v7 uniqueIdentifier];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__HMAccessory_unconfigureInfoDataProviderWithOptions___block_invoke;
    v16[3] = &unk_1E59428A0;
    void v16[4] = v7;
    v16[5] = a3;
    [v11 unsubscribeToAccessoryInfoWithHomeIdentifier:v13 accessoryIdentifier:v14 accessoryInfoTypes:a3 completionHandler:v16];
  }
  else
  {
    if (v9)
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v15;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Ask to unconfigure nil info data provider", buf, 0xCu);
    }
  }
}

void __54__HMAccessory_unconfigureInfoDataProviderWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543874;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to unsubscribe to info data provider, option: %lu error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (void)configureInfoDataProviderIfNeededWithOption:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMAccessory *)self home];
  id v6 = [v5 homeManager];
  BOOL v7 = [(HMAccessory *)self accessoryInfoDataProvider];

  uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
  int v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      unint64_t v20 = v12;
      __int16 v21 = 2048;
      unint64_t v22 = a3;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Asked to create info data provider again with option: %lu", buf, 0x16u);
    }
  }
  else
  {
    if (v11)
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      unint64_t v20 = v13;
      __int16 v21 = 2048;
      unint64_t v22 = a3;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating info data provider with option: %lu", buf, 0x16u);
    }
    id v14 = [v6 createAccessoryInfoDataProvider];
    [(HMAccessory *)v9 setAccessoryInfoDataProvider:v14];
  }
  uint64_t v15 = [(HMAccessory *)v9 accessoryInfoDataProvider];
  uint64_t v16 = [v5 uniqueIdentifier];
  uint64_t v17 = [(HMAccessory *)v9 uniqueIdentifier];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__HMAccessory_configureInfoDataProviderIfNeededWithOption___block_invoke;
  v18[3] = &unk_1E5945188;
  void v18[4] = v9;
  [v15 configureWithHomeIdentifier:v16 accessoryIdentifier:v17 accessoryInfoTypes:a3 dataProviderDelegate:v9 completionHandler:v18];
}

void __59__HMAccessory_configureInfoDataProviderIfNeededWithOption___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      int v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to info data provider, error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)configureSettingsAdapterIfNeeded
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMAccessory *)self home];
  BOOL v4 = [v3 homeManager];
  id v5 = [v4 configuration];
  char v6 = [v5 options];

  if ((v6 & 0x20) != 0)
  {
    BOOL v7 = [(HMAccessory *)self settingsAdapter];

    if (v7)
    {
      int v8 = (void *)MEMORY[0x19F3A64A0]();
      int v9 = self;
      __int16 v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        int v36 = 138543362;
        id v37 = v11;
        uint64_t v12 = "%{public}@Asked to create settings adaptor again";
        __int16 v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_INFO;
LABEL_16:
        _os_log_impl(&dword_19D1A8000, v13, v14, v12, (uint8_t *)&v36, 0xCu);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
    uint64_t v15 = [(HMAccessory *)self context];
    if (!v15) {
      goto LABEL_14;
    }
    uint64_t v16 = (void *)v15;
    uint64_t v17 = [(HMAccessory *)self context];
    uint64_t v18 = [v17 queue];

    if (!v18)
    {
LABEL_14:
      int v8 = (void *)MEMORY[0x19F3A64A0]();
      int v9 = self;
      __int16 v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        int v36 = 138543362;
        id v37 = v11;
        uint64_t v12 = "%{public}@Context or context queue is nil";
        __int16 v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        goto LABEL_16;
      }
LABEL_17:

      return;
    }
    __int16 v19 = [(HMAccessory *)self settings];

    if (v19)
    {
      __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
      unint64_t v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        long long v24 = HMFGetLogIdentifier();
        int v36 = 138543362;
        id v37 = v24;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Removing all existing settings on update to support HPLS", (uint8_t *)&v36, 0xCu);
      }
      uint64_t v20 = [(HMAccessory *)v22 setSettings:0];
    }
    long long v25 = (void *)MEMORY[0x19F3A64A0](v20);
    id v26 = self;
    long long v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      long long v28 = HMFGetLogIdentifier();
      int v36 = 138543362;
      id v37 = v28;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Creating adaptor on settings support", (uint8_t *)&v36, 0xCu);
    }
    long long v29 = [(HMAccessory *)v26 home];
    long long v30 = [v29 homeManager];
    long long v31 = [v30 createAccessorySettingsDataSource];
    [(HMAccessory *)v26 setAccessorySettingsDataSource:v31];

    long long v32 = [v30 createAccessorySettingsController];
    [(HMAccessory *)v26 setAccessorySettingsController:v32];

    long long v33 = [(HMAccessory *)v26 accessorySettingsDataSource];
    long long v34 = [(HMAccessory *)v26 accessorySettingsController];
    long long v35 = [(HMAccessory *)v26 context];
    [(HMAccessory *)v26 createSettingsAdapterWithDataSource:v33 controller:v34 context:v35];

    [(HMAccessory *)v26 configureSettingsAdapterWithCompletionHandler:0];
  }
}

uint64_t __43__HMAccessory___configureWithContext_home___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "__configureWithContext:accessory:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (HMAccessory)init
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  BOOL v4 = [(HMAccessory *)self initWithUUID:v3];

  return v4;
}

- (void)updatePendingConfigurationIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v6 = a4;
  uint64_t v7 = [(HMAccessory *)self context];
  if (!v6)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory(PendingConfiguration) updatePendingConfigurationIdentifier:completionHandler:]", @"completionHandler"];
    id v26 = (void *)MEMORY[0x19F3A64A0]();
    long long v27 = self;
    long long v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v40 = v29;
      __int16 v41 = 2112;
      id v42 = (const char *)v25;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];
    objc_exception_throw(v30);
  }
  int v8 = (void *)v7;
  if (v7)
  {
    int v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setObject:v32 forKeyedSubscript:@"HMA.pendingConfigurationIdentifier"];
    id v10 = objc_alloc(MEMORY[0x1E4F65488]);
    id v11 = [(HMAccessory *)self messageTargetUUID];
    uint64_t v12 = [v10 initWithTarget:v11];

    long long v31 = (void *)v12;
    __int16 v13 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryUpdatePendingConfigurationIdentifierMessage" destination:v12 payload:v9];
    objc_initWeak(&location, self);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __92__HMAccessory_PendingConfiguration__updatePendingConfigurationIdentifier_completionHandler___block_invoke;
    v33[3] = &unk_1E5944978;
    objc_copyWeak(&v37, &location);
    id v14 = v32;
    id v34 = v14;
    id v15 = v8;
    id v35 = v15;
    id v36 = v6;
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]([v13 setResponseHandler:v33]);
    uint64_t v17 = self;
    HMFGetOSLogHandle();
    uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v40 = v19;
      __int16 v41 = 2112;
      id v42 = (const char *)v14;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating pending configuration identifier to %@", buf, 0x16u);
    }
    uint64_t v20 = [v15 messageDispatcher];
    [v20 sendMessage:v13];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
    unint64_t v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v40 = v24;
      __int16 v41 = 2080;
      id v42 = "-[HMAccessory(PendingConfiguration) updatePendingConfigurationIdentifier:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    int v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v9);
  }
}

void __92__HMAccessory_PendingConfiguration__updatePendingConfigurationIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 32);
      int v17 = 138543874;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to update pending configuration identifier to %@: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 32);
      int v17 = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Updated pending configuration identifier to %@", (uint8_t *)&v17, 0x16u);
    }
    [v9 setPendingConfigurationIdentifier:*(void *)(a1 + 32)];
  }
  uint64_t v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (NSDictionary)serializedDictionaryRepresentation
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v2 = +[HMPBAccessoryReference accessoryReferenceWithAccessory:self];
  v6[0] = @"HMShortcutsSerializedDictionaryVersion";
  v6[1] = @"HMShortcutsSerializedDictionaryProtocol";
  v7[0] = @"1.0";
  v7[1] = @"ProtoBuf";
  void v6[2] = @"HMAccessorySerializedDataKey";
  id v3 = [v2 data];
  v7[2] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return (NSDictionary *)v4;
}

+ (HMAccessory)accessoryWithAccessoryReference:(id)a3 home:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 hasUniqueIdentifier] & 1) == 0)
  {
    __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = a1;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      int v44 = 138543362;
      uint64_t v45 = v24;
      uint64_t v25 = "%{public}@AccessoryReference uniqueIdentifier not set";
LABEL_13:
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v44, 0xCu);
    }
LABEL_14:

    __int16 v19 = 0;
    goto LABEL_34;
  }
  if (([v6 hasHomeReference] & 1) == 0)
  {
    __int16 v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = a1;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      int v44 = 138543362;
      uint64_t v45 = v24;
      uint64_t v25 = "%{public}@HomeReference not set in accessoryReference";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  int v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = [v6 uniqueIdentifier];
  id v10 = objc_msgSend(v8, "hmf_UUIDWithBytesAsData:", v9);

  if (!v10)
  {
    id v26 = (void *)MEMORY[0x19F3A64A0]();
    id v27 = a1;
    long long v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = HMFGetLogIdentifier();
      int v44 = 138543362;
      uint64_t v45 = v29;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode Accessory UniqueIdentifier", (uint8_t *)&v44, 0xCu);
    }
    __int16 v19 = 0;
    goto LABEL_33;
  }
  id v11 = [v6 homeReference];
  if (([v11 hasUniqueIdentifier] & 1) == 0)
  {
    id v30 = (void *)MEMORY[0x19F3A64A0]();
    id v31 = a1;
    id v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      long long v33 = HMFGetLogIdentifier();
      int v44 = 138543362;
      uint64_t v45 = v33;
      _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_ERROR, "%{public}@HomeReference uniqueIdentifier not set", (uint8_t *)&v44, 0xCu);
    }
    __int16 v19 = 0;
    goto LABEL_32;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F29128];
  uint64_t v13 = [v11 uniqueIdentifier];
  id v14 = objc_msgSend(v12, "hmf_UUIDWithBytesAsData:", v13);

  uint64_t v15 = [v11 uniqueIdentifier];

  if (v15)
  {
    uint64_t v16 = [v7 uniqueIdentifier];
    char v17 = [v14 isEqual:v16];

    if (v17)
    {
      uint64_t v18 = [v7 accessoryWithUniqueIdentifier:v10];
      __int16 v19 = v18;
      if (v18)
      {
        id v20 = v18;
      }
      else
      {
        uint64_t v39 = (void *)MEMORY[0x19F3A64A0]();
        id v40 = a1;
        __int16 v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          id v42 = HMFGetLogIdentifier();
          int v44 = 138543618;
          uint64_t v45 = v42;
          __int16 v46 = 2112;
          uint64_t v47 = v10;
          _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@Can't find accessory %@", (uint8_t *)&v44, 0x16u);
        }
      }

      goto LABEL_31;
    }
    id v34 = (void *)MEMORY[0x19F3A64A0]();
    id v35 = a1;
    id v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      uint64_t v38 = [v7 uniqueIdentifier];
      int v44 = 138543874;
      uint64_t v45 = v37;
      __int16 v46 = 2112;
      uint64_t v47 = v14;
      __int16 v48 = 2112;
      __int16 v49 = v38;
      _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@Trying to dereference Characteristic Reference from different home %@ %@", (uint8_t *)&v44, 0x20u);

      goto LABEL_25;
    }
  }
  else
  {
    id v34 = (void *)MEMORY[0x19F3A64A0]();
    id v35 = a1;
    id v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      int v44 = 138543362;
      uint64_t v45 = v37;
      _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode Home UniqueIdentifier", (uint8_t *)&v44, 0xCu);
LABEL_25:
    }
  }

  __int16 v19 = 0;
LABEL_31:

LABEL_32:
LABEL_33:

LABEL_34:

  return (HMAccessory *)v19;
}

+ (HMAccessory)accessoryWithSerializedDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "hmf_dataForKey:", @"HMAccessorySerializedDataKey");
  int v8 = +[HMPBAccessoryReference accessoryReferenceWithData:v7];
  id v9 = [a1 accessoryWithAccessoryReference:v8 home:v6];

  return (HMAccessory *)v9;
}

- (void)removeCorrespondingSystemCommissionerPairingWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v22 = v10;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing corresponding system commissioner pairing", buf, 0xCu);
    }
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v12 = [(HMAccessory *)v7 uuid];
    uint64_t v13 = (void *)[v11 initWithTarget:v12];

    id v14 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryRemoveCorrespondingSystemCommissionerPairingMessage" destination:v13 payload:0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__HMAccessory_CHIP__removeCorrespondingSystemCommissionerPairingWithCompletion___block_invoke;
    v18[3] = &unk_1E5945510;
    void v18[4] = v7;
    id v15 = v5;
    id v19 = v15;
    id v20 = v4;
    [v14 setResponseHandler:v18];
    uint64_t v16 = [v15 messageDispatcher];
    [v16 sendMessage:v14];

    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    char v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v22 = v17;
    __int16 v23 = 2080;
    long long v24 = "-[HMAccessory(CHIP) removeCorrespondingSystemCommissionerPairingWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
LABEL_9:
  }
}

void __80__HMAccessory_CHIP__removeCorrespondingSystemCommissionerPairingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      uint64_t v12 = "%{public}@Failed to remove corresponding system commissioner pairing: %@";
      uint64_t v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v11;
    uint64_t v12 = "%{public}@Successfully removed corresponding system commissioner pairing";
    uint64_t v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  uint64_t v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMAccessory *)self context];
  if (!v4)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory(CHIP) activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion:]", @"completion"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v29 = v23;
      __int16 v30 = 2112;
      id v31 = (const char *)v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  id v6 = (void *)v5;
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
      long long v29 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Activating CHIP pairing mode and creating setup payload string", buf, 0xCu);
    }
    id v12 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v13 = [(HMAccessory *)v8 uuid];
    os_log_type_t v14 = (void *)[v12 initWithTarget:v13];

    uint32_t v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryActivateCHIPPairingModeAndCreateSetupPayloadStringMessage" destination:v14 payload:0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __86__HMAccessory_CHIP__activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion___block_invoke;
    v25[3] = &unk_1E5945510;
    void v25[4] = v8;
    id v16 = v6;
    id v26 = v16;
    id v27 = v4;
    [v15 setResponseHandler:v25];
    int v17 = [v16 messageDispatcher];
    [v17 sendMessage:v15];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v29 = v18;
      __int16 v30 = 2080;
      id v31 = "-[HMAccessory(CHIP) activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    os_log_type_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v14);
  }
}

void __86__HMAccessory_CHIP__activateCHIPPairingModeAndCreateSetupPayloadStringWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hmf_stringForKey:", @"HMA.chipSetupPayloadString");
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully activated CHIP pairing mode and created setup payload string: %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v13 = [*(id *)(a1 + 40) delegateCaller];
    os_log_type_t v14 = v13;
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = v7;
    id v17 = 0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v18;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to activate CHIP pairing mode and create setup payload string: %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v13 = [*(id *)(a1 + 40) delegateCaller];
    os_log_type_t v14 = v13;
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = 0;
    id v17 = v5;
  }
  [v13 callCompletion:v15 obj:v16 error:v17];
}

- (void)setCHIPPairingModeActive:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    [(HMAccessory *)self activateCHIPPairingModeWithCompletion:v6];
  }
  else
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v10;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Setting CHIP pairing mode inactive is not supported", (uint8_t *)&v14, 0xCu);
    }
    id v11 = [(HMAccessory *)v8 context];
    id v12 = [v11 delegateCaller];
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v12 callCompletion:v6 error:v13];
  }
}

- (void)activateCHIPPairingModeWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMAccessory *)self context];
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v22 = v10;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Activating CHIP pairing mode", buf, 0xCu);
    }
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    id v12 = [(HMAccessory *)v7 uuid];
    uint64_t v13 = (void *)[v11 initWithTarget:v12];

    int v14 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryActivateCHIPPairingModeMessage" destination:v13 payload:0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__HMAccessory_CHIP__activateCHIPPairingModeWithCompletion___block_invoke;
    v18[3] = &unk_1E5945510;
    void v18[4] = v7;
    id v15 = v5;
    id v19 = v15;
    id v20 = v4;
    [v14 setResponseHandler:v18];
    uint64_t v16 = [v15 messageDispatcher];
    [v16 sendMessage:v14];

    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v22 = v17;
    __int16 v23 = 2080;
    id v24 = "-[HMAccessory(CHIP) activateCHIPPairingModeWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v13);
LABEL_9:
  }
}

void __59__HMAccessory_CHIP__activateCHIPPairingModeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      id v12 = "%{public}@Failed to activate CHIP pairing mode: %@";
      uint64_t v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v11;
    id v12 = "%{public}@Successfully activated CHIP pairing mode";
    uint64_t v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  uint64_t v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)removeCHIPPairings:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = a4;
  id v8 = [(HMAccessory *)self context];
  id v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v29 = v13;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing CHIP pairings: %@", buf, 0x16u);
    }
    id v14 = objc_alloc(MEMORY[0x1E4F65488]);
    uint32_t v15 = [(HMAccessory *)v10 uuid];
    uint64_t v16 = (void *)[v14 initWithTarget:v15];

    id v26 = @"HMA.chipPairings";
    int v17 = encodeRootObject(v6);
    id v27 = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    __int16 v19 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryRemoveCHIPPairingsMessage" destination:v16 payload:v18];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __51__HMAccessory_CHIP__removeCHIPPairings_completion___block_invoke;
    v23[3] = &unk_1E5945510;
    void v23[4] = v10;
    id v20 = v8;
    id v24 = v20;
    id v25 = v7;
    [v19 setResponseHandler:v23];
    uint64_t v21 = [v20 messageDispatcher];
    [v21 sendMessage:v19];

    goto LABEL_9;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    long long v29 = v22;
    __int16 v30 = 2080;
    id v31 = "-[HMAccessory(CHIP) removeCHIPPairings:completion:]";
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
LABEL_9:
  }
}

void __51__HMAccessory_CHIP__removeCHIPPairings_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      id v12 = "%{public}@Failed to remove CHIP pairings: %@";
      uint64_t v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v11;
    id v12 = "%{public}@Successfully removed CHIP pairings";
    uint64_t v13 = v10;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 12;
    goto LABEL_6;
  }

  uint64_t v16 = [*(id *)(a1 + 40) delegateCaller];
  [v16 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void)fetchCHIPPairingsWithCompletion:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMAccessory *)self context];
  if (!v4)
  {
    uint64_t v19 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMAccessory(CHIP) fetchCHIPPairingsWithCompletion:]", @"completion"];
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v29 = v23;
      __int16 v30 = 2112;
      id v31 = (const char *)v19;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v19 userInfo:0];
    objc_exception_throw(v24);
  }
  id v6 = (void *)v5;
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
      long long v29 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching CHIP pairings", buf, 0xCu);
    }
    id v12 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v13 = [(HMAccessory *)v8 uuid];
    os_log_type_t v14 = (void *)[v12 initWithTarget:v13];

    uint32_t v15 = [MEMORY[0x1E4F654B0] messageWithName:@"HMAccessoryFetchCHIPPairingsMessage" destination:v14 payload:0];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke;
    v25[3] = &unk_1E5945510;
    void v25[4] = v8;
    id v16 = v6;
    id v26 = v16;
    id v27 = v4;
    [v15 setResponseHandler:v25];
    int v17 = [v16 messageDispatcher];
    [v17 sendMessage:v15];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v29 = v18;
      __int16 v30 = 2080;
      id v31 = "-[HMAccessory(CHIP) fetchCHIPPairingsWithCompletion:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    os_log_type_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v14);
  }
}

void __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "hmf_dataForKey:", @"HMA.chipPairings");
  id v8 = (void *)v7;
  if (v5) {
    goto LABEL_7;
  }
  if (!v7) {
    goto LABEL_7;
  }
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  id v11 = [v9 setWithArray:v10];

  id v31 = 0;
  id v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v11 fromData:v8 error:&v31];
  id v5 = v31;

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = a1[4];
    uint32_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v33 = v16;
      __int16 v34 = 2112;
      id v35 = v12;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Fetched CHIP pairings: %@", buf, 0x16u);
    }
    int v17 = [a1[5] delegateCaller];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke_14;
    v25[3] = &unk_1E59454E8;
    id v18 = a1[6];
    id v26 = v12;
    id v27 = v18;
    id v19 = v12;
    [v17 invokeBlock:v25];
  }
  else
  {
LABEL_7:
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = a1[4];
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v33 = v23;
      __int16 v34 = 2112;
      id v35 = v5;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch CHIP pairings: %@", buf, 0x16u);
    }
    id v24 = [a1[5] delegateCaller];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke_12;
    v28[3] = &unk_1E59454E8;
    id v30 = a1[6];
    id v5 = v5;
    id v29 = v5;
    [v24 invokeBlock:v28];

    id v19 = v30;
  }
}

uint64_t __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __53__HMAccessory_CHIP__fetchCHIPPairingsWithCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (HMNetworkConfigurationProfile)networkConfigurationProfile
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(HMAccessory *)self profiles];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
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

  return (HMNetworkConfigurationProfile *)v7;
}

- (void)setHasOnboardedForNaturalLightingWithCompletion:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMAccessory *)self context];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F65488]);
    id v7 = [(HMAccessory *)self uuid];
    id v8 = (void *)[v6 initWithTarget:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v10 = (void *)[v9 initWithName:HMAccessorySetHasOnboardedForNaturalLightingMessage destination:v8 payload:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__HMAccessory_Light__setHasOnboardedForNaturalLightingWithCompletion___block_invoke;
    aBlock[3] = &unk_1E5944EF0;
    void aBlock[4] = self;
    id v29 = v4;
    long long v11 = _Block_copy(aBlock);
    long long v12 = [v10 identifier];
    long long v13 = [v5 pendingRequests];
    long long v14 = _Block_copy(v11);
    [v13 addCompletionBlock:v14 forIdentifier:v12];

    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __70__HMAccessory_Light__setHasOnboardedForNaturalLightingWithCompletion___block_invoke_5;
    id v25 = &unk_1E59455E8;
    id v26 = v13;
    id v27 = v12;
    id v15 = v12;
    id v16 = v13;
    [v10 setResponseHandler:&v22];
    int v17 = objc_msgSend(v5, "messageDispatcher", v22, v23, v24, v25);
    [v17 sendMessage:v10];

LABEL_7:
    goto LABEL_8;
  }
  id v18 = (void *)MEMORY[0x19F3A64A0]();
  id v19 = self;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v31 = v21;
    __int16 v32 = 2080;
    long long v33 = "-[HMAccessory(Light) setHasOnboardedForNaturalLightingWithCompletion:]";
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v4)
  {
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v8);
    goto LABEL_7;
  }
LABEL_8:
}

void __70__HMAccessory_Light__setHasOnboardedForNaturalLightingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      int v22 = 138543874;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      __int16 v26 = 2112;
      id v27 = v5;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to onboard accessory for natural lighting %@:%@", (uint8_t *)&v22, 0x20u);
    }
    long long v12 = [*(id *)(a1 + 32) context];
    long long v13 = [v12 delegateCaller];
    long long v14 = v13;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = v5;
  }
  else
  {
    int v17 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) setHasOnboardedForNaturalLighting:1]);
    id v18 = *(id *)(a1 + 32);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      uint64_t v21 = *(void *)(a1 + 32);
      int v22 = 138543618;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully onboarded accessory for natural lighting: %@", (uint8_t *)&v22, 0x16u);
    }
    long long v12 = [*(id *)(a1 + 32) context];
    long long v13 = [v12 delegateCaller];
    long long v14 = v13;
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = 0;
  }
  [v13 callCompletion:v15 error:v16];
}

void __70__HMAccessory_Light__setHasOnboardedForNaturalLightingWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
}

@end
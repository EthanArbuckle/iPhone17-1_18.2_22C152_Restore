@interface HMDHomeConfigurationLogEvent
- (BOOL)hasHomeKeyInWallet;
- (BOOL)isAccessToHomeAllowed;
- (BOOL)isAutomaticThirdPartyAccessorySoftwareUpdateEnabled;
- (BOOL)isCurrentDeviceLocalToHome;
- (BOOL)isCurrentDevicePrimaryResident;
- (BOOL)isCurrentDeviceResidentCapable;
- (BOOL)isCurrentDeviceResidentEnabled;
- (BOOL)isOwnerUser;
- (BOOL)isResidentAvailable;
- (BOOL)isResidentElectionV2Enabled;
- (BOOL)isResidentFirstEnabled;
- (BOOL)isResidentSelectionEnabled;
- (BOOL)isSiriPhraseOptionsHeySiriEnabled;
- (BOOL)isSiriPhraseOptionsJustSiriEnabled;
- (BOOL)isSmokeAlarmEnabled;
- (BOOL)isSubmitted;
- (BOOL)networkProtectionEnabled;
- (BOOL)primaryReportingDevice;
- (HMDHomeConfigurationLogEvent)initWithDataSource:(id)a3 home:(id)a4 configuredWidgetsCount:(int64_t)a5;
- (HMDHomeConfigurationLogEvent)initWithHome:(id)a3 configuredWidgetsCount:(int64_t)a4;
- (HMDHomeConfigurationLogEvent)initWithIsOwnerUser:(BOOL)a3 isResidentAvailable:(BOOL)a4 isPrimaryReportingDevice:(BOOL)a5 isCurrentDeviceResidentEnabled:(BOOL)a6 isPrimaryResident:(BOOL)a7 isCurrentDeviceLocalToHome:(BOOL)a8 isNetworkProtectionEnabled:(BOOL)a9 isUserRoeProvisioned:(BOOL)a10 isResidentFirstEnabled:(BOOL)a11 isResidentElectionV2Enabled:(BOOL)a12 isSmokeAlarmEnabled:(BOOL)a13;
- (NSArray)eventTriggers;
- (NSArray)hapServices;
- (NSArray)multiUserSettings;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)numBSPs;
- (NSString)coreAnalyticsEventName;
- (NSString)oldestTVOSBuildInHome;
- (NSString)oldestTVOSVersionInHome;
- (NSString)primaryResidentBuildInHome;
- (NSString)primaryResidentVersionInHome;
- (id)initForUnitTesting;
- (int)networkProtectionStatus;
- (int64_t)currentMediaAccessoryFallbackMediaUserType;
- (int64_t)daysSinceDate:(id)a3 trimAtMaximumValue:(unint64_t)a4;
- (int64_t)firstHAPAccessoryAddedCohortWeek;
- (int64_t)homeCreationCohortWeek;
- (int64_t)numAdmins;
- (int64_t)numConfiguredWidgets;
- (int64_t)numRestrictedGuests;
- (int64_t)numUsers;
- (int64_t)weeksSinceDate:(id)a3 trimAtMaximumValue:(unint64_t)a4;
- (unint64_t)appleMediaCategoryBitMask;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)currentUserPrivilege;
- (unint64_t)currentUserPrivilegeBitMask;
- (unint64_t)enabledResidentsDeviceCapabilities;
- (unint64_t)homeCategoryBitMask;
- (unint64_t)homeIndex;
- (unint64_t)numACBAccessories;
- (unint64_t)numAccessories;
- (unint64_t)numAccessoriesNetworkProtectionAutoFullAccess;
- (unint64_t)numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN;
- (unint64_t)numAccessoriesNetworkProtectionAutoProtectedMainLAN;
- (unint64_t)numAccessoriesNetworkProtectionFullAccess;
- (unint64_t)numAccessoriesNetworkProtectionHomeKitOnly;
- (unint64_t)numAccessoriesNetworkProtectionUnprotected;
- (unint64_t)numAccessoriesWiFiPPSKCredential;
- (unint64_t)numAccessoriesWithWalletKeySupported;
- (unint64_t)numAccessoryServiceGroups;
- (unint64_t)numActiveTriggers;
- (unint64_t)numAppleAudioAccessories;
- (unint64_t)numAppleMediaAccessories;
- (unint64_t)numAppleTV4K2ndGenAccessories;
- (unint64_t)numAppleTVAccessories;
- (unint64_t)numBTAccessories;
- (unint64_t)numBTOnlyAccessories;
- (unint64_t)numBridgedAccessories;
- (unint64_t)numBridgedTargetControllers;
- (unint64_t)numCHIPAccessories;
- (unint64_t)numCHIPAccessoriesFirmwareUpdateEligible;
- (unint64_t)numCameraAccessories;
- (unint64_t)numCameraAccessoriesReachabilityNotificationEnabled;
- (unint64_t)numCameraAccessoriesRecordingEnabled;
- (unint64_t)numCameraAccessoriesSupportRecording;
- (unint64_t)numCameraAccessoriesWithActivityZonesEnabled;
- (unint64_t)numCapableSiriEndpointAccessories;
- (unint64_t)numCertifiedAccessories;
- (unint64_t)numCertifiedBridgedTargetControllers;
- (unint64_t)numCertifiedTargetControllers;
- (unint64_t)numConfiguredScenes;
- (unint64_t)numEnabledSiriEndpointAccessories;
- (unint64_t)numEventTriggers;
- (unint64_t)numHAPAccessories;
- (unint64_t)numHAPAccessoriesFirmwareUpdateEligible;
- (unint64_t)numHAPBTAccessories;
- (unint64_t)numHAPBatteryServiceAccessories;
- (unint64_t)numHAPIPAccessories;
- (unint64_t)numHAPLocks;
- (unint64_t)numHAPSpeakerServiceAccessories;
- (unint64_t)numHomePod2ndGen;
- (unint64_t)numHomePod2ndGenStereoPairs;
- (unint64_t)numHomePodMiniStereoPairs;
- (unint64_t)numHomePodMinis;
- (unint64_t)numHomePodStereoPairs;
- (unint64_t)numHomePods;
- (unint64_t)numIPAccessories;
- (unint64_t)numLightProfilesWithNaturalLightingEnabled;
- (unint64_t)numLightProfilesWithNaturalLightingSupported;
- (unint64_t)numLightProfilesWithNaturalLightingUsed;
- (unint64_t)numLocksWithAccessCodeSupported;
- (unint64_t)numLocksWithWalletKeySupported;
- (unint64_t)numMatterLightProfilesWithNaturalLightingEnabled;
- (unint64_t)numMatterLightProfilesWithNaturalLightingSupported;
- (unint64_t)numMatterLightProfilesWithNaturalLightingUsed;
- (unint64_t)numMatterLocks;
- (unint64_t)numMediaSystems;
- (unint64_t)numNotCertifiedAccessories;
- (unint64_t)numPrimaryHAPSpeakerServiceAccessories;
- (unint64_t)numRVCs;
- (unint64_t)numResidentsEnabled;
- (unint64_t)numRooms;
- (unint64_t)numScenes;
- (unint64_t)numServices;
- (unint64_t)numShortcuts;
- (unint64_t)numSmartHomeAccessories;
- (unint64_t)numTargetControllers;
- (unint64_t)numTelevisionAccessories;
- (unint64_t)numTelevisionServiceAccessories;
- (unint64_t)numTelevisionSetTopBoxAccessories;
- (unint64_t)numTelevisionStreamingStickAccessories;
- (unint64_t)numThirdPartyAudioAccessories;
- (unint64_t)numThirdPartyMediaAccessories;
- (unint64_t)numThreadAccessories;
- (unint64_t)numThreadAccessoryBorderRouterCapable;
- (unint64_t)numThreadAccessoryFullCapable;
- (unint64_t)numThreadAccessoryMinCapable;
- (unint64_t)numThreadAccessoryRouterCapable;
- (unint64_t)numThreadAccessorySleepCapable;
- (unint64_t)numThreadBorderRouters;
- (unint64_t)numTimerTriggers;
- (unint64_t)numTriggerOwnedConfiguredScenes;
- (unint64_t)numTriggers;
- (unint64_t)numWholeHouseAudioAccessories;
- (unint64_t)numWoLAccessories;
- (unint64_t)numZones;
- (unint64_t)ownerPerspectiveNumUsersWithAccessCode;
- (unint64_t)residentElectionBitMask;
- (unint64_t)residentSelectionMode;
- (unint64_t)thirdPartyMediaCategoryBitMask;
- (unint64_t)userPrivilegeBitMask;
- (unsigned)databaseSize;
- (unsigned)metadataVersion;
- (void)setDatabaseSize:(unsigned int)a3;
- (void)setEventTriggers:(id)a3;
- (void)setHomeConfigurationBitMasks;
- (void)setHomeIndex:(unint64_t)a3;
- (void)setMetadataVersion:(unsigned int)a3;
- (void)setMultiUserSettings:(id)a3;
- (void)updateConfigWithAccessory:(id)a3 reportNetworkProtectionMetrics:(BOOL)a4 networkProtectionEnabled:(BOOL)a5 hapServiceTypes:(id)a6 primaryHAPServiceTypes:(id)a7;
@end

@implementation HMDHomeConfigurationLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryResidentBuildInHome, 0);
  objc_storeStrong((id *)&self->_primaryResidentVersionInHome, 0);
  objc_storeStrong((id *)&self->_oldestTVOSBuildInHome, 0);
  objc_storeStrong((id *)&self->_oldestTVOSVersionInHome, 0);
  objc_storeStrong((id *)&self->_numBSPs, 0);
  objc_storeStrong((id *)&self->_hapServices, 0);
  objc_storeStrong((id *)&self->_eventTriggers, 0);
  objc_storeStrong((id *)&self->_multiUserSettings, 0);
}

- (NSString)primaryResidentBuildInHome
{
  return self->_primaryResidentBuildInHome;
}

- (NSString)primaryResidentVersionInHome
{
  return self->_primaryResidentVersionInHome;
}

- (NSString)oldestTVOSBuildInHome
{
  return self->_oldestTVOSBuildInHome;
}

- (NSString)oldestTVOSVersionInHome
{
  return self->_oldestTVOSVersionInHome;
}

- (unint64_t)numRVCs
{
  return self->_numRVCs;
}

- (unint64_t)residentSelectionMode
{
  return self->_residentSelectionMode;
}

- (BOOL)isResidentSelectionEnabled
{
  return self->_isResidentSelectionEnabled;
}

- (unint64_t)numACBAccessories
{
  return self->_numACBAccessories;
}

- (unint64_t)residentElectionBitMask
{
  return self->_residentElectionBitMask;
}

- (BOOL)isSiriPhraseOptionsJustSiriEnabled
{
  return self->_isSiriPhraseOptionsJustSiriEnabled;
}

- (BOOL)isSiriPhraseOptionsHeySiriEnabled
{
  return self->_isSiriPhraseOptionsHeySiriEnabled;
}

- (BOOL)isSmokeAlarmEnabled
{
  return self->_isSmokeAlarmEnabled;
}

- (BOOL)hasHomeKeyInWallet
{
  return self->_hasHomeKeyInWallet;
}

- (unint64_t)numAccessoriesWithWalletKeySupported
{
  return self->_numAccessoriesWithWalletKeySupported;
}

- (unint64_t)ownerPerspectiveNumUsersWithAccessCode
{
  return self->_ownerPerspectiveNumUsersWithAccessCode;
}

- (unint64_t)numLocksWithWalletKeySupported
{
  return self->_numLocksWithWalletKeySupported;
}

- (unint64_t)numLocksWithAccessCodeSupported
{
  return self->_numLocksWithAccessCodeSupported;
}

- (unint64_t)numMatterLocks
{
  return self->_numMatterLocks;
}

- (unint64_t)numHAPLocks
{
  return self->_numHAPLocks;
}

- (void)setMetadataVersion:(unsigned int)a3
{
  self->_metadataVersion = a3;
}

- (unsigned)metadataVersion
{
  return self->_metadataVersion;
}

- (void)setDatabaseSize:(unsigned int)a3
{
  self->_databaseSize = a3;
}

- (unsigned)databaseSize
{
  return self->_databaseSize;
}

- (unint64_t)numWoLAccessories
{
  return self->_numWoLAccessories;
}

- (NSNumber)numBSPs
{
  return (NSNumber *)objc_getProperty(self, a2, 832, 1);
}

- (unint64_t)numHomePod2ndGenStereoPairs
{
  return self->_numHomePod2ndGenStereoPairs;
}

- (unint64_t)numHomePodMiniStereoPairs
{
  return self->_numHomePodMiniStereoPairs;
}

- (unint64_t)numHomePodStereoPairs
{
  return self->_numHomePodStereoPairs;
}

- (unint64_t)numMediaSystems
{
  return self->_numMediaSystems;
}

- (unint64_t)numHomePod2ndGen
{
  return self->_numHomePod2ndGen;
}

- (unint64_t)numHomePodMinis
{
  return self->_numHomePodMinis;
}

- (unint64_t)numHomePods
{
  return self->_numHomePods;
}

- (int64_t)currentMediaAccessoryFallbackMediaUserType
{
  return self->_currentMediaAccessoryFallbackMediaUserType;
}

- (NSArray)hapServices
{
  return self->_hapServices;
}

- (void)setEventTriggers:(id)a3
{
}

- (NSArray)eventTriggers
{
  return self->_eventTriggers;
}

- (void)setMultiUserSettings:(id)a3
{
}

- (NSArray)multiUserSettings
{
  return self->_multiUserSettings;
}

- (unint64_t)numThreadBorderRouters
{
  return self->_numThreadBorderRouters;
}

- (unint64_t)numThreadAccessoryBorderRouterCapable
{
  return self->_numThreadAccessoryBorderRouterCapable;
}

- (unint64_t)numThreadAccessoryRouterCapable
{
  return self->_numThreadAccessoryRouterCapable;
}

- (unint64_t)numThreadAccessoryFullCapable
{
  return self->_numThreadAccessoryFullCapable;
}

- (unint64_t)numThreadAccessorySleepCapable
{
  return self->_numThreadAccessorySleepCapable;
}

- (unint64_t)numThreadAccessoryMinCapable
{
  return self->_numThreadAccessoryMinCapable;
}

- (int64_t)numConfiguredWidgets
{
  return self->_numConfiguredWidgets;
}

- (int64_t)firstHAPAccessoryAddedCohortWeek
{
  return self->_firstHAPAccessoryAddedCohortWeek;
}

- (int64_t)homeCreationCohortWeek
{
  return self->_homeCreationCohortWeek;
}

- (unint64_t)numAccessoryServiceGroups
{
  return self->_numAccessoryServiceGroups;
}

- (unint64_t)numZones
{
  return self->_numZones;
}

- (unint64_t)numRooms
{
  return self->_numRooms;
}

- (unint64_t)numScenes
{
  return self->_numScenes;
}

- (unint64_t)numTriggerOwnedConfiguredScenes
{
  return self->_numTriggerOwnedConfiguredScenes;
}

- (unint64_t)numConfiguredScenes
{
  return self->_numConfiguredScenes;
}

- (unint64_t)userPrivilegeBitMask
{
  return self->_userPrivilegeBitMask;
}

- (int64_t)numRestrictedGuests
{
  return self->_numRestrictedGuests;
}

- (int64_t)numAdmins
{
  return self->_numAdmins;
}

- (int64_t)numUsers
{
  return self->_numUsers;
}

- (unint64_t)numCertifiedBridgedTargetControllers
{
  return self->_numCertifiedBridgedTargetControllers;
}

- (unint64_t)numBridgedTargetControllers
{
  return self->_numBridgedTargetControllers;
}

- (unint64_t)numCertifiedTargetControllers
{
  return self->_numCertifiedTargetControllers;
}

- (unint64_t)numTargetControllers
{
  return self->_numTargetControllers;
}

- (unint64_t)numShortcuts
{
  return self->_numShortcuts;
}

- (unint64_t)numTimerTriggers
{
  return self->_numTimerTriggers;
}

- (unint64_t)numEventTriggers
{
  return self->_numEventTriggers;
}

- (unint64_t)numActiveTriggers
{
  return self->_numActiveTriggers;
}

- (unint64_t)numTriggers
{
  return self->_numTriggers;
}

- (unint64_t)numServices
{
  return self->_numServices;
}

- (unint64_t)enabledResidentsDeviceCapabilities
{
  return self->_enabledResidentsDeviceCapabilities;
}

- (unint64_t)numResidentsEnabled
{
  return self->_numResidentsEnabled;
}

- (unint64_t)numMatterLightProfilesWithNaturalLightingUsed
{
  return self->_numMatterLightProfilesWithNaturalLightingUsed;
}

- (unint64_t)numMatterLightProfilesWithNaturalLightingEnabled
{
  return self->_numMatterLightProfilesWithNaturalLightingEnabled;
}

- (unint64_t)numMatterLightProfilesWithNaturalLightingSupported
{
  return self->_numMatterLightProfilesWithNaturalLightingSupported;
}

- (unint64_t)numLightProfilesWithNaturalLightingUsed
{
  return self->_numLightProfilesWithNaturalLightingUsed;
}

- (unint64_t)numLightProfilesWithNaturalLightingEnabled
{
  return self->_numLightProfilesWithNaturalLightingEnabled;
}

- (unint64_t)numLightProfilesWithNaturalLightingSupported
{
  return self->_numLightProfilesWithNaturalLightingSupported;
}

- (unint64_t)numCameraAccessoriesWithActivityZonesEnabled
{
  return self->_numCameraAccessoriesWithActivityZonesEnabled;
}

- (unint64_t)numCameraAccessoriesReachabilityNotificationEnabled
{
  return self->_numCameraAccessoriesReachabilityNotificationEnabled;
}

- (unint64_t)numCameraAccessoriesRecordingEnabled
{
  return self->_numCameraAccessoriesRecordingEnabled;
}

- (unint64_t)numCameraAccessoriesSupportRecording
{
  return self->_numCameraAccessoriesSupportRecording;
}

- (unint64_t)numCameraAccessories
{
  return self->_numCameraAccessories;
}

- (unint64_t)numAccessoriesNetworkProtectionHomeKitOnly
{
  return self->_numAccessoriesNetworkProtectionHomeKitOnly;
}

- (unint64_t)numAccessoriesNetworkProtectionFullAccess
{
  return self->_numAccessoriesNetworkProtectionFullAccess;
}

- (unint64_t)numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN
{
  return self->_numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN;
}

- (unint64_t)numAccessoriesNetworkProtectionAutoProtectedMainLAN
{
  return self->_numAccessoriesNetworkProtectionAutoProtectedMainLAN;
}

- (unint64_t)numAccessoriesNetworkProtectionAutoFullAccess
{
  return self->_numAccessoriesNetworkProtectionAutoFullAccess;
}

- (unint64_t)numAccessoriesNetworkProtectionUnprotected
{
  return self->_numAccessoriesNetworkProtectionUnprotected;
}

- (unint64_t)numAccessoriesWiFiPPSKCredential
{
  return self->_numAccessoriesWiFiPPSKCredential;
}

- (unint64_t)numEnabledSiriEndpointAccessories
{
  return self->_numEnabledSiriEndpointAccessories;
}

- (unint64_t)numCapableSiriEndpointAccessories
{
  return self->_numCapableSiriEndpointAccessories;
}

- (unint64_t)numWholeHouseAudioAccessories
{
  return self->_numWholeHouseAudioAccessories;
}

- (unint64_t)numPrimaryHAPSpeakerServiceAccessories
{
  return self->_numPrimaryHAPSpeakerServiceAccessories;
}

- (unint64_t)numHAPSpeakerServiceAccessories
{
  return self->_numHAPSpeakerServiceAccessories;
}

- (unint64_t)numTelevisionStreamingStickAccessories
{
  return self->_numTelevisionStreamingStickAccessories;
}

- (unint64_t)numTelevisionSetTopBoxAccessories
{
  return self->_numTelevisionSetTopBoxAccessories;
}

- (unint64_t)numTelevisionAccessories
{
  return self->_numTelevisionAccessories;
}

- (unint64_t)numAppleTV4K2ndGenAccessories
{
  return self->_numAppleTV4K2ndGenAccessories;
}

- (unint64_t)numAppleTVAccessories
{
  return self->_numAppleTVAccessories;
}

- (unint64_t)numAppleAudioAccessories
{
  return self->_numAppleAudioAccessories;
}

- (unint64_t)numHAPBatteryServiceAccessories
{
  return self->_numHAPBatteryServiceAccessories;
}

- (unint64_t)numHAPBTAccessories
{
  return self->_numHAPBTAccessories;
}

- (unint64_t)numHAPIPAccessories
{
  return self->_numHAPIPAccessories;
}

- (unint64_t)numThreadAccessories
{
  return self->_numThreadAccessories;
}

- (unint64_t)numBTOnlyAccessories
{
  return self->_numBTOnlyAccessories;
}

- (unint64_t)numBTAccessories
{
  return self->_numBTAccessories;
}

- (unint64_t)numIPAccessories
{
  return self->_numIPAccessories;
}

- (unint64_t)numCHIPAccessoriesFirmwareUpdateEligible
{
  return self->_numCHIPAccessoriesFirmwareUpdateEligible;
}

- (unint64_t)numHAPAccessoriesFirmwareUpdateEligible
{
  return self->_numHAPAccessoriesFirmwareUpdateEligible;
}

- (unint64_t)numCHIPAccessories
{
  return self->_numCHIPAccessories;
}

- (unint64_t)numHAPAccessories
{
  return self->_numHAPAccessories;
}

- (unint64_t)numAppleMediaAccessories
{
  return self->_numAppleMediaAccessories;
}

- (unint64_t)numThirdPartyMediaAccessories
{
  return self->_numThirdPartyMediaAccessories;
}

- (unint64_t)numSmartHomeAccessories
{
  return self->_numSmartHomeAccessories;
}

- (unint64_t)numNotCertifiedAccessories
{
  return self->_numNotCertifiedAccessories;
}

- (unint64_t)numBridgedAccessories
{
  return self->_numBridgedAccessories;
}

- (unint64_t)numCertifiedAccessories
{
  return self->_numCertifiedAccessories;
}

- (unint64_t)numAccessories
{
  return self->_numAccessories;
}

- (unint64_t)thirdPartyMediaCategoryBitMask
{
  return self->_thirdPartyMediaCategoryBitMask;
}

- (unint64_t)appleMediaCategoryBitMask
{
  return self->_appleMediaCategoryBitMask;
}

- (unint64_t)homeCategoryBitMask
{
  return self->_homeCategoryBitMask;
}

- (BOOL)networkProtectionEnabled
{
  return self->_networkProtectionEnabled;
}

- (BOOL)isResidentElectionV2Enabled
{
  return self->_isResidentElectionV2Enabled;
}

- (BOOL)isResidentFirstEnabled
{
  return self->_isResidentFirstEnabled;
}

- (BOOL)isCurrentDeviceLocalToHome
{
  return self->_isCurrentDeviceLocalToHome;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return self->_isCurrentDevicePrimaryResident;
}

- (BOOL)isCurrentDeviceResidentEnabled
{
  return self->_isCurrentDeviceResidentEnabled;
}

- (BOOL)isCurrentDeviceResidentCapable
{
  return self->_isCurrentDeviceResidentCapable;
}

- (BOOL)primaryReportingDevice
{
  return self->_primaryReportingDevice;
}

- (BOOL)isAutomaticThirdPartyAccessorySoftwareUpdateEnabled
{
  return self->_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled;
}

- (BOOL)isResidentAvailable
{
  return self->_isResidentAvailable;
}

- (int)networkProtectionStatus
{
  return self->_networkProtectionStatus;
}

- (BOOL)isAccessToHomeAllowed
{
  return self->_accessToHomeAllowed;
}

- (unint64_t)currentUserPrivilege
{
  return self->_currentUserPrivilege;
}

- (BOOL)isOwnerUser
{
  return self->_ownerUser;
}

- (void)setHomeIndex:(unint64_t)a3
{
  self->_homeIndex = a3;
}

- (unint64_t)homeIndex
{
  return self->_homeIndex;
}

- (HMDHomeConfigurationLogEvent)initWithIsOwnerUser:(BOOL)a3 isResidentAvailable:(BOOL)a4 isPrimaryReportingDevice:(BOOL)a5 isCurrentDeviceResidentEnabled:(BOOL)a6 isPrimaryResident:(BOOL)a7 isCurrentDeviceLocalToHome:(BOOL)a8 isNetworkProtectionEnabled:(BOOL)a9 isUserRoeProvisioned:(BOOL)a10 isResidentFirstEnabled:(BOOL)a11 isResidentElectionV2Enabled:(BOOL)a12 isSmokeAlarmEnabled:(BOOL)a13
{
  result = [(HMDHomeConfigurationLogEvent *)self initForUnitTesting];
  if (result)
  {
    result->_ownerUser = a3;
    result->_isResidentAvailable = a4;
    result->_primaryReportingDevice = a5;
    result->_isCurrentDeviceResidentEnabled = a6;
    result->_isCurrentDevicePrimaryResident = a7;
    result->_isCurrentDeviceLocalToHome = a8;
    result->_networkProtectionEnabled = a9;
    result->_hasHomeKeyInWallet = a10;
    result->_isResidentFirstEnabled = a11;
    result->_isResidentElectionV2Enabled = a12;
    result->_isSmokeAlarmEnabled = a13;
  }
  return result;
}

- (id)initForUnitTesting
{
  v3 = [MEMORY[0x263F08C38] UUID];
  v6.receiver = self;
  v6.super_class = (Class)HMDHomeConfigurationLogEvent;
  v4 = [(HMMHomeLogEvent *)&v6 initWithHomeUUID:v3];

  return v4;
}

- (BOOL)isSubmitted
{
  return 0;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent homeIndex](self, "homeIndex"));
  [v3 setObject:v4 forKeyedSubscript:@"homeIndex"];

  v5 = [(HMMHomeLogEvent *)self homeUUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"homeUUID"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent homeCategoryBitMask](self, "homeCategoryBitMask"));
  [v3 setObject:v6 forKeyedSubscript:@"homeCategoryBitMask"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent appleMediaCategoryBitMask](self, "appleMediaCategoryBitMask"));
  [v3 setObject:v7 forKeyedSubscript:@"appleMediaCategoryBitMask"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent thirdPartyMediaCategoryBitMask](self, "thirdPartyMediaCategoryBitMask"));
  [v3 setObject:v8 forKeyedSubscript:@"thirdPartyMediaCategoryBitMask"];

  if ([(HMDHomeConfigurationLogEvent *)self isOwnerUser]) {
    v9 = &unk_26E471698;
  }
  else {
    v9 = &unk_26E4716B0;
  }
  [v3 setObject:v9 forKeyedSubscript:@"isOwnerUser"];
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isOwnerUser](self, "isOwnerUser"));
  [v3 setObject:v10 forKeyedSubscript:@"isOwnerUserBool"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent currentUserPrivilege](self, "currentUserPrivilege"));
  [v3 setObject:v11 forKeyedSubscript:@"currentUserPrivilege"];

  if ([(HMDHomeConfigurationLogEvent *)self isAccessToHomeAllowed]) {
    v12 = &unk_26E471698;
  }
  else {
    v12 = &unk_26E4716B0;
  }
  [v3 setObject:v12 forKeyedSubscript:@"isAccessToHomeAllowed"];
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isAccessToHomeAllowed](self, "isAccessToHomeAllowed"));
  [v3 setObject:v13 forKeyedSubscript:@"isAccessToHomeAllowedBool"];

  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDHomeConfigurationLogEvent networkProtectionStatus](self, "networkProtectionStatus"));
  [v3 setObject:v14 forKeyedSubscript:@"networkProtectionStatus"];

  if ([(HMDHomeConfigurationLogEvent *)self isResidentAvailable]) {
    v15 = &unk_26E471698;
  }
  else {
    v15 = &unk_26E4716B0;
  }
  [v3 setObject:v15 forKeyedSubscript:@"isResidentAvailable"];
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentAvailable](self, "isResidentAvailable"));
  [v3 setObject:v16 forKeyedSubscript:@"isResidentAvailableBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isAutomaticThirdPartyAccessorySoftwareUpdateEnabled])
  {
    v17 = &unk_26E471698;
  }
  else
  {
    v17 = &unk_26E4716B0;
  }
  [v3 setObject:v17 forKeyedSubscript:@"isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"];
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isAutomaticThirdPartyAccessorySoftwareUpdateEnabled](self, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"));
  [v3 setObject:v18 forKeyedSubscript:@"isAutomaticThirdPartyAccessorySoftwareUpdateEnabledBool"];

  if ([(HMDHomeConfigurationLogEvent *)self primaryReportingDevice]) {
    v19 = &unk_26E471698;
  }
  else {
    v19 = &unk_26E4716B0;
  }
  [v3 setObject:v19 forKeyedSubscript:@"primaryReportingDevice"];
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent primaryReportingDevice](self, "primaryReportingDevice"));
  [v3 setObject:v20 forKeyedSubscript:@"primaryReportingDeviceBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isCurrentDevicePrimaryResident]) {
    v21 = &unk_26E471698;
  }
  else {
    v21 = &unk_26E4716B0;
  }
  [v3 setObject:v21 forKeyedSubscript:@"isPrimaryResident"];
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"));
  [v3 setObject:v22 forKeyedSubscript:@"isPrimaryResidentBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isCurrentDeviceResidentEnabled]) {
    v23 = &unk_26E471698;
  }
  else {
    v23 = &unk_26E4716B0;
  }
  [v3 setObject:v23 forKeyedSubscript:@"isCurrentDeviceResidentEnabled"];
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isCurrentDeviceResidentEnabled](self, "isCurrentDeviceResidentEnabled"));
  [v3 setObject:v24 forKeyedSubscript:@"isCurrentDeviceResidentEnabledBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isCurrentDeviceLocalToHome]) {
    v25 = &unk_26E471698;
  }
  else {
    v25 = &unk_26E4716B0;
  }
  [v3 setObject:v25 forKeyedSubscript:@"isCurrentDeviceLocalToHome"];
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isCurrentDeviceLocalToHome](self, "isCurrentDeviceLocalToHome"));
  [v3 setObject:v26 forKeyedSubscript:@"isCurrentDeviceLocalToHomeBool"];

  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentFirstEnabled](self, "isResidentFirstEnabled"));
  [v3 setObject:v27 forKeyedSubscript:@"isResidentFirstEnabled"];

  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentFirstEnabled](self, "isResidentFirstEnabled"));
  [v3 setObject:v28 forKeyedSubscript:@"isResidentFirstEnabledBool"];

  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentElectionV2Enabled](self, "isResidentElectionV2Enabled"));
  [v3 setObject:v29 forKeyedSubscript:@"isResidentElectionV2Enabled"];

  v30 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentElectionV2Enabled](self, "isResidentElectionV2Enabled"));
  [v3 setObject:v30 forKeyedSubscript:@"isResidentElectionV2EnabledBool"];

  if ([(HMDHomeConfigurationLogEvent *)self networkProtectionEnabled]) {
    v31 = &unk_26E471698;
  }
  else {
    v31 = &unk_26E4716B0;
  }
  [v3 setObject:v31 forKeyedSubscript:@"networkProtectionEnabled"];
  v32 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent networkProtectionEnabled](self, "networkProtectionEnabled"));
  [v3 setObject:v32 forKeyedSubscript:@"networkProtectionEnabledBool"];

  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessories](self, "numAccessories"));
  [v3 setObject:v33 forKeyedSubscript:@"numAccessories"];

  v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCertifiedAccessories](self, "numCertifiedAccessories"));
  [v3 setObject:v34 forKeyedSubscript:@"numCertifiedAccessories"];

  v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numBridgedAccessories](self, "numBridgedAccessories"));
  [v3 setObject:v35 forKeyedSubscript:@"numBridgedAccessories"];

  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numNotCertifiedAccessories](self, "numNotCertifiedAccessories"));
  [v3 setObject:v36 forKeyedSubscript:@"numNotCertifiedAccessories"];

  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numSmartHomeAccessories](self, "numSmartHomeAccessories"));
  [v3 setObject:v37 forKeyedSubscript:@"numSmartHomeAccessories"];

  v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThirdPartyMediaAccessories](self, "numThirdPartyMediaAccessories"));
  [v3 setObject:v38 forKeyedSubscript:@"numThirdPartyMediaAccessories"];

  v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAppleMediaAccessories](self, "numAppleMediaAccessories"));
  [v3 setObject:v39 forKeyedSubscript:@"numAppleMediaAccessories"];

  v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAppleAudioAccessories](self, "numAppleAudioAccessories"));
  [v3 setObject:v40 forKeyedSubscript:@"numAppleAudioAccessories"];

  v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePods](self, "numHomePods"));
  [v3 setObject:v41 forKeyedSubscript:@"numHomePods"];

  v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePodStereoPairs](self, "numHomePodStereoPairs"));
  [v3 setObject:v42 forKeyedSubscript:@"numHomePodStereoPairs"];

  v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePodMinis](self, "numHomePodMinis"));
  [v3 setObject:v43 forKeyedSubscript:@"numHomePodMinis"];

  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePodMiniStereoPairs](self, "numHomePodMiniStereoPairs"));
  [v3 setObject:v44 forKeyedSubscript:@"numHomePodMiniStereoPairs"];

  v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePod2ndGen](self, "numHomePod2ndGen"));
  [v3 setObject:v45 forKeyedSubscript:@"numVoeAccessories"];

  v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHomePod2ndGenStereoPairs](self, "numHomePod2ndGenStereoPairs"));
  [v3 setObject:v46 forKeyedSubscript:@"numVoe2Accessories"];

  v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numMediaSystems](self, "numMediaSystems"));
  [v3 setObject:v47 forKeyedSubscript:@"numMediaSystems"];

  v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAppleTVAccessories](self, "numAppleTVAccessories"));
  [v3 setObject:v48 forKeyedSubscript:@"numAppleTVAccessories"];

  v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAppleTV4K2ndGenAccessories](self, "numAppleTV4K2ndGenAccessories"));
  [v3 setObject:v49 forKeyedSubscript:@"numAppleTV4K2ndGenAccessories"];

  v50 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeConfigurationLogEvent currentMediaAccessoryFallbackMediaUserType](self, "currentMediaAccessoryFallbackMediaUserType"));
  [v3 setObject:v50 forKeyedSubscript:@"currentMediaAccessoryFallbackMediaUserType"];

  v51 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTelevisionServiceAccessories](self, "numTelevisionServiceAccessories"));
  [v3 setObject:v51 forKeyedSubscript:@"numTelevisionServiceAccessories"];

  v52 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTelevisionAccessories](self, "numTelevisionAccessories"));
  [v3 setObject:v52 forKeyedSubscript:@"numTelevisionAccessories"];

  v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTelevisionSetTopBoxAccessories](self, "numTelevisionSetTopBoxAccessories"));
  [v3 setObject:v53 forKeyedSubscript:@"numTelevisionSetTopBoxAccessories"];

  v54 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTelevisionStreamingStickAccessories](self, "numTelevisionStreamingStickAccessories"));
  [v3 setObject:v54 forKeyedSubscript:@"numTelevisionStreamingStickAccessories"];

  v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThirdPartyAudioAccessories](self, "numThirdPartyAudioAccessories"));
  [v3 setObject:v55 forKeyedSubscript:@"numThirdPartyAudioAccessories"];

  v56 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPSpeakerServiceAccessories](self, "numHAPSpeakerServiceAccessories"));
  [v3 setObject:v56 forKeyedSubscript:@"numHAPSpeakerServiceAccessories"];

  v57 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numPrimaryHAPSpeakerServiceAccessories](self, "numPrimaryHAPSpeakerServiceAccessories"));
  [v3 setObject:v57 forKeyedSubscript:@"numPrimaryHAPSpeakerServiceAccessories"];

  v58 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numWholeHouseAudioAccessories](self, "numWholeHouseAudioAccessories"));
  [v3 setObject:v58 forKeyedSubscript:@"numWholeHouseAudioAccessories"];

  v59 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCapableSiriEndpointAccessories](self, "numCapableSiriEndpointAccessories"));
  [v3 setObject:v59 forKeyedSubscript:@"numCapableSiriEndpointAccessories"];

  v60 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numEnabledSiriEndpointAccessories](self, "numEnabledSiriEndpointAccessories"));
  [v3 setObject:v60 forKeyedSubscript:@"numEnabledSiriEndpointAccessories"];

  v61 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesWiFiPPSKCredential](self, "numAccessoriesWiFiPPSKCredential"));
  [v3 setObject:v61 forKeyedSubscript:@"numAccessoriesWiFiPPSKCredential"];

  v62 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionUnprotected](self, "numAccessoriesNetworkProtectionUnprotected"));
  [v3 setObject:v62 forKeyedSubscript:@"numAccessoriesNetworkProtectionUnprotected"];

  v63 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionAutoFullAccess](self, "numAccessoriesNetworkProtectionAutoFullAccess"));
  [v3 setObject:v63 forKeyedSubscript:@"numAccessoriesNetworkProtectionAutoFullAccess"];

  v64 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionAutoProtectedMainLAN](self, "numAccessoriesNetworkProtectionAutoProtectedMainLAN"));
  [v3 setObject:v64 forKeyedSubscript:@"numAccessoriesNetworkProtectionAutoProtectedMainLAN"];

  v65 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN](self, "numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN"));
  [v3 setObject:v65 forKeyedSubscript:@"numAccessoriesNetworkProtectionAutoProtectedHomeKitLAN"];

  v66 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionFullAccess](self, "numAccessoriesNetworkProtectionFullAccess"));
  [v3 setObject:v66 forKeyedSubscript:@"numAccessoriesNetworkProtectionFullAccess"];

  v67 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesNetworkProtectionHomeKitOnly](self, "numAccessoriesNetworkProtectionHomeKitOnly"));
  [v3 setObject:v67 forKeyedSubscript:@"numAccessoriesNetworkProtectionHomeKitOnly"];

  v68 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPAccessories](self, "numHAPAccessories"));
  [v3 setObject:v68 forKeyedSubscript:@"numHAPAccessories"];

  v69 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCHIPAccessories](self, "numCHIPAccessories"));
  [v3 setObject:v69 forKeyedSubscript:@"numMatterAccessories"];

  v70 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPAccessoriesFirmwareUpdateEligible](self, "numHAPAccessoriesFirmwareUpdateEligible"));
  [v3 setObject:v70 forKeyedSubscript:@"numHAPAccessoriesFirmwareUpdateEligible"];

  v71 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCHIPAccessoriesFirmwareUpdateEligible](self, "numCHIPAccessoriesFirmwareUpdateEligible"));
  [v3 setObject:v71 forKeyedSubscript:@"numMatterAccessoriesFirmwareUpdateEligible"];

  v72 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numIPAccessories](self, "numIPAccessories"));
  [v3 setObject:v72 forKeyedSubscript:@"numIPAccessories"];

  v73 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numBTAccessories](self, "numBTAccessories"));
  [v3 setObject:v73 forKeyedSubscript:@"numBTAccessories"];

  v74 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numBTOnlyAccessories](self, "numBTOnlyAccessories"));
  [v3 setObject:v74 forKeyedSubscript:@"numBTOnlyAccessories"];

  v75 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessories](self, "numThreadAccessories"));
  [v3 setObject:v75 forKeyedSubscript:@"numThreadAccessories"];

  v76 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPIPAccessories](self, "numHAPIPAccessories"));
  [v3 setObject:v76 forKeyedSubscript:@"numHAPIPAccessories"];

  v77 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPBTAccessories](self, "numHAPBTAccessories"));
  [v3 setObject:v77 forKeyedSubscript:@"numHAPBTAccessories"];

  v78 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPBatteryServiceAccessories](self, "numHAPBatteryServiceAccessories"));
  [v3 setObject:v78 forKeyedSubscript:@"numHAPBatteryServiceAccessories"];

  v79 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadBorderRouters](self, "numThreadBorderRouters"));
  [v3 setObject:v79 forKeyedSubscript:@"numThreadBorderRouters"];

  v80 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessoryMinCapable](self, "numThreadAccessoryMinCapable"));
  [v3 setObject:v80 forKeyedSubscript:@"numThreadAccessoryMinCapable"];

  v81 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessorySleepCapable](self, "numThreadAccessorySleepCapable"));
  [v3 setObject:v81 forKeyedSubscript:@"numThreadAccessorySleepCapable"];

  v82 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessoryFullCapable](self, "numThreadAccessoryFullCapable"));
  [v3 setObject:v82 forKeyedSubscript:@"numThreadAccessoryFullCapable"];

  v83 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessoryRouterCapable](self, "numThreadAccessoryRouterCapable"));
  [v3 setObject:v83 forKeyedSubscript:@"numThreadAccessoryRouterCapable"];

  v84 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numThreadAccessoryBorderRouterCapable](self, "numThreadAccessoryBorderRouterCapable"));
  [v3 setObject:v84 forKeyedSubscript:@"numThreadAccessoryBorderRouterCapable"];

  v85 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCameraAccessories](self, "numCameraAccessories"));
  [v3 setObject:v85 forKeyedSubscript:@"numCameraAccessories"];

  v86 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCameraAccessoriesSupportRecording](self, "numCameraAccessoriesSupportRecording"));
  [v3 setObject:v86 forKeyedSubscript:@"numCameraAccessoriesSupportRecording"];

  v87 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCameraAccessoriesRecordingEnabled](self, "numCameraAccessoriesRecordingEnabled"));
  [v3 setObject:v87 forKeyedSubscript:@"numCameraAccessoriesRecordingEnabled"];

  v88 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCameraAccessoriesReachabilityNotificationEnabled](self, "numCameraAccessoriesReachabilityNotificationEnabled"));
  [v3 setObject:v88 forKeyedSubscript:@"numCameraAccessoriesReachabilityNotificationEnabled"];

  v89 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCameraAccessoriesWithActivityZonesEnabled](self, "numCameraAccessoriesWithActivityZonesEnabled"));
  [v3 setObject:v89 forKeyedSubscript:@"numCameraAccessoriesWithActivityZonesEnabled"];

  v90 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numLightProfilesWithNaturalLightingSupported](self, "numLightProfilesWithNaturalLightingSupported"));
  [v3 setObject:v90 forKeyedSubscript:@"numLightProfilesWithNaturalLightingSupported"];

  v91 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numLightProfilesWithNaturalLightingEnabled](self, "numLightProfilesWithNaturalLightingEnabled"));
  [v3 setObject:v91 forKeyedSubscript:@"numLightProfilesWithNaturalLightingEnabled"];

  v92 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numLightProfilesWithNaturalLightingUsed](self, "numLightProfilesWithNaturalLightingUsed"));
  [v3 setObject:v92 forKeyedSubscript:@"numLightProfilesWithNaturalLightingUsed"];

  v93 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numResidentsEnabled](self, "numResidentsEnabled"));
  [v3 setObject:v93 forKeyedSubscript:@"numResidentsEnabled"];

  v94 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent enabledResidentsDeviceCapabilities](self, "enabledResidentsDeviceCapabilities"));
  [v3 setObject:v94 forKeyedSubscript:@"enabledResidentsDeviceCapabilities"];

  v95 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTriggers](self, "numTriggers"));
  [v3 setObject:v95 forKeyedSubscript:@"numTriggers"];

  v96 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numActiveTriggers](self, "numActiveTriggers"));
  [v3 setObject:v96 forKeyedSubscript:@"numActiveTriggers"];

  v97 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numEventTriggers](self, "numEventTriggers"));
  [v3 setObject:v97 forKeyedSubscript:@"numEventTriggers"];

  v98 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTimerTriggers](self, "numTimerTriggers"));
  [v3 setObject:v98 forKeyedSubscript:@"numTimerTriggers"];

  v99 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numShortcuts](self, "numShortcuts"));
  [v3 setObject:v99 forKeyedSubscript:@"numShortcuts"];

  v100 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numScenes](self, "numScenes"));
  [v3 setObject:v100 forKeyedSubscript:@"numScenes"];

  v101 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numConfiguredScenes](self, "numConfiguredScenes"));
  [v3 setObject:v101 forKeyedSubscript:@"numConfiguredScenes"];

  v102 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTriggerOwnedConfiguredScenes](self, "numTriggerOwnedConfiguredScenes"));
  [v3 setObject:v102 forKeyedSubscript:@"numTriggerOwnedConfiguredScenes"];

  v103 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numTargetControllers](self, "numTargetControllers"));
  [v3 setObject:v103 forKeyedSubscript:@"numTargetControllers"];

  v104 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCertifiedTargetControllers](self, "numCertifiedTargetControllers"));
  [v3 setObject:v104 forKeyedSubscript:@"numCertifiedTargetControllers"];

  v105 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numBridgedTargetControllers](self, "numBridgedTargetControllers"));
  [v3 setObject:v105 forKeyedSubscript:@"numBridgedTargetControllers"];

  v106 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numCertifiedBridgedTargetControllers](self, "numCertifiedBridgedTargetControllers"));
  [v3 setObject:v106 forKeyedSubscript:@"numCertifiedBridgedTargetControllers"];

  v107 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeConfigurationLogEvent numUsers](self, "numUsers"));
  [v3 setObject:v107 forKeyedSubscript:@"numUsers"];

  v108 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeConfigurationLogEvent numAdmins](self, "numAdmins"));
  [v3 setObject:v108 forKeyedSubscript:@"numAdmins"];

  v109 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeConfigurationLogEvent numRestrictedGuests](self, "numRestrictedGuests"));
  [v3 setObject:v109 forKeyedSubscript:@"numRestrictedGuests"];

  v110 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent userPrivilegeBitMask](self, "userPrivilegeBitMask"));
  [v3 setObject:v110 forKeyedSubscript:@"userPrivilegeBitMask"];

  v111 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numRooms](self, "numRooms"));
  [v3 setObject:v111 forKeyedSubscript:@"numRooms"];

  v112 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numZones](self, "numZones"));
  [v3 setObject:v112 forKeyedSubscript:@"numZones"];

  v113 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numServices](self, "numServices"));
  [v3 setObject:v113 forKeyedSubscript:@"numServices"];

  v114 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoryServiceGroups](self, "numAccessoryServiceGroups"));
  [v3 setObject:v114 forKeyedSubscript:@"numAccessoryServiceGroups"];

  v115 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeConfigurationLogEvent homeCreationCohortWeek](self, "homeCreationCohortWeek"));
  [v3 setObject:v115 forKeyedSubscript:@"homeCreationCohortWeek"];

  v116 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeConfigurationLogEvent firstHAPAccessoryAddedCohortWeek](self, "firstHAPAccessoryAddedCohortWeek"));
  [v3 setObject:v116 forKeyedSubscript:@"firstHAPAccessoryAddedCohortWeek"];

  v117 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomeConfigurationLogEvent numConfiguredWidgets](self, "numConfiguredWidgets"));
  [v3 setObject:v117 forKeyedSubscript:@"numHomeWidgetsEnabled"];

  v118 = [(HMDHomeConfigurationLogEvent *)self numBSPs];

  if (v118)
  {
    v119 = [(HMDHomeConfigurationLogEvent *)self numBSPs];
    [v3 setObject:v119 forKeyedSubscript:@"numBSPs"];
  }
  v120 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numWoLAccessories](self, "numWoLAccessories"));
  [v3 setObject:v120 forKeyedSubscript:@"numWoLAccessories"];

  v121 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDHomeConfigurationLogEvent databaseSize](self, "databaseSize"));
  [v3 setObject:v121 forKeyedSubscript:@"databaseSize"];

  v122 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDHomeConfigurationLogEvent metadataVersion](self, "metadataVersion"));
  [v3 setObject:v122 forKeyedSubscript:@"metadataVersion"];

  v123 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numHAPLocks](self, "numHAPLocks"));
  [v3 setObject:v123 forKeyedSubscript:@"numHAPLocks"];

  v124 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numMatterLocks](self, "numMatterLocks"));
  [v3 setObject:v124 forKeyedSubscript:@"numMatterLocks"];

  v125 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numLocksWithAccessCodeSupported](self, "numLocksWithAccessCodeSupported"));
  [v3 setObject:v125 forKeyedSubscript:@"numLocksWithAccessCodeSupported"];

  v126 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numLocksWithWalletKeySupported](self, "numLocksWithWalletKeySupported"));
  [v3 setObject:v126 forKeyedSubscript:@"numLocksWithWalletKeySupported"];

  if ([(HMDHomeConfigurationLogEvent *)self isOwnerUser])
  {
    v127 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent ownerPerspectiveNumUsersWithAccessCode](self, "ownerPerspectiveNumUsersWithAccessCode"));
    [v3 setObject:v127 forKeyedSubscript:@"ownerPerspectiveNumUsersWithAccessCode"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"ownerPerspectiveNumUsersWithAccessCode"];
  }
  if ([(HMDHomeConfigurationLogEvent *)self hasHomeKeyInWallet]) {
    v128 = &unk_26E471698;
  }
  else {
    v128 = &unk_26E4716B0;
  }
  [v3 setObject:v128 forKeyedSubscript:@"isWalletKeyProvisioned"];
  v129 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent hasHomeKeyInWallet](self, "hasHomeKeyInWallet"));
  [v3 setObject:v129 forKeyedSubscript:@"isWalletKeyProvisionedBool"];

  v130 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesWithWalletKeySupported](self, "numAccessoriesWithWalletKeySupported"));
  [v3 setObject:v130 forKeyedSubscript:@"numRoeAccessories"];

  if ([(HMDHomeConfigurationLogEvent *)self hasHomeKeyInWallet]) {
    v131 = &unk_26E471698;
  }
  else {
    v131 = &unk_26E4716B0;
  }
  [v3 setObject:v131 forKeyedSubscript:@"isUserRoeProvisioned"];
  v132 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent hasHomeKeyInWallet](self, "hasHomeKeyInWallet"));
  [v3 setObject:v132 forKeyedSubscript:@"isUserRoeProvisionedBool"];

  v133 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numRVCs](self, "numRVCs"));
  [v3 setObject:v133 forKeyedSubscript:@"numRVCs"];

  if ([(HMDHomeConfigurationLogEvent *)self isSmokeAlarmEnabled]) {
    v134 = &unk_26E471698;
  }
  else {
    v134 = &unk_26E4716B0;
  }
  [v3 setObject:v134 forKeyedSubscript:@"isXoeEnabled"];
  v135 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isSmokeAlarmEnabled](self, "isSmokeAlarmEnabled"));
  [v3 setObject:v135 forKeyedSubscript:@"isXoeEnabledBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isSiriPhraseOptionsHeySiriEnabled]) {
    v136 = &unk_26E471698;
  }
  else {
    v136 = &unk_26E4716B0;
  }
  [v3 setObject:v136 forKeyedSubscript:@"isSiriPhraseOptionsHeySiriEnabled"];
  v137 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isSiriPhraseOptionsHeySiriEnabled](self, "isSiriPhraseOptionsHeySiriEnabled"));
  [v3 setObject:v137 forKeyedSubscript:@"isSiriPhraseOptionsHeySiriEnabledBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isSiriPhraseOptionsJustSiriEnabled]) {
    v138 = &unk_26E471698;
  }
  else {
    v138 = &unk_26E4716B0;
  }
  [v3 setObject:v138 forKeyedSubscript:@"isSiriPhraseOptionsJustSiriEnabled"];
  v139 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isSiriPhraseOptionsJustSiriEnabled](self, "isSiriPhraseOptionsJustSiriEnabled"));
  [v3 setObject:v139 forKeyedSubscript:@"isSiriPhraseOptionsJustSiriEnabledBool"];

  v140 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent residentElectionBitMask](self, "residentElectionBitMask"));
  [v3 setObject:v140 forKeyedSubscript:@"residentElectionBitMask"];

  v141 = (void *)[v3 copy];
  return (NSDictionary *)v141;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.config.home";
}

- (unint64_t)currentUserPrivilegeBitMask
{
  unint64_t v2 = [(HMDHomeConfigurationLogEvent *)self currentUserPrivilege];
  if (v2 - 1 > 4) {
    return 1;
  }
  else {
    return qword_2303E4250[v2 - 1];
  }
}

- (unint64_t)numThirdPartyAudioAccessories
{
  unint64_t v3 = [(HMDHomeConfigurationLogEvent *)self numPrimaryHAPSpeakerServiceAccessories];
  return [(HMDHomeConfigurationLogEvent *)self numWholeHouseAudioAccessories] + v3;
}

- (unint64_t)numTelevisionServiceAccessories
{
  unint64_t v3 = [(HMDHomeConfigurationLogEvent *)self numTelevisionAccessories];
  unint64_t v4 = [(HMDHomeConfigurationLogEvent *)self numTelevisionSetTopBoxAccessories] + v3;
  return v4
       + [(HMDHomeConfigurationLogEvent *)self numTelevisionStreamingStickAccessories];
}

- (void)updateConfigWithAccessory:(id)a3 reportNetworkProtectionMetrics:(BOOL)a4 networkProtectionEnabled:(BOOL)a5 hapServiceTypes:(id)a6 primaryHAPServiceTypes:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v138 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v116 = a7;
  id v14 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  id v17 = v14;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v117 = v18;

  id v19 = v17;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v115 = v20;

  id v21 = v19;
  if ([v21 conformsToProtocol:&unk_26E4FFCC0]) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v114 = v22;
  v118 = v21;

  if (v16)
  {
    v23 = [v16 hostAccessory];
    objc_opt_class();
    v24 = (objc_opt_isKindOfClass() & 1) != 0 ? v23 : 0;
    id v25 = v24;

    if (v25) {
      goto LABEL_182;
    }
  }
  if (v10)
  {
    if ([v118 wiFiCredentialType] == 3) {
      ++self->_numAccessoriesWiFiPPSKCredential;
    }
    if (v9)
    {
      id v26 = v118;
      if ([v26 supportsNetworkProtection])
      {
        v27 = [v26 networkClientIdentifier];

        if (v27)
        {
          uint64_t v28 = [v26 targetNetworkProtectionMode];
          uint64_t v29 = [v26 currentNetworkProtectionMode];
          if (!v28 && v29 == 4)
          {

            uint64_t v30 = 368;
            goto LABEL_166;
          }
          if (!v28 && v29 == 2)
          {
            uint64_t v96 = [v26 networkClientLAN];

            if (v96 == 3) {
              uint64_t v30 = 384;
            }
            else {
              uint64_t v30 = 376;
            }
LABEL_166:
            ++*(Class *)((char *)&self->super.super.super.isa + v30);
            if (!v16) {
              goto LABEL_167;
            }
LABEL_32:
            uint64_t v113 = [v16 certificationStatus];
            if (v113 == 2)
            {
              v33 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numCertifiedAccessories;
            }
            else
            {
              if ([v16 certificationStatus] != 1) {
                goto LABEL_37;
              }
              v33 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numNotCertifiedAccessories;
            }
            ++*(Class *)((char *)&self->super.super.super.isa + *v33);
LABEL_37:
            if (![v16 supportsHAP])
            {
              if (![v16 supportsCHIP])
              {
LABEL_81:
                unsigned int v60 = objc_msgSend(v16, "metric_threadCapabilities");
                if ([v16 hasIPLink] && objc_msgSend(v16, "isPrimary"))
                {
                  ++self->_numIPAccessories;
                }
                else if ([v16 hasBTLELink] && objc_msgSend(v16, "isPrimary"))
                {
                  ++self->_numBTAccessories;
                  if (!v60)
                  {
                    v61 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numBTOnlyAccessories;
                    unint64_t v62 = 1;
LABEL_90:
                    *(Class *)((char *)&self->super.super.super.isa + *v61) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                               + *v61)
                                                                                    + v62);
LABEL_91:
                    if (([v16 isPrimary] & 1) == 0) {
                      ++self->_numBridgedAccessories;
                    }
                    long long v121 = 0u;
                    long long v122 = 0u;
                    long long v119 = 0u;
                    long long v120 = 0u;
                    v63 = [v16 services];
                    uint64_t v64 = [v63 countByEnumeratingWithState:&v119 objects:v135 count:16];
                    if (v64)
                    {
                      uint64_t v65 = v64;
                      uint64_t v66 = *(void *)v120;
                      do
                      {
                        for (uint64_t i = 0; i != v65; ++i)
                        {
                          if (*(void *)v120 != v66) {
                            objc_enumerationMutation(v63);
                          }
                          v68 = [*(id *)(*((void *)&v119 + 1) + 8 * i) type];
                          [v13 addObject:v68];
                        }
                        uint64_t v65 = [v63 countByEnumeratingWithState:&v119 objects:v135 count:16];
                      }
                      while (v65);
                    }

                    v69 = +[HMDMetricsUtilities primaryServiceTypeForHAPAccessory:v16];
                    if (v69) {
                      [v116 addObject:v69];
                    }
                    v70 = [v16 findServiceWithServiceType:*MEMORY[0x263F0D640]];

                    if (v70) {
                      ++self->_numHAPBatteryServiceAccessories;
                    }
                    if ([v16 supportsWoL]) {
                      ++self->_numWoLAccessories;
                    }
                    if ([v16 supportsTargetController])
                    {
                      ++self->_numTargetControllers;
                      if (v113 == 2) {
                        ++self->_numCertifiedTargetControllers;
                      }
                      if (([v16 isPrimary] & 1) == 0)
                      {
                        ++self->_numBridgedTargetControllers;
                        if (v113 == 2) {
                          ++self->_numCertifiedBridgedTargetControllers;
                        }
                      }
                    }
                    if ([v16 hasCameraStreamService])
                    {
                      ++self->_numCameraAccessories;
                      if ([v16 isCameraRecordingFeatureSupported]) {
                        ++self->_numCameraAccessoriesSupportRecording;
                      }
                      v71 = [v16 cameraProfileSettingsManager];
                      if ([v71 isRecordingEnabled]) {
                        ++self->_numCameraAccessoriesRecordingEnabled;
                      }
                      v72 = [v71 currentSettings];
                      v73 = [v72 notificationSettings];
                      int v74 = [v73 isReachabilityEventNotificationEnabled];

                      if (v74) {
                        ++self->_numCameraAccessoriesReachabilityNotificationEnabled;
                      }
                      v75 = [v71 currentSettings];
                      v76 = [v75 activityZones];
                      uint64_t v77 = [v76 count];

                      if (v77) {
                        ++self->_numCameraAccessoriesWithActivityZonesEnabled;
                      }
                    }
                    if (![v16 hasTelevisionService])
                    {
                      uint64_t v82 = 1;
LABEL_132:
                      if ([v16 hasSmartSpeakerService])
                      {
                        ++self->_numHAPSpeakerServiceAccessories;
                        if ([v69 isEqual:@"00000228-0000-1000-8000-0026BB765291"])
                        {
                          ++self->_numPrimaryHAPSpeakerServiceAccessories;
                          uint64_t v82 = 3;
                        }
                      }
                      if ([v16 hasSiriEndpointService]) {
                        ++self->_numCapableSiriEndpointAccessories;
                      }
                      if (self->_isCurrentDevicePrimaryResident)
                      {
                        v89 = [v16 siriEndpointProfile];
                        v90 = v89;
                        if (v89
                          && ([v89 siriTouchToUse] == 1 || objc_msgSend(v90, "siriListening") == 1))
                        {
                          ++self->_numEnabledSiriEndpointAccessories;
                        }
                      }
                      v91 = [v16 category];
                      v92 = [v91 categoryType];
                      int v93 = [v92 isEqualToString:*MEMORY[0x263F0B058]];

                      if (v93)
                      {
                        if ([v16 supportsHAP]) {
                          ++self->_numHAPLocks;
                        }
                        if ([v16 supportsCHIP]) {
                          ++self->_numMatterLocks;
                        }
                        if ([v16 supportsAccessCode]) {
                          ++self->_numLocksWithAccessCodeSupported;
                        }
                        if ([v16 supportsWalletKey]) {
                          ++self->_numLocksWithWalletKeySupported;
                        }
                      }
                      v94 = [v16 services];
                      self->_numServices += [v94 count];

                      if (v82 != 3)
                      {
                        uint64_t v95 = 152;
LABEL_181:
                        ++*(Class *)((char *)&self->super.super.super.isa + v95);
                        goto LABEL_182;
                      }
LABEL_173:
                      uint64_t v95 = 160;
                      goto LABEL_181;
                    }
                    v78 = [v16 category];
                    v79 = [v78 categoryType];
                    char v80 = [v79 isEqualToString:*MEMORY[0x263F0B170]];

                    if (v80)
                    {
                      v81 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numTelevisionAccessories;
                    }
                    else
                    {
                      v83 = [v16 category];
                      v84 = [v83 categoryType];
                      char v85 = [v84 isEqualToString:*MEMORY[0x263F0B188]];

                      if (v85)
                      {
                        v81 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numTelevisionSetTopBoxAccessories;
                      }
                      else
                      {
                        v86 = [v16 category];
                        v87 = [v86 categoryType];
                        int v88 = [v87 isEqualToString:*MEMORY[0x263F0B198]];

                        if (!v88)
                        {
LABEL_131:
                          uint64_t v82 = 3;
                          goto LABEL_132;
                        }
                        v81 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numTelevisionStreamingStickAccessories;
                      }
                    }
                    ++*(Class *)((char *)&self->super.super.super.isa + *v81);
                    goto LABEL_131;
                  }
LABEL_89:
                  ++self->_numThreadAccessories;
                  self->_numThreadAccessoryMinCapable += v60 & 1;
                  self->_numThreadAccessorySleepCapable += ((unint64_t)v60 >> 1) & 1;
                  self->_numThreadAccessoryFullCapable += ((unint64_t)v60 >> 2) & 1;
                  self->_numThreadAccessoryRouterCapable += ((unint64_t)v60 >> 3) & 1;
                  unint64_t v62 = ((unint64_t)v60 >> 4) & 1;
                  v61 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numThreadAccessoryBorderRouterCapable;
                  goto LABEL_90;
                }
                if (!v60) {
                  goto LABEL_91;
                }
                goto LABEL_89;
              }
              ++self->_numCHIPAccessories;
              v36 = [v16 firmwareUpdateProfile];

              if (v36) {
                ++self->_numCHIPAccessoriesFirmwareUpdateEligible;
              }
              long long v125 = 0u;
              long long v126 = 0u;
              long long v123 = 0u;
              long long v124 = 0u;
              v37 = [v16 lightProfiles];
              uint64_t v38 = [v37 countByEnumeratingWithState:&v123 objects:v136 count:16];
              if (v38)
              {
                uint64_t v39 = v38;
                id v111 = v16;
                id v112 = v13;
                uint64_t v40 = *(void *)v124;
                do
                {
                  for (uint64_t j = 0; j != v39; ++j)
                  {
                    if (*(void *)v124 != v40) {
                      objc_enumerationMutation(v37);
                    }
                    v42 = *(void **)(*((void *)&v123 + 1) + 8 * j);
                    if (objc_msgSend(v42, "isNaturalLightingSupported", v111, v112)) {
                      ++self->_numMatterLightProfilesWithNaturalLightingSupported;
                    }
                    v43 = [MEMORY[0x263EFF910] date];
                    v44 = [v43 dateByAddingTimeInterval:-86400.0];

                    if (([v42 isNaturalLightingEnabled] & 1) != 0
                      || ([v42 mostRecentNaturalLightingEnabledDate],
                          v45 = objc_claimAutoreleasedReturnValue(),
                          uint64_t v46 = [v45 compare:v44],
                          v45,
                          v46 == 1))
                    {
                      ++self->_numMatterLightProfilesWithNaturalLightingEnabled;
                    }
                    v47 = [v42 mostRecentNaturalLightingUsedDate];
                    uint64_t v48 = [v47 compare:v44];

                    if (v48 == 1) {
                      ++self->_numMatterLightProfilesWithNaturalLightingUsed;
                    }
                  }
                  uint64_t v39 = [v37 countByEnumeratingWithState:&v123 objects:v136 count:16];
                }
                while (v39);
                goto LABEL_79;
              }
LABEL_80:

              goto LABEL_81;
            }
            ++self->_numHAPAccessories;
            v34 = [v16 firmwareUpdateProfile];

            if (v34) {
              ++self->_numHAPAccessoriesFirmwareUpdateEligible;
            }
            if [v16 hasIPLink] && (objc_msgSend(v16, "isPrimary"))
            {
              v35 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numHAPIPAccessories;
            }
            else
            {
              if (![v16 hasBTLELink] || !objc_msgSend(v16, "isPrimary"))
              {
LABEL_65:
                long long v129 = 0u;
                long long v130 = 0u;
                long long v127 = 0u;
                long long v128 = 0u;
                v37 = [v16 lightProfiles];
                uint64_t v49 = [v37 countByEnumeratingWithState:&v127 objects:v137 count:16];
                if (v49)
                {
                  uint64_t v50 = v49;
                  id v111 = v16;
                  id v112 = v13;
                  uint64_t v51 = *(void *)v128;
                  do
                  {
                    for (uint64_t k = 0; k != v50; ++k)
                    {
                      if (*(void *)v128 != v51) {
                        objc_enumerationMutation(v37);
                      }
                      v53 = *(void **)(*((void *)&v127 + 1) + 8 * k);
                      if (objc_msgSend(v53, "isNaturalLightingSupported", v111, v112)) {
                        ++self->_numLightProfilesWithNaturalLightingSupported;
                      }
                      v54 = [MEMORY[0x263EFF910] date];
                      v55 = [v54 dateByAddingTimeInterval:-86400.0];

                      if (([v53 isNaturalLightingEnabled] & 1) != 0
                        || ([v53 mostRecentNaturalLightingEnabledDate],
                            v56 = objc_claimAutoreleasedReturnValue(),
                            uint64_t v57 = [v56 compare:v55],
                            v56,
                            v57 == 1))
                      {
                        ++self->_numLightProfilesWithNaturalLightingEnabled;
                      }
                      v58 = [v53 mostRecentNaturalLightingUsedDate];
                      uint64_t v59 = [v58 compare:v55];

                      if (v59 == 1) {
                        ++self->_numLightProfilesWithNaturalLightingUsed;
                      }
                    }
                    uint64_t v50 = [v37 countByEnumeratingWithState:&v127 objects:v137 count:16];
                  }
                  while (v50);
LABEL_79:
                  id v16 = v111;
                  id v13 = v112;
                  goto LABEL_80;
                }
                goto LABEL_80;
              }
              v35 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numHAPBTAccessories;
            }
            ++*(Class *)((char *)&self->super.super.super.isa + *v35);
            goto LABEL_65;
          }
          if (v28 == 1 && v29 == 1)
          {

            uint64_t v30 = 400;
            goto LABEL_166;
          }
          if (v28 == 3 && v29 == 3)
          {

            uint64_t v30 = 392;
            goto LABEL_166;
          }
        }

        uint64_t v30 = 360;
        goto LABEL_166;
      }
    }
    else
    {
      v31 = [v16 category];
      int v32 = [v31 isWiFiRouterAccessoryCategory];

      if (v32)
      {
        self->_networkProtectionStatus = 1;
        if (!v16) {
          goto LABEL_167;
        }
        goto LABEL_32;
      }
    }
  }
  if (v16) {
    goto LABEL_32;
  }
LABEL_167:
  if (v117)
  {
    v97 = [v117 category];
    v98 = [v97 categoryType];
    int v99 = HMFEqualObjects();

    if (v99)
    {
      ++self->_numAppleTVAccessories;
      v100 = [v117 capabilities];
      char v101 = [v100 supportsThreadBorderRouter];

      if ((v101 & 1) == 0) {
        goto LABEL_177;
      }
      v102 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numAppleTV4K2ndGenAccessories;
    }
    else
    {
      if (![v117 isHomePod]) {
        goto LABEL_177;
      }
      v102 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numAppleAudioAccessories;
    }
    ++*(Class *)((char *)&self->super.super.super.isa + *v102);
LABEL_177:
    if ([v117 isCurrentAccessory])
    {
      int64_t v103 = [v117 fallbackMediaUserType];
      if ((unint64_t)(v103 - 1) < 3) {
        self->_currentMediaAccessoryFallbackMediaUserType = v103;
      }
    }
    uint64_t v95 = 168;
    goto LABEL_181;
  }
  if (v115)
  {
    ++self->_numWholeHouseAudioAccessories;
    goto LABEL_173;
  }
  if (v114)
  {
    v104 = [v114 matterAdapter];
    v105 = [v104 endpointToDeviceTypesMap];
    v106 = objc_msgSend(v105, "na_filter:", &__block_literal_global_225);
    self->_numRVCs += [v106 count];
  }
  v107 = (void *)MEMORY[0x230FBD990]();
  v108 = self;
  v109 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
  {
    v110 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v132 = v110;
    __int16 v133 = 2112;
    v134 = v118;
    _os_log_impl(&dword_22F52A000, v109, OS_LOG_TYPE_ERROR, "%{public}@Accessory was not matched to any type for configuration reporting: %@", buf, 0x16u);
  }
LABEL_182:
}

uint64_t __153__HMDHomeConfigurationLogEvent_updateConfigWithAccessory_reportNetworkProtectionMetrics_networkProtectionEnabled_hapServiceTypes_primaryHAPServiceTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_228_97757);
}

uint64_t __153__HMDHomeConfigurationLogEvent_updateConfigWithAccessory_reportNetworkProtectionMetrics_networkProtectionEnabled_hapServiceTypes_primaryHAPServiceTypes___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:&unk_26E471680];
}

- (HMDHomeConfigurationLogEvent)initWithDataSource:(id)a3 home:(id)a4 configuredWidgetsCount:(int64_t)a5
{
  uint64_t v230 = *MEMORY[0x263EF8340];
  id v148 = a3;
  id v149 = a4;
  v8 = [v148 uuid];
  v207.receiver = self;
  v207.super_class = (Class)HMDHomeConfigurationLogEvent;
  BOOL v9 = [(HMMHomeLogEvent *)&v207 initWithHomeUUID:v8];

  if (v9)
  {
    v9->_numConfiguredWidgets = a5;
    v162 = [MEMORY[0x263EFF9C0] set];
    id v160 = [MEMORY[0x263EFF9C0] set];
    v9->_isCurrentDeviceResidentEnabled = 0;
    BOOL v10 = [v148 enabledResidents];
    v9->_numResidentsEnabled = [v10 count];
    long long v203 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    obuint64_t j = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v203 objects:v228 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v204;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v204 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v203 + 1) + 8 * i);
          v9->_enabledResidentsDeviceCapabilities |= [v14 legacyResidentCapabilities];
          if ([v14 isCurrentDevice]) {
            v9->_isCurrentDeviceResidentEnabled = 1;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v203 objects:v228 count:16];
      }
      while (v11);
    }

    v9->_isResidentAvailable = [v149 _residentDeviceAvailable];
    v9->_isResidentFirstEnabled = 1;
    v15 = [v149 residentDeviceManager];
    if ([v15 homeSupportsResidentSelection])
    {
      p_isResidentElectionV2Enabled = &v9->_isResidentElectionV2Enabled;
      v9->_isResidentElectionV2Enabled = 0;
    }
    else
    {
      id v16 = [v149 residentDeviceManager];
      p_isResidentElectionV2Enabled = &v9->_isResidentElectionV2Enabled;
      v9->_isResidentElectionV2Enabled = [v16 isResidentElectionV2Enabled];
    }
    v147 = [v148 currentDevice];
    id v17 = [v147 capabilities];
    v9->_isCurrentDeviceResidentCapable = [v17 isResidentCapable];

    v18 = [v149 primaryResident];
    id v19 = [v18 device];
    v9->_isCurrentDevicePrimaryResident = [v19 isEqual:v147];

    v9->_primaryReportingDevice = [v149 awdPrimaryReportingDevice];
    v9->_isCurrentDeviceLocalToHome = [v149 homeLocation] == 1;
    v9->_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled = [v149 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
    v20 = [v149 availableBorderRouters];
    v9->_numThreadBorderRouters = [v20 unsignedIntegerValue];

    id v21 = [v148 triggerOwnedActionSets];
    v9->_numTriggerOwnedConfiguredScenes = [v21 count];

    v22 = [v148 actionSets];
    v9->_numScenes = [v22 count];

    v23 = [v149 rooms];
    v9->_numRooms = [v23 count] + 1;

    v24 = [v149 zones];
    v9->_numZones = [v24 count];

    id v25 = [v149 serviceGroups];
    v9->_numAccessoryServiceGroups = [v25 count];

    uint64_t v26 = [v149 availableBSPsCount];
    numBSPs = v9->_numBSPs;
    v9->_numBSPs = (NSNumber *)v26;

    unsigned int v165 = [v149 isOwnerUser];
    if ([v149 networkRouterSupport])
    {
      uint64_t v28 = [v149 protectionMode];
      BOOL v158 = v28 == 1;
      unsigned int v29 = v165;
      if (v28 != 1) {
        unsigned int v29 = 0;
      }
      if (v29 == 1)
      {
        v9->_networkProtectionStatus = 2;
        BOOL v158 = 1;
      }
    }
    else
    {
      BOOL v158 = 0;
    }
    v9->_userPrivilegeBitMasuint64_t k = 0;
    long long v199 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    uint64_t v30 = objc_msgSend(v148, "users", p_isResidentElectionV2Enabled);
    uint64_t v31 = [v30 countByEnumeratingWithState:&v199 objects:v227 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v200;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v200 != v32) {
            objc_enumerationMutation(v30);
          }
          v34 = *(void **)(*((void *)&v199 + 1) + 8 * j);
          if (([v34 isRemoteGateway] & 1) == 0)
          {
            uint64_t v35 = [v34 privilege];
            uint64_t v36 = 8;
            uint64_t v37 = 2;
            switch(v35)
            {
              case 1:
                goto LABEL_28;
              case 2:
                uint64_t v37 = 4;
LABEL_28:
                uint64_t v38 = v9->_userPrivilegeBitMask | v37;
                goto LABEL_30;
              case 3:
                goto LABEL_32;
              case 4:
                uint64_t v36 = 16;
LABEL_32:
                v9->_userPrivilegeBitMask |= v36;
                uint64_t v39 = 600;
                goto LABEL_34;
              case 5:
                v9->_userPrivilegeBitMask |= 0x20uLL;
                uint64_t v39 = 608;
LABEL_34:
                ++*(Class *)((char *)&v9->super.super.super.isa + v39);
                break;
              default:
                uint64_t v38 = v9->_userPrivilegeBitMask | 1;
LABEL_30:
                v9->_userPrivilegeBitMasuint64_t k = v38;
                break;
            }
            ++v9->_numUsers;
            uint64_t v40 = [v34 accessCode];

            if (v40) {
              ++v9->_ownerPerspectiveNumUsersWithAccessCode;
            }
          }
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v199 objects:v227 count:16];
      }
      while (v31);
    }

    id v41 = [v148 users];
    id v156 = [MEMORY[0x263EFF980] array];
    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    id v150 = v41;
    uint64_t v42 = [v150 countByEnumeratingWithState:&v215 objects:v229 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v216;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v216 != v43) {
            objc_enumerationMutation(v150);
          }
          v45 = *(void **)(*((void *)&v215 + 1) + 8 * k);
          uint64_t v46 = objc_alloc_init(HMDAnalyticsMultiUserSettings);
          -[HMDAnalyticsMultiUserSettings setIsOwner:](v46, "setIsOwner:", [v45 isCurrentUser]);
          v47 = [MEMORY[0x263EFF980] array];
          [(HMDAnalyticsMultiUserSettings *)v46 setMultiUserSettingsValuesByKeyPaths:v47];

          uint64_t v48 = [v45 privateSettingValuesByKeyPath];
          uint64_t v49 = (void *)[v48 mutableCopy];

          uint64_t v50 = [v45 sharedSettingValuesByKeyPath];
          [v49 addEntriesFromDictionary:v50];

          if ([v49 count])
          {
            uint64_t v209 = 0;
            v210 = &v209;
            uint64_t v211 = 0x3032000000;
            v212 = __Block_byref_object_copy__97764;
            v213 = __Block_byref_object_dispose__97765;
            id v214 = [MEMORY[0x263EFF980] array];
            v208[0] = MEMORY[0x263EF8330];
            v208[1] = 3221225472;
            v208[2] = ___legacyMultiUserSettings_block_invoke;
            v208[3] = &unk_264A27268;
            v208[4] = &v209;
            [v49 enumerateKeysAndObjectsUsingBlock:v208];
            uint64_t v51 = (void *)[(id)v210[5] copy];
            [(HMDAnalyticsMultiUserSettings *)v46 setMultiUserSettingsValuesByKeyPaths:v51];

            [v156 addObject:v46];
            _Block_object_dispose(&v209, 8);
          }
        }
        uint64_t v42 = [v150 countByEnumeratingWithState:&v215 objects:v229 count:16];
      }
      while (v42);
    }

    uint64_t v52 = [v156 copy];
    multiUserSettings = v9->_multiUserSettings;
    v9->_multiUserSettings = (NSArray *)v52;

    v9->_ownerUser = [v148 isOwnerUser];
    v54 = [v148 currentUser];
    v9->_currentUserPrivilege = [v54 privilege];

    v9->_accessToHomeAllowed = [v148 isAccessToHomeAllowed];
    v55 = [v148 accessories];
    v9->_numAccessories = [v55 count];
    long long v195 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    id v157 = v55;
    uint64_t v56 = [v157 countByEnumeratingWithState:&v195 objects:v226 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v196;
      do
      {
        for (uint64_t m = 0; m != v56; ++m)
        {
          if (*(void *)v196 != v57) {
            objc_enumerationMutation(v157);
          }
          [(HMDHomeConfigurationLogEvent *)v9 updateConfigWithAccessory:*(void *)(*((void *)&v195 + 1) + 8 * m) reportNetworkProtectionMetrics:v165 networkProtectionEnabled:v158 hapServiceTypes:v162 primaryHAPServiceTypes:v160];
        }
        uint64_t v56 = [v157 countByEnumeratingWithState:&v195 objects:v226 count:16];
      }
      while (v56);
    }

    v166 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v162, "count") + 1);
    if ([v162 count])
    {
      uint64_t v59 = [[HMDAnalyticsHAPServiceData alloc] initWithServiceType:@"_HomeWithHAPServices_" isPrimary:0 ownerUser:v9->_ownerUser];
      [v166 addObject:v59];
    }
    long long v193 = 0u;
    long long v194 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    id v161 = v160;
    uint64_t v60 = [v161 countByEnumeratingWithState:&v191 objects:v225 count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v192;
      do
      {
        for (uint64_t n = 0; n != v60; ++n)
        {
          if (*(void *)v192 != v61) {
            objc_enumerationMutation(v161);
          }
          v63 = [[HMDAnalyticsHAPServiceData alloc] initWithServiceType:*(void *)(*((void *)&v191 + 1) + 8 * n) isPrimary:1 ownerUser:v9->_ownerUser];
          [v166 addObject:v63];
        }
        uint64_t v60 = [v161 countByEnumeratingWithState:&v191 objects:v225 count:16];
      }
      while (v60);
    }

    [v162 minusSet:v161];
    long long v189 = 0u;
    long long v190 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    id v159 = v162;
    uint64_t v64 = [v159 countByEnumeratingWithState:&v187 objects:v224 count:16];
    if (v64)
    {
      uint64_t v65 = *(void *)v188;
      do
      {
        for (iuint64_t i = 0; ii != v64; ++ii)
        {
          if (*(void *)v188 != v65) {
            objc_enumerationMutation(v159);
          }
          v67 = [[HMDAnalyticsHAPServiceData alloc] initWithServiceType:*(void *)(*((void *)&v187 + 1) + 8 * ii) isPrimary:0 ownerUser:v9->_ownerUser];
          [v166 addObject:v67];
        }
        uint64_t v64 = [v159 countByEnumeratingWithState:&v187 objects:v224 count:16];
      }
      while (v64);
    }

    uint64_t v68 = [v166 copy];
    hapServices = v9->_hapServices;
    v9->_hapServices = (NSArray *)v68;

    v70 = [v148 accessories];
    v71 = objc_msgSend(v70, "na_filter:", &__block_literal_global_97768);
    v9->_numHomePodMinis = [v71 count];

    v72 = [v148 accessories];
    v73 = objc_msgSend(v72, "na_filter:", &__block_literal_global_22);
    v9->_numHomePod2ndGeuint64_t n = [v73 count];

    int v74 = [v148 accessories];
    v75 = objc_msgSend(v74, "na_filter:", &__block_literal_global_24_97769);
    v9->_numHomePods = [v75 count];

    v76 = [v149 mediaSystems];
    v9->_numMediaSystems = [v76 count];

    uint64_t v77 = [v149 mediaSystems];
    v78 = objc_msgSend(v77, "na_filter:", &__block_literal_global_27_97770);
    v9->_numHomePodMiniStereoPairs = [v78 count];

    v79 = [v149 mediaSystems];
    char v80 = objc_msgSend(v79, "na_filter:", &__block_literal_global_31_97771);
    v9->_numHomePod2ndGenStereoPairs = [v80 count];

    v81 = [v149 mediaSystems];
    uint64_t v82 = objc_msgSend(v81, "na_filter:", &__block_literal_global_35_97772);
    v9->_numHomePodStereoPairs = [v82 count];

    v83 = [v148 triggers];
    v9->_numTriggers += [v83 count];
    v144 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v83, "count"));
    long long v185 = 0u;
    long long v186 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    id v145 = v83;
    id v151 = (id)[v145 countByEnumeratingWithState:&v183 objects:v223 count:16];
    if (v151)
    {
      uint64_t v143 = *(void *)v184;
      do
      {
        uint64_t v84 = 0;
        do
        {
          if (*(void *)v184 != v143)
          {
            uint64_t v85 = v84;
            objc_enumerationMutation(v145);
            uint64_t v84 = v85;
          }
          uint64_t v146 = v84;
          v86 = *(void **)(*((void *)&v183 + 1) + 8 * v84);
          if ([v86 active]) {
            ++v9->_numActiveTriggers;
          }
          if ([v86 triggerType] == 1)
          {
            ++v9->_numEventTriggers;
            id v87 = v86;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int v88 = v87;
            }
            else {
              int v88 = 0;
            }
            id v89 = v88;

            v90 = [[HMDAnalyticsEventTriggerData alloc] initWithEventTrigger:v89 isAdding:0];
            if (v90) {
              [v144 addObject:v90];
            }
          }
          else if ([v86 triggerType] == 2)
          {
            ++v9->_numTimerTriggers;
          }
          v91 = [v86 actionSets];
          long long v181 = 0u;
          long long v182 = 0u;
          long long v179 = 0u;
          long long v180 = 0u;
          id v154 = v91;
          uint64_t v92 = [v154 countByEnumeratingWithState:&v179 objects:v222 count:16];
          if (v92)
          {
            uint64_t v163 = *(void *)v180;
            do
            {
              for (juint64_t j = 0; jj != v92; ++jj)
              {
                if (*(void *)v180 != v163) {
                  objc_enumerationMutation(v154);
                }
                v94 = *(void **)(*((void *)&v179 + 1) + 8 * jj);
                long long v175 = 0u;
                long long v176 = 0u;
                long long v177 = 0u;
                long long v178 = 0u;
                uint64_t v95 = [v94 actions];
                uint64_t v96 = [v95 countByEnumeratingWithState:&v175 objects:v221 count:16];
                if (v96)
                {
                  uint64_t v97 = *(void *)v176;
                  do
                  {
                    for (kuint64_t k = 0; kk != v96; ++kk)
                    {
                      if (*(void *)v176 != v97) {
                        objc_enumerationMutation(v95);
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        ++v9->_numShortcuts;
                      }
                    }
                    uint64_t v96 = [v95 countByEnumeratingWithState:&v175 objects:v221 count:16];
                  }
                  while (v96);
                }
              }
              uint64_t v92 = [v154 countByEnumeratingWithState:&v179 objects:v222 count:16];
            }
            while (v92);
          }

          uint64_t v84 = v146 + 1;
        }
        while ((id)(v146 + 1) != v151);
        id v151 = (id)[v145 countByEnumeratingWithState:&v183 objects:v223 count:16];
      }
      while (v151);
    }

    uint64_t v99 = [v144 copy];
    eventTriggers = v9->_eventTriggers;
    v9->_eventTriggers = (NSArray *)v99;

    char v101 = [v148 actionSets];
    v102 = (void *)[v101 copy];

    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v155 = v102;
    uint64_t v103 = [v155 countByEnumeratingWithState:&v171 objects:v220 count:16];
    if (v103)
    {
      uint64_t v104 = *(void *)v172;
      do
      {
        for (muint64_t m = 0; mm != v103; ++mm)
        {
          if (*(void *)v172 != v104) {
            objc_enumerationMutation(v155);
          }
          v106 = [*(id *)(*((void *)&v171 + 1) + 8 * mm) actions];
          uint64_t v107 = [v106 count];

          if (v107) {
            ++v9->_numConfiguredScenes;
          }
        }
        uint64_t v103 = [v155 countByEnumeratingWithState:&v171 objects:v220 count:16];
      }
      while (v103);
    }

    [(HMDHomeConfigurationLogEvent *)v9 setHomeConfigurationBitMasks];
    v108 = [v149 creationDate];
    v9->_homeCreationCohortWeeuint64_t k = [(HMDHomeConfigurationLogEvent *)v9 weeksSinceDate:v108 trimAtMaximumValue:13];

    v109 = [v149 firstHAPAccessoryAddedDate];
    v9->_firstHAPAccessoryAddedCohortWeeuint64_t k = [(HMDHomeConfigurationLogEvent *)v9 weeksSinceDate:v109 trimAtMaximumValue:13];

    v110 = [v149 accessoriesWithWalletKeySupport];
    v9->_numAccessoriesWithWalletKeySupported = [v110 count];

    id v111 = [v149 walletKeyManager];
    v9->_hasHomeKeyInWallet = [v111 hasHomeKeyInWallet];

    v9->_isSmokeAlarmEnabled = [v148 isSmokeAlarmEnabled];
    v9->_isSiriPhraseOptionsHeySiriEnabled = [v148 isSiriPhraseOptionsHeySiriEnabled];
    v9->_isSiriPhraseOptionsJustSiriEnabled = [v148 isSiriPhraseOptionsJustSiriEnabled];
    if (*v142) {
      v9->_residentElectionBitMask |= 1uLL;
    }
    id v112 = [v149 hapAccessories];
    uint64_t v113 = objc_msgSend(v112, "na_filter:", &__block_literal_global_43_97776);
    v9->_numACBAccessories = [v113 count];

    id v114 = [v149 residentDeviceManager];
    v9->_isResidentSelectionEnabled = [v114 homeSupportsResidentSelection];

    id v115 = [v149 residentDeviceManager];
    v9->_residentSelectionMode = [v115 residentSelectionMode];

    unint64_t v116 = v9->_residentSelectionMode - 1;
    if (v116 <= 2) {
      v9->_residentElectionBitMask |= qword_2303E4238[v116];
    }
    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    id v152 = [v148 appleMediaAccessories];
    id v117 = 0;
    uint64_t v118 = [v152 countByEnumeratingWithState:&v167 objects:v219 count:16];
    if (v118)
    {
      v164 = 0;
      uint64_t v119 = *(void *)v168;
      do
      {
        for (nuint64_t n = 0; nn != v118; ++nn)
        {
          if (*(void *)v168 != v119) {
            objc_enumerationMutation(v152);
          }
          long long v121 = *(void **)(*((void *)&v167 + 1) + 8 * nn);
          if (!v117
            || ([*(id *)(*((void *)&v167 + 1) + 8 * nn) softwareVersion],
                (long long v122 = objc_claimAutoreleasedReturnValue()) != 0)
            && ([v121 softwareVersion],
                long long v123 = objc_claimAutoreleasedReturnValue(),
                int v124 = [v117 isGreaterThanVersion:v123],
                v123,
                v122,
                v124))
          {
            uint64_t v125 = [v121 softwareVersion];

            id v117 = (void *)v125;
          }
          long long v126 = [v121 device];
          long long v127 = [v149 primaryResident];
          long long v128 = [v127 device];
          int v129 = [v126 isEqual:v128];

          if (v129)
          {
            uint64_t v130 = [v121 softwareVersion];

            v164 = (void *)v130;
          }
        }
        uint64_t v118 = [v152 countByEnumeratingWithState:&v167 objects:v219 count:16];
      }
      while (v118);
    }
    else
    {
      v164 = 0;
    }

    uint64_t v131 = [v117 shortVersionString];
    oldestTVOSVersionInHome = v9->_oldestTVOSVersionInHome;
    v9->_oldestTVOSVersionInHome = (NSString *)v131;

    uint64_t v133 = [v117 buildVersion];
    oldestTVOSBuildInHome = v9->_oldestTVOSBuildInHome;
    v9->_oldestTVOSBuildInHome = (NSString *)v133;

    uint64_t v135 = [v164 shortVersionString];
    primaryResidentVersionInHome = v9->_primaryResidentVersionInHome;
    v9->_primaryResidentVersionInHome = (NSString *)v135;

    uint64_t v137 = [v164 buildVersion];
    primaryResidentBuildInHome = v9->_primaryResidentBuildInHome;
    v9->_primaryResidentBuildInHome = (NSString *)v137;

    v139 = v9;
  }

  return v9;
}

uint64_t __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 supportsACWGUWB];
}

uint64_t __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_8(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 accessories];
  uint64_t v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_37_97779);

  return v3;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_9(uint64_t a1, void *a2)
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
  uint64_t v5 = [v4 homePodVariant];

  return v5 == 1;
}

uint64_t __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 accessories];
  uint64_t v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_33_97782);

  return v3;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_7(uint64_t a1, void *a2)
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
  uint64_t v5 = [v4 homePodVariant];

  return v5 == 3;
}

uint64_t __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 accessories];
  uint64_t v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_29_97785);

  return v3;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_5(uint64_t a1, void *a2)
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
  uint64_t v5 = [v4 homePodVariant];

  return v5 == 2;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_3(uint64_t a1, void *a2)
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
  uint64_t v5 = [v4 homePodVariant];

  return v5 == 1;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v5 = [v4 homePodVariant];

  return v5 == 3;
}

BOOL __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v5 = [v4 homePodVariant];

  return v5 == 2;
}

- (HMDHomeConfigurationLogEvent)initWithHome:(id)a3 configuredWidgetsCount:(int64_t)a4
{
  return [(HMDHomeConfigurationLogEvent *)self initWithDataSource:a3 home:a3 configuredWidgetsCount:a4];
}

- (int64_t)weeksSinceDate:(id)a3 trimAtMaximumValue:(unint64_t)a4
{
  unint64_t v5 = [(HMDHomeConfigurationLogEvent *)self daysSinceDate:a3 trimAtMaximumValue:0];
  if ((v5 & 0x8000000000000000) != 0) {
    return -1;
  }
  if (v5) {
    unint64_t v6 = (int)(v5 / 7 + 1);
  }
  else {
    unint64_t v6 = 0;
  }
  if (v6 >= a4) {
    unint64_t v8 = a4;
  }
  else {
    unint64_t v8 = v6;
  }
  if (a4) {
    return v8;
  }
  else {
    return v6;
  }
}

- (int64_t)daysSinceDate:(id)a3 trimAtMaximumValue:(unint64_t)a4
{
  if (!a3) {
    return -1;
  }
  unint64_t v5 = (void *)MEMORY[0x263EFF910];
  id v6 = a3;
  v7 = [v5 now];
  [v7 timeIntervalSinceDate:v6];
  double v9 = v8;

  unint64_t v10 = (uint64_t)v9 / 0x15180uLL;
  if ((uint64_t)v9 < 0) {
    unint64_t v10 = -1;
  }
  if (v10 >= a4) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = v10;
  }
  if (a4) {
    return v11;
  }
  else {
    return v10;
  }
}

- (void)setHomeConfigurationBitMasks
{
  self->_homeCategoryBitMasuint64_t k = 0;
  self->_appleMediaCategoryBitMasuint64_t k = 0;
  self->_thirdPartyMediaCategoryBitMasuint64_t k = 0;
  self->_homeCategoryBitMask |= 1uLL;
  if ([(HMDHomeConfigurationLogEvent *)self numSmartHomeAccessories]) {
    self->_homeCategoryBitMask |= 8uLL;
  }
  if ([(HMDHomeConfigurationLogEvent *)self numThirdPartyMediaAccessories])
  {
    self->_homeCategoryBitMask |= 2uLL;
    if ([(HMDHomeConfigurationLogEvent *)self numTelevisionServiceAccessories]) {
      self->_thirdPartyMediaCategoryBitMask |= 1uLL;
    }
    if ([(HMDHomeConfigurationLogEvent *)self numThirdPartyAudioAccessories]) {
      self->_thirdPartyMediaCategoryBitMask |= 2uLL;
    }
  }
  if ([(HMDHomeConfigurationLogEvent *)self numAppleMediaAccessories])
  {
    self->_homeCategoryBitMask |= 4uLL;
    if ([(HMDHomeConfigurationLogEvent *)self numAppleTVAccessories]) {
      self->_appleMediaCategoryBitMask |= 1uLL;
    }
    if ([(HMDHomeConfigurationLogEvent *)self numHomePods]
      || [(HMDHomeConfigurationLogEvent *)self numHomePodMinis]
      || [(HMDHomeConfigurationLogEvent *)self numHomePod2ndGen])
    {
      self->_appleMediaCategoryBitMask |= 2uLL;
    }
  }
}

@end
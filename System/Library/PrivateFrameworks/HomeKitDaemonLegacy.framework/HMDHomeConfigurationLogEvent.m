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
  v3 = [MEMORY[0x1E4F29128] UUID];
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
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
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
    v9 = &unk_1F2DC7F78;
  }
  else {
    v9 = &unk_1F2DC7F90;
  }
  [v3 setObject:v9 forKeyedSubscript:@"isOwnerUser"];
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isOwnerUser](self, "isOwnerUser"));
  [v3 setObject:v10 forKeyedSubscript:@"isOwnerUserBool"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent currentUserPrivilege](self, "currentUserPrivilege"));
  [v3 setObject:v11 forKeyedSubscript:@"currentUserPrivilege"];

  if ([(HMDHomeConfigurationLogEvent *)self isAccessToHomeAllowed]) {
    v12 = &unk_1F2DC7F78;
  }
  else {
    v12 = &unk_1F2DC7F90;
  }
  [v3 setObject:v12 forKeyedSubscript:@"isAccessToHomeAllowed"];
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isAccessToHomeAllowed](self, "isAccessToHomeAllowed"));
  [v3 setObject:v13 forKeyedSubscript:@"isAccessToHomeAllowedBool"];

  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDHomeConfigurationLogEvent networkProtectionStatus](self, "networkProtectionStatus"));
  [v3 setObject:v14 forKeyedSubscript:@"networkProtectionStatus"];

  if ([(HMDHomeConfigurationLogEvent *)self isResidentAvailable]) {
    v15 = &unk_1F2DC7F78;
  }
  else {
    v15 = &unk_1F2DC7F90;
  }
  [v3 setObject:v15 forKeyedSubscript:@"isResidentAvailable"];
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isResidentAvailable](self, "isResidentAvailable"));
  [v3 setObject:v16 forKeyedSubscript:@"isResidentAvailableBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isAutomaticThirdPartyAccessorySoftwareUpdateEnabled])
  {
    v17 = &unk_1F2DC7F78;
  }
  else
  {
    v17 = &unk_1F2DC7F90;
  }
  [v3 setObject:v17 forKeyedSubscript:@"isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"];
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isAutomaticThirdPartyAccessorySoftwareUpdateEnabled](self, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"));
  [v3 setObject:v18 forKeyedSubscript:@"isAutomaticThirdPartyAccessorySoftwareUpdateEnabledBool"];

  if ([(HMDHomeConfigurationLogEvent *)self primaryReportingDevice]) {
    v19 = &unk_1F2DC7F78;
  }
  else {
    v19 = &unk_1F2DC7F90;
  }
  [v3 setObject:v19 forKeyedSubscript:@"primaryReportingDevice"];
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent primaryReportingDevice](self, "primaryReportingDevice"));
  [v3 setObject:v20 forKeyedSubscript:@"primaryReportingDeviceBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isCurrentDevicePrimaryResident]) {
    v21 = &unk_1F2DC7F78;
  }
  else {
    v21 = &unk_1F2DC7F90;
  }
  [v3 setObject:v21 forKeyedSubscript:@"isPrimaryResident"];
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"));
  [v3 setObject:v22 forKeyedSubscript:@"isPrimaryResidentBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isCurrentDeviceResidentEnabled]) {
    v23 = &unk_1F2DC7F78;
  }
  else {
    v23 = &unk_1F2DC7F90;
  }
  [v3 setObject:v23 forKeyedSubscript:@"isCurrentDeviceResidentEnabled"];
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isCurrentDeviceResidentEnabled](self, "isCurrentDeviceResidentEnabled"));
  [v3 setObject:v24 forKeyedSubscript:@"isCurrentDeviceResidentEnabledBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isCurrentDeviceLocalToHome]) {
    v25 = &unk_1F2DC7F78;
  }
  else {
    v25 = &unk_1F2DC7F90;
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
    v31 = &unk_1F2DC7F78;
  }
  else {
    v31 = &unk_1F2DC7F90;
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
    v128 = &unk_1F2DC7F78;
  }
  else {
    v128 = &unk_1F2DC7F90;
  }
  [v3 setObject:v128 forKeyedSubscript:@"isWalletKeyProvisioned"];
  v129 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent hasHomeKeyInWallet](self, "hasHomeKeyInWallet"));
  [v3 setObject:v129 forKeyedSubscript:@"isWalletKeyProvisionedBool"];

  v130 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent numAccessoriesWithWalletKeySupported](self, "numAccessoriesWithWalletKeySupported"));
  [v3 setObject:v130 forKeyedSubscript:@"numRoeAccessories"];

  if ([(HMDHomeConfigurationLogEvent *)self hasHomeKeyInWallet]) {
    v131 = &unk_1F2DC7F78;
  }
  else {
    v131 = &unk_1F2DC7F90;
  }
  [v3 setObject:v131 forKeyedSubscript:@"isUserRoeProvisioned"];
  v132 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent hasHomeKeyInWallet](self, "hasHomeKeyInWallet"));
  [v3 setObject:v132 forKeyedSubscript:@"isUserRoeProvisionedBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isSmokeAlarmEnabled]) {
    v133 = &unk_1F2DC7F78;
  }
  else {
    v133 = &unk_1F2DC7F90;
  }
  [v3 setObject:v133 forKeyedSubscript:@"isXoeEnabled"];
  v134 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isSmokeAlarmEnabled](self, "isSmokeAlarmEnabled"));
  [v3 setObject:v134 forKeyedSubscript:@"isXoeEnabledBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isSiriPhraseOptionsHeySiriEnabled]) {
    v135 = &unk_1F2DC7F78;
  }
  else {
    v135 = &unk_1F2DC7F90;
  }
  [v3 setObject:v135 forKeyedSubscript:@"isSiriPhraseOptionsHeySiriEnabled"];
  v136 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isSiriPhraseOptionsHeySiriEnabled](self, "isSiriPhraseOptionsHeySiriEnabled"));
  [v3 setObject:v136 forKeyedSubscript:@"isSiriPhraseOptionsHeySiriEnabledBool"];

  if ([(HMDHomeConfigurationLogEvent *)self isSiriPhraseOptionsJustSiriEnabled]) {
    v137 = &unk_1F2DC7F78;
  }
  else {
    v137 = &unk_1F2DC7F90;
  }
  [v3 setObject:v137 forKeyedSubscript:@"isSiriPhraseOptionsJustSiriEnabled"];
  v138 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomeConfigurationLogEvent isSiriPhraseOptionsJustSiriEnabled](self, "isSiriPhraseOptionsJustSiriEnabled"));
  [v3 setObject:v138 forKeyedSubscript:@"isSiriPhraseOptionsJustSiriEnabledBool"];

  v139 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHomeConfigurationLogEvent residentElectionBitMask](self, "residentElectionBitMask"));
  [v3 setObject:v139 forKeyedSubscript:@"residentElectionBitMask"];

  v140 = (void *)[v3 copy];
  return (NSDictionary *)v140;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.config.home";
}

- (unint64_t)currentUserPrivilegeBitMask
{
  unint64_t v2 = [(HMDHomeConfigurationLogEvent *)self currentUserPrivilege];
  if (v2 - 1 > 3) {
    return 1;
  }
  else {
    return qword_1D54D3BE8[v2 - 1];
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
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  id v18 = v15;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v112 = v19;

  id v20 = v18;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  id v111 = v21;
  v113 = v20;

  if (v17)
  {
    v22 = [v17 hostAccessory];
    objc_opt_class();
    v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
    id v24 = v23;

    if (v24) {
      goto LABEL_179;
    }
  }
  if (v10)
  {
    if ([v113 wiFiCredentialType] == 3) {
      ++self->_numAccessoriesWiFiPPSKCredential;
    }
    if (v9)
    {
      id v25 = v113;
      if ([v25 supportsNetworkProtection])
      {
        v26 = [v25 networkClientIdentifier];

        if (v26)
        {
          uint64_t v27 = [v25 targetNetworkProtectionMode];
          uint64_t v28 = [v25 currentNetworkProtectionMode];
          if (!v27 && v28 == 4)
          {

            uint64_t v29 = 368;
            goto LABEL_163;
          }
          if (!v27 && v28 == 2)
          {
            uint64_t v95 = [v25 networkClientLAN];

            if (v95 == 3) {
              uint64_t v29 = 384;
            }
            else {
              uint64_t v29 = 376;
            }
LABEL_163:
            ++*(Class *)((char *)&self->super.super.super.isa + v29);
            if (!v17) {
              goto LABEL_164;
            }
LABEL_29:
            uint64_t v110 = [v17 certificationStatus];
            if (v110 == 2)
            {
              v32 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numCertifiedAccessories;
            }
            else
            {
              if ([v17 certificationStatus] != 1) {
                goto LABEL_34;
              }
              v32 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numNotCertifiedAccessories;
            }
            ++*(Class *)((char *)&self->super.super.super.isa + *v32);
LABEL_34:
            if (![v17 supportsHAP])
            {
              if (![v17 supportsCHIP])
              {
LABEL_78:
                unsigned int v59 = objc_msgSend(v17, "metric_threadCapabilities");
                if ([v17 hasIPLink] && objc_msgSend(v17, "isPrimary"))
                {
                  ++self->_numIPAccessories;
                }
                else if ([v17 hasBTLELink] && objc_msgSend(v17, "isPrimary"))
                {
                  ++self->_numBTAccessories;
                  if (!v59)
                  {
                    v60 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numBTOnlyAccessories;
                    unint64_t v61 = 1;
LABEL_87:
                    *(Class *)((char *)&self->super.super.super.isa + *v60) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                               + *v60)
                                                                                    + v61);
LABEL_88:
                    if (([v17 isPrimary] & 1) == 0) {
                      ++self->_numBridgedAccessories;
                    }
                    long long v116 = 0u;
                    long long v117 = 0u;
                    long long v114 = 0u;
                    long long v115 = 0u;
                    v62 = [v17 services];
                    uint64_t v63 = [v62 countByEnumeratingWithState:&v114 objects:v130 count:16];
                    if (v63)
                    {
                      uint64_t v64 = v63;
                      uint64_t v65 = *(void *)v115;
                      do
                      {
                        for (uint64_t i = 0; i != v64; ++i)
                        {
                          if (*(void *)v115 != v65) {
                            objc_enumerationMutation(v62);
                          }
                          v67 = [*(id *)(*((void *)&v114 + 1) + 8 * i) type];
                          [v13 addObject:v67];
                        }
                        uint64_t v64 = [v62 countByEnumeratingWithState:&v114 objects:v130 count:16];
                      }
                      while (v64);
                    }

                    v68 = +[HMDMetricsUtilities primaryServiceTypeForHAPAccessory:v17];
                    if (v68) {
                      [v14 addObject:v68];
                    }
                    v69 = [v17 findServiceWithServiceType:*MEMORY[0x1E4F2DDD0]];

                    if (v69) {
                      ++self->_numHAPBatteryServiceAccessories;
                    }
                    if ([v17 supportsWoL]) {
                      ++self->_numWoLAccessories;
                    }
                    if ([v17 supportsTargetController])
                    {
                      ++self->_numTargetControllers;
                      if (v110 == 2) {
                        ++self->_numCertifiedTargetControllers;
                      }
                      if (([v17 isPrimary] & 1) == 0)
                      {
                        ++self->_numBridgedTargetControllers;
                        if (v110 == 2) {
                          ++self->_numCertifiedBridgedTargetControllers;
                        }
                      }
                    }
                    if ([v17 hasCameraStreamService])
                    {
                      ++self->_numCameraAccessories;
                      if ([v17 isCameraRecordingFeatureSupported]) {
                        ++self->_numCameraAccessoriesSupportRecording;
                      }
                      v70 = [v17 cameraProfileSettingsManager];
                      if ([v70 isRecordingEnabled]) {
                        ++self->_numCameraAccessoriesRecordingEnabled;
                      }
                      v71 = [v70 currentSettings];
                      v72 = [v71 notificationSettings];
                      int v73 = [v72 isReachabilityEventNotificationEnabled];

                      if (v73) {
                        ++self->_numCameraAccessoriesReachabilityNotificationEnabled;
                      }
                      v74 = [v70 currentSettings];
                      v75 = [v74 activityZones];
                      uint64_t v76 = [v75 count];

                      if (v76) {
                        ++self->_numCameraAccessoriesWithActivityZonesEnabled;
                      }
                    }
                    if (![v17 hasTelevisionService])
                    {
                      uint64_t v81 = 1;
LABEL_129:
                      if ([v17 hasSmartSpeakerService])
                      {
                        ++self->_numHAPSpeakerServiceAccessories;
                        if ([v68 isEqual:@"00000228-0000-1000-8000-0026BB765291"])
                        {
                          ++self->_numPrimaryHAPSpeakerServiceAccessories;
                          uint64_t v81 = 3;
                        }
                      }
                      if ([v17 hasSiriEndpointService]) {
                        ++self->_numCapableSiriEndpointAccessories;
                      }
                      if (self->_isCurrentDevicePrimaryResident)
                      {
                        v88 = [v17 siriEndpointProfile];
                        v89 = v88;
                        if (v88
                          && ([v88 siriTouchToUse] == 1 || objc_msgSend(v89, "siriListening") == 1))
                        {
                          ++self->_numEnabledSiriEndpointAccessories;
                        }
                      }
                      v90 = [v17 category];
                      v91 = [v90 categoryType];
                      int v92 = [v91 isEqualToString:*MEMORY[0x1E4F2C1B0]];

                      if (v92)
                      {
                        if ([v17 supportsHAP]) {
                          ++self->_numHAPLocks;
                        }
                        if ([v17 supportsCHIP]) {
                          ++self->_numMatterLocks;
                        }
                        if ([v17 supportsAccessCode]) {
                          ++self->_numLocksWithAccessCodeSupported;
                        }
                        if ([v17 supportsWalletKey]) {
                          ++self->_numLocksWithWalletKeySupported;
                        }
                      }
                      v93 = [v17 services];
                      self->_numServices += [v93 count];

                      if (v81 != 3)
                      {
                        uint64_t v94 = 152;
LABEL_178:
                        ++*(Class *)((char *)&self->super.super.super.isa + v94);
                        goto LABEL_179;
                      }
LABEL_170:
                      uint64_t v94 = 160;
                      goto LABEL_178;
                    }
                    v77 = [v17 category];
                    v78 = [v77 categoryType];
                    char v79 = [v78 isEqualToString:*MEMORY[0x1E4F2C230]];

                    if (v79)
                    {
                      v80 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numTelevisionAccessories;
                    }
                    else
                    {
                      v82 = [v17 category];
                      v83 = [v82 categoryType];
                      char v84 = [v83 isEqualToString:*MEMORY[0x1E4F2C240]];

                      if (v84)
                      {
                        v80 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numTelevisionSetTopBoxAccessories;
                      }
                      else
                      {
                        v85 = [v17 category];
                        v86 = [v85 categoryType];
                        int v87 = [v86 isEqualToString:*MEMORY[0x1E4F2C248]];

                        if (!v87)
                        {
LABEL_128:
                          uint64_t v81 = 3;
                          goto LABEL_129;
                        }
                        v80 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numTelevisionStreamingStickAccessories;
                      }
                    }
                    ++*(Class *)((char *)&self->super.super.super.isa + *v80);
                    goto LABEL_128;
                  }
LABEL_86:
                  ++self->_numThreadAccessories;
                  self->_numThreadAccessoryMinCapable += v59 & 1;
                  self->_numThreadAccessorySleepCapable += ((unint64_t)v59 >> 1) & 1;
                  self->_numThreadAccessoryFullCapable += ((unint64_t)v59 >> 2) & 1;
                  self->_numThreadAccessoryRouterCapable += ((unint64_t)v59 >> 3) & 1;
                  unint64_t v61 = ((unint64_t)v59 >> 4) & 1;
                  v60 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numThreadAccessoryBorderRouterCapable;
                  goto LABEL_87;
                }
                if (!v59) {
                  goto LABEL_88;
                }
                goto LABEL_86;
              }
              id v109 = v14;
              ++self->_numCHIPAccessories;
              v35 = [v17 firmwareUpdateProfile];

              if (v35) {
                ++self->_numCHIPAccessoriesFirmwareUpdateEligible;
              }
              long long v120 = 0u;
              long long v121 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              v36 = [v17 lightProfiles];
              uint64_t v37 = [v36 countByEnumeratingWithState:&v118 objects:v131 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                id v107 = v17;
                id v108 = v13;
                uint64_t v39 = *(void *)v119;
                do
                {
                  for (uint64_t j = 0; j != v38; ++j)
                  {
                    if (*(void *)v119 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    v41 = *(void **)(*((void *)&v118 + 1) + 8 * j);
                    if ([v41 isNaturalLightingSupported]) {
                      ++self->_numMatterLightProfilesWithNaturalLightingSupported;
                    }
                    v42 = [MEMORY[0x1E4F1C9C8] date];
                    v43 = [v42 dateByAddingTimeInterval:-86400.0];

                    if (([v41 isNaturalLightingEnabled] & 1) != 0
                      || ([v41 mostRecentNaturalLightingEnabledDate],
                          v44 = objc_claimAutoreleasedReturnValue(),
                          uint64_t v45 = [v44 compare:v43],
                          v44,
                          v45 == 1))
                    {
                      ++self->_numMatterLightProfilesWithNaturalLightingEnabled;
                    }
                    v46 = [v41 mostRecentNaturalLightingUsedDate];
                    uint64_t v47 = [v46 compare:v43];

                    if (v47 == 1) {
                      ++self->_numMatterLightProfilesWithNaturalLightingUsed;
                    }
                  }
                  uint64_t v38 = [v36 countByEnumeratingWithState:&v118 objects:v131 count:16];
                }
                while (v38);
                goto LABEL_76;
              }
LABEL_77:

              id v14 = v109;
              goto LABEL_78;
            }
            ++self->_numHAPAccessories;
            v33 = [v17 firmwareUpdateProfile];

            if (v33) {
              ++self->_numHAPAccessoriesFirmwareUpdateEligible;
            }
            if [v17 hasIPLink] && (objc_msgSend(v17, "isPrimary"))
            {
              v34 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numHAPIPAccessories;
            }
            else
            {
              if (![v17 hasBTLELink] || !objc_msgSend(v17, "isPrimary"))
              {
LABEL_62:
                id v109 = v14;
                long long v124 = 0u;
                long long v125 = 0u;
                long long v122 = 0u;
                long long v123 = 0u;
                v36 = [v17 lightProfiles];
                uint64_t v48 = [v36 countByEnumeratingWithState:&v122 objects:v132 count:16];
                if (v48)
                {
                  uint64_t v49 = v48;
                  id v107 = v17;
                  id v108 = v13;
                  uint64_t v50 = *(void *)v123;
                  do
                  {
                    for (uint64_t k = 0; k != v49; ++k)
                    {
                      if (*(void *)v123 != v50) {
                        objc_enumerationMutation(v36);
                      }
                      v52 = *(void **)(*((void *)&v122 + 1) + 8 * k);
                      if ([v52 isNaturalLightingSupported]) {
                        ++self->_numLightProfilesWithNaturalLightingSupported;
                      }
                      v53 = [MEMORY[0x1E4F1C9C8] date];
                      v54 = [v53 dateByAddingTimeInterval:-86400.0];

                      if (([v52 isNaturalLightingEnabled] & 1) != 0
                        || ([v52 mostRecentNaturalLightingEnabledDate],
                            v55 = objc_claimAutoreleasedReturnValue(),
                            uint64_t v56 = [v55 compare:v54],
                            v55,
                            v56 == 1))
                      {
                        ++self->_numLightProfilesWithNaturalLightingEnabled;
                      }
                      v57 = [v52 mostRecentNaturalLightingUsedDate];
                      uint64_t v58 = [v57 compare:v54];

                      if (v58 == 1) {
                        ++self->_numLightProfilesWithNaturalLightingUsed;
                      }
                    }
                    uint64_t v49 = [v36 countByEnumeratingWithState:&v122 objects:v132 count:16];
                  }
                  while (v49);
LABEL_76:
                  id v17 = v107;
                  id v13 = v108;
                  goto LABEL_77;
                }
                goto LABEL_77;
              }
              v34 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numHAPBTAccessories;
            }
            ++*(Class *)((char *)&self->super.super.super.isa + *v34);
            goto LABEL_62;
          }
          if (v27 == 1 && v28 == 1)
          {

            uint64_t v29 = 400;
            goto LABEL_163;
          }
          if (v27 == 3 && v28 == 3)
          {

            uint64_t v29 = 392;
            goto LABEL_163;
          }
        }

        uint64_t v29 = 360;
        goto LABEL_163;
      }
    }
    else
    {
      v30 = [v17 category];
      int v31 = [v30 isWiFiRouterAccessoryCategory];

      if (v31)
      {
        self->_networkProtectionStatus = 1;
        if (!v17) {
          goto LABEL_164;
        }
        goto LABEL_29;
      }
    }
  }
  if (v17) {
    goto LABEL_29;
  }
LABEL_164:
  if (v112)
  {
    v96 = [v112 category];
    v97 = [v96 categoryType];
    int v98 = HMFEqualObjects();

    if (v98)
    {
      ++self->_numAppleTVAccessories;
      v99 = [v112 capabilities];
      char v100 = [v99 supportsThreadBorderRouter];

      if ((v100 & 1) == 0) {
        goto LABEL_174;
      }
      v101 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numAppleTV4K2ndGenAccessories;
    }
    else
    {
      if (![v112 isHomePod]) {
        goto LABEL_174;
      }
      v101 = &OBJC_IVAR___HMDHomeConfigurationLogEvent__numAppleAudioAccessories;
    }
    ++*(Class *)((char *)&self->super.super.super.isa + *v101);
LABEL_174:
    if ([v112 isCurrentAccessory])
    {
      int64_t v102 = [v112 fallbackMediaUserType];
      if ((unint64_t)(v102 - 1) < 3) {
        self->_currentMediaAccessoryFallbackMediaUserType = v102;
      }
    }
    uint64_t v94 = 168;
    goto LABEL_178;
  }
  if (v111)
  {
    ++self->_numWholeHouseAudioAccessories;
    goto LABEL_170;
  }
  v103 = (void *)MEMORY[0x1D9452090]();
  v104 = self;
  v105 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    v106 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v127 = v106;
    __int16 v128 = 2112;
    v129 = v113;
    _os_log_impl(&dword_1D49D5000, v105, OS_LOG_TYPE_ERROR, "%{public}@Accessory was not matched to any type for configuration reporting: %@", buf, 0x16u);
  }
LABEL_179:
}

- (HMDHomeConfigurationLogEvent)initWithDataSource:(id)a3 home:(id)a4 configuredWidgetsCount:(int64_t)a5
{
  uint64_t v220 = *MEMORY[0x1E4F143B8];
  id v138 = a3;
  id v139 = a4;
  v8 = [v138 uuid];
  v197.receiver = self;
  v197.super_class = (Class)HMDHomeConfigurationLogEvent;
  BOOL v9 = [(HMMHomeLogEvent *)&v197 initWithHomeUUID:v8];

  if (v9)
  {
    v9->_numConfiguredWidgets = a5;
    v152 = [MEMORY[0x1E4F1CA80] set];
    id v150 = [MEMORY[0x1E4F1CA80] set];
    v9->_isCurrentDeviceResidentEnabled = 0;
    BOOL v10 = [v138 enabledResidents];
    v9->_numResidentsEnabled = [v10 count];
    long long v193 = 0u;
    long long v194 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    obuint64_t j = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v193 objects:v218 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v194;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v194 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v193 + 1) + 8 * i);
          v9->_enabledResidentsDeviceCapabilities |= [v14 legacyResidentCapabilities];
          if ([v14 isCurrentDevice]) {
            v9->_isCurrentDeviceResidentEnabled = 1;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v193 objects:v218 count:16];
      }
      while (v11);
    }

    v9->_isResidentAvailable = [v139 _residentDeviceAvailable];
    v9->_isResidentFirstEnabled = [v138 isResidentFirstAccessoryCommunicationEnabled];
    id v15 = [v139 residentDeviceManager];
    v9->_isResidentElectionV2Enabled = [v15 isResidentElectionV2Enabled];

    v137 = [v138 currentDevice];
    v16 = [v137 capabilities];
    v9->_isCurrentDeviceResidentCapable = [v16 isResidentCapable];

    id v17 = [v139 primaryResident];
    id v18 = [v17 device];
    v9->_isCurrentDevicePrimaryResident = [v18 isEqual:v137];

    v9->_primaryReportingDevice = [v139 awdPrimaryReportingDevice];
    v9->_isCurrentDeviceLocalToHome = [v139 homeLocation] == 1;
    v9->_isAutomaticThirdPartyAccessorySoftwareUpdateEnabled = [v139 isAutomaticThirdPartyAccessorySoftwareUpdateEnabled];
    v19 = [v139 availableBorderRouters];
    v9->_numThreadBorderRouters = [v19 unsignedIntegerValue];

    id v20 = [v138 triggerOwnedActionSets];
    v9->_numTriggerOwnedConfiguredScenes = [v20 count];

    v21 = [v138 actionSets];
    v9->_numScenes = [v21 count];

    v22 = [v139 rooms];
    v9->_numRooms = [v22 count] + 1;

    v23 = [v139 zones];
    v9->_numZones = [v23 count];

    id v24 = [v139 serviceGroups];
    v9->_numAccessoryServiceGroups = [v24 count];

    uint64_t v25 = [v139 availableBSPsCount];
    numBSPs = v9->_numBSPs;
    v9->_numBSPs = (NSNumber *)v25;

    unsigned int v155 = [v139 isOwnerUser];
    if ([v139 networkRouterSupport])
    {
      uint64_t v27 = [v139 protectionMode];
      BOOL v148 = v27 == 1;
      unsigned int v28 = v155;
      if (v27 != 1) {
        unsigned int v28 = 0;
      }
      if (v28 == 1)
      {
        v9->_networkProtectionStatus = 2;
        BOOL v148 = 1;
      }
    }
    else
    {
      BOOL v148 = 0;
    }
    v9->_userPrivilegeBitMasuint64_t k = 0;
    long long v189 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    uint64_t v29 = [v138 users];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v189 objects:v217 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v190;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v190 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = *(void **)(*((void *)&v189 + 1) + 8 * v32);
          if (([v33 isRemoteGateway] & 1) == 0)
          {
            uint64_t v34 = [v33 privilege];
            uint64_t v35 = 8;
            uint64_t v36 = 2;
            switch(v34)
            {
              case 1:
                goto LABEL_25;
              case 2:
                uint64_t v36 = 4;
LABEL_25:
                v9->_userPrivilegeBitMask |= v36;
                goto LABEL_29;
              case 3:
                goto LABEL_27;
              case 4:
                uint64_t v35 = 16;
LABEL_27:
                v9->_userPrivilegeBitMask |= v35;
                goto LABEL_28;
              default:
                v9->_userPrivilegeBitMask |= 1uLL;
                if ((unint64_t)(v34 - 3) > 1) {
                  goto LABEL_29;
                }
LABEL_28:
                ++v9->_numAdmins;
LABEL_29:
                ++v9->_numUsers;
                uint64_t v37 = [v33 accessCode];

                if (v37) {
                  ++v9->_ownerPerspectiveNumUsersWithAccessCode;
                }
                break;
            }
          }
          ++v32;
        }
        while (v30 != v32);
        uint64_t v38 = [v29 countByEnumeratingWithState:&v189 objects:v217 count:16];
        uint64_t v30 = v38;
      }
      while (v38);
    }

    id v39 = [v138 users];
    id v146 = [MEMORY[0x1E4F1CA48] array];
    long long v207 = 0u;
    long long v208 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    id v140 = v39;
    uint64_t v40 = [v140 countByEnumeratingWithState:&v205 objects:v219 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v206;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v206 != v41) {
            objc_enumerationMutation(v140);
          }
          v43 = *(void **)(*((void *)&v205 + 1) + 8 * j);
          v44 = objc_alloc_init(HMDAnalyticsMultiUserSettings);
          -[HMDAnalyticsMultiUserSettings setIsOwner:](v44, "setIsOwner:", [v43 isCurrentUser]);
          uint64_t v45 = [MEMORY[0x1E4F1CA48] array];
          [(HMDAnalyticsMultiUserSettings *)v44 setMultiUserSettingsValuesByKeyPaths:v45];

          v46 = [v43 privateSettingValuesByKeyPath];
          uint64_t v47 = (void *)[v46 mutableCopy];

          uint64_t v48 = [v43 sharedSettingValuesByKeyPath];
          [v47 addEntriesFromDictionary:v48];

          if ([v47 count])
          {
            uint64_t v199 = 0;
            v200 = &v199;
            uint64_t v201 = 0x3032000000;
            v202 = __Block_byref_object_copy__65252;
            v203 = __Block_byref_object_dispose__65253;
            id v204 = [MEMORY[0x1E4F1CA48] array];
            v198[0] = MEMORY[0x1E4F143A8];
            v198[1] = 3221225472;
            v198[2] = ___legacyMultiUserSettings_block_invoke;
            v198[3] = &unk_1E6A0C7E8;
            v198[4] = &v199;
            [v47 enumerateKeysAndObjectsUsingBlock:v198];
            uint64_t v49 = (void *)[(id)v200[5] copy];
            [(HMDAnalyticsMultiUserSettings *)v44 setMultiUserSettingsValuesByKeyPaths:v49];

            [v146 addObject:v44];
            _Block_object_dispose(&v199, 8);
          }
        }
        uint64_t v40 = [v140 countByEnumeratingWithState:&v205 objects:v219 count:16];
      }
      while (v40);
    }

    uint64_t v50 = [v146 copy];
    multiUserSettings = v9->_multiUserSettings;
    v9->_multiUserSettings = (NSArray *)v50;

    v9->_ownerUser = [v138 isOwnerUser];
    v52 = [v138 currentUser];
    v9->_currentUserPrivilege = [v52 privilege];

    v9->_accessToHomeAllowed = [v138 isAccessToHomeAllowed];
    v53 = [v138 accessories];
    v9->_numAccessories = [v53 count];
    long long v185 = 0u;
    long long v186 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    id v147 = v53;
    uint64_t v54 = [v147 countByEnumeratingWithState:&v185 objects:v216 count:16];
    if (v54)
    {
      uint64_t v55 = *(void *)v186;
      do
      {
        for (uint64_t k = 0; k != v54; ++k)
        {
          if (*(void *)v186 != v55) {
            objc_enumerationMutation(v147);
          }
          [(HMDHomeConfigurationLogEvent *)v9 updateConfigWithAccessory:*(void *)(*((void *)&v185 + 1) + 8 * k) reportNetworkProtectionMetrics:v155 networkProtectionEnabled:v148 hapServiceTypes:v152 primaryHAPServiceTypes:v150];
        }
        uint64_t v54 = [v147 countByEnumeratingWithState:&v185 objects:v216 count:16];
      }
      while (v54);
    }

    v156 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v152, "count") + 1);
    if ([v152 count])
    {
      v57 = [[HMDAnalyticsHAPServiceData alloc] initWithServiceType:@"_HomeWithHAPServices_" isPrimary:0 ownerUser:v9->_ownerUser];
      [v156 addObject:v57];
    }
    long long v183 = 0u;
    long long v184 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    id v151 = v150;
    uint64_t v58 = [v151 countByEnumeratingWithState:&v181 objects:v215 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v182;
      do
      {
        for (uint64_t m = 0; m != v58; ++m)
        {
          if (*(void *)v182 != v59) {
            objc_enumerationMutation(v151);
          }
          unint64_t v61 = [[HMDAnalyticsHAPServiceData alloc] initWithServiceType:*(void *)(*((void *)&v181 + 1) + 8 * m) isPrimary:1 ownerUser:v9->_ownerUser];
          [v156 addObject:v61];
        }
        uint64_t v58 = [v151 countByEnumeratingWithState:&v181 objects:v215 count:16];
      }
      while (v58);
    }

    [v152 minusSet:v151];
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    id v149 = v152;
    uint64_t v62 = [v149 countByEnumeratingWithState:&v177 objects:v214 count:16];
    if (v62)
    {
      uint64_t v63 = *(void *)v178;
      do
      {
        for (uint64_t n = 0; n != v62; ++n)
        {
          if (*(void *)v178 != v63) {
            objc_enumerationMutation(v149);
          }
          uint64_t v65 = [[HMDAnalyticsHAPServiceData alloc] initWithServiceType:*(void *)(*((void *)&v177 + 1) + 8 * n) isPrimary:0 ownerUser:v9->_ownerUser];
          [v156 addObject:v65];
        }
        uint64_t v62 = [v149 countByEnumeratingWithState:&v177 objects:v214 count:16];
      }
      while (v62);
    }

    uint64_t v66 = [v156 copy];
    hapServices = v9->_hapServices;
    v9->_hapServices = (NSArray *)v66;

    v68 = [v138 accessories];
    v69 = objc_msgSend(v68, "na_filter:", &__block_literal_global_65256);
    v9->_numHomePodMinis = [v69 count];

    v70 = [v138 accessories];
    v71 = objc_msgSend(v70, "na_filter:", &__block_literal_global_13_65257);
    v9->_numHomePod2ndGeuint64_t n = [v71 count];

    v72 = [v138 accessories];
    int v73 = objc_msgSend(v72, "na_filter:", &__block_literal_global_15_65258);
    v9->_numHomePods = [v73 count];

    v74 = [v139 mediaSystems];
    v9->_numMediaSystems = [v74 count];

    v75 = [v139 mediaSystems];
    uint64_t v76 = objc_msgSend(v75, "na_filter:", &__block_literal_global_18_65259);
    v9->_numHomePodMiniStereoPairs = [v76 count];

    v77 = [v139 mediaSystems];
    v78 = objc_msgSend(v77, "na_filter:", &__block_literal_global_22_65260);
    v9->_numHomePod2ndGenStereoPairs = [v78 count];

    char v79 = [v139 mediaSystems];
    v80 = objc_msgSend(v79, "na_filter:", &__block_literal_global_26_65261);
    v9->_numHomePodStereoPairs = [v80 count];

    uint64_t v81 = [v138 triggers];
    v9->_numTriggers += [v81 count];
    v134 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v81, "count"));
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    id v135 = v81;
    id v141 = (id)[v135 countByEnumeratingWithState:&v173 objects:v213 count:16];
    if (v141)
    {
      uint64_t v133 = *(void *)v174;
      do
      {
        uint64_t v82 = 0;
        do
        {
          if (*(void *)v174 != v133)
          {
            uint64_t v83 = v82;
            objc_enumerationMutation(v135);
            uint64_t v82 = v83;
          }
          uint64_t v136 = v82;
          char v84 = *(void **)(*((void *)&v173 + 1) + 8 * v82);
          if ([v84 active]) {
            ++v9->_numActiveTriggers;
          }
          if ([v84 triggerType] == 1)
          {
            ++v9->_numEventTriggers;
            id v85 = v84;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v86 = v85;
            }
            else {
              v86 = 0;
            }
            id v87 = v86;

            v88 = [[HMDAnalyticsEventTriggerData alloc] initWithEventTrigger:v87 isAdding:0];
            if (v88) {
              [v134 addObject:v88];
            }
          }
          else if ([v84 triggerType] == 2)
          {
            ++v9->_numTimerTriggers;
          }
          id v144 = [v84 actionSets];
          long long v171 = 0u;
          long long v172 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          uint64_t v89 = [v144 countByEnumeratingWithState:&v169 objects:v212 count:16];
          if (v89)
          {
            uint64_t v153 = *(void *)v170;
            do
            {
              for (iuint64_t i = 0; ii != v89; ++ii)
              {
                if (*(void *)v170 != v153) {
                  objc_enumerationMutation(v144);
                }
                v91 = *(void **)(*((void *)&v169 + 1) + 8 * ii);
                long long v165 = 0u;
                long long v166 = 0u;
                long long v167 = 0u;
                long long v168 = 0u;
                int v92 = [v91 actions];
                uint64_t v93 = [v92 countByEnumeratingWithState:&v165 objects:v211 count:16];
                if (v93)
                {
                  uint64_t v94 = *(void *)v166;
                  do
                  {
                    for (juint64_t j = 0; jj != v93; ++jj)
                    {
                      if (*(void *)v166 != v94) {
                        objc_enumerationMutation(v92);
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        ++v9->_numShortcuts;
                      }
                    }
                    uint64_t v93 = [v92 countByEnumeratingWithState:&v165 objects:v211 count:16];
                  }
                  while (v93);
                }
              }
              uint64_t v89 = [v144 countByEnumeratingWithState:&v169 objects:v212 count:16];
            }
            while (v89);
          }

          uint64_t v82 = v136 + 1;
        }
        while ((id)(v136 + 1) != v141);
        id v141 = (id)[v135 countByEnumeratingWithState:&v173 objects:v213 count:16];
      }
      while (v141);
    }

    uint64_t v96 = [v134 copy];
    eventTriggers = v9->_eventTriggers;
    v9->_eventTriggers = (NSArray *)v96;

    int v98 = [v138 actionSets];
    v99 = (void *)[v98 copy];

    long long v163 = 0u;
    long long v164 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    id v145 = v99;
    uint64_t v100 = [v145 countByEnumeratingWithState:&v161 objects:v210 count:16];
    if (v100)
    {
      uint64_t v101 = *(void *)v162;
      do
      {
        for (kuint64_t k = 0; kk != v100; ++kk)
        {
          if (*(void *)v162 != v101) {
            objc_enumerationMutation(v145);
          }
          v103 = [*(id *)(*((void *)&v161 + 1) + 8 * kk) actions];
          uint64_t v104 = [v103 count];

          if (v104) {
            ++v9->_numConfiguredScenes;
          }
        }
        uint64_t v100 = [v145 countByEnumeratingWithState:&v161 objects:v210 count:16];
      }
      while (v100);
    }

    [(HMDHomeConfigurationLogEvent *)v9 setHomeConfigurationBitMasks];
    v105 = [v139 creationDate];
    v9->_homeCreationCohortWeeuint64_t k = [(HMDHomeConfigurationLogEvent *)v9 weeksSinceDate:v105 trimAtMaximumValue:13];

    v106 = [v139 firstHAPAccessoryAddedDate];
    v9->_firstHAPAccessoryAddedCohortWeeuint64_t k = [(HMDHomeConfigurationLogEvent *)v9 weeksSinceDate:v106 trimAtMaximumValue:13];

    id v107 = [v139 accessoriesWithWalletKeySupport];
    v9->_numAccessoriesWithWalletKeySupported = [v107 count];

    id v108 = [v139 walletKeyManager];
    v9->_hasHomeKeyInWallet = [v108 hasHomeKeyInWallet];

    v9->_isSmokeAlarmEnabled = [v138 isSmokeAlarmEnabled];
    v9->_isSiriPhraseOptionsHeySiriEnabled = [v138 isSiriPhraseOptionsHeySiriEnabled];
    v9->_isSiriPhraseOptionsJustSiriEnabled = [v138 isSiriPhraseOptionsJustSiriEnabled];
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    id v142 = [v138 appleMediaAccessories];
    id v109 = 0;
    uint64_t v110 = [v142 countByEnumeratingWithState:&v157 objects:v209 count:16];
    if (v110)
    {
      v154 = 0;
      uint64_t v111 = *(void *)v158;
      do
      {
        for (muint64_t m = 0; mm != v110; ++mm)
        {
          if (*(void *)v158 != v111) {
            objc_enumerationMutation(v142);
          }
          v113 = *(void **)(*((void *)&v157 + 1) + 8 * mm);
          if (!v109
            || ([*(id *)(*((void *)&v157 + 1) + 8 * mm) softwareVersion],
                (long long v114 = objc_claimAutoreleasedReturnValue()) != 0)
            && ([v113 softwareVersion],
                long long v115 = objc_claimAutoreleasedReturnValue(),
                int v116 = [v109 isGreaterThanVersion:v115],
                v115,
                v114,
                v116))
          {
            uint64_t v117 = [v113 softwareVersion];

            id v109 = (void *)v117;
          }
          long long v118 = [v113 device];
          long long v119 = [v139 primaryResident];
          long long v120 = [v119 device];
          int v121 = [v118 isEqual:v120];

          if (v121)
          {
            uint64_t v122 = [v113 softwareVersion];

            v154 = (void *)v122;
          }
        }
        uint64_t v110 = [v142 countByEnumeratingWithState:&v157 objects:v209 count:16];
      }
      while (v110);
    }
    else
    {
      v154 = 0;
    }

    uint64_t v123 = [v109 shortVersionString];
    oldestTVOSVersionInHome = v9->_oldestTVOSVersionInHome;
    v9->_oldestTVOSVersionInHome = (NSString *)v123;

    uint64_t v125 = [v109 buildVersion];
    oldestTVOSBuildInHome = v9->_oldestTVOSBuildInHome;
    v9->_oldestTVOSBuildInHome = (NSString *)v125;

    uint64_t v127 = [v154 shortVersionString];
    primaryResidentVersionInHome = v9->_primaryResidentVersionInHome;
    v9->_primaryResidentVersionInHome = (NSString *)v127;

    uint64_t v129 = [v154 buildVersion];
    primaryResidentBuildInHome = v9->_primaryResidentBuildInHome;
    v9->_primaryResidentBuildInHome = (NSString *)v129;

    v131 = v9;
  }

  return v9;
}

uint64_t __79__HMDHomeConfigurationLogEvent_initWithDataSource_home_configuredWidgetsCount___block_invoke_8(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 accessories];
  uint64_t v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_28_65266);

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
  uint64_t v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_24_65269);

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
  uint64_t v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_20_65272);

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
  unint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
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
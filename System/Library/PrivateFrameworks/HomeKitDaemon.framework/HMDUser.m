@interface HMDUser
+ (BOOL)isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (HMDUser)userWithDictionary:(id)a3;
+ (HMDUser)userWithDictionary:(id)a3 home:(id)a4;
+ (id)UUIDWithUserID:(id)a3 forHomeIdentifier:(id)a4 uuid:(id)a5 pairingIdentity:(id)a6;
+ (id)_openZoneWithName:(id)a3 inDatabase:(id)a4;
+ (id)allLastUserSyncDataArchives;
+ (id)allowedClassesForAnnounceNotificationMode;
+ (id)allowedClassesForSyncData;
+ (id)appendRootPath:(id)a3 withSettingPath:(id)a4;
+ (id)av_authorizedPeerForPairingIdentity:(id)a3 isOwner:(BOOL)a4;
+ (id)currentUserWithPrivilege:(unint64_t)a3 forHome:(id)a4;
+ (id)currentUserWithPrivilege:(unint64_t)a3 forHome:(id)a4 forceHH1Key:(BOOL)a5;
+ (id)getSettingsUsingPreOrderTraversal:(id)a3 rootUUID:(id)a4 keyPath:(id)a5;
+ (id)getSyncDataFromLocalDiskWithArchive:(id)a3;
+ (id)localPrivateZoneForSharedUserUUID:(id)a3 database:(id)a4;
+ (id)localSharedZoneForSharedUserUUID:(id)a3 database:(id)a4;
+ (id)logCategory;
+ (id)ownerWithUserID:(id)a3 home:(id)a4 pairingIdentity:(id)a5 homeManager:(id)a6;
+ (id)privateZoneNameForUserUUID:(id)a3;
+ (id)sharedZoneNameForUserUUID:(id)a3;
+ (id)userDictionaryWithUserID:(id)a3 privilege:(unint64_t)a4 remoteAccessAllowed:(BOOL)a5 cameraAccessLevel:(unint64_t)a6 announceAccessAllowed:(id)a7 announceAccessLevel:(unint64_t)a8 audioAnalysisUserDropInAccessLevel:(unint64_t)a9 restrictedGuestAccessSettings:(id)a10;
+ (id)userIDForAccountHandle:(id)a3;
+ (unint64_t)hmdUserPrivilegeFromHMMTRUserPrivilege:(unint64_t)a3;
+ (unint64_t)hmmtrUserPrivilegeFromHMDUserPrivilege:(unint64_t)a3;
+ (unint64_t)privilegeFromDictionary:(id)a3;
+ (void)__findOrCreateCKSharedUserAccessorySettingsForAccessory:(id)a3 usingManagedObjectContext:(id)a4 rootShareObject:(id)a5 listeningHistoryEnabled:(id)a6 mediaContentProfileEnabled:(id)a7 personalRequestsEnabled:(id)a8;
+ (void)_fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5;
+ (void)_fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5;
+ (void)_fetchAndMigratePhotosPersonManagerSettingsFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5;
+ (void)_fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5;
+ (void)_saveSharedUserSettingsToCoreData:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5;
+ (void)migrateHH1SettingsToHH2ForSharedUserWithUUID:(id)a3 homeUUID:(id)a4 privateZone:(id)a5 backingStoreContext:(id)a6;
+ (void)migrateHH1SettingsToHH2ForSharedUserWithUUID:(id)a3 homeUUID:(id)a4 sharedZone:(id)a5 backingStoreContext:(id)a6;
- (AVOutputDeviceAuthorizedPeer)av_authorizedPeer;
- (BOOL)_isExplicitContentValueEnabledForAppleMediaAccessory:(id)a3;
- (BOOL)_setRemoteAccessAllowed:(BOOL)a3;
- (BOOL)allowExplicitContent;
- (BOOL)allowiTunesAccount;
- (BOOL)areAccessoriesInAllowedList:(id)a3;
- (BOOL)cloudShareTrustManager:(id)a3 shouldShareTrustWithUser:(id)a4;
- (BOOL)dolbyAtmosEnabled;
- (BOOL)hasCameraClipsAccess;
- (BOOL)hasDeviceWithHomeKitVersionGreaterThanVersion:(id)a3;
- (BOOL)isAccessCurrentlyAllowedBySchedule;
- (BOOL)isAccessPolicySet;
- (BOOL)isAccountEqualWithUser:(id)a3;
- (BOOL)isAdministrator;
- (BOOL)isAllowedToAccessActivityHistory;
- (BOOL)isAllowedToAddOrRemoveHAPPairingsOnAccessory;
- (BOOL)isAllowedToContributeActivityStates;
- (BOOL)isAllowedToHaveCATId;
- (BOOL)isAllowedToSharePhotosPersonManagerData;
- (BOOL)isAnnounceAccessAllowed;
- (BOOL)isCurrentUser;
- (BOOL)isCurrentUserAndOwner;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalAccessoryCommunicationAllowed;
- (BOOL)isOwner;
- (BOOL)isOwnerCapableForTrustManager:(id)a3;
- (BOOL)isPending;
- (BOOL)isRemoteAccessAllowed;
- (BOOL)isRemoteGateway;
- (BOOL)isRestrictedGuest;
- (BOOL)isRunningOnHomeOwnersDevice;
- (BOOL)isSharedUsersMeDeviceForProfileMetadata;
- (BOOL)isValid;
- (BOOL)losslessMusicEnabled;
- (BOOL)matchingPairingIdentityIdentifier:(id)a3;
- (BOOL)needsiTunesMultiUserRepair;
- (BOOL)ownerCompletedSwitchingHomesOnboardingUI;
- (BOOL)ownerDismissed2024EnergyOnboarding;
- (BOOL)ownerDismissedAccessCodeOnboarding;
- (BOOL)ownerDismissedAccessoryFirmwareUpdateOnboarding;
- (BOOL)ownerDismissedAnnounceOnboarding;
- (BOOL)ownerDismissedCameraRecordingOnboarding;
- (BOOL)ownerDismissedCameraRecordingSetupBanner;
- (BOOL)ownerDismissedCameraUpgradeOfferBanner;
- (BOOL)ownerDismissedHomeTheaterOnboarding;
- (BOOL)ownerDismissedIdentifyVoiceOnboarding;
- (BOOL)ownerDismissedIdentifyVoiceSetupBanner;
- (BOOL)ownerDismissedNaturalLightingOnboarding;
- (BOOL)ownerDismissedTVViewingProfileOnboarding;
- (BOOL)ownerDismissedTVViewingProfileSetupBanner;
- (BOOL)ownerDismissedUserSplitMediaAccountWarning;
- (BOOL)ownerDismissedWalletKeyExpressModeOnboarding;
- (BOOL)ownerDismissedWelcomeUI;
- (BOOL)ownerHasUserSeenRMVNewLanguageNotification;
- (BOOL)playbackInfluencesEnabled;
- (BOOL)refreshDisplayName;
- (BOOL)requiresMakoSupport;
- (BOOL)shouldWeOverrideRemoteAccessAllowedDespiteNoRemoteAccessAllowed;
- (BOOL)siriIdentifyVoiceEnabled;
- (BOOL)updateAdministrator:(BOOL)a3;
- (BOOL)userDataController:(id)a3 isAccessoryUserListeningHistoryUpdateCapable:(id)a4;
- (BOOL)userDataController:(id)a3 isAppleMediaAccessory:(id)a4;
- (BOOL)userDataController:(id)a3 isHAPAccessory:(id)a4;
- (BOOL)userDataController:(id)a3 isMediaContentProfileCapableAccessoryID:(id)a4;
- (BOOL)userDataController:(id)a3 isPersonalRequestCapableAccessoryID:(id)a4;
- (HAPKeyStore)keyStore;
- (HAPPairingIdentity)pairingIdentity;
- (HMBShareUserID)cloudShareID;
- (HMDAccountIdentifier)accountIdentifier;
- (HMDAccountMetadata)accountMetadata;
- (HMDAssistantAccessControl)assistantAccessControl;
- (HMDCloudShareMessenger)shareMessenger;
- (HMDCloudShareTrustManager)cloudShareTrustManager;
- (HMDHome)home;
- (HMDPersonSettingsManager)personSettingsManager;
- (HMDPhotosPersonManager)photosPersonManager;
- (HMDRestrictedGuestHomeAccessSettings)restrictedGuestAccessSettings;
- (HMDSiriMultiUserNewLanguageNotificationManager)siriMultiUserNewLanguageNotificationManager;
- (HMDUser)initWithAccountHandle:(id)a3 home:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6;
- (HMDUser)initWithAccountHandle:(id)a3 home:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6 dataSource:(id)a7;
- (HMDUser)initWithAccountHandle:(id)a3 homeUUID:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6;
- (HMDUser)initWithAccountHandle:(id)a3 homeUUID:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6 keyStore:(id)a7 dataSource:(id)a8;
- (HMDUser)initWithCoder:(id)a3;
- (HMDUser)initWithModelObject:(id)a3;
- (HMDUserAccessorySettingsDataController)accessorySettingsDataController;
- (HMDUserDataController)userDataController;
- (HMDUserDataSource)dataSource;
- (HMDUserPhotosPersonDataManager)photosPersonDataManager;
- (HMDUserSettingsBackingStoreController)privateBackingStoreController;
- (HMDUserSettingsBackingStoreController)sharedBackingStoreController;
- (HMFMessageDispatcher)messageDispatcher;
- (HMPhotosPersonManagerSettings)photosPersonManagerSettings;
- (HMUserPresenceAuthorization)presenceAuthStatus;
- (NAFuture)cloudShareIDFuture;
- (NSData)acwgIssuerPublicKeyExternalRepresentation;
- (NSData)nfcIssuerKeyIdentifier;
- (NSData)publicKey;
- (NSDictionary)ownerCharacteristicAuthorizationData;
- (NSNumber)matterCASEAuthenticatedTagID;
- (NSNumber)notificationContextHAPIdentifier;
- (NSNumber)notificationContextNFCIdentifier;
- (NSNumber)uniqueIDForAccessories;
- (NSSet)cachedCurrentUserPairingIdentityIdentifiers;
- (NSString)accessCode;
- (NSString)displayName;
- (NSString)firstName;
- (NSString)iCloudAltDSID;
- (NSString)lastName;
- (NSString)mergeIdentifier;
- (NSString)pairingUsername;
- (NSString)userID;
- (NSUUID)accessCodeChangedByUserUUID;
- (NSUUID)assistantAccessControlModelUUID;
- (NSUUID)spiClientIdentifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)messageReceiveQueue;
- (OS_dispatch_queue)queue;
- (double)configuredProofOfLocalityTimeout;
- (id)_initWithCoder:(id)a3;
- (id)account;
- (id)accountHandle;
- (id)allAccessoryUUID;
- (id)announceNotificationFileName;
- (id)announceNotificationFileNameForUserUUID:(id)a3;
- (id)attributeDescriptions;
- (id)backingStoreController:(id)a3 createParticipantManagerForCloudZone:(id)a4;
- (id)backingStoreObjects:(int64_t)a3;
- (id)dictionaryEncoding;
- (id)dumpState;
- (id)logIdentifier;
- (id)messageDestination;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)newModelWithChangeType:(unint64_t)a3;
- (id)ownerPrivateSettingsAsDictionary;
- (id)privateSettingValuesByKeyPath;
- (id)privateZoneName;
- (id)pushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4;
- (id)restrictedGuestScheduleEndTimerID;
- (id)restrictedGuestScheduleStartTimerID;
- (id)setHasUserSeenRMVNewLanguageNotification:(BOOL)a3;
- (id)settingsControllerFollowerKeyPaths:(id)a3;
- (id)sharedSettingValuesByKeyPath;
- (id)sharedSettingsAsDictionary;
- (id)sharedZoneName;
- (id)shortDescription;
- (id)trustTargetUUID;
- (id)userIDsToMigrateAnnounceSettingsFrom;
- (id)zoneNameForCloudShareTrustManager:(id)a3;
- (int64_t)sharedUserSettingsLogEventBackingStoreControllerRunState;
- (int64_t)userCloudShareWithOwnerMessagingState;
- (uint64_t)announceUserAccessLevelFromAnnounceAccessAllowed:(void *)a3 announceAccessLevel:;
- (unint64_t)_compatiblePrivilege;
- (unint64_t)allowedRemoteEventAccessUserTypes;
- (unint64_t)announceAccessLevel;
- (unint64_t)announceNotificationModeForCurrentDevice;
- (unint64_t)audioAnalysisUserDropInAccessLevel;
- (unint64_t)camerasAccessLevel;
- (unint64_t)defaultAnnounceUserAccessLevel;
- (unint64_t)hash;
- (unint64_t)ownerAddSceneButtonPresentedCount;
- (unint64_t)privilege;
- (unint64_t)userAccessPolicy;
- (void)__handleAddedAccount:(id)a3;
- (void)__handleModifiedAccount:(id)a3;
- (void)__handleRemovedAccount:(id)a3;
- (void)_encodeWithCoder:(id)a3;
- (void)_handleAnnounceSettingsUpdate:(id)a3;
- (void)_handleAssistantAccessControlUpdate:(id)a3;
- (void)_handleCloudShareWithOwnerMessageError;
- (void)_handleFMFDeviceChangedNotification:(id)a3;
- (void)_handleFetchProfilePhoto:(id)a3;
- (void)_handleLegacyPairingIdentityRequest:(id)a3;
- (void)_handleMediaContentProfileAccessControlUpdate:(id)a3;
- (void)_handleMultiUserSharePayloadRequest:(id)a3;
- (void)_handleNeedsiTunesMultiUserRepair:(id)a3;
- (void)_handlePairingIdentityRequest:(id)a3;
- (void)_handleRestrictedGuestNewSchedule:(id)a3;
- (void)_handleShareClientRepairRequest:(id)a3;
- (void)_handleShareLookupInfoRequest:(id)a3;
- (void)_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3;
- (void)_migrateAnnounceNotificationModeIfNeeded;
- (void)_notifyEveryOneAboutRestrictedGuestScheduleNotification:(id)a3;
- (void)_pushSharedProfileMetadataToStoreForHome:(id)a3 iCloudAltDSID:(id)a4 firstName:(id)a5 lastName:(id)a6 profilePhotoDict:(id)a7;
- (void)_readAnnounceNotificationModeFromLocalStore;
- (void)_recoverTrustManagerDueToUUIDChange;
- (void)_recoverUserSettingsDueToUUIDChange;
- (void)_removeAnnounceNotificationModeFileFromDiskForUserUUID:(id)a3;
- (void)_saveAnnounceSettingsToLocalStore:(unint64_t)a3;
- (void)_saveSharedUserProfileMetadataToBackingStoreContext:(id)a3 rootShareObject:(id)a4 iCloudAltDSID:(id)a5 firstName:(id)a6 lastName:(id)a7 profilePhotoDict:(id)a8;
- (void)_sendAccountMessage:(id)a3 payload:(id)a4 deviceCapabilities:(id)a5 multicast:(BOOL)a6 preferPrimary:(BOOL)a7 completion:(id)a8;
- (void)_sendSecureShareClientPayloadToMostEligibleDevice:(id)a3 completion:(id)a4;
- (void)_setUuidUnsafely:(id)a3;
- (void)_transactionAccessorySettingsUpdated:(id)a3;
- (void)_transactionPhotosPersonManagerSettingsUpdated:(id)a3;
- (void)_transactionUserProfileMetaDataUpdated:(id)a3;
- (void)_transactionUserSettingsUpdated:(id)a3;
- (void)_transactionUserUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)_updateAnnounceNotificationMode:(unint64_t)a3;
- (void)_updateAnnounceNotificationModeToLocalStore:(unint64_t)a3 managedObjectContext:(id)a4;
- (void)applyConditionalValueUpdateToModels:(id)a3;
- (void)backingStoreController:(id)a3 didUpdatePhotosPersonManagerSettingsModel:(id)a4 previousPhotosPersonManagerSettingsModel:(id)a5;
- (void)cancelRestrictedGuestScheduledTimers;
- (void)cloudShareTrustManager:(id)a3 didFetchOwnerCloudShareID:(id)a4;
- (void)cloudShareTrustManager:(id)a3 didRemoveUserWithUUID:(id)a4;
- (void)configureCloudShareTrustManager;
- (void)configurePersonSettingsManager;
- (void)configurePhotosPersonDataManager;
- (void)configureWithHome:(id)a3;
- (void)dealloc;
- (void)deregisterForMessages;
- (void)deregisterIDSActivityObserver:(id)a3;
- (void)deregisterIDSActivityObserver:(id)a3 subActivity:(id)a4 subjectDevice:(id)a5;
- (void)deregisterIdentity;
- (void)didFinishConfiguringForCloudShareTrustManager:(id)a3;
- (void)didRemoveTrustZoneInCloudShareTrustManager:(id)a3;
- (void)didStartBackingStoreController:(id)a3;
- (void)didStartLocalZoneForBackingStoreController:(id)a3;
- (void)didStopBackingStoreController:(id)a3;
- (void)enableUserListeningHistoryForAccessory:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fetchPairingIdentityForClientWithMessage:(id)a3;
- (void)handleAssistantAccessControlUpdate:(id)a3;
- (void)handleMediaContentProfileAccessControlUpdate:(id)a3;
- (void)handlePrimaryResidentUpdateNotification:(id)a3;
- (void)handleRemovedAccessory:(id)a3;
- (void)handleRestrictedGuestScheduleTimer:(id)a3;
- (void)handleUpdatedCATForUser;
- (void)handleUserDataControllerInitialized:(id)a3;
- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3;
- (void)initializeUserSettingsWithHome:(id)a3;
- (void)postUserSettingsUpdatedNotificationWithReason:(id)a3;
- (void)pushMetadataToStoreForHome:(id)a3;
- (void)recoverUserCloudDataDueToUUIDChangeFromOldUUID:(id)a3;
- (void)registerForMessages;
- (void)registerIDSActivityObserver:(id)a3 subActivity:(id)a4 subjectDevice:(id)a5;
- (void)registerIdentity;
- (void)removeAccessoriesFromAssistantAccessControlList:(id)a3;
- (void)removeCloudData;
- (void)removeCloudShareID;
- (void)scheduleRestrictedGuestAccessTimersWithReason:(id)a3;
- (void)sendSharedUserProfileMetadataUpdatedMessage;
- (void)setAccessCode:(id)a3;
- (void)setAccessCodeChangedByUserUUID:(id)a3;
- (void)setAccessorySettingsDataController:(id)a3;
- (void)setAccountHandle:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountMetadata:(id)a3;
- (void)setAcwgIssuerPublicKeyExternalRepresentation:(id)a3;
- (void)setAllowExplicitContent:(BOOL)a3;
- (void)setAllowiTunesAccount:(BOOL)a3;
- (void)setAnnounceAccessLevel:(unint64_t)a3;
- (void)setAnnounceNotificationModeForCurrentDevice:(unint64_t)a3;
- (void)setAssistantAccessControl:(id)a3;
- (void)setAudioAnalysisUserDropInAccessLevel:(unint64_t)a3;
- (void)setCamerasAccessLevel:(unint64_t)a3;
- (void)setCloudShareID:(id)a3;
- (void)setCloudShareTrustManager:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDolbyAtmosEnabled:(BOOL)a3;
- (void)setFirstName:(id)a3;
- (void)setHome:(id)a3;
- (void)setICloudAltDSID:(id)a3;
- (void)setLastName:(id)a3;
- (void)setLosslessMusicEnabled:(BOOL)a3;
- (void)setMatterCASEAuthenticatedTagID:(id)a3;
- (void)setMergeIdentifier:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setNeedsiTunesMultiUserRepair:(BOOL)a3;
- (void)setOwnerAddSceneButtonPresentedCount:(unint64_t)a3;
- (void)setOwnerCharacteristicAuthorizationData:(id)a3;
- (void)setOwnerCompletedSwitchingHomesOnboardingUI:(BOOL)a3;
- (void)setOwnerDismissed2024EnergyOnboarding:(BOOL)a3;
- (void)setOwnerDismissedAccessCodeOnboarding:(BOOL)a3;
- (void)setOwnerDismissedAccessoryFirmwareUpdateOnboarding:(BOOL)a3;
- (void)setOwnerDismissedAnnounceOnboarding:(BOOL)a3;
- (void)setOwnerDismissedCameraRecordingOnboarding:(BOOL)a3;
- (void)setOwnerDismissedCameraRecordingSetupBanner:(BOOL)a3;
- (void)setOwnerDismissedCameraUpgradeOfferBanner:(BOOL)a3;
- (void)setOwnerDismissedHomeTheaterOnboarding:(BOOL)a3;
- (void)setOwnerDismissedIdentifyVoiceOnboarding:(BOOL)a3;
- (void)setOwnerDismissedIdentifyVoiceSetupBanner:(BOOL)a3;
- (void)setOwnerDismissedNaturalLightingOnboarding:(BOOL)a3;
- (void)setOwnerDismissedTVViewingProfileOnboarding:(BOOL)a3;
- (void)setOwnerDismissedTVViewingProfileSetupBanner:(BOOL)a3;
- (void)setOwnerDismissedUserSplitMediaAccountWarning:(BOOL)a3;
- (void)setOwnerDismissedWalletKeyExpressModeOnboarding:(BOOL)a3;
- (void)setOwnerDismissedWelcomeUI:(BOOL)a3;
- (void)setOwnerHasUserSeenRMVNewLanguageNotification:(BOOL)a3;
- (void)setPairingIdentity:(id)a3;
- (void)setPersonSettingsManager:(id)a3;
- (void)setPhotosPersonDataManager:(id)a3;
- (void)setPlaybackInfluencesEnabled:(BOOL)a3;
- (void)setPresenceAuthStatus:(id)a3;
- (void)setPrivateBackingStoreController:(id)a3;
- (void)setPrivilege:(unint64_t)a3;
- (void)setRemoteAccessAllowed:(BOOL)a3;
- (void)setRestrictedGuestAccessSettings:(id)a3;
- (void)setShareMessenger:(id)a3;
- (void)setSharedBackingStoreController:(id)a3;
- (void)setSiriIdentifyVoiceEnabled:(BOOL)a3;
- (void)setSiriMultiUserNewLanguageNotificationManager:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUserCloudShareWithOwnerMessagingState:(int64_t)a3;
- (void)setUserDataController:(id)a3;
- (void)setUserID:(id)a3;
- (void)setiCloudAltDSID:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)unconfigure;
- (void)updateAnnounceNotificationMode:(unint64_t)a3;
- (void)updateCloudShareID:(id)a3;
- (void)updateIDSActivityObserver:(id)a3;
- (void)updateRestrictedGuestSettingsFromWorkingStoreIfNeeded;
- (void)updateSharedBackingStoreControllerParticipants;
- (void)userDataControllerDidUpdateAssistantAccessControl:(id)a3;
- (void)userDataControllerDidUpdateMediaContentProfile:(id)a3;
- (void)userDataControllerDidUpdateUserListeningHistoryUpdateControl:(id)a3;
@end

@implementation HMDUser

- (BOOL)isAccessPolicySet
{
  return [(HMDUser *)self userAccessPolicy] & 1;
}

- (BOOL)isAllowedToAddOrRemoveHAPPairingsOnAccessory
{
  v2 = self;
  char v3 = sub_22F631110();

  return v3 & 1;
}

- (BOOL)isAllowedToSharePhotosPersonManagerData
{
  v2 = self;
  if ([(HMDUser *)v2 isAccessPolicySet])
  {
    unint64_t v3 = [(HMDUser *)v2 userAccessPolicy];

    return (v3 >> 2) & 1;
  }
  else
  {
    id v5 = [(HMDUser *)v2 privilege];

    LOBYTE(v4) = v5 != (id)5;
  }
  return v4;
}

- (BOOL)isAllowedToAccessActivityHistory
{
  v2 = self;
  if ([(HMDUser *)v2 isAccessPolicySet])
  {
    unint64_t v3 = [(HMDUser *)v2 userAccessPolicy];

    return (v3 >> 3) & 1;
  }
  else
  {
    id v5 = [(HMDUser *)v2 privilege];

    LOBYTE(v4) = v5 != (id)5;
  }
  return v4;
}

- (BOOL)isAllowedToHaveCATId
{
  v2 = self;
  if ([(HMDUser *)v2 isAccessPolicySet])
  {
    unint64_t v3 = [(HMDUser *)v2 userAccessPolicy];

    return (v3 >> 4) & 1;
  }
  else
  {
    id v5 = [(HMDUser *)v2 privilege];

    LOBYTE(v4) = v5 != (id)5;
  }
  return v4;
}

- (BOOL)isLocalAccessoryCommunicationAllowed
{
  v2 = self;
  if ([(HMDUser *)v2 isAccessPolicySet])
  {
    unint64_t v3 = [(HMDUser *)v2 userAccessPolicy];

    return (v3 >> 5) & 1;
  }
  else
  {
    id v5 = [(HMDUser *)v2 privilege];

    LOBYTE(v4) = v5 != (id)5;
  }
  return v4;
}

- (BOOL)isAllowedToContributeActivityStates
{
  return ![(HMDUser *)self isPending];
}

+ (BOOL)isAllowedToAddOrRemoveHAPPairingsOnAccessoryFor:(id)a3
{
  swift_unknownObjectRetain();
  unsigned __int8 v4 = sub_22F6313EC(a3);
  swift_unknownObjectRelease();
  return v4 & 1;
}

- (AVOutputDeviceAuthorizedPeer)av_authorizedPeer
{
  unint64_t v3 = [(HMDUser *)self pairingIdentity];
  if (v3)
  {
    unsigned __int8 v4 = +[HMDUser av_authorizedPeerForPairingIdentity:v3 isOwner:[(HMDUser *)self privilege] == 3];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return (AVOutputDeviceAuthorizedPeer *)v4;
}

+ (id)av_authorizedPeerForPairingIdentity:(id)a3 isOwner:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (objc_class *)MEMORY[0x263EFA7C8];
  id v6 = a3;
  id v7 = [v5 alloc];
  v8 = [v6 identifier];
  v9 = [v6 publicKey];

  v10 = [v9 data];
  v11 = (void *)[v7 initWithID:v8 publicKey:v10 hasAdministratorPrivileges:v4];

  return v11;
}

- (BOOL)hasCameraClipsAccess
{
  int v3 = [(HMDUser *)self isRemoteAccessAllowed];
  if (v3)
  {
    unint64_t v4 = [(HMDUser *)self camerasAccessLevel];
    LOBYTE(v3) = MEMORY[0x270EF3DA0](v4);
  }
  return v3;
}

- (NSData)nfcIssuerKeyIdentifier
{
  v2 = [(HMDUser *)self pairingIdentity];
  int v3 = +[HMDHome nfcIssuerKeyIdentifierWithPairingIdentity:v2];

  return (NSData *)v3;
}

+ (unint64_t)hmdUserPrivilegeFromHMMTRUserPrivilege:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 2;
  }
  else {
    return qword_2303E46E0[a3 - 1];
  }
}

+ (unint64_t)hmmtrUserPrivilegeFromHMDUserPrivilege:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return qword_2303E46B8[a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_sharedBackingStoreController, 0);
  objc_storeStrong((id *)&self->_cloudShareTrustManager, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedCurrentUserPairingIdentityIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessorySettingsDataController, 0);
  objc_storeStrong((id *)&self->_siriMultiUserNewLanguageNotificationManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_privateBackingStoreController, 0);
  objc_storeStrong((id *)&self->_shareMessenger, 0);
  objc_storeStrong((id *)&self->_accountMetadata, 0);
  objc_storeStrong((id *)&self->_acwgIssuerPublicKeyExternalRepresentation, 0);
  objc_storeStrong((id *)&self->_ownerCharacteristicAuthorizationData, 0);
  objc_storeStrong((id *)&self->_userDataController, 0);
  objc_storeStrong((id *)&self->_accessCodeChangedByUserUUID, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);
  objc_storeStrong((id *)&self->_personSettingsManager, 0);
  objc_storeStrong((id *)&self->_photosPersonDataManager, 0);
  objc_storeStrong((id *)&self->_cloudShareIDFuture, 0);
  objc_storeStrong((id *)&self->_cloudShareID, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_iCloudAltDSID, 0);
  objc_storeStrong((id *)&self->_matterCASEAuthenticatedTagID, 0);
  objc_storeStrong((id *)&self->_restrictedGuestAccessSettings, 0);
  objc_storeStrong((id *)&self->_assistantAccessControl, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_presenceAuthStatus, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_mergeIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHandle, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setSiriIdentifyVoiceEnabled:(BOOL)a3
{
  self->_siriIdentifyVoiceEnabled = a3;
}

- (BOOL)siriIdentifyVoiceEnabled
{
  return self->_siriIdentifyVoiceEnabled;
}

- (void)setPlaybackInfluencesEnabled:(BOOL)a3
{
  self->_playbackInfluencesEnabled = a3;
}

- (BOOL)playbackInfluencesEnabled
{
  return self->_playbackInfluencesEnabled;
}

- (void)setLosslessMusicEnabled:(BOOL)a3
{
  self->_losslessMusicEnabled = a3;
}

- (BOOL)losslessMusicEnabled
{
  return self->_losslessMusicEnabled;
}

- (void)setDolbyAtmosEnabled:(BOOL)a3
{
  self->_dolbyAtmosEnabled = a3;
}

- (BOOL)dolbyAtmosEnabled
{
  return self->_dolbyAtmosEnabled;
}

- (void)setAllowiTunesAccount:(BOOL)a3
{
  self->_allowiTunesAccount = a3;
}

- (BOOL)allowiTunesAccount
{
  return self->_allowiTunesAccount;
}

- (void)setAllowExplicitContent:(BOOL)a3
{
  self->_allowExplicitContent = a3;
}

- (BOOL)allowExplicitContent
{
  return self->_allowExplicitContent;
}

- (void)setOwnerHasUserSeenRMVNewLanguageNotification:(BOOL)a3
{
  self->_ownerHasUserSeenRMVNewLanguageNotification = a3;
}

- (BOOL)ownerHasUserSeenRMVNewLanguageNotification
{
  return self->_ownerHasUserSeenRMVNewLanguageNotification;
}

- (void)setOwnerDismissedWelcomeUI:(BOOL)a3
{
  self->_ownerDismissedWelcomeUI = a3;
}

- (BOOL)ownerDismissedWelcomeUI
{
  return self->_ownerDismissedWelcomeUI;
}

- (void)setOwnerDismissedWalletKeyExpressModeOnboarding:(BOOL)a3
{
  self->_ownerDismissedWalletKeyExpressModeOnboarding = a3;
}

- (BOOL)ownerDismissedWalletKeyExpressModeOnboarding
{
  return self->_ownerDismissedWalletKeyExpressModeOnboarding;
}

- (void)setOwnerDismissedUserSplitMediaAccountWarning:(BOOL)a3
{
  self->_ownerDismissedUserSplitMediaAccountWarning = a3;
}

- (BOOL)ownerDismissedUserSplitMediaAccountWarning
{
  return self->_ownerDismissedUserSplitMediaAccountWarning;
}

- (void)setOwnerDismissedTVViewingProfileSetupBanner:(BOOL)a3
{
  self->_ownerDismissedTVViewingProfileSetupBanner = a3;
}

- (BOOL)ownerDismissedTVViewingProfileSetupBanner
{
  return self->_ownerDismissedTVViewingProfileSetupBanner;
}

- (void)setOwnerDismissedTVViewingProfileOnboarding:(BOOL)a3
{
  self->_ownerDismissedTVViewingProfileOnboarding = a3;
}

- (BOOL)ownerDismissedTVViewingProfileOnboarding
{
  return self->_ownerDismissedTVViewingProfileOnboarding;
}

- (void)setOwnerDismissedNaturalLightingOnboarding:(BOOL)a3
{
  self->_ownerDismissedNaturalLightingOnboarding = a3;
}

- (BOOL)ownerDismissedNaturalLightingOnboarding
{
  return self->_ownerDismissedNaturalLightingOnboarding;
}

- (void)setOwnerDismissedIdentifyVoiceSetupBanner:(BOOL)a3
{
  self->_ownerDismissedIdentifyVoiceSetupBanner = a3;
}

- (BOOL)ownerDismissedIdentifyVoiceSetupBanner
{
  return self->_ownerDismissedIdentifyVoiceSetupBanner;
}

- (void)setOwnerDismissedIdentifyVoiceOnboarding:(BOOL)a3
{
  self->_ownerDismissedIdentifyVoiceOnboarding = a3;
}

- (BOOL)ownerDismissedIdentifyVoiceOnboarding
{
  return self->_ownerDismissedIdentifyVoiceOnboarding;
}

- (void)setOwnerDismissedHomeTheaterOnboarding:(BOOL)a3
{
  self->_ownerDismissedHomeTheaterOnboarding = a3;
}

- (BOOL)ownerDismissedHomeTheaterOnboarding
{
  return self->_ownerDismissedHomeTheaterOnboarding;
}

- (void)setOwnerDismissedCameraUpgradeOfferBanner:(BOOL)a3
{
  self->_ownerDismissedCameraUpgradeOfferBanner = a3;
}

- (BOOL)ownerDismissedCameraUpgradeOfferBanner
{
  return self->_ownerDismissedCameraUpgradeOfferBanner;
}

- (void)setOwnerDismissedCameraRecordingSetupBanner:(BOOL)a3
{
  self->_ownerDismissedCameraRecordingSetupBanner = a3;
}

- (BOOL)ownerDismissedCameraRecordingSetupBanner
{
  return self->_ownerDismissedCameraRecordingSetupBanner;
}

- (void)setOwnerDismissedCameraRecordingOnboarding:(BOOL)a3
{
  self->_ownerDismissedCameraRecordingOnboarding = a3;
}

- (BOOL)ownerDismissedCameraRecordingOnboarding
{
  return self->_ownerDismissedCameraRecordingOnboarding;
}

- (void)setOwnerDismissedAnnounceOnboarding:(BOOL)a3
{
  self->_ownerDismissedAnnounceOnboarding = a3;
}

- (BOOL)ownerDismissedAnnounceOnboarding
{
  return self->_ownerDismissedAnnounceOnboarding;
}

- (void)setOwnerDismissedAccessoryFirmwareUpdateOnboarding:(BOOL)a3
{
  self->_ownerDismissedAccessoryFirmwareUpdateOnboarding = a3;
}

- (BOOL)ownerDismissedAccessoryFirmwareUpdateOnboarding
{
  return self->_ownerDismissedAccessoryFirmwareUpdateOnboarding;
}

- (void)setOwnerDismissedAccessCodeOnboarding:(BOOL)a3
{
  self->_ownerDismissedAccessCodeOnboarding = a3;
}

- (BOOL)ownerDismissedAccessCodeOnboarding
{
  return self->_ownerDismissedAccessCodeOnboarding;
}

- (void)setOwnerDismissed2024EnergyOnboarding:(BOOL)a3
{
  self->_ownerDismissed2024EnergyOnboarding = a3;
}

- (BOOL)ownerDismissed2024EnergyOnboarding
{
  return self->_ownerDismissed2024EnergyOnboarding;
}

- (void)setOwnerCompletedSwitchingHomesOnboardingUI:(BOOL)a3
{
  self->_ownerCompletedSwitchingHomesOnboardingUI = a3;
}

- (BOOL)ownerCompletedSwitchingHomesOnboardingUI
{
  return self->_ownerCompletedSwitchingHomesOnboardingUI;
}

- (void)setOwnerAddSceneButtonPresentedCount:(unint64_t)a3
{
  self->_ownerAddSceneButtonPresentedCount = a3;
}

- (unint64_t)ownerAddSceneButtonPresentedCount
{
  return self->_ownerAddSceneButtonPresentedCount;
}

- (HAPKeyStore)keyStore
{
  return (HAPKeyStore *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSharedBackingStoreController:(id)a3
{
}

- (HMDUserSettingsBackingStoreController)sharedBackingStoreController
{
  return (HMDUserSettingsBackingStoreController *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCloudShareTrustManager:(id)a3
{
}

- (HMDCloudShareTrustManager)cloudShareTrustManager
{
  return (HMDCloudShareTrustManager *)objc_getProperty(self, a2, 376, 1);
}

- (void)setAnnounceNotificationModeForCurrentDevice:(unint64_t)a3
{
  self->_announceNotificationModeForCurrentDevice = a3;
}

- (unint64_t)announceNotificationModeForCurrentDevice
{
  return self->_announceNotificationModeForCurrentDevice;
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 360, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 352, 1);
}

- (NSSet)cachedCurrentUserPairingIdentityIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 344, 1);
}

- (void)setAccessorySettingsDataController:(id)a3
{
}

- (HMDUserAccessorySettingsDataController)accessorySettingsDataController
{
  return (HMDUserAccessorySettingsDataController *)objc_getProperty(self, a2, 336, 1);
}

- (void)setSiriMultiUserNewLanguageNotificationManager:(id)a3
{
}

- (HMDSiriMultiUserNewLanguageNotificationManager)siriMultiUserNewLanguageNotificationManager
{
  return (HMDSiriMultiUserNewLanguageNotificationManager *)objc_getProperty(self, a2, 328, 1);
}

- (HMDUserDataSource)dataSource
{
  return (HMDUserDataSource *)objc_getProperty(self, a2, 320, 1);
}

- (void)setNeedsiTunesMultiUserRepair:(BOOL)a3
{
  self->_needsiTunesMultiUserRepair = a3;
}

- (BOOL)needsiTunesMultiUserRepair
{
  return self->_needsiTunesMultiUserRepair;
}

- (void)setPrivateBackingStoreController:(id)a3
{
}

- (HMDUserSettingsBackingStoreController)privateBackingStoreController
{
  return (HMDUserSettingsBackingStoreController *)objc_getProperty(self, a2, 312, 1);
}

- (void)setShareMessenger:(id)a3
{
}

- (HMDCloudShareMessenger)shareMessenger
{
  return (HMDCloudShareMessenger *)objc_getProperty(self, a2, 304, 1);
}

- (void)setAccountMetadata:(id)a3
{
}

- (HMDAccountMetadata)accountMetadata
{
  return (HMDAccountMetadata *)objc_getProperty(self, a2, 296, 1);
}

- (unint64_t)userAccessPolicy
{
  return self->_userAccessPolicy;
}

- (void)setAcwgIssuerPublicKeyExternalRepresentation:(id)a3
{
}

- (NSData)acwgIssuerPublicKeyExternalRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 280, 1);
}

- (void)setOwnerCharacteristicAuthorizationData:(id)a3
{
}

- (NSDictionary)ownerCharacteristicAuthorizationData
{
  return (NSDictionary *)objc_getProperty(self, a2, 272, 1);
}

- (void)setUserDataController:(id)a3
{
}

- (HMDUserDataController)userDataController
{
  return (HMDUserDataController *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAccessCodeChangedByUserUUID:(id)a3
{
}

- (NSUUID)accessCodeChangedByUserUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 256, 1);
}

- (void)setAccessCode:(id)a3
{
}

- (NSString)accessCode
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPersonSettingsManager:(id)a3
{
}

- (HMDPersonSettingsManager)personSettingsManager
{
  return (HMDPersonSettingsManager *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPhotosPersonDataManager:(id)a3
{
}

- (HMDUserPhotosPersonDataManager)photosPersonDataManager
{
  return (HMDUserPhotosPersonDataManager *)objc_getProperty(self, a2, 232, 1);
}

- (NAFuture)cloudShareIDFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 224, 1);
}

- (void)setCloudShareID:(id)a3
{
}

- (HMBShareUserID)cloudShareID
{
  return (HMBShareUserID *)objc_getProperty(self, a2, 216, 1);
}

- (void)setICloudAltDSID:(id)a3
{
}

- (void)setMatterCASEAuthenticatedTagID:(id)a3
{
}

- (NSNumber)matterCASEAuthenticatedTagID
{
  return self->_matterCASEAuthenticatedTagID;
}

- (void)setUUID:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)_pushSharedProfileMetadataToStoreForHome:(id)a3 iCloudAltDSID:(id)a4 firstName:(id)a5 lastName:(id)a6 profilePhotoDict:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  v17 = [v16 uuid];
  v18 = [v16 backingStore];

  v19 = [v18 context];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __102__HMDUser__pushSharedProfileMetadataToStoreForHome_iCloudAltDSID_firstName_lastName_profilePhotoDict___block_invoke;
  v26[3] = &unk_264A29900;
  id v27 = v19;
  id v28 = v17;
  v29 = self;
  id v30 = v12;
  id v31 = v13;
  id v32 = v14;
  id v33 = v15;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v17;
  id v25 = v19;
  [v25 performBlock:v26];
}

void __102__HMDUser__pushSharedProfileMetadataToStoreForHome_iCloudAltDSID_firstName_lastName_profilePhotoDict___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  v2 = +[HMDCoreData sharedInstance];
  int v3 = [*(id *)(a1 + 32) managedObjectContext];
  unint64_t v4 = +[MKFCKSharedUserDataRoot fetchRequest];
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = [v2 cloudPrivateStore];
  v21[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  [v4 setAffectedStores:v7];

  [v4 setFetchLimit:1];
  id v18 = 0;
  v8 = [v3 executeFetchRequest:v4 error:&v18];
  id v9 = v18;
  v10 = [v8 firstObject];

  if (v10)
  {
    v11 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 48) _saveSharedUserProfileMetadataToBackingStoreContext:*(void *)(a1 + 32) rootShareObject:v10 iCloudAltDSID:*(void *)(a1 + 56) firstName:*(void *)(a1 + 64) lastName:*(void *)(a1 + 72) profilePhotoDict:*(void *)(a1 + 80)]);
    id v12 = *(id *)(a1 + 48);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v20 = v14;
      id v15 = "%{public}@Successfully saved shared user profile metadata to Core Data";
      id v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v16, v17, v15, buf, 0xCu);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 48);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v20 = v14;
      id v15 = "%{public}@Unable to fetch shared user root";
      id v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }
}

- (void)setLastName:(id)a3
{
  unint64_t v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  lastName = self->_lastName;
  self->_lastName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)lastName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = self->_lastName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFirstName:(id)a3
{
  unint64_t v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  firstName = self->_firstName;
  self->_firstName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)firstName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = self->_firstName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setiCloudAltDSID:(id)a3
{
  unint64_t v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  iCloudAltDSID = self->_iCloudAltDSID;
  self->_iCloudAltDSID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)iCloudAltDSID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t v4 = self->_iCloudAltDSID;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_saveSharedUserProfileMetadataToBackingStoreContext:(id)a3 rootShareObject:(id)a4 iCloudAltDSID:(id)a5 firstName:(id)a6 lastName:(id)a7 profilePhotoDict:(id)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [v14 managedObjectContext];
  objc_msgSend(v20, "hmd_assertIsExecuting");
  id v21 = [v15 iCloudAltDSID];

  if (v21 != v16) {
    [v15 setICloudAltDSID:v16];
  }
  id v22 = [v15 firstName];

  if (v22 != v17) {
    [v15 setFirstName:v17];
  }
  id v23 = [v15 lastName];

  if (v23 != v18) {
    [v15 setLastName:v18];
  }
  id v24 = [v15 aaProfilePhoto];

  if (v24)
  {
    id v25 = [v19 valueForKey:*MEMORY[0x263F0DD08]];
    v26 = [v15 aaProfilePhoto];
    [v26 setPhotoData:v25];

    id v27 = [v19 valueForKey:*MEMORY[0x263F0DD00]];
    id v28 = [v15 aaProfilePhoto];
    [v28 setCropRect:v27];
  }
  else
  {
    id v27 = [[MKFCKSharedUserPhoto alloc] initWithContext:v20];
    v29 = [v19 valueForKey:*MEMORY[0x263F0DD08]];
    [(MKFCKSharedUserPhoto *)v27 setPhotoData:v29];

    id v30 = [v19 valueForKey:*MEMORY[0x263F0DD00]];
    [(MKFCKSharedUserPhoto *)v27 setCropRect:v30];

    id v31 = [MEMORY[0x263F08C38] UUID];
    [(MKFCKSharedUserPhoto *)v27 setModelID:v31];

    id v32 = [v15 homeModelID];
    [(MKFCKSharedUserPhoto *)v27 setHomeModelID:v32];

    [v15 setAaProfilePhoto:v27];
  }

  id v43 = 0;
  char v33 = [v14 save:&v43];
  id v34 = v43;
  if ((v33 & 1) == 0)
  {
    v42 = v20;
    v35 = (void *)MEMORY[0x230FBD990]();
    v36 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = id v40 = v17;
      HMFBooleanToString();
      v39 = id v41 = v16;
      *(_DWORD *)buf = 138543874;
      v45 = v38;
      __int16 v46 = 2112;
      id v47 = v34;
      __int16 v48 = 2112;
      v49 = v39;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Unable to save the shared user metadata to local store with error : %@, Success : %@", buf, 0x20u);

      id v16 = v41;
      id v17 = v40;
    }

    id v20 = v42;
  }
}

- (id)allAccessoryUUID
{
  v2 = [(HMDUser *)self home];
  int v3 = [v2 accessories];
  unint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_886);

  return v4;
}

uint64_t __27__HMDUser_allAccessoryUUID__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (BOOL)_isExplicitContentValueEnabledForAppleMediaAccessory:(id)a3
{
  unint64_t v4 = [a3 settingsController];
  id v5 = [v4 rootGroup];
  id v6 = [v5 groups];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke;
  v8[3] = &unk_264A29798;
  v8[4] = self;
  LOBYTE(self) = objc_msgSend(v6, "na_any:", v8);

  return (char)self;
}

uint64_t __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 settings];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke_2;
  v6[3] = &unk_264A29770;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 value];
  id v5 = [v3 keyPath];
  int v6 = [v5 isEqualToString:@"root.music.allowExplicitContent"];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@setting found = %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)applyConditionalValueUpdateToModels:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUser *)self home];
  int v6 = [v5 accessories];
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_827);

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Aggregating settings to migrate user settings for Accessories = %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_828;
  v13[3] = &unk_264A29748;
  id v14 = v7;
  __int16 v15 = v9;
  id v12 = v7;
  objc_msgSend(v4, "na_each:", v13);
}

void __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_828(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26E4EDAB0]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    if ([*(id *)(a1 + 32) count])
    {
      int v6 = [v5 nameForKeyPath];
      int v7 = [v6 isEqualToString:@"allowExplicitContent"];

      if (v7)
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_2;
        v16[3] = &unk_264A2C478;
        id v8 = *(void **)(a1 + 32);
        v16[4] = *(void *)(a1 + 40);
        uint64_t v9 = objc_msgSend(v8, "na_any:", v16);
        v10 = (void *)MEMORY[0x230FBD990]();
        id v11 = *(id *)(a1 + 40);
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v13 = HMFGetLogIdentifier();
          id v14 = HMFBooleanToString();
          *(_DWORD *)buf = 138543618;
          __int16 v18 = v13;
          __int16 v19 = 2112;
          uint64_t v20 = v14;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Aggregated value = %@ for allowExplicitContent", buf, 0x16u);
        }
        __int16 v15 = [NSNumber numberWithBool:v9];
        [v5 setNumberValue:v15];
      }
    }
  }
}

uint64_t __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@checking allowExplicitContent setting for accessory %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 32) _isExplicitContentValueEnabledForAppleMediaAccessory:v3];

  return v8;
}

id __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke(uint64_t a1, void *a2)
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

- (id)pushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMDUser *)self sharedBackingStoreController];
  uint64_t v9 = [v7 identifier];

  int v10 = [v8 queryPushTokensForDevicesObservingSubjectDevice:v9 subActivity:v6];

  return v10;
}

- (void)deregisterIDSActivityObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUser *)self sharedBackingStoreController];
  [v5 deregisterObserverDeviceIdentifier:v4];
}

- (void)deregisterIDSActivityObserver:(id)a3 subActivity:(id)a4 subjectDevice:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [(HMDUser *)self sharedBackingStoreController];
  id v11 = [v10 identifier];
  __int16 v12 = [v10 pushToken];

  id v13 = [v8 identifier];

  [v14 deregisterObserverDeviceIdentifier:v11 observerPushToken:v12 subActivity:v9 subjectDeviceIdentifier:v13];
}

- (void)updateIDSActivityObserver:(id)a3
{
  id v4 = a3;
  id v7 = [(HMDUser *)self sharedBackingStoreController];
  id v5 = [v4 identifier];
  id v6 = [v4 pushToken];

  [v7 updateObserverDeviceIdentifier:v5 observerPushToken:v6];
}

- (void)registerIDSActivityObserver:(id)a3 subActivity:(id)a4 subjectDevice:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [(HMDUser *)self sharedBackingStoreController];
  id v11 = [v10 identifier];
  __int16 v12 = [v10 pushToken];

  id v13 = [v8 identifier];

  [v14 registerObserverDeviceIdentifier:v11 observerPushToken:v12 subActivity:v9 subjectDeviceIdentifier:v13];
}

- (void)cloudShareTrustManager:(id)a3 didRemoveUserWithUUID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDUser *)self home];
  id v9 = [v8 userWithUUID:v7];

  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  __int16 v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      id v14 = HMFGetLogIdentifier();
      int v18 = 138543618;
      __int16 v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v15 = "%{public}@Trust manager removed user: %@";
      id v16 = v12;
      uint32_t v17 = 22;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v18, v17);
    }
  }
  else if (v13)
  {
    id v14 = HMFGetLogIdentifier();
    int v18 = 138543362;
    __int16 v19 = v14;
    __int16 v15 = "%{public}@Trust manager removed unknown user";
    id v16 = v12;
    uint32_t v17 = 12;
    goto LABEL_6;
  }
}

- (void)didRemoveTrustZoneInCloudShareTrustManager:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Removed cloud share trust", (uint8_t *)&v9, 0xCu);
  }
  [(HMDUser *)v6 setUserCloudShareWithOwnerMessagingState:0];
}

- (void)didFinishConfiguringForCloudShareTrustManager:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Trust has been configured", (uint8_t *)&v9, 0xCu);
  }
}

- (void)cloudShareTrustManager:(id)a3 didFetchOwnerCloudShareID:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    BOOL v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Trust manager did fetch owner cloud share id: %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMDUser *)v9 updateCloudShareID:v7];
  [(HMDUser *)v9 setUserCloudShareWithOwnerMessagingState:1];
}

- (BOOL)isOwnerCapableForTrustManager:(id)a3
{
  id v3 = [(HMDUser *)self home];
  char v4 = [v3 isOwnerTrustZoneCapable];

  return v4;
}

- (id)zoneNameForCloudShareTrustManager:(id)a3
{
  id v3 = [(HMDUser *)self uuid];
  char v4 = [v3 UUIDString];
  id v5 = [@"trust-" stringByAppendingString:v4];

  return v5;
}

- (BOOL)cloudShareTrustManager:(id)a3 shouldShareTrustWithUser:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(HMDUser *)self isOwner]
    && [(HMDUser *)self isCurrentUser]
    && ([v7 isOwner] & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Will share cloud share trust with user: %@", (uint8_t *)&v14, 0x16u);
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)configureCloudShareTrustManager
{
  if ([(HMDUser *)self isOwner])
  {
    id v3 = [(HMDUser *)self home];
    if (v3)
    {
      char v4 = [HMDCloudShareMessenger alloc];
      id v5 = [(HMDUser *)self trustTargetUUID];
      __int16 v19 = [(HMDCloudShareMessenger *)v4 initWithMessageTargetUUID:v5 workQueue:self->_queue home:v3];

      id v6 = [v3 homeManager];
      id v7 = [v6 metricsManager];

      BOOL v8 = [HMDCloudShareTrustManager alloc];
      int v9 = +[HMDDatabase defaultDatabase];
      BOOL v10 = [(HMDUser *)self isCurrentUser];
      queue = self->_queue;
      int v12 = [(HMDUser *)self cloudShareID];
      BOOL v13 = [v7 logEventSubmitter];
      int v14 = [v7 dailyScheduler];
      id v15 = [(HMDCloudShareTrustManager *)v8 initWithDatabase:v9 isOwnedTrust:v10 queue:queue shareMessenger:v19 ownerCloudShareID:v12 logEventSubmitter:v13 dailyScheduler:v14];
      [(HMDUser *)self setCloudShareTrustManager:v15];

      __int16 v16 = [(HMDUser *)self cloudShareTrustManager];
      [v16 setDataSource:self];

      id v17 = [(HMDUser *)self cloudShareTrustManager];
      [v17 setDelegate:self];

      uint64_t v18 = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__HMDUser_configureCloudShareTrustManager__block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = self;
      dispatch_async(v18, block);
    }
  }
}

void __42__HMDUser_configureCloudShareTrustManager__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cloudShareTrustManager];
  [v1 configure];
}

- (id)trustTargetUUID
{
  if (trustTargetUUID_onceToken != -1) {
    dispatch_once(&trustTargetUUID_onceToken, &__block_literal_global_823);
  }
  id v3 = (void *)MEMORY[0x263F08C38];
  uint64_t v4 = trustTargetUUID_namespace;
  id v5 = [(HMDUser *)self uuid];
  id v6 = [v5 UUIDString];
  id v7 = [v6 dataUsingEncoding:4];
  BOOL v8 = objc_msgSend(v3, "hmf_UUIDWithNamespace:data:", v4, v7);

  return v8;
}

void __26__HMDUser_trustTargetUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"79E0D39A-83CC-42C1-99FC-5B4E0745E284"];
  id v1 = (void *)trustTargetUUID_namespace;
  trustTargetUUID_namespace = v0;
}

- (void)updateCloudShareID:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUser *)self cloudShareID];

  if (!v5)
  {
    [(HMDUser *)self setCloudShareID:v4];
    int v14 = [(HMDUser *)self home];
    [v14 saveToCurrentAccountWithReason:@"HMDUserCloudShareIDCodingKey"];

    id v15 = (void *)MEMORY[0x230FBD990]();
    __int16 v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      __int16 v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@User has updated their cloud share id and is cloud share ready", (uint8_t *)&v19, 0xCu);
    }
    int v12 = [(HMDUser *)v16 cloudShareIDFuture];
    BOOL v13 = [(HMDUser *)v16 cloudShareID];
    [(HMDAssertionLogEvent *)v12 finishWithResult:v13];
    goto LABEL_9;
  }
  id v6 = [(HMDUser *)self cloudShareID];
  char v7 = [v4 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    BOOL v8 = (void *)MEMORY[0x230FBD990]();
    int v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v19 = 138543362;
      __int16 v20 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Cloud Share ID has unexpectedly changed", (uint8_t *)&v19, 0xCu);
    }
    int v12 = [[HMDAssertionLogEvent alloc] initWithReason:@"Cloud Share ID has unexpectedly changed"];
    BOOL v13 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v13 submitLogEvent:v12];
LABEL_9:
  }
}

- (void)removeCloudShareID
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUser *)self cloudShareID];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      BOOL v10 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing cloud share id", (uint8_t *)&v9, 0xCu);
    }
    [(HMDUser *)v5 setCloudShareID:0];
    BOOL v8 = [(HMDUser *)v5 home];
    [v8 saveToCurrentAccountWithReason:@"HMDUserCloudShareIDCodingKey"];
  }
}

- (id)setHasUserSeenRMVNewLanguageNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = [(HMDUser *)self home];
  if ([(HMDUser *)self isOwner])
  {
    id v6 = (void *)MEMORY[0x263F42538];
    char v7 = [v5 backingStore];
    BOOL v8 = [v7 context];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __52__HMDUser_setHasUserSeenRMVNewLanguageNotification___block_invoke;
    v24[3] = &unk_264A2D448;
    v24[4] = self;
    BOOL v25 = v3;
    int v9 = [v6 inContext:v8 perform:v24];
  }
  else
  {
    char v7 = [v5 uuid];
    BOOL v10 = [v5 backingStore];
    uint64_t v11 = [v10 context];
    BOOL v8 = [v11 managedObjectContext];

    int v12 = [v5 homeManager];
    BOOL v13 = [v12 sharedUserPrivateSettingsManager];

    int v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    id v17 = v16;
    if (v8 && v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v19 = [NSNumber numberWithBool:v3];
        *(_DWORD *)buf = 138544130;
        id v27 = v18;
        __int16 v28 = 2112;
        v29 = @"root.home.hasUserSeenRMVNewLanguageNotification";
        __int16 v30 = 2112;
        id v31 = @"ownerHasUserSeenRMVNewLanguageNotification";
        __int16 v32 = 2112;
        char v33 = v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating shared user setting: '%@' (%@) = %@", buf, 0x2Au);
      }
      __int16 v20 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v21 = [NSNumber numberWithBool:v3];
      [v20 setObject:v21 forKeyedSubscript:@"root.home.hasUserSeenRMVNewLanguageNotification"];

      int v9 = [v13 updateSettingsForHome:v7 ofType:1 withValues:v20 context:v8];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v27 = v22;
        __int16 v28 = 2112;
        v29 = @"root.home.hasUserSeenRMVNewLanguageNotification";
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Context or manager is nil when updating %@", buf, 0x16u);
      }
      int v9 = [MEMORY[0x263F42538] futureWithNoValue];
    }
  }
  return v9;
}

uint64_t __52__HMDUser_setHasUserSeenRMVNewLanguageNotification___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) uuid];
  BOOL v3 = +[HMCContext findUserWithModelID:v2];
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  char v7 = v6;
  if (!v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v18 = 138543874;
      int v19 = v13;
      __int16 v20 = 2112;
      uint64_t v21 = v2;
      __int16 v22 = 2112;
      id v23 = @"root.home.hasUserSeenRMVNewLanguageNotification";
      int v14 = "%{public}@Unable to fetch the user with id [%@] when updating %@";
      id v15 = v7;
      uint32_t v16 = 32;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    int v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    int v18 = 138544130;
    int v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = @"root.home.hasUserSeenRMVNewLanguageNotification";
    __int16 v22 = 2112;
    id v23 = @"ownerHasUserSeenRMVNewLanguageNotification";
    __int16 v24 = 2112;
    BOOL v25 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating owner user setting: '%@' (%@) = %@", (uint8_t *)&v18, 0x2Au);
  }
  BOOL v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v3 setValue:v10 forKey:@"ownerHasUserSeenRMVNewLanguageNotification"];

  uint64_t v11 = +[HMCContext currentContext];
  char v12 = [v11 save];

  if ((v12 & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    char v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v18 = 138543362;
      int v19 = v13;
      int v14 = "%{public}@Error when saving the update";
      id v15 = v7;
      uint32_t v16 = 12;
LABEL_9:
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, v16);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

  return 1;
}

- (void)userDataControllerDidUpdateUserListeningHistoryUpdateControl:(id)a3
{
}

- (BOOL)userDataController:(id)a3 isHAPAccessory:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDUser *)self home];
  uint64_t v9 = [v8 accessoryWithUUID:v7];
  BOOL v10 = (void *)v9;
  if (!v8)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    uint32_t v16 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v7;
      id v15 = "%{public}@Don't have home to find accessory %@.";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (!v9)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    char v12 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v7;
      id v15 = "%{public}@Did not find accessory %@.";
LABEL_7:
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  id v17 = v10;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & (v17 != 0);
}

- (BOOL)userDataController:(id)a3 isAppleMediaAccessory:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDUser *)self home];
  uint64_t v9 = [v8 accessoryWithUUID:v7];
  BOOL v10 = (void *)v9;
  if (!v8)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    uint32_t v16 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v7;
      id v15 = "%{public}@Don't have home to find accessory %@.";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (!v9)
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    char v12 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v7;
      id v15 = "%{public}@Did not find accessory %@.";
LABEL_7:
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  id v17 = v10;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & (v17 != 0);
}

- (void)postUserSettingsUpdatedNotificationWithReason:(id)a3
{
  id v4 = a3;
  id v7 = [(HMDUser *)self home];
  id v5 = [v7 homeManager];
  id v6 = [(HMDUser *)self uuid];
  [v5 notifyClientsOfUserSettingsChangeWithReason:v4 sourceUUID:v6];
}

- (void)userDataControllerDidUpdateMediaContentProfile:(id)a3
{
}

- (void)userDataControllerDidUpdateAssistantAccessControl:(id)a3
{
}

- (BOOL)userDataController:(id)a3 isAccessoryUserListeningHistoryUpdateCapable:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDUser *)self home];
  uint64_t v9 = [v8 accessoryWithUUID:v7];
  BOOL v10 = (void *)v9;
  if (!v8)
  {
    int v18 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = HMFGetLogIdentifier();
      int v23 = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      id v26 = v7;
      uint64_t v21 = "%{public}@Don't have home to find accessory %@.";
LABEL_15:
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v23, 0x16u);
    }
LABEL_16:

    LOBYTE(v17) = 0;
    goto LABEL_19;
  }
  if (!v9)
  {
    int v18 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = HMFGetLogIdentifier();
      int v23 = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      id v26 = v7;
      uint64_t v21 = "%{public}@Did not find accessory %@.";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  id v13 = v10;
  objc_opt_class();
  int v14 = objc_opt_isKindOfClass() & 1;
  if (v14) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  if (v14) {
    LOBYTE(v17) = 1;
  }
  else {
    LODWORD(v17) = [v12 supportsSiriEndpoint];
  }

LABEL_19:
  return (char)v17;
}

- (BOOL)userDataController:(id)a3 isMediaContentProfileCapableAccessoryID:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDUser *)self home];
  uint64_t v9 = [v8 accessoryWithUUID:v7];
  BOOL v10 = v9;
  if (!v8)
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v18;
      __int16 v30 = 2112;
      id v31 = v7;
      int v19 = "%{public}@Don't have home to find accessory %@.";
LABEL_9:
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v9)
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    int v20 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v18;
      __int16 v30 = 2112;
      id v31 = v7;
      int v19 = "%{public}@Did not find accessory %@.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  uint64_t v11 = [v9 supportsMediaContentProfile];
  if (v11)
  {
    BOOL v14 = 1;
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v21 = (void *)MEMORY[0x230FBD990](v11, v12, v13);
  __int16 v22 = self;
  int v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    __int16 v25 = [v10 category];
    int v26 = [v10 supportsMediaContentProfile];
    int v28 = 138544386;
    v29 = v24;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    char v33 = v10;
    __int16 v34 = 2112;
    v35 = v25;
    __int16 v36 = 1024;
    int v37 = v26;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not valid home: %@, accessory: %@, category: %@, supports: %d", (uint8_t *)&v28, 0x30u);
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)userDataController:(id)a3 isPersonalRequestCapableAccessoryID:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDUser *)self home];
  uint64_t v9 = [v8 accessoryWithUUID:v7];
  BOOL v10 = v9;
  if (!v8)
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v18;
      __int16 v30 = 2112;
      id v31 = v7;
      int v19 = "%{public}@Don't have home to find accessory %@.";
LABEL_9:
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v9)
  {
    id v15 = (void *)MEMORY[0x230FBD990]();
    int v20 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v18;
      __int16 v30 = 2112;
      id v31 = v7;
      int v19 = "%{public}@Did not find accessory %@.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  uint64_t v11 = [v9 supportsPersonalRequests];
  if (v11)
  {
    BOOL v14 = 1;
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v21 = (void *)MEMORY[0x230FBD990](v11, v12, v13);
  __int16 v22 = self;
  int v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    __int16 v25 = [v10 category];
    int v26 = [v10 supportsPersonalRequests];
    int v28 = 138544386;
    v29 = v24;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    char v33 = v10;
    __int16 v34 = 2112;
    v35 = v25;
    __int16 v36 = 1024;
    int v37 = v26;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not valid home: %@, accessory: %@, category: %@, supports: %d", (uint8_t *)&v28, 0x30u);
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (void)backingStoreController:(id)a3 didUpdatePhotosPersonManagerSettingsModel:(id)a4 previousPhotosPersonManagerSettingsModel:(id)a5
{
}

- (id)backingStoreController:(id)a3 createParticipantManagerForCloudZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(HMDUser *)self sharedBackingStoreController];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    BOOL v10 = [HMDCloudShareParticipantsManager alloc];
    queue = self->_queue;
    uint64_t v12 = [(HMDUser *)self home];
    uint64_t v13 = [(HMDCloudShareParticipantsManager *)v10 initWithQueue:queue cloudZone:v6 home:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)didStopBackingStoreController:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Did stop backing store controller: %@", (uint8_t *)&v14, 0x16u);
  }
  [(HMDUser *)v6 postUserSettingsUpdatedNotificationWithReason:@"User Settings Removed"];
  id v9 = [(HMDUser *)v6 privateBackingStoreController];

  if (v9 == v4)
  {
    BOOL v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = v6;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Nil-ing out the person settings manager", (uint8_t *)&v14, 0xCu);
    }
    [(HMDUser *)v11 setPersonSettingsManager:0];
  }
}

- (void)didStartLocalZoneForBackingStoreController:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Did start local zone for backing store controller: %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [(HMDUser *)v6 privateBackingStoreController];

  if (v9 == v4)
  {
    [(HMDUser *)v6 configurePersonSettingsManager];
  }
  else
  {
    id v10 = [(HMDUser *)v6 sharedBackingStoreController];

    if (v10 == v4) {
      [(HMDUser *)v6 configurePhotosPersonDataManager];
    }
  }
}

- (void)didStartBackingStoreController:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUser *)self userDataController];
  [v5 handleStartForZoneController:v4];
}

- (BOOL)isRunningOnHomeOwnersDevice
{
  id v2 = [(HMDUser *)self home];
  BOOL v3 = [v2 owner];
  id v4 = [v2 currentUser];
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (id)settingsControllerFollowerKeyPaths:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  char v5 = @"root.music.allowiTunesAccount";
  v6[0] = @"root.siri.identifyVoice";
  BOOL v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (id)dictionaryEncoding
{
  BOOL v3 = [(HMDUser *)self userID];
  unint64_t v4 = [(HMDUser *)self privilege];
  BOOL v5 = [(HMDUser *)self isRemoteAccessAllowed];
  unint64_t v6 = [(HMDUser *)self camerasAccessLevel];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"));
  unint64_t v8 = [(HMDUser *)self announceAccessLevel];
  unint64_t v9 = [(HMDUser *)self audioAnalysisUserDropInAccessLevel];
  id v10 = [(HMDUser *)self restrictedGuestAccessSettings];
  int v11 = +[HMDUser userDictionaryWithUserID:v3 privilege:v4 remoteAccessAllowed:v5 cameraAccessLevel:v6 announceAccessAllowed:v7 announceAccessLevel:v8 audioAnalysisUserDropInAccessLevel:v9 restrictedGuestAccessSettings:v10];

  return v11;
}

- (void)removeCloudData
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x230FBD990](self, a2);
  unint64_t v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing user cloud data", buf, 0xCu);
  }
  queue = v4->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__HMDUser_removeCloudData__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v4;
  dispatch_async(queue, block);
}

void __26__HMDUser_removeCloudData__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isOwner])
  {
    id v2 = [*(id *)(a1 + 32) cloudShareTrustManager];
    [v2 removeTrust];
  }
  BOOL v3 = [*(id *)(a1 + 32) sharedBackingStoreController];
  [v3 destroyZone];

  unint64_t v4 = [*(id *)(a1 + 32) privateBackingStoreController];
  [v4 destroyZone];

  id v5 = [*(id *)(a1 + 32) photosPersonDataManager];
  [v5 removeCloudDataDueToUserRemoval];
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = [(HMDUser *)self home];
  if ([(HMDUser *)self isRemoteGateway])
  {
    unint64_t v8 = [HMDResidentUserModel alloc];
    unint64_t v9 = [(HMDUser *)self uuid];
    id v10 = [v7 uuid];
    uint64_t v11 = [(HMDBackingStoreModelObject *)v8 initWithObjectChangeType:a3 uuid:v9 parentUUID:v10];
  }
  else
  {
    uint64_t v11 = [(HMDUser *)self newModelWithChangeType:a3];
  }
  uint64_t v12 = [(HMDUser *)self accountHandle];
  [(HMDResidentUserModel *)v11 setAccountHandle:v12];

  __int16 v13 = [(HMDUser *)self accountIdentifier];

  if (v13)
  {
    id v14 = [(HMDUser *)self accountIdentifier];
    [(HMDResidentUserModel *)v11 setAccountIdentifier:v14];
  }
  uint64_t v15 = [(HMDUser *)self mergeIdentifier];
  if (v15)
  {
    [(HMDResidentUserModel *)v11 setIdsMergeIdentifier:v15];
  }
  else
  {
    __int16 v16 = [(HMDUser *)self account];
    id v17 = [v16 senderCorrelationIdentifier];
    [(HMDResidentUserModel *)v11 setIdsMergeIdentifier:v17];
  }
  if (a4 < 3) {
    goto LABEL_11;
  }
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser privilege](self, "privilege"));
  [(HMDResidentUserModel *)v11 setPrivilege:v18];

  int v19 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"));
  [(HMDResidentUserModel *)v11 setRemoteAccessAllowed:v19];

  if (a4 == 3)
  {
LABEL_11:
    int v20 = 0;
  }
  else
  {
    uint64_t v21 = [(HMDUser *)self presenceAuthStatus];

    if (v21)
    {
      __int16 v22 = [(HMDUser *)self presenceAuthStatus];
      int v23 = [v22 number];
      [(HMDResidentUserModel *)v11 setPresenceAuthorizationStatus:v23];
    }
    int v20 = 1;
  }
  uint64_t v24 = [(HMDUser *)self pairingIdentity];
  __int16 v25 = objc_msgSend(v24, "hmd_dictionaryEncoding");
  [(HMDResidentUserModel *)v11 setPairingIdentity:v25];

  int v26 = [(HMDUser *)self userID];
  [(HMDResidentUserModel *)v11 setUserID:v26];

  uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
  [(HMDResidentUserModel *)v11 setCamerasAccessLevel:v27];

  int v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  [(HMDUserModel *)v11 setAudioAnalysisUserDropInAccessLevel:v28];

  v29 = [(HMDUser *)self matterCASEAuthenticatedTagID];
  [(HMDResidentUserModel *)v11 setMatterCASEAuthenticatedTagID:v29];

  if (v20)
  {
    __int16 v30 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"));
    [(HMDResidentUserModel *)v11 setAnnounceAccessAllowed:v30];

    id v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
    [(HMDResidentUserModel *)v11 setAnnounceAccessLevel:v31];
  }
  if ([(HMDUser *)self isRestrictedGuest])
  {
    __int16 v32 = [(HMDUser *)self restrictedGuestAccessSettings];

    if (v32)
    {
      char v33 = v11;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v34 = v33;
      }
      else {
        __int16 v34 = 0;
      }
      v35 = v34;

      __int16 v36 = [(HMDUser *)self restrictedGuestAccessSettings];
      int v37 = [v36 uuidsOfAllowedAccessories];
      [(HMDResidentUserModel *)v35 setAllowedAccessoryUUIDs:v37];

      uint64_t v38 = (void *)MEMORY[0x230FBD990]();
      v39 = self;
      id v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = HMFGetLogIdentifier();
        v42 = [(HMDResidentUserModel *)v35 allowedAccessoryUUIDs];
        int v44 = 138543618;
        v45 = v41;
        __int16 v46 = 2112;
        id v47 = v42;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Added allowed accessory UUIDs to user model: %@", (uint8_t *)&v44, 0x16u);
      }
    }
  }

  return v11;
}

- (id)newModelWithChangeType:(unint64_t)a3
{
  id v5 = [(HMDUser *)self home];
  if ([(HMDUser *)self isRestrictedGuest]) {
    unint64_t v6 = HMDGuestModel;
  }
  else {
    unint64_t v6 = HMDUserModel;
  }
  id v7 = [v6 alloc];
  unint64_t v8 = [(HMDUser *)self uuid];
  unint64_t v9 = [v5 uuid];
  id v10 = (void *)[v7 initWithObjectChangeType:a3 uuid:v8 parentUUID:v9];

  return v10;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return [(HMDUser *)self modelObjectWithChangeType:a3 version:4];
}

- (id)backingStoreObjects:(int64_t)a3
{
  id v5 = [MEMORY[0x263EFF980] array];
  unint64_t v6 = [(HMDUser *)self modelObjectWithChangeType:1 version:a3];
  [v5 addObject:v6];

  if (a3 >= 4)
  {
    id v7 = [(HMDUser *)self assistantAccessControl];
    unint64_t v8 = v7;
    if (v7)
    {
      unint64_t v9 = [v7 model];
      id v10 = v9;
      if (v9)
      {
        [v9 setObjectChangeType:1];
        [v5 addObject:v10];
      }
    }
    uint64_t v11 = [(HMDUser *)self accessCode];
    if (v11)
    {
    }
    else
    {
      uint64_t v12 = [(HMDUser *)self accessCodeChangedByUserUUID];

      if (!v12)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    __int16 v13 = [(HMDUser *)self accessCode];
    id v14 = [(HMDUser *)self uuid];
    uint64_t v15 = [(HMDUser *)self accessCodeChangedByUserUUID];
    __int16 v16 = +[HMDAccessCodeDataManager createUserAccessCodeModelFromAccessCode:v13 forUserUUID:v14 changedByUserUUID:v15];

    [v5 addObject:v16];
    goto LABEL_10;
  }
LABEL_11:
  id v17 = (void *)[v5 copy];

  return v17;
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = 0;
  }
  id v9 = v8;
  if (v9)
  {
    [(HMDUser *)self setAssistantAccessControl:0];
    [v7 respondWithSuccess];
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
      __int16 v13 = [(HMDUser *)self home];
      id v14 = [v13 accessCodeManager];
      uint64_t v15 = [v14 dataManager];

      if (v15)
      {
        [v15 handleRemovedUserAccessCodeModel:v12 forUser:self message:v7];
      }
      else
      {
        __int16 v16 = (void *)MEMORY[0x230FBD990]();
        id v17 = self;
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v19 = HMFGetLogIdentifier();
          int v21 = 138543362;
          __int16 v22 = v19;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Not handling removed HMDUserAccessCodeModel because self.home.accessCodeManager.dataManager is nil.", (uint8_t *)&v21, 0xCu);
        }
        int v20 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
        [v7 respondWithError:v20];
      }
    }
  }
}

- (void)_transactionUserProfileMetaDataUpdated:(id)a3
{
  id v22 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v4 = [v22 iCloudAltDSID];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [v22 iCloudAltDSID];
      id v7 = [(HMDUser *)self iCloudAltDSID];
      char v8 = HMFEqualObjects();

      if ((v8 & 1) == 0)
      {
        id v9 = [v22 iCloudAltDSID];
        [(HMDUser *)self setICloudAltDSID:v9];
      }
    }
    uint64_t v10 = [v22 firstName];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v12 = [v22 firstName];
      __int16 v13 = [(HMDUser *)self firstName];
      char v14 = HMFEqualObjects();

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = [v22 firstName];
        [(HMDUser *)self setFirstName:v15];
      }
    }
    uint64_t v16 = [v22 lastName];
    if (v16)
    {
      id v17 = (void *)v16;
      uint64_t v18 = [v22 lastName];
      int v19 = [(HMDUser *)self lastName];
      char v20 = HMFEqualObjects();

      if ((v20 & 1) == 0)
      {
        int v21 = [v22 lastName];
        [(HMDUser *)self setLastName:v21];
      }
    }
  }
}

- (void)_transactionPhotosPersonManagerSettingsUpdated:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HMDUser__transactionPhotosPersonManagerSettingsUpdated___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __58__HMDUser__transactionPhotosPersonManagerSettingsUpdated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) photosPersonDataManager];
  [v2 handleUpdatedUserModel:*(void *)(a1 + 40)];
}

- (void)_transactionUserSettingsUpdated:(id)a3
{
  id v155 = a3;
  uint64_t v4 = [v155 allowExplicitContent];
  if (!v4
    || (id v5 = (void *)v4,
        [v155 allowExplicitContent],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 BOOLValue],
        int v8 = [(HMDUser *)self allowExplicitContent],
        v6,
        v5,
        v7 == v8))
  {
    int v10 = 0;
  }
  else
  {
    id v9 = [v155 allowExplicitContent];
    -[HMDUser setAllowExplicitContent:](self, "setAllowExplicitContent:", [v9 BOOLValue]);

    int v10 = 1;
  }
  uint64_t v11 = [v155 allowiTunesAccount];
  if (v11)
  {
    id v12 = (void *)v11;
    __int16 v13 = [v155 allowiTunesAccount];
    int v14 = [v13 BOOLValue];
    int v15 = [(HMDUser *)self allowiTunesAccount];

    if (v14 != v15)
    {
      uint64_t v16 = [v155 allowiTunesAccount];
      -[HMDUser setAllowiTunesAccount:](self, "setAllowiTunesAccount:", [v16 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v17 = [v155 dolbyAtmosEnabled];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    int v19 = [v155 dolbyAtmosEnabled];
    int v20 = [v19 BOOLValue];
    int v21 = [(HMDUser *)self dolbyAtmosEnabled];

    if (v20 != v21)
    {
      id v22 = [v155 dolbyAtmosEnabled];
      -[HMDUser setDolbyAtmosEnabled:](self, "setDolbyAtmosEnabled:", [v22 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v23 = [v155 losslessMusicEnabled];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    __int16 v25 = [v155 losslessMusicEnabled];
    int v26 = [v25 BOOLValue];
    int v27 = [(HMDUser *)self losslessMusicEnabled];

    if (v26 != v27)
    {
      int v28 = [v155 losslessMusicEnabled];
      -[HMDUser setLosslessMusicEnabled:](self, "setLosslessMusicEnabled:", [v28 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v29 = [v155 playbackInfluencesEnabled];
  if (v29)
  {
    __int16 v30 = (void *)v29;
    id v31 = [v155 playbackInfluencesEnabled];
    int v32 = [v31 BOOLValue];
    int v33 = [(HMDUser *)self playbackInfluencesEnabled];

    if (v32 != v33)
    {
      __int16 v34 = [v155 playbackInfluencesEnabled];
      -[HMDUser setPlaybackInfluencesEnabled:](self, "setPlaybackInfluencesEnabled:", [v34 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v35 = [v155 siriIdentifyVoiceEnabled];
  if (v35)
  {
    __int16 v36 = (void *)v35;
    int v37 = [v155 siriIdentifyVoiceEnabled];
    int v38 = [v37 BOOLValue];
    int v39 = [(HMDUser *)self siriIdentifyVoiceEnabled];

    if (v38 != v39)
    {
      id v40 = [v155 siriIdentifyVoiceEnabled];
      -[HMDUser setSiriIdentifyVoiceEnabled:](self, "setSiriIdentifyVoiceEnabled:", [v40 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v41 = [v155 ownerAddSceneButtonPresentedCount];
  if (v41)
  {
    v42 = (void *)v41;
    id v43 = [v155 ownerAddSceneButtonPresentedCount];
    uint64_t v44 = [v43 integerValue];
    unint64_t v45 = [(HMDUser *)self ownerAddSceneButtonPresentedCount];

    if (v44 != v45)
    {
      __int16 v46 = [v155 ownerAddSceneButtonPresentedCount];
      -[HMDUser setOwnerAddSceneButtonPresentedCount:](self, "setOwnerAddSceneButtonPresentedCount:", [v46 integerValue]);

      int v10 = 1;
    }
  }
  uint64_t v47 = [v155 ownerCompletedSwitchingHomesOnboardingUI];
  if (v47)
  {
    uint64_t v48 = (void *)v47;
    v49 = [v155 ownerCompletedSwitchingHomesOnboardingUI];
    int v50 = [v49 BOOLValue];
    int v51 = [(HMDUser *)self ownerCompletedSwitchingHomesOnboardingUI];

    if (v50 != v51)
    {
      v52 = [v155 ownerCompletedSwitchingHomesOnboardingUI];
      -[HMDUser setOwnerCompletedSwitchingHomesOnboardingUI:](self, "setOwnerCompletedSwitchingHomesOnboardingUI:", [v52 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v53 = [v155 ownerDismissedAccessCodeOnboarding];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [v155 ownerDismissedAccessCodeOnboarding];
    int v56 = [v55 BOOLValue];
    int v57 = [(HMDUser *)self ownerDismissedAccessCodeOnboarding];

    if (v56 != v57)
    {
      v58 = [v155 ownerDismissedAccessCodeOnboarding];
      -[HMDUser setOwnerDismissedAccessCodeOnboarding:](self, "setOwnerDismissedAccessCodeOnboarding:", [v58 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v59 = [v155 ownerDismissedAccessoryFirmwareUpdateOnboarding];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [v155 ownerDismissedAccessoryFirmwareUpdateOnboarding];
    int v62 = [v61 BOOLValue];
    int v63 = [(HMDUser *)self ownerDismissedAccessoryFirmwareUpdateOnboarding];

    if (v62 != v63)
    {
      v64 = [v155 ownerDismissedAccessoryFirmwareUpdateOnboarding];
      -[HMDUser setOwnerDismissedAccessoryFirmwareUpdateOnboarding:](self, "setOwnerDismissedAccessoryFirmwareUpdateOnboarding:", [v64 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v65 = [v155 ownerDismissedAnnounceOnboarding];
  if (v65)
  {
    v66 = (void *)v65;
    v67 = [v155 ownerDismissedAnnounceOnboarding];
    int v68 = [v67 BOOLValue];
    int v69 = [(HMDUser *)self ownerDismissedAnnounceOnboarding];

    if (v68 != v69)
    {
      v70 = [v155 ownerDismissedAnnounceOnboarding];
      -[HMDUser setOwnerDismissedAnnounceOnboarding:](self, "setOwnerDismissedAnnounceOnboarding:", [v70 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v71 = [v155 ownerDismissedCameraRecordingOnboarding];
  if (v71)
  {
    v72 = (void *)v71;
    v73 = [v155 ownerDismissedCameraRecordingOnboarding];
    int v74 = [v73 BOOLValue];
    int v75 = [(HMDUser *)self ownerDismissedCameraRecordingOnboarding];

    if (v74 != v75)
    {
      v76 = [v155 ownerDismissedCameraRecordingOnboarding];
      -[HMDUser setOwnerDismissedCameraRecordingOnboarding:](self, "setOwnerDismissedCameraRecordingOnboarding:", [v76 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v77 = [v155 ownerDismissedCameraRecordingSetupBanner];
  if (v77)
  {
    v78 = (void *)v77;
    v79 = [v155 ownerDismissedCameraRecordingSetupBanner];
    int v80 = [v79 BOOLValue];
    int v81 = [(HMDUser *)self ownerDismissedCameraRecordingSetupBanner];

    if (v80 != v81)
    {
      v82 = [v155 ownerDismissedCameraRecordingSetupBanner];
      -[HMDUser setOwnerDismissedCameraRecordingSetupBanner:](self, "setOwnerDismissedCameraRecordingSetupBanner:", [v82 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v83 = [v155 ownerDismissedCameraUpgradeOfferBanner];
  if (v83)
  {
    v84 = (void *)v83;
    v85 = [v155 ownerDismissedCameraUpgradeOfferBanner];
    int v86 = [v85 BOOLValue];
    int v87 = [(HMDUser *)self ownerDismissedCameraUpgradeOfferBanner];

    if (v86 != v87)
    {
      v88 = [v155 ownerDismissedCameraUpgradeOfferBanner];
      -[HMDUser setOwnerDismissedCameraUpgradeOfferBanner:](self, "setOwnerDismissedCameraUpgradeOfferBanner:", [v88 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v89 = [v155 ownerDismissedHomeTheaterOnboarding];
  if (v89)
  {
    v90 = (void *)v89;
    v91 = [v155 ownerDismissedHomeTheaterOnboarding];
    int v92 = [v91 BOOLValue];
    int v93 = [(HMDUser *)self ownerDismissedHomeTheaterOnboarding];

    if (v92 != v93)
    {
      v94 = [v155 ownerDismissedHomeTheaterOnboarding];
      -[HMDUser setOwnerDismissedHomeTheaterOnboarding:](self, "setOwnerDismissedHomeTheaterOnboarding:", [v94 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v95 = [v155 ownerDismissedIdentifyVoiceOnboarding];
  if (v95)
  {
    v96 = (void *)v95;
    v97 = [v155 ownerDismissedIdentifyVoiceOnboarding];
    int v98 = [v97 BOOLValue];
    int v99 = [(HMDUser *)self ownerDismissedIdentifyVoiceOnboarding];

    if (v98 != v99)
    {
      v100 = [v155 ownerDismissedIdentifyVoiceOnboarding];
      -[HMDUser setOwnerDismissedIdentifyVoiceOnboarding:](self, "setOwnerDismissedIdentifyVoiceOnboarding:", [v100 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v101 = [v155 ownerDismissedIdentifyVoiceSetupBanner];
  if (v101)
  {
    v102 = (void *)v101;
    v103 = [v155 ownerDismissedIdentifyVoiceSetupBanner];
    int v104 = [v103 BOOLValue];
    int v105 = [(HMDUser *)self ownerDismissedIdentifyVoiceSetupBanner];

    if (v104 != v105)
    {
      v106 = [v155 ownerDismissedIdentifyVoiceSetupBanner];
      -[HMDUser setOwnerDismissedIdentifyVoiceSetupBanner:](self, "setOwnerDismissedIdentifyVoiceSetupBanner:", [v106 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v107 = [v155 ownerDismissedNaturalLightingOnboarding];
  if (v107)
  {
    v108 = (void *)v107;
    v109 = [v155 ownerDismissedNaturalLightingOnboarding];
    int v110 = [v109 BOOLValue];
    int v111 = [(HMDUser *)self ownerDismissedNaturalLightingOnboarding];

    if (v110 != v111)
    {
      v112 = [v155 ownerDismissedNaturalLightingOnboarding];
      -[HMDUser setOwnerDismissedNaturalLightingOnboarding:](self, "setOwnerDismissedNaturalLightingOnboarding:", [v112 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v113 = [v155 ownerDismissedTVViewingProfileOnboarding];
  if (v113)
  {
    v114 = (void *)v113;
    v115 = [v155 ownerDismissedTVViewingProfileOnboarding];
    int v116 = [v115 BOOLValue];
    int v117 = [(HMDUser *)self ownerDismissedTVViewingProfileOnboarding];

    if (v116 != v117)
    {
      v118 = [v155 ownerDismissedTVViewingProfileOnboarding];
      -[HMDUser setOwnerDismissedTVViewingProfileOnboarding:](self, "setOwnerDismissedTVViewingProfileOnboarding:", [v118 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v119 = [v155 ownerDismissedTVViewingProfileSetupBanner];
  if (v119)
  {
    v120 = (void *)v119;
    v121 = [v155 ownerDismissedTVViewingProfileSetupBanner];
    int v122 = [v121 BOOLValue];
    int v123 = [(HMDUser *)self ownerDismissedTVViewingProfileSetupBanner];

    if (v122 != v123)
    {
      v124 = [v155 ownerDismissedTVViewingProfileSetupBanner];
      -[HMDUser setOwnerDismissedTVViewingProfileSetupBanner:](self, "setOwnerDismissedTVViewingProfileSetupBanner:", [v124 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v125 = [v155 ownerDismissedUserSplitMediaAccountWarning];
  if (v125)
  {
    v126 = (void *)v125;
    v127 = [v155 ownerDismissedUserSplitMediaAccountWarning];
    int v128 = [v127 BOOLValue];
    int v129 = [(HMDUser *)self ownerDismissedUserSplitMediaAccountWarning];

    if (v128 != v129)
    {
      v130 = [v155 ownerDismissedUserSplitMediaAccountWarning];
      -[HMDUser setOwnerDismissedUserSplitMediaAccountWarning:](self, "setOwnerDismissedUserSplitMediaAccountWarning:", [v130 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v131 = [v155 ownerDismissedWalletKeyExpressModeOnboarding];
  if (v131)
  {
    v132 = (void *)v131;
    v133 = [v155 ownerDismissedWalletKeyExpressModeOnboarding];
    int v134 = [v133 BOOLValue];
    int v135 = [(HMDUser *)self ownerDismissedWalletKeyExpressModeOnboarding];

    if (v134 != v135)
    {
      v136 = [v155 ownerDismissedWalletKeyExpressModeOnboarding];
      -[HMDUser setOwnerDismissedWalletKeyExpressModeOnboarding:](self, "setOwnerDismissedWalletKeyExpressModeOnboarding:", [v136 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v137 = [v155 ownerDismissedWelcomeUI];
  if (v137)
  {
    v138 = (void *)v137;
    v139 = [v155 ownerDismissedWelcomeUI];
    int v140 = [v139 BOOLValue];
    int v141 = [(HMDUser *)self ownerDismissedWelcomeUI];

    if (v140 != v141)
    {
      v142 = [v155 ownerDismissedWelcomeUI];
      -[HMDUser setOwnerDismissedWelcomeUI:](self, "setOwnerDismissedWelcomeUI:", [v142 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v143 = [v155 ownerHasUserSeenRMVNewLanguageNotification];
  if (v143)
  {
    v144 = (void *)v143;
    v145 = [v155 ownerHasUserSeenRMVNewLanguageNotification];
    int v146 = [v145 BOOLValue];
    int v147 = [(HMDUser *)self ownerHasUserSeenRMVNewLanguageNotification];

    if (v146 != v147)
    {
      v148 = [v155 ownerHasUserSeenRMVNewLanguageNotification];
      -[HMDUser setOwnerHasUserSeenRMVNewLanguageNotification:](self, "setOwnerHasUserSeenRMVNewLanguageNotification:", [v148 BOOLValue]);

      int v10 = 1;
    }
  }
  uint64_t v149 = [v155 ownerDismissed2024EnergyOnboarding];
  if (!v149
    || (v150 = (void *)v149,
        [v155 ownerDismissed2024EnergyOnboarding],
        v151 = objc_claimAutoreleasedReturnValue(),
        int v152 = [v151 BOOLValue],
        int v153 = [(HMDUser *)self ownerDismissed2024EnergyOnboarding],
        v151,
        v150,
        v152 == v153))
  {
    if (!v10) {
      goto LABEL_79;
    }
  }
  else
  {
    v154 = [v155 ownerDismissed2024EnergyOnboarding];
    -[HMDUser setOwnerDismissed2024EnergyOnboarding:](self, "setOwnerDismissed2024EnergyOnboarding:", [v154 BOOLValue]);
  }
  [(HMDUser *)self postUserSettingsUpdatedNotificationWithReason:@"User Settings updated"];
LABEL_79:
}

- (void)_transactionAccessorySettingsUpdated:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(HMDUser *)self assistantAccessControl];
  int v5 = [v4 areActivityNotificationsEnabledForPersonalRequests];
  id v6 = [v9 activityNotificationsEnabledForPersonalRequests];
  int v7 = [v6 BOOLValue];

  if (v5 != v7)
  {
    int v8 = [v9 activityNotificationsEnabledForPersonalRequests];
    objc_msgSend(v4, "setActivityNotificationsEnabledForPersonalRequests:", objc_msgSend(v8, "BOOLValue"));

    [(HMDUser *)self postUserSettingsUpdatedNotificationWithReason:@"Personal request settings enabled"];
  }
}

- (void)handleUpdatedCATForUser
{
  id v2 = [(HMDUser *)self home];
  [v2 handleCATUpdate];
}

- (void)_transactionUserUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v182 = *MEMORY[0x263EF8340];
  id v164 = a3;
  id v8 = a4;
  id v166 = a5;
  group = dispatch_group_create();
  id v9 = [v8 accountHandle];

  if (v9)
  {
    uint64_t v10 = [v8 accountHandle];
    if (!v10) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = [v8 userID];

    if (!v11)
    {
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    id v12 = +[HMDAccountHandleFormatter defaultFormatter];
    __int16 v13 = [v8 userID];
    uint64_t v10 = [v12 accountHandleFromString:v13];

    if (!v10) {
      goto LABEL_9;
    }
  }
  int v14 = [(HMDUser *)self accountHandle];
  char v15 = HMFEqualObjects();

  if ((v15 & 1) == 0) {
    [(HMDUser *)self setAccountHandle:v10];
  }
LABEL_9:
  v165 = (HMDUser *)v10;
  uint64_t v16 = (void *)MEMORY[0x230FBD990]();
  uint64_t v17 = self;
  HMFGetOSLogHandle();
  uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    int v20 = [(HMDUser *)v17 userID];
    int v21 = [(HMDUser *)v17 account];
    [(HMDUser *)v17 isCurrentUser];
    HMFBooleanToString();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544387;
    id v171 = v19;
    __int16 v172 = 2112;
    v173 = v165;
    __int16 v174 = 2117;
    v175 = v20;
    __int16 v176 = 2112;
    uint64_t v177 = (uint64_t)v21;
    __int16 v178 = 2112;
    id v179 = v22;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Updated account handle [%@] for %{sensitive}@, account: %@, isCurrentUser: %@", buf, 0x34u);
  }
  if ([v8 propertyWasSet:@"accountIdentifier"])
  {
    uint64_t v23 = [v8 accountIdentifier];
    uint64_t v24 = [(HMDUser *)v17 accountIdentifier];
    char v25 = HMFEqualObjects();

    if ((v25 & 1) == 0)
    {
      int v26 = [v8 accountIdentifier];
      [(HMDUser *)v17 setAccountIdentifier:v26];
    }
  }
  uint64_t v27 = [v8 idsMergeIdentifier];
  if (v27)
  {
    int v28 = (void *)v27;
    uint64_t v29 = [v8 idsMergeIdentifier];
    __int16 v30 = [(HMDUser *)v17 mergeIdentifier];
    char v31 = HMFEqualObjects();

    if ((v31 & 1) == 0)
    {
      int v32 = [v8 idsMergeIdentifier];
      [(HMDUser *)v17 setMergeIdentifier:v32];
    }
  }
  v162 = [(HMDUser *)v17 home];
  int v33 = [(HMDUser *)v17 uuid];
  __int16 v34 = [v8 uuid];
  char v35 = [v33 isEqual:v34];

  if ((v35 & 1) == 0)
  {
    __int16 v36 = (void *)MEMORY[0x230FBD990]();
    int v37 = v17;
    HMFGetOSLogHandle();
    int v38 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      int v39 = HMFGetLogIdentifier();
      id v40 = [v8 uuid];
      uint64_t v41 = [(HMDUser *)v37 uuid];
      *(_DWORD *)buf = 138543874;
      id v171 = v39;
      __int16 v172 = 2112;
      v173 = v40;
      __int16 v174 = 2112;
      v175 = v41;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Updating uuid: %@ from %@", buf, 0x20u);
    }
    [(HMDUser *)v37 deregisterForMessages];
    v42 = [(HMDUser *)v37 uuid];
    id v43 = [v8 uuid];
    [(HMDUser *)v37 setUUID:v43];

    [(HMDUser *)v37 registerForMessages];
    [(HMDUser *)v37 recoverUserCloudDataDueToUUIDChangeFromOldUUID:v42];
  }
  uint64_t v44 = [v8 privilege];
  if (v44)
  {
    unint64_t v45 = (void *)v44;
    uint64_t v46 = [(HMDUser *)v17 privilege];
    uint64_t v47 = [v8 privilege];
    uint64_t v48 = [v47 integerValue];

    if (v46 != v48)
    {
      v49 = (void *)MEMORY[0x230FBD990]();
      int v50 = v17;
      HMFGetOSLogHandle();
      int v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v53 = [(HMDUser *)v50 privilege];
        if (v53 > 5) {
          v54 = @"None";
        }
        else {
          v54 = off_264A29920[v53];
        }
        v55 = [v8 privilege];
        unsigned int v56 = [v55 intValue];
        if (v56 > 5) {
          int v57 = @"None";
        }
        else {
          int v57 = off_264A29920[v56];
        }
        *(_DWORD *)buf = 138543874;
        id v171 = v52;
        __int16 v172 = 2112;
        v173 = (HMDUser *)v54;
        __int16 v174 = 2112;
        v175 = v57;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@User Privilege got updated from : %@ -> %@", buf, 0x20u);
      }
      v58 = [v8 privilege];
      -[HMDUser setPrivilege:](v50, "setPrivilege:", [v58 integerValue]);
    }
  }
  uint64_t v59 = [v8 remoteAccessAllowed];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [v8 remoteAccessAllowed];
    int v62 = [v61 BOOLValue];
    int v63 = [(HMDUser *)v17 isRemoteAccessAllowed];

    if (v62 != v63)
    {
      v64 = [v8 remoteAccessAllowed];
      -[HMDUser setRemoteAccessAllowed:](v17, "setRemoteAccessAllowed:", [v64 BOOLValue]);
    }
  }
  uint64_t v65 = [v8 camerasAccessLevel];
  uint64_t v66 = [v65 integerValue];

  uint64_t v67 = [v8 camerasAccessLevel];
  if (v67)
  {
    int v68 = (void *)v67;
    uint64_t v69 = [(HMDUser *)v17 camerasAccessLevel];

    if (v66 != v69)
    {
      v70 = (void *)MEMORY[0x230FBD990]();
      uint64_t v71 = v17;
      HMFGetOSLogHandle();
      v72 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        v73 = HMFGetLogIdentifier();
        [(HMDUser *)v71 camerasAccessLevel];
        HMUserCameraAccessLevelAsString();
        int v74 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        HMUserCameraAccessLevelAsString();
        int v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        id v171 = v73;
        __int16 v172 = 2112;
        v173 = v74;
        __int16 v174 = 2112;
        v175 = v75;
        _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_INFO, "%{public}@Updating cameras access value from %@ to %@", buf, 0x20u);
      }
      [(HMDUser *)v71 setCamerasAccessLevel:v66];
    }
  }
  uint64_t v76 = [v8 announceAccessLevel];
  if (v76)
  {
    uint64_t v77 = (void *)v76;
    v78 = [v8 announceAccessLevel];
    uint64_t v79 = [v78 unsignedIntegerValue];
    uint64_t v80 = [(HMDUser *)v17 announceAccessLevel];

    if (v79 != v80)
    {
      int v81 = [v8 announceAccessLevel];
      uint64_t v89 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v17, 0, v81);
LABEL_51:
      [(HMDUser *)v17 setAnnounceAccessLevel:v89];
      goto LABEL_52;
    }
  }
  int v81 = [v8 announceAccessLevel];
  if (v81)
  {
LABEL_52:

    goto LABEL_53;
  }
  uint64_t v82 = [v8 announceAccessAllowed];
  if (v82)
  {
    uint64_t v83 = (void *)v82;
    v84 = [v8 announceAccessAllowed];
    int v85 = [v84 BOOLValue];
    int v86 = [(HMDUser *)v17 isAnnounceAccessAllowed];

    if (v85 != v86)
    {
      int v81 = [v8 announceAccessAllowed];
      int v87 = [v81 BOOLValue];
      uint64_t v88 = 1;
      if (v87) {
        uint64_t v88 = 2;
      }
      if (v17) {
        uint64_t v89 = v88;
      }
      else {
        uint64_t v89 = 0;
      }
      goto LABEL_51;
    }
  }
LABEL_53:
  v90 = [v8 audioAnalysisUserDropInAccessLevel];
  uint64_t v91 = [v90 integerValue];

  uint64_t v92 = [v8 audioAnalysisUserDropInAccessLevel];
  if (v92)
  {
    int v93 = (void *)v92;
    uint64_t v94 = [(HMDUser *)v17 audioAnalysisUserDropInAccessLevel];

    if (v91 != v94)
    {
      uint64_t v95 = (void *)MEMORY[0x230FBD990]();
      v96 = v17;
      HMFGetOSLogHandle();
      v97 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        int v98 = HMFGetLogIdentifier();
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](v96, "audioAnalysisUserDropInAccessLevel"));
        int v99 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        v100 = [NSNumber numberWithUnsignedInteger:v91];
        *(_DWORD *)buf = 138543874;
        id v171 = v98;
        __int16 v172 = 2112;
        v173 = v99;
        __int16 v174 = 2112;
        v175 = v100;
        _os_log_impl(&dword_22F52A000, v97, OS_LOG_TYPE_INFO, "%{public}@Updating audio analysis user Dropin value from %@ to %@", buf, 0x20u);
      }
      [(HMDUser *)v96 setAudioAnalysisUserDropInAccessLevel:v91];
    }
  }
  uint64_t v101 = [v8 matterCASEAuthenticatedTagID];
  if (v101)
  {
    v102 = (void *)v101;
    v103 = [v8 matterCASEAuthenticatedTagID];
    if ([v103 integerValue])
    {
      int v104 = [v8 matterCASEAuthenticatedTagID];
      int v105 = [(HMDUser *)v17 matterCASEAuthenticatedTagID];
      char v106 = [v104 isEqual:v105];

      if ((v106 & 1) == 0)
      {
        uint64_t v107 = (void *)MEMORY[0x230FBD990]();
        v108 = v17;
        v109 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          int v110 = HMFGetLogIdentifier();
          v160 = [(HMDUser *)v108 matterCASEAuthenticatedTagID];
          uint64_t v111 = [v160 integerValue];
          v112 = [(HMDUser *)v108 matterCASEAuthenticatedTagID];
          uint64_t v113 = [v8 matterCASEAuthenticatedTagID];
          uint64_t v114 = [v113 integerValue];
          [v8 matterCASEAuthenticatedTagID];
          v115 = v161 = v107;
          *(_DWORD *)buf = 138544642;
          id v171 = v110;
          __int16 v172 = 2048;
          v173 = (HMDUser *)v111;
          __int16 v174 = 2112;
          v175 = v112;
          __int16 v176 = 2048;
          uint64_t v177 = v114;
          __int16 v178 = 2112;
          id v179 = v115;
          __int16 v180 = 2112;
          v181 = v108;
          _os_log_impl(&dword_22F52A000, v109, OS_LOG_TYPE_INFO, "%{public}@Updating CATID from 0x%lX (%@) to 0x%lX (%@) for user %@", buf, 0x3Eu);

          uint64_t v107 = v161;
        }

        int v116 = [v8 matterCASEAuthenticatedTagID];
        [(HMDUser *)v108 setMatterCASEAuthenticatedTagID:v116];

        [(HMDUser *)v108 handleUpdatedCATForUser];
      }
    }
    else
    {
    }
  }
  int v117 = [v8 setProperties];
  int v118 = [v117 containsObject:@"presenceAuthorizationStatus"];

  if (v118)
  {
    uint64_t v119 = (void *)MEMORY[0x263F0E8C8];
    v120 = [v8 presenceAuthorizationStatus];
    v121 = [v119 authWithNumber:v120];

    if (isPresenceAuthorizationValid())
    {
      int v122 = [(HMDUser *)v17 presenceAuthStatus];
      char v123 = HMFEqualObjects();

      if ((v123 & 1) == 0)
      {
        v124 = (void *)MEMORY[0x230FBD990]();
        uint64_t v125 = v17;
        v126 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
        {
          v127 = HMFGetLogIdentifier();
          int v128 = [(HMDUser *)v125 presenceAuthStatus];
          *(_DWORD *)buf = 138544130;
          id v171 = v127;
          __int16 v172 = 2112;
          v173 = v125;
          __int16 v174 = 2112;
          v175 = v128;
          __int16 v176 = 2112;
          uint64_t v177 = (uint64_t)v121;
          _os_log_impl(&dword_22F52A000, v126, OS_LOG_TYPE_INFO, "%{public}@Updating the presence auth status for user %@ from %@ to %@", buf, 0x2Au);
        }
        [(HMDUser *)v125 setPresenceAuthStatus:v121];
      }
    }
    else
    {
      int v129 = (void *)MEMORY[0x230FBD990]();
      v130 = v17;
      uint64_t v131 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
      {
        v132 = HMFGetLogIdentifier();
        v133 = [v8 presenceAuthorizationStatus];
        *(_DWORD *)buf = 138543618;
        id v171 = v132;
        __int16 v172 = 2112;
        v173 = v133;
        _os_log_impl(&dword_22F52A000, v131, OS_LOG_TYPE_INFO, "%{public}@Ignoring the value for presence auth in user model: %@", buf, 0x16u);
      }
    }
  }
  [(HMDUser *)v17 updateRestrictedGuestSettingsFromWorkingStoreIfNeeded];
  int v134 = [v8 setProperties];
  if ([v134 containsObject:@"matCredIPKExternalRepresentation"])
  {
    int v135 = [(HMDUser *)v17 acwgIssuerPublicKeyExternalRepresentation];
    v136 = [v8 matCredIPKExternalRepresentation];
    char v137 = HMFEqualObjects();

    if (v137) {
      goto LABEL_81;
    }
    v138 = (void *)MEMORY[0x230FBD990]();
    v139 = v17;
    HMFGetOSLogHandle();
    int v140 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
    {
      int v141 = HMFGetLogIdentifier();
      v142 = [v8 matCredIPKExternalRepresentation];
      *(_DWORD *)buf = 138543618;
      id v171 = v141;
      __int16 v172 = 2112;
      v173 = v142;
      _os_log_impl(&dword_22F52A000, v140, OS_LOG_TYPE_INFO, "%{public}@Updating acwgIssuerPublicKeyExternalRepresentation to: %@", buf, 0x16u);
    }
    int v134 = [v8 matCredIPKExternalRepresentation];
    [(HMDUser *)v139 setAcwgIssuerPublicKeyExternalRepresentation:v134];
  }

LABEL_81:
  uint64_t v143 = [v166 transactionResult];
  v144 = [v8 pairingIdentity];

  if (v144)
  {
    v145 = (void *)MEMORY[0x263F35A78];
    int v146 = [v8 pairingIdentity];
    int v147 = objc_msgSend(v145, "hmd_pairingIdentityWithDictionary:", v146);

    v148 = [(HMDUser *)v17 pairingIdentity];
    char v149 = HMFEqualObjects();

    if ((v149 & 1) == 0) {
      [(HMDUser *)v17 setPairingIdentity:v147];
    }
  }
  [(HMDUser *)v17 _transactionAccessorySettingsUpdated:v8];
  [(HMDUser *)v17 _transactionUserSettingsUpdated:v8];
  [(HMDUser *)v17 _transactionPhotosPersonManagerSettingsUpdated:v8];
  v150 = [v8 ownerCharacteristicAuthorizationData];
  if ([v8 propertyWasSet:@"ownerCharacteristicAuthorizationData"])
  {
    v151 = [(HMDUser *)v17 ownerCharacteristicAuthorizationData];
    char v152 = HMFEqualObjects();

    if ((v152 & 1) == 0)
    {
      int v153 = (void *)MEMORY[0x230FBD990]();
      v154 = v17;
      HMFGetOSLogHandle();
      id v155 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
      {
        v156 = HMFGetLogIdentifier();
        v157 = [(HMDUser *)v154 ownerCharacteristicAuthorizationData];
        *(_DWORD *)buf = 138543874;
        id v171 = v156;
        __int16 v172 = 2112;
        v173 = v157;
        __int16 v174 = 2112;
        v175 = v150;
        _os_log_impl(&dword_22F52A000, v155, OS_LOG_TYPE_INFO, "%{public}@Updating owner user's characteristic authorization data %@ -> %@", buf, 0x20u);
      }
      [(HMDUser *)v154 setOwnerCharacteristicAuthorizationData:v150];
    }
  }
  [(HMDUser *)v17 _transactionUserProfileMetaDataUpdated:v8];
  [v143 markChanged];
  v158 = [v162 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDUser__transactionUserUpdated_newValues_message___block_invoke;
  block[3] = &unk_264A2F820;
  id v159 = v166;
  id v168 = v159;
  id v169 = 0;
  dispatch_group_notify(group, v158, block);
}

- (uint64_t)announceUserAccessLevelFromAnnounceAccessAllowed:(void *)a3 announceAccessLevel:
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (a1)
  {
    if (v6)
    {
      uint64_t v8 = [v6 unsignedIntegerValue];
      uint64_t v9 = 1;
      if (v8 == 2) {
        uint64_t v9 = 2;
      }
      if (v8) {
        a1 = v9;
      }
      else {
        a1 = 0;
      }
    }
    else if ([v5 BOOLValue])
    {
      a1 = 2;
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

void __53__HMDUser__transactionUserUpdated_newValues_message___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) responseHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) responseHandler];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), 0);
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  if (!v12)
  {
    id v16 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 0;
    }
    id v15 = v17;

    if (v15)
    {
      uint64_t v18 = [(HMDUser *)self assistantAccessControl];

      if (v18)
      {
        id v19 = [(HMDUser *)self assistantAccessControl];
        [v19 transactionObjectUpdated:v8 newValues:v16 message:v10];

        goto LABEL_29;
      }
      int v20 = [[HMDAssistantAccessControl alloc] initWithUser:self model:v15];
      if (v20)
      {
        int v26 = [(HMDUser *)self accessorySettingsDataController];
        [(HMDAssistantAccessControl *)v20 configureWithSettingsController:v26];

        [(HMDUser *)self setAssistantAccessControl:v20];
      }
    }
    else
    {
      int v20 = [(HMDUser *)self home];
      id v21 = v16;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v22 = v21;
      }
      else {
        id v22 = 0;
      }
      id v23 = v22;

      if (v23)
      {
        uint64_t v24 = [(HMDAssistantAccessControl *)v20 accessCodeManager];
        char v25 = [v24 dataManager];

        if (v25)
        {
          [v25 handleUpdatedUserAccessCodeModel:v23 forUser:self message:v10];
        }
        else
        {
          context = (void *)MEMORY[0x230FBD990]();
          uint64_t v27 = self;
          int v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            __int16 v30 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            int v33 = v30;
            _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not handling updated HMDUserAccessCodeModel because self.home.accessCodeManager.dataManager is nil.", buf, 0xCu);
          }
          uint64_t v29 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
          [v10 respondWithError:v29];
        }
      }
    }
    goto LABEL_29;
  }
  id v13 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v14 = v13;
  }
  else {
    int v14 = 0;
  }
  id v15 = v14;

  [(HMDUser *)self _transactionUserUpdated:v15 newValues:v12 message:v10];
LABEL_29:
}

- (id)sharedSettingsAsDictionary
{
  v12[6] = *MEMORY[0x263EF8340];
  v11[0] = @"root.music.allowExplicitContent";
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser allowExplicitContent](self, "allowExplicitContent"));
  v12[0] = v3;
  v11[1] = @"root.music.allowiTunesAccount";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser allowiTunesAccount](self, "allowiTunesAccount"));
  v12[1] = v4;
  v11[2] = @"root.music.dolbyAtmos";
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser dolbyAtmosEnabled](self, "dolbyAtmosEnabled"));
  v12[2] = v5;
  v11[3] = @"root.music.lossless";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser losslessMusicEnabled](self, "losslessMusicEnabled"));
  v12[3] = v6;
  v11[4] = @"root.music.playbackInfluencesForYou";
  int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser playbackInfluencesEnabled](self, "playbackInfluencesEnabled"));
  v12[4] = v7;
  v11[5] = @"root.siri.identifyVoice";
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser siriIdentifyVoiceEnabled](self, "siriIdentifyVoiceEnabled"));
  v12[5] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (id)ownerPrivateSettingsAsDictionary
{
  v25[19] = *MEMORY[0x263EF8340];
  v24[0] = @"root.home.addSceneButtonPresentedCount";
  id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser ownerAddSceneButtonPresentedCount](self, "ownerAddSceneButtonPresentedCount"));
  v25[0] = v23;
  v24[1] = @"root.home.completedSwitchingHomesOnboardingUI";
  id v22 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerCompletedSwitchingHomesOnboardingUI](self, "ownerCompletedSwitchingHomesOnboardingUI"));
  v25[1] = v22;
  v24[2] = @"root.home.dismissed2024EnergyOnboarding";
  id v21 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissed2024EnergyOnboarding](self, "ownerDismissed2024EnergyOnboarding"));
  v25[2] = v21;
  v24[3] = @"root.home.dismissedAccessCodeOnboarding";
  int v20 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedAccessCodeOnboarding](self, "ownerDismissedAccessCodeOnboarding"));
  v25[3] = v20;
  v24[4] = @"root.home.dismissedAccessoryFirmwareUpdateOnboarding";
  id v19 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedAccessoryFirmwareUpdateOnboarding](self, "ownerDismissedAccessoryFirmwareUpdateOnboarding"));
  v25[4] = v19;
  void v24[5] = @"root.home.dismissedAnnounceOnboarding";
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedAnnounceOnboarding](self, "ownerDismissedAnnounceOnboarding"));
  v25[5] = v18;
  v24[6] = @"root.home.dismissedCameraRecordingOnboarding";
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedCameraRecordingOnboarding](self, "ownerDismissedCameraRecordingOnboarding"));
  v25[6] = v17;
  v24[7] = @"root.home.dismissedCameraRecordingSetupBanner";
  id v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedCameraRecordingSetupBanner](self, "ownerDismissedCameraRecordingSetupBanner"));
  v25[7] = v16;
  v24[8] = @"root.home.dismissedCameraUpgradeOfferBanner";
  id v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedCameraUpgradeOfferBanner](self, "ownerDismissedCameraUpgradeOfferBanner"));
  v25[8] = v15;
  v24[9] = @"root.home.dismissedHomeTheaterOnboarding";
  int v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedHomeTheaterOnboarding](self, "ownerDismissedHomeTheaterOnboarding"));
  v25[9] = v14;
  v24[10] = @"root.home.dismissedIdentifyVoiceOnboarding";
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedIdentifyVoiceOnboarding](self, "ownerDismissedIdentifyVoiceOnboarding"));
  v25[10] = v3;
  v24[11] = @"root.home.dismissedIdentifyVoiceSetupBanner";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedIdentifyVoiceSetupBanner](self, "ownerDismissedIdentifyVoiceSetupBanner"));
  v25[11] = v4;
  v24[12] = @"root.home.dismissedNaturalLightingOnboarding";
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedNaturalLightingOnboarding](self, "ownerDismissedNaturalLightingOnboarding"));
  v25[12] = v5;
  v24[13] = @"root.home.dismissedTVViewingProfileOnboarding";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedTVViewingProfileOnboarding](self, "ownerDismissedTVViewingProfileOnboarding"));
  v25[13] = v6;
  v24[14] = @"root.home.dismissedTVViewingProfileSetupBanner";
  int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedTVViewingProfileSetupBanner](self, "ownerDismissedTVViewingProfileSetupBanner"));
  v25[14] = v7;
  v24[15] = @"root.home.dismissedUserSplitMediaAccountWarning";
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedUserSplitMediaAccountWarning](self, "ownerDismissedUserSplitMediaAccountWarning"));
  v25[15] = v8;
  v24[16] = @"root.home.dismissedWalletKeyExpressModeOnboarding";
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedWalletKeyExpressModeOnboarding](self, "ownerDismissedWalletKeyExpressModeOnboarding"));
  v25[16] = v9;
  v24[17] = @"root.home.dismissedWelcomeUI";
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerDismissedWelcomeUI](self, "ownerDismissedWelcomeUI"));
  v25[17] = v10;
  v24[18] = @"root.home.hasUserSeenRMVNewLanguageNotification";
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser ownerHasUserSeenRMVNewLanguageNotification](self, "ownerHasUserSeenRMVNewLanguageNotification"));
  v25[18] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:19];

  return v12;
}

- (void)_encodeWithCoder:(id)a3
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUser *)self home];
  id v6 = [(HMDUser *)self uuid];
  int v7 = [v6 UUIDString];
  [v4 encodeObject:v7 forKey:@"userUUID"];

  [v4 encodeConditionalObject:v5 forKey:@"home"];
  id v8 = [(HMDUser *)self userDataController];
  [v8 encodeWithCoder:v4];

  if (!objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    id v16 = [(HMDUser *)self accountHandle];
    [v4 encodeObject:v16 forKey:@"HM.handle"];

    uint64_t v17 = [(HMDUser *)self userID];
    [v4 encodeObject:v17 forKey:@"userID"];

    if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
      || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
    {
      uint64_t v18 = [(HMDUser *)self accountIdentifier];
      [v4 encodeObject:v18 forKey:@"HM.accountId"];
    }
    id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser _compatiblePrivilege](self, "_compatiblePrivilege"));
    [v4 encodeObject:v19 forKey:@"userPrivilege"];

    int v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser privilege](self, "privilege"));
    [v4 encodeObject:v20 forKey:@"HM.userAdministratorType"];

    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"), @"HM.isUserAllowedRemoteAccess");
    id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
    [v4 encodeObject:v21 forKey:*MEMORY[0x263F0DBF8]];

    BOOL v22 = [(HMDUser *)self isAnnounceAccessAllowed];
    [v4 encodeBool:v22 forKey:*MEMORY[0x263F0DBC0]];
    id v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
    [v4 encodeObject:v23 forKey:@"HMDUserAnnounceAccessLevelCodingKey"];

    uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
    [v4 encodeObject:v24 forKey:*MEMORY[0x263F0C638]];

    if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
      || (objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") & 1) != 0
      || objc_msgSend(v4, "hmd_isForRemoteUserAdministrator"))
    {
      char v25 = [(HMDUser *)self presenceAuthStatus];
      [v25 addToCoder:v4];
    }
    int v26 = [(HMDUser *)self encodingRemoteDisplayName];
    [v4 encodeObject:v26 forKey:@"userDisplayName"];

    uint64_t v27 = [(HMDUser *)self pairingIdentity];
    int v28 = [v27 identifier];
    [v4 encodeObject:v28 forKey:@"pairingUsername"];

    uint64_t v29 = [(HMDUser *)self pairingIdentity];
    __int16 v30 = [v29 publicKey];
    char v31 = [v30 data];
    [v4 encodeObject:v31 forKey:@"userPublicKey"];

    int v32 = [(HMDUser *)self pairingIdentity];
    [v4 encodeObject:v32 forKey:*MEMORY[0x263F0DCC8]];

    if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
      || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
    {
      int v33 = [(HMDUser *)self assistantAccessControl];
      [v4 encodeObject:v33 forKey:*MEMORY[0x263F0DBE0]];
    }
    if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) == 0
      && (objc_msgSend(v4, "hmd_isForRemoteUserAdministrator") & 1) == 0)
    {
      uint64_t v34 = objc_msgSend(v4, "hmd_user");
      if ([(HMDUser *)self isEqual:v34])
      {
      }
      else
      {
        int v53 = objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount");

        if (!v53) {
          goto LABEL_56;
        }
      }
    }
    v54 = [(HMDUser *)self accessCode];
    [v4 encodeObject:v54 forKey:@"HMDUserAccessCodeCodingKey"];

    v55 = [(HMDUser *)self accessCodeChangedByUserUUID];
    [v4 encodeObject:v55 forKey:@"HMDUserAccessCodeChangedByUserUUIDCodingKey"];

    goto LABEL_56;
  }
  if ([(HMDUser *)self isCurrentUser]
    && !objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [(HMDUser *)self displayName];
    if (!v9)
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        int v104 = v13;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Display name was nil for non-current user", buf, 0xCu);
      }
      int v14 = [[HMDAssertionLogEvent alloc] initWithReason:@"Display name was nil for non-current user"];
      id v15 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v15 submitLogEvent:v14];

      id v9 = &stru_26E2EB898;
    }
  }
  [v4 encodeObject:v9 forKey:@"userDisplayName"];
  objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isCurrentUser](self, "isCurrentUser"), @"HM.isCurrentUser");
  if (objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    char v35 = [(HMDUser *)self pairingIdentity];
    if (v35)
    {
      id v36 = objc_alloc(MEMORY[0x263F425E8]);
      int v37 = [v35 identifier];
      int v38 = [v35 publicKey];
      int v39 = (void *)[v36 initWithIdentifier:v37 publicKey:v38 privateKey:0];

      [v4 encodeObject:v39 forKey:*MEMORY[0x263F0DCC8]];
    }
    id v40 = [(HMDUser *)self accessorySettingsDataController];
    uint64_t v41 = [v40 mediaContentProfileAccessControlAccessoriesToEncode];

    v42 = __accessoriesFromAccessoryUUIDs(v41, v5);
    id v43 = v42;
    if (v42)
    {
      uint64_t v44 = (void *)[v42 copy];
      [v4 encodeObject:v44 forKey:*MEMORY[0x263F0DC98]];
    }
    unint64_t v45 = [(HMDUser *)self accessorySettingsDataController];
    uint64_t v46 = [v45 userListeningHistoryUpdateControlModelAccessoriesToEncode];

    if (v46) {
      [v4 encodeObject:v46 forKey:*MEMORY[0x263F0DC80]];
    }

    uint64_t v47 = [(HMDUser *)self userID];
    [v4 encodeObject:v47 forKey:@"userID"];

    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isAdministrator](self, "isAdministrator"), @"isAdminUser");
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isOwner](self, "isOwner"), @"HM.isOwnerUser");
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"), @"HM.isUserAllowedRemoteAccess");
    uint64_t v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
    [v4 encodeObject:v48 forKey:*MEMORY[0x263F0DBF8]];

    BOOL v49 = [(HMDUser *)self isAnnounceAccessAllowed];
    [v4 encodeBool:v49 forKey:*MEMORY[0x263F0DBC0]];
    int v50 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
    [v4 encodeObject:v50 forKey:*MEMORY[0x263F0C638]];

    if ([(HMDUser *)self isCurrentUser])
    {
      if (![(HMDUser *)self isOwner])
      {
        id v52 = [v5 uuid];
        unsigned int v56 = [v5 homeManager];
        int v57 = [v56 sharedUserPrivateSettingsManager];

        v58 = [v57 settingsForHome:v52 ofType:1];
        [v4 encodeObject:v58 forKey:*MEMORY[0x263F0DC68]];
        [v57 settingsForHome:v52 ofType:2];
        v60 = uint64_t v59 = v35;
        [v4 encodeObject:v60 forKey:*MEMORY[0x263F0DC70]];

        char v35 = v59;
        goto LABEL_37;
      }
      int v51 = [(HMDUser *)self ownerPrivateSettingsAsDictionary];
      [v4 encodeObject:v51 forKey:*MEMORY[0x263F0DC68]];
    }
    id v52 = [(HMDUser *)self sharedSettingsAsDictionary];
    [v4 encodeObject:v52 forKey:*MEMORY[0x263F0DC70]];
LABEL_37:

    BOOL v61 = [(HMDUser *)self isRestrictedGuest];
    [v4 encodeBool:v61 forKey:*MEMORY[0x263F0DC78]];
    int v62 = [(HMDUser *)self restrictedGuestAccessSettings];

    if (v62)
    {
      int v63 = [(HMDUser *)self restrictedGuestAccessSettings];
      [v4 encodeObject:v63 forKey:*MEMORY[0x263F0D568]];
    }
    uint64_t v64 = [v5 isAccessToHomeAllowed];
    [v4 encodeBool:v64 forKey:*MEMORY[0x263F0C930]];
    if ((v64 & 1) == 0)
    {
      uint64_t v65 = [v5 accessNotAllowedReasonCode];
      [v4 encodeInteger:v65 forKey:*MEMORY[0x263F0C758]];
    }
    uint64_t v66 = [v5 overriddenHomeAccessControl];
    uint64_t v67 = v66;
    if (v66)
    {
      uint64_t v68 = [v66 unsignedIntegerValue];
      [v4 encodeInteger:v68 forKey:*MEMORY[0x263F0C750]];
    }
    uint64_t v69 = [(HMDUser *)self presenceAuthStatus];
    [v69 addToCoder:v4];

    if ([(HMDUser *)self isCurrentUser])
    {
      v70 = [v5 presenceComputeStatus];
      [v70 addToCoder:v4];

      uint64_t v71 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser needsiTunesMultiUserRepair](self, "needsiTunesMultiUserRepair"));
      [v4 encodeObject:v71 forKey:*MEMORY[0x263F0DCB0]];
    }
    if ([(HMDUser *)self isOwner])
    {
      v72 = [(HMDUser *)self assistantAccessControl];
      [v4 encodeObject:v72 forKey:*MEMORY[0x263F0DBE0]];
    }
    else
    {
      v73 = [(HMDUser *)self accessorySettingsDataController];
      v72 = [v73 assistantAccessControlAccessoriesToEncode];

      if (v72)
      {
        int v74 = __accessoriesFromAccessoryUUIDs(v72, v5);
        BOOL v75 = [v74 count] != 0;
        objc_msgSend(v74, "na_map:", &__block_literal_global_698);
        v76 = uint64_t v101 = v5;
        objc_msgSend(v74, "na_map:", &__block_literal_global_701);
        v102 = v9;
        uint64_t v77 = v100 = v67;
        v78 = v35;
        uint64_t v79 = [HMDAssistantAccessControl alloc];
        uint64_t v80 = [(HMDUser *)self accessorySettingsDataController];
        uint64_t v81 = [v80 assistantAccessControlActivityNotificationsEnabledForPersonalRequests];
        uint64_t v82 = v79;
        char v35 = v78;
        uint64_t v83 = [(HMDAssistantAccessControl *)v82 initWithUser:self appleAccessories:v76 hapAccessoryIdentifiers:v77 enabled:v75 activityNotificationsEnabledForPersonalRequests:v81];

        v84 = [(HMDUser *)self userDataController];
        -[HMDAssistantAccessControl setOptions:](v83, "setOptions:", [v84 assistantAccessControlRequiresAuthenticationForSecureRequests] ^ 1);

        int v85 = [(HMDUser *)self accessorySettingsDataController];
        [(HMDAssistantAccessControl *)v83 configureWithSettingsController:v85];

        [v4 encodeObject:v83 forKey:*MEMORY[0x263F0DBE0]];
        uint64_t v67 = v100;
        id v9 = v102;

        id v5 = v101;
      }
    }

    if ([(HMDUser *)self isCurrentUser])
    {
      int v86 = objc_msgSend(objc_alloc(MEMORY[0x263F0E0D8]), "initWithDeviceNotificationMode:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
      [v4 encodeObject:v86 forKey:*MEMORY[0x263F0DBC8]];
    }
    int v87 = [(HMDUser *)self photosPersonDataManager];
    uint64_t v88 = [v87 settings];
    [v4 encodeObject:v88 forKey:*MEMORY[0x263F0DCD8]];

    uint64_t v89 = [(HMDUser *)self photosPersonDataManager];
    v90 = [v89 zoneUUID];
    [v4 encodeObject:v90 forKey:*MEMORY[0x263F0DCE8]];
  }
  uint64_t v91 = [(HMDUser *)self account];
  uint64_t v92 = [v91 senderCorrelationIdentifier];

  if (v92 && (objc_msgSend(v4, "hmd_entitlements") & 0x1000) != 0) {
    [v4 encodeObject:v92 forKey:*MEMORY[0x263F0DD28]];
  }

LABEL_56:
  int v93 = [(HMDUser *)self matterCASEAuthenticatedTagID];
  [v4 encodeObject:v93 forKey:@"HMDUserMatterCATIDCodingKey"];

  if (objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    uint64_t v94 = [(HMDUser *)self cloudShareID];
    [v4 encodeObject:v94 forKey:@"HMDUserCloudShareIDCodingKey"];

    if ([(HMDUser *)self isCurrentUser])
    {
      uint64_t v95 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser needsiTunesMultiUserRepair](self, "needsiTunesMultiUserRepair"));
      [v4 encodeObject:v95 forKey:*MEMORY[0x263F0DCB0]];
    }
  }
  v96 = [(HMDUser *)self iCloudAltDSID];
  [v4 encodeObject:v96 forKey:*MEMORY[0x263F0DDA8]];

  v97 = [(HMDUser *)self firstName];
  [v4 encodeObject:v97 forKey:*MEMORY[0x263F0DC60]];

  int v98 = [(HMDUser *)self lastName];
  [v4 encodeObject:v98 forKey:*MEMORY[0x263F0DC50]];

  if ([(HMDUser *)self isCurrentUser]
    && ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
     || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") && isiOSDevice()))
  {
    int v99 = objc_msgSend(objc_alloc(MEMORY[0x263F0E0D8]), "initWithDeviceNotificationMode:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
    [v4 encodeObject:v99 forKey:*MEMORY[0x263F0DBC8]];
  }
}

id __28__HMDUser__encodeWithCoder___block_invoke_2(uint64_t a1, void *a2)
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
  id v5 = [v4 uuid];

  return v5;
}

id __28__HMDUser__encodeWithCoder___block_invoke(uint64_t a1, void *a2)
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

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x230FBD990]();
  [(HMDUser *)self _encodeWithCoder:v5];
}

- (id)_initWithCoder:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class() || ![v4 decodeBoolForKey:@"userIsRemoteGateway"])
  {
    if ([v4 containsValueForKey:@"HM.handle"])
    {
      int v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.handle"];
    }
    else
    {
      id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
      if (v8)
      {
        int v7 = +[HMDAccountHandle accountHandleForDestination:v8];
      }
      else
      {
        int v7 = 0;
      }
    }
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.userAdministratorType"];
    v72 = v9;
    if (v9)
    {
      uint64_t v10 = [v9 integerValue];
    }
    else
    {
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userPrivilege"];
      uint64_t v12 = [v11 integerValue];
      if (v12 == 1) {
        uint64_t v10 = 3;
      }
      else {
        uint64_t v10 = v12;
      }
    }
    uint64_t v13 = *MEMORY[0x263F0DCC8];
    if ([v4 containsValueForKey:*MEMORY[0x263F0DCC8]])
    {
      int v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v13];
    }
    else
    {
      id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingUsername"];
      id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userPublicKey"];
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F425F0]) initWithPairingKeyData:v16];
      int v14 = (void *)[objc_alloc(MEMORY[0x263F35A78]) initWithIdentifier:v15 publicKey:v17 privateKey:0 permissions:(v10 & 0xFFFFFFFFFFFFFFFDLL) == 1];
    }
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    id v19 = [(HMDUser *)self initWithAccountHandle:v7 home:v18 pairingIdentity:v14 privilege:2];
    if (!v19)
    {
LABEL_54:
      self = v19;

      id v6 = (HMDResidentUser *)self;
      goto LABEL_55;
    }
    v70 = v14;
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserCloudShareIDCodingKey"];
    cloudShareID = v19->_cloudShareID;
    v19->_cloudShareID = (HMBShareUserID *)v20;

    uint64_t v71 = v7;
    if (v19->_cloudShareID)
    {
      BOOL v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = v19;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        char v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        int v74 = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@User has decoded their cloud share id and is cloud share ready", buf, 0xCu);
      }
      [v23[28] finishWithResult:v19->_cloudShareID];
    }
    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userUUID"];
    uint64_t v26 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v69];
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v26;

    int v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.userAdministratorType"];
    uint64_t v29 = v28;
    if (v28)
    {
      v19->_privilege = [v28 integerValue];
    }
    else
    {
      __int16 v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userPrivilege"];
      uint64_t v31 = [v30 integerValue];
      uint64_t v32 = 3;
      if (v31 != 1) {
        uint64_t v32 = v31;
      }
      v19->_privilege = v32;
    }
    v19->_privilege = v10;
    if ([v4 containsValueForKey:@"userDisplayName"])
    {
      uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDisplayName"];
      displayName = v19->_displayName;
      v19->_displayName = (NSString *)v33;
    }
    char v35 = [(HMDUser *)v19 userID];
    if ([v35 isEqual:v19->_displayName])
    {
    }
    else
    {
      id v36 = v19->_displayName;

      if (v36)
      {
LABEL_35:
        uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accountId"];
        accountIdentifier = v19->_accountIdentifier;
        v19->_accountIdentifier = (HMDAccountIdentifier *)v39;

        if ([v4 containsValueForKey:@"HM.isUserAllowedRemoteAccess"]) {
          char v41 = [v4 decodeBoolForKey:@"HM.isUserAllowedRemoteAccess"];
        }
        else {
          char v41 = 1;
        }
        v19->_remoteAccessAllowed = v41;
        uint64_t v42 = [MEMORY[0x263F0E8C8] authWithCoder:v4];
        presenceAuthStatus = v19->_presenceAuthStatus;
        v19->_presenceAuthStatus = (HMUserPresenceAuthorization *)v42;

        uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0DBF8]];
        unint64_t v45 = v44;
        if (v44) {
          v19->_camerasAccessLevel = [v44 integerValue];
        }
        uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0DBE0]];
        assistantAccessControl = v19->_assistantAccessControl;
        v19->_assistantAccessControl = (HMDAssistantAccessControl *)v46;

        uint64_t v48 = *MEMORY[0x263F0DBC0];
        id v49 = v4;
        uint64_t v50 = [v49 decodeBoolForKey:v48];
        int v51 = [NSNumber numberWithBool:v50];
        id v52 = [v49 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserAnnounceAccessLevelCodingKey"];

        uint64_t v53 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v19, v51, v52);
        v19->_announceAccessLevel = v53;
        v54 = [v49 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0C638]];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v55 = v54;
        }
        else {
          v55 = 0;
        }
        id v56 = v55;

        uint64_t v57 = [v56 integerValue];
        v19->_audioAnalysisUserDropInAccessLevel = v57;
        uint64_t v58 = [v49 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0D568]];
        restrictedGuestAccessSettings = v19->_restrictedGuestAccessSettings;
        v19->_restrictedGuestAccessSettings = (HMDRestrictedGuestHomeAccessSettings *)v58;

        if ([(HMDUser *)v19 isCurrentUser])
        {
          if (objc_msgSend(v49, "hmd_isForLocalStore"))
          {
            v60 = [v49 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0DBC8]];
            v19->_announceNotificationModeForCurrentDevice = [v60 deviceNotificationMode];
          }
          else
          {
            isWatch();
          }
        }
        BOOL v61 = [v49 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0DCB0]];
        v19->_needsiTunesMultiUserRepair = [v61 BOOLValue];

        if ([v49 containsValueForKey:@"HMDUserAccessCodeCodingKey"])
        {
          uint64_t v62 = [v49 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserAccessCodeCodingKey"];
          accessCode = v19->_accessCode;
          v19->_accessCode = (NSString *)v62;
        }
        if ([v49 containsValueForKey:@"HMDUserAccessCodeChangedByUserUUIDCodingKey"])
        {
          uint64_t v64 = [v49 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserAccessCodeChangedByUserUUIDCodingKey"];
          accessCodeChangedByUserUUID = v19->_accessCodeChangedByUserUUID;
          v19->_accessCodeChangedByUserUUID = (NSUUID *)v64;
        }
        int v14 = v70;
        if ([v49 containsValueForKey:@"HMDUserMatterCATIDCodingKey"])
        {
          uint64_t v66 = [v49 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserMatterCATIDCodingKey"];
          matterCASEAuthenticatedTagID = v19->_matterCASEAuthenticatedTagID;
          v19->_matterCASEAuthenticatedTagID = (NSNumber *)v66;
        }
        int v7 = v71;
        goto LABEL_54;
      }
    }
    uint64_t v37 = __displayNameForUser(v19);
    int v38 = v19->_displayName;
    v19->_displayName = (NSString *)v37;

    goto LABEL_35;
  }
  id v6 = [[HMDResidentUser alloc] initWithCoder:v4];
LABEL_55:

  return v6;
}

+ (id)appendRootPath:(id)a3 withSettingPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length]) {
    [NSString stringWithFormat:@"%@.%@", v5, v6];
  }
  else {
  int v7 = [NSString stringWithFormat:@"%@", v6, v9];
  }

  return v7;
}

+ (id)getSettingsUsingPreOrderTraversal:(id)a3 rootUUID:(id)a4 keyPath:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v12 = v11;
  if (v9)
  {
    id v36 = 0;
    uint64_t v13 = [v8 fetchModelsWithParentModelID:v9 error:&v36];
    id v14 = v36;
    if (v13)
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __62__HMDUser_getSettingsUsingPreOrderTraversal_rootUUID_keyPath___block_invoke;
      v31[3] = &unk_264A298B0;
      id v35 = a1;
      id v15 = v10;
      id v32 = v15;
      id v33 = v8;
      id v16 = v12;
      id v34 = v16;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __62__HMDUser_getSettingsUsingPreOrderTraversal_rootUUID_keyPath___block_invoke_2;
      uint64_t v27 = &unk_264A298D8;
      id v30 = a1;
      id v28 = v15;
      id v17 = v16;
      id v29 = v17;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v24);
      uint64_t v18 = objc_msgSend(v17, "copy", v24, v25, v26, v27);
    }
    else
    {
      id v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = a1;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        BOOL v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        int v38 = v22;
        __int16 v39 = 2112;
        id v40 = v9;
        __int16 v41 = 2112;
        id v42 = v14;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@fetch models with root UUID : %@ failed with error: %@", buf, 0x20u);
      }
      uint64_t v18 = (void *)[v12 copy];
    }
  }
  else
  {
    uint64_t v18 = (void *)[v11 copy];
  }

  return v18;
}

void __62__HMDUser_getSettingsUsingPreOrderTraversal_rootUUID_keyPath___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v14;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    id v6 = *(void **)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v4 name];
    id v9 = [v6 appendRootPath:v7 withSettingPath:v8];

    id v10 = *(void **)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [v5 hmbModelID];
    uint64_t v13 = [v10 getSettingsUsingPreOrderTraversal:v11 rootUUID:v12 keyPath:v9];

    if ([v13 count]) {
      [*(id *)(a1 + 48) addEntriesFromDictionary:v13];
    }
  }
}

void __62__HMDUser_getSettingsUsingPreOrderTraversal_rootUUID_keyPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v5 name];
    id v9 = [v6 appendRootPath:v7 withSettingPath:v8];

    uint64_t v10 = +[HMDSetting settingValueWithModel:v5];
    uint64_t v11 = (void *)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v9]);
      id v14 = *(id *)(a1 + 48);
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        int v17 = 138543874;
        uint64_t v18 = v16;
        __int16 v19 = 2112;
        id v20 = v9;
        __int16 v21 = 2112;
        BOOL v22 = v11;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@[%@] : [%@]", (uint8_t *)&v17, 0x20u);
      }
    }
  }
}

+ (id)localSharedZoneForSharedUserUUID:(id)a3 database:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() sharedZoneNameForUserUUID:v6];
  id v9 = [a1 _openZoneWithName:v8 inDatabase:v7];
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    BOOL v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v16 = 138543874;
      int v17 = v13;
      __int16 v18 = 2112;
      __int16 v19 = v9;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully created local zone [%@] for user : %@", (uint8_t *)&v16, 0x20u);
    }
    id v14 = v9;
  }

  return v9;
}

+ (id)localPrivateZoneForSharedUserUUID:(id)a3 database:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() privateZoneNameForUserUUID:v7];

  id v9 = [a1 _openZoneWithName:v8 inDatabase:v6];

  return v9;
}

+ (id)_openZoneWithName:(id)a3 inDatabase:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = a1;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Opening zone with name: %@", buf, 0x16u);
  }
  id v12 = objc_alloc_init(MEMORY[0x263F492F8]);
  id v23 = 0;
  uint64_t v13 = [v7 existingPrivateZonesWithName:v6 configuration:v12 delegate:0 error:&v23];
  id v14 = v23;
  if (v13)
  {
    id v15 = [v13 localZone];
    int v16 = (void *)MEMORY[0x230FBD990]([v15 startUp]);
    id v17 = v9;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Successfully opened local zone [%@]", buf, 0x16u);
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x230FBD990]();
    id v20 = v9;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v21;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v14;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to open zone with name %@: %@", buf, 0x20u);
    }
    id v15 = 0;
  }

  return v15;
}

+ (void)_saveSharedUserSettingsToCoreData:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  objc_msgSend(a4, "hmd_assertIsExecuting");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__HMDUser__saveSharedUserSettingsToCoreData_managedObjectContext_rootShareObject___block_invoke;
  v11[3] = &unk_264A29888;
  id v12 = v8;
  id v13 = a1;
  id v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

void __82__HMDUser__saveSharedUserSettingsToCoreData_managedObjectContext_rootShareObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) entity];
  id v8 = objc_msgSend(v7, "hmd_attributeForSettingsPath:", v5);

  if (v8)
  {
    id v9 = [v6 numberValue];
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 40);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v13 = v24 = v6;
      id v14 = [*(id *)(a1 + 32) entity];
      id v15 = [v14 name];
      [v8 name];
      int v16 = v23 = v10;
      *(_DWORD *)buf = 138544386;
      __int16 v26 = v13;
      __int16 v27 = 2112;
      id v28 = v5;
      __int16 v29 = 2112;
      uint64_t v30 = v15;
      __int16 v31 = 2112;
      id v32 = v16;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating shared user setting '%@' (%@.%@) = %@", buf, 0x34u);

      id v10 = v23;
      id v6 = v24;
    }

    id v17 = *(void **)(a1 + 32);
    __int16 v18 = [v8 name];
    [v17 setValue:v9 forKey:v18];
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 40);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v22;
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Invalid settings key path '%@' for shared user settings update", buf, 0x16u);
    }
  }
}

+ (void)__findOrCreateCKSharedUserAccessorySettingsForAccessory:(id)a3 usingManagedObjectContext:(id)a4 rootShareObject:(id)a5 listeningHistoryEnabled:(id)a6 mediaContentProfileEnabled:(id)a7 personalRequestsEnabled:(id)a8
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v44 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  __int16 v19 = (void *)MEMORY[0x230FBD990](objc_msgSend(v15, "hmd_assertIsExecuting"));
  id v20 = a1;
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544642;
    uint64_t v48 = v22;
    __int16 v49 = 2112;
    id v50 = v14;
    __int16 v51 = 2112;
    id v52 = v44;
    __int16 v53 = 2112;
    id v54 = v16;
    __int16 v55 = 2112;
    id v56 = v17;
    __int16 v57 = 2112;
    id v58 = v18;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Going to check whether we have shared settings for accessory : %@ for root: %@. [Listening History: %@], [Media Access control : %@], [Personal request enabled : %@]", buf, 0x3Eu);
  }
  id v42 = v16;

  id v23 = +[MKFCKSharedUserAccessorySettings fetchRequest];
  uint64_t v43 = v14;
  id v24 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"accessoryModelID", v14];
  [v23 setPredicate:v24];

  uint64_t v25 = +[HMDCoreData sharedInstance];
  __int16 v26 = [v25 cloudPrivateStore];

  uint64_t v46 = v26;
  __int16 v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
  [v23 setAffectedStores:v27];

  [v23 setFetchLimit:1];
  id v45 = 0;
  id v28 = [v15 executeFetchRequest:v23 error:&v45];
  id v41 = v45;
  __int16 v29 = [v28 firstObject];

  if (!v29)
  {
    __int16 v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = v20;
    __int16 v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = id v34 = v31;
      *(_DWORD *)buf = 138543618;
      uint64_t v48 = v35;
      __int16 v49 = 2112;
      id v50 = v43;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Did not find the accessorySettings for accessory UUID : %@. Going to create a new one", buf, 0x16u);

      __int16 v31 = v34;
    }

    id v36 = [v44 homeModelID];
    __int16 v29 = +[MKFCKSharedUserAccessorySettings createWithHomeModelID:v36 accessoryModelID:v43 persistentStore:v26 context:v15];

    [v29 setRoot:v44];
    uint64_t v30 = [v44 addAccessorySettingsObject:v29];
  }
  uint64_t v37 = (void *)MEMORY[0x230FBD990](v30);
  id v38 = v20;
  __int16 v39 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    id v40 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v48 = v40;
    __int16 v49 = 2112;
    id v50 = v29;
    _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Working with %@", buf, 0x16u);
  }
  if (v42) {
    objc_msgSend(v29, "setListeningHistoryEnabled:", objc_msgSend(v42, "BOOLValue"));
  }
  if (v17) {
    objc_msgSend(v29, "setMediaContentProfileEnabled:", objc_msgSend(v17, "BOOLValue"));
  }
  if (v18) {
    objc_msgSend(v29, "setPersonalRequestsEnabled:", objc_msgSend(v18, "BOOLValue"));
  }
}

+ (void)_fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990](objc_msgSend(v9, "hmd_assertIsExecuting"));
  id v12 = a1;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v23 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to migrate assistant access control models from V5 to Core Data", buf, 0xCu);
  }
  id v15 = [v8 queryModelsOfType:objc_opt_class()];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __117__HMDUser__fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke;
  v18[3] = &unk_264A29860;
  id v20 = v10;
  id v21 = v12;
  id v19 = v9;
  id v16 = v10;
  id v17 = v9;
  [v15 enumerateObjectsUsingBlock:v18];
}

void __117__HMDUser__fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke(id *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 accessoryUUIDs];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __117__HMDUser__fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2;
  v12[3] = &unk_264A2D508;
  id v15 = a1[6];
  id v13 = a1[4];
  id v14 = a1[5];
  [v4 enumerateObjectsUsingBlock:v12];

  id v5 = [v3 activityNotificationsEnabledForPersonalRequests];
  objc_msgSend(a1[5], "setActivityNotificationsEnabledForPersonalRequests:", objc_msgSend(v5, "BOOLValue"));

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = a1[6];
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v3 activityNotificationsEnabledForPersonalRequests];
    [v10 BOOLValue];
    id v11 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Migrating activityNotificationsEnabledForPersonalRequests : %@", buf, 0x16u);
  }
}

uint64_t __117__HMDUser__fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "__findOrCreateCKSharedUserAccessorySettingsForAccessory:usingManagedObjectContext:rootShareObject:listeningHistoryEnabled:mediaContentProfileEnabled:personalRequestsEnabled:", a2, *(void *)(a1 + 32), *(void *)(a1 + 40), 0, 0, MEMORY[0x263EFFA88]);
}

+ (void)_fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990](objc_msgSend(v9, "hmd_assertIsExecuting"));
  id v12 = a1;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v23 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to migrate media content profile access control models from V5 to Core Data", buf, 0xCu);
  }
  id v15 = [v8 queryModelsOfType:objc_opt_class()];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __125__HMDUser__fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke;
  v18[3] = &unk_264A29838;
  id v20 = v10;
  id v21 = v12;
  id v19 = v9;
  id v16 = v10;
  id v17 = v9;
  [v15 enumerateObjectsUsingBlock:v18];
}

void __125__HMDUser__fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __125__HMDUser__fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2;
  v4[3] = &unk_264A2D508;
  uint64_t v7 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __125__HMDUser__fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "__findOrCreateCKSharedUserAccessorySettingsForAccessory:usingManagedObjectContext:rootShareObject:listeningHistoryEnabled:mediaContentProfileEnabled:personalRequestsEnabled:", a2, *(void *)(a1 + 32), *(void *)(a1 + 40), 0, MEMORY[0x263EFFA88], 0);
}

+ (void)_fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990](objc_msgSend(v9, "hmd_assertIsExecuting"));
  id v12 = a1;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v23 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to migrate user listening history models from V5 to Core Data", buf, 0xCu);
  }
  id v15 = [v8 queryModelsOfType:objc_opt_class()];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __127__HMDUser__fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke;
  v18[3] = &unk_264A29810;
  id v20 = v10;
  id v21 = v12;
  id v19 = v9;
  id v16 = v10;
  id v17 = v9;
  [v15 enumerateObjectsUsingBlock:v18];
}

void __127__HMDUser__fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __127__HMDUser__fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2;
  v4[3] = &unk_264A2D508;
  uint64_t v7 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __127__HMDUser__fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone_managedObjectContext_rootShareObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "__findOrCreateCKSharedUserAccessorySettingsForAccessory:usingManagedObjectContext:rootShareObject:listeningHistoryEnabled:mediaContentProfileEnabled:personalRequestsEnabled:", a2, *(void *)(a1 + 32), *(void *)(a1 + 40), MEMORY[0x263EFFA88], 0, 0);
}

+ (void)_fetchAndMigratePhotosPersonManagerSettingsFromLocalZone:(id)a3 managedObjectContext:(id)a4 rootShareObject:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990](objc_msgSend(v9, "hmd_assertIsExecuting"));
  id v12 = a1;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v23 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to migrate photos person manager settings from V5 to Core Data", buf, 0xCu);
  }
  id v15 = [v8 queryModelsOfType:objc_opt_class()];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __105__HMDUser__fetchAndMigratePhotosPersonManagerSettingsFromLocalZone_managedObjectContext_rootShareObject___block_invoke;
  v18[3] = &unk_264A297E8;
  id v19 = v10;
  id v20 = v9;
  id v21 = v12;
  id v16 = v9;
  id v17 = v10;
  [v15 enumerateObjectsUsingBlock:v18];
}

void __105__HMDUser__fetchAndMigratePhotosPersonManagerSettingsFromLocalZone_managedObjectContext_rootShareObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 sharingFaceClassificationsEnabled];
  objc_msgSend(*(id *)(a1 + 32), "setSharePhotosFaceClassifications:", objc_msgSend(v4, "BOOLValue"));

  id v5 = [v3 zoneUUID];
  [*(id *)(a1 + 32) setPhotosPersonDataZoneUUID:v5];

  id v6 = *(void **)(a1 + 40);
  id v18 = 0;
  char v7 = [v6 save:&v18];
  id v8 = v18;
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 48);
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v20 = v13;
      id v14 = "%{public}@Successfully stored photos person manager settings";
      id v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
      uint32_t v17 = 12;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v15, v16, v14, buf, v17);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v20 = v13;
    __int16 v21 = 2112;
    id v22 = v8;
    id v14 = "%{public}@Unable to save the photos person manager settings: %@";
    id v15 = v12;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 22;
    goto LABEL_6;
  }
}

+ (void)migrateHH1SettingsToHH2ForSharedUserWithUUID:(id)a3 homeUUID:(id)a4 privateZone:(id)a5 backingStoreContext:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = a1;
  os_log_type_t v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v17)
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      __int16 v27 = v18;
      __int16 v28 = 2112;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Migrating private user settings from HH1 to HH2 for home : %@, user: %@, privateZone: %@", buf, 0x2Au);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __97__HMDUser_migrateHH1SettingsToHH2ForSharedUserWithUUID_homeUUID_privateZone_backingStoreContext___block_invoke;
    v20[3] = &unk_264A297C0;
    id v21 = v13;
    id v22 = v11;
    id v25 = v15;
    id v23 = v12;
    id v24 = v10;
    [v21 performBlock:v20];
  }
  else
  {
    if (v17)
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Unable to open private zone. This can be due to 1. This user did not exist in HH1 world and they are a brand new user in HH2 world.2. The device on which this user is accepting the invitation does not have the HH1 V5 data.", buf, 0xCu);
    }
  }
}

void __97__HMDUser_migrateHH1SettingsToHH2ForSharedUserWithUUID_homeUUID_privateZone_backingStoreContext___block_invoke(uint64_t a1)
{
  v34[1] = *MEMORY[0x263EF8340];
  id v2 = +[HMDCoreData sharedInstance];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = +[MKFCKSharedUserPrivateRoot fetchRequest];
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = [v2 cloudPrivateStore];
  v34[0] = v6;
  char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  [v4 setAffectedStores:v7];

  [v4 setFetchLimit:1];
  id v29 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v29];
  id v9 = v29;
  id v10 = [v8 firstObject];

  id v11 = (void *)MEMORY[0x230FBD990]();
  if (v10)
  {
    id v12 = [(id)objc_opt_class() getSettingsUsingPreOrderTraversal:*(void *)(a1 + 48) rootUUID:*(void *)(a1 + 56) keyPath:&stru_26E2EB898];
    id v13 = +[HMDHome loadMigrationCharacteristicsAuthorizationDataFromDiskWithHomeUUID:*(void *)(a1 + 40)];
    if ([v12 count] || -[NSObject count](v13, "count"))
    {
      if ([v13 count])
      {
        id v28 = v9;
        context = (void *)MEMORY[0x230FBD990]([v10 setCharacteristicAuthorizationData:v13]);
        id v14 = *(id *)(a1 + 64);
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          os_log_type_t v16 = v26 = v2;
          [v10 characteristicAuthorizationData];
          v17 = id v25 = v3;
          *(_DWORD *)buf = 138543618;
          id v31 = v16;
          __int16 v32 = 2112;
          id v33 = v17;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating shared user characteristics authorization data to %@", buf, 0x16u);

          id v3 = v25;
          id v2 = v26;
        }

        +[HMDHome removeCharacteristicAuthorizationDataMigrationFileFromDiskWithhHomeUUID:*(void *)(a1 + 40)];
        id v9 = v28;
      }
      if ([v12 count]) {
        [*(id *)(a1 + 64) _saveSharedUserSettingsToCoreData:v12 managedObjectContext:v3 rootShareObject:v10];
      }

      char v18 = [*(id *)(a1 + 32) save];
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 64);
      id v13 = HMFGetOSLogHandle();
      BOOL v19 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v18)
      {
        if (v19)
        {
          id v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v31 = v20;
          id v21 = "%{public}@Successfully migrated V5 private settings for shared user to Core Data";
LABEL_17:
          id v22 = v13;
          os_log_type_t v23 = OS_LOG_TYPE_INFO;
          uint32_t v24 = 12;
          goto LABEL_18;
        }
      }
      else if (v19)
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v31 = v20;
        id v21 = "%{public}@Unable to save the migrated V5 private settings for user";
        goto LABEL_17;
      }
    }
  }
  else
  {
    id v12 = *(id *)(a1 + 64);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v20;
      __int16 v32 = 2112;
      id v33 = v9;
      id v21 = "%{public}@Unable to fetch shared user private root object: %@";
      id v22 = v13;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      uint32_t v24 = 22;
LABEL_18:
      _os_log_impl(&dword_22F52A000, v22, v23, v21, buf, v24);
    }
  }
}

+ (void)migrateHH1SettingsToHH2ForSharedUserWithUUID:(id)a3 homeUUID:(id)a4 sharedZone:(id)a5 backingStoreContext:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x230FBD990]();
  id v15 = a1;
  os_log_type_t v16 = HMFGetOSLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v17)
    {
      char v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      __int16 v27 = v18;
      __int16 v28 = 2112;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Migrating shared user settings from HH1 to HH2 for home : %@, user: %@, sharedZone: %@", buf, 0x2Au);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __96__HMDUser_migrateHH1SettingsToHH2ForSharedUserWithUUID_homeUUID_sharedZone_backingStoreContext___block_invoke;
    v20[3] = &unk_264A297C0;
    id v21 = v13;
    id v22 = v11;
    id v25 = v15;
    id v23 = v12;
    id v24 = v10;
    [v21 performBlock:v20];
  }
  else
  {
    if (v17)
    {
      BOOL v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Unable to open shared zone. This can be due to 1. This user did not exist in HH1 world and they are a brand new user in HH2 world.2. The device on which this user is accepting the invitation does not have the HH1 V5 data.", buf, 0xCu);
    }
  }
}

void __96__HMDUser_migrateHH1SettingsToHH2ForSharedUserWithUUID_homeUUID_sharedZone_backingStoreContext___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x263EF8340];
  id v2 = +[HMDCoreData sharedInstance];
  id v3 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = +[MKFCKSharedUserDataRoot fetchRequest];
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];

  id v6 = [v2 cloudPrivateStore];
  v32[0] = v6;
  char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
  [v4 setAffectedStores:v7];

  [v4 setFetchLimit:1];
  id v27 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v27];
  id v9 = v27;
  id v10 = [v8 firstObject];

  id v11 = (void *)MEMORY[0x230FBD990]();
  if (!v10)
  {
    id v12 = *(id *)(a1 + 64);
    BOOL v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v29 = v21;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch shared user data object: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  id v12 = [(id)objc_opt_class() getSettingsUsingPreOrderTraversal:*(void *)(a1 + 48) rootUUID:*(void *)(a1 + 56) keyPath:&stru_26E2EB898];
  if ([v12 count])
  {
    [*(id *)(a1 + 64) _saveSharedUserSettingsToCoreData:v12 managedObjectContext:v3 rootShareObject:v10];

    id v13 = (void *)MEMORY[0x230FBD990]();
    [*(id *)(a1 + 64) _fetchAndMigrateAssistantAccessControlModelV2ToCoreDataFromLocalZone:*(void *)(a1 + 48) managedObjectContext:v3 rootShareObject:v10];
    id v14 = (void *)MEMORY[0x230FBD990]();
    [*(id *)(a1 + 64) _fetchAndMigrateMediaContentProfileAccessControlModelToCoreDataFromLocalZone:*(void *)(a1 + 48) managedObjectContext:v3 rootShareObject:v10];
    id v15 = (void *)MEMORY[0x230FBD990]();
    [*(id *)(a1 + 64) _fetchAndMigrateUserListeningHistoryUpdatedControlModelToCoreDataFromLocalZone:*(void *)(a1 + 48) managedObjectContext:v3 rootShareObject:v10];
    uint64_t v16 = MEMORY[0x230FBD990]();
    [*(id *)(a1 + 64) _fetchAndMigratePhotosPersonManagerSettingsFromLocalZone:*(void *)(a1 + 48) managedObjectContext:v3 rootShareObject:v10];
    LOBYTE(v16) = [*(id *)(a1 + 32) save];
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 64);
    BOOL v17 = HMFGetOSLogHandle();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v18)
      {
        BOOL v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v29 = v19;
        id v20 = "%{public}@Successfully migrated V5 settings for shared user to Core Data";
LABEL_13:
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
      }
    }
    else if (v18)
    {
      BOOL v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v19;
      id v20 = "%{public}@Unable to save the migrated V5 settings for user";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  id v26 = v9;
  id v22 = (void *)MEMORY[0x230FBD990]();
  id v23 = *(id *)(a1 + 64);
  id v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v29 = v25;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Did not find any settings model for user", buf, 0xCu);
  }
  id v9 = v26;
LABEL_15:
}

+ (id)userDictionaryWithUserID:(id)a3 privilege:(unint64_t)a4 remoteAccessAllowed:(BOOL)a5 cameraAccessLevel:(unint64_t)a6 announceAccessAllowed:(id)a7 announceAccessLevel:(unint64_t)a8 audioAnalysisUserDropInAccessLevel:(unint64_t)a9 restrictedGuestAccessSettings:(id)a10
{
  BOOL v12 = a5;
  id v15 = a7;
  id v16 = a10;
  BOOL v17 = (void *)MEMORY[0x263EFF9A0];
  id v18 = a3;
  BOOL v19 = [v17 dictionary];
  [v19 setObject:v18 forKeyedSubscript:@"userID"];

  id v20 = [NSNumber numberWithUnsignedInteger:a4];
  [v19 setObject:v20 forKeyedSubscript:@"HM.userAdministratorType"];

  id v21 = [NSNumber numberWithBool:v12];
  [v19 setObject:v21 forKeyedSubscript:@"HM.isUserAllowedRemoteAccess"];

  id v22 = [NSNumber numberWithUnsignedInteger:a6];
  [v19 setObject:v22 forKeyedSubscript:*MEMORY[0x263F0DBF8]];

  id v23 = [NSNumber numberWithUnsignedInteger:a8];
  [v19 setObject:v23 forKeyedSubscript:@"HMDUserAnnounceAccessLevelCodingKey"];

  id v24 = [NSNumber numberWithUnsignedInteger:a9];
  [v19 setObject:v24 forKeyedSubscript:*MEMORY[0x263F0C638]];

  if (v16)
  {
    id v25 = encodeRootObject();
    [v19 setObject:v25 forKeyedSubscript:*MEMORY[0x263F0D568]];
  }
  if (v15) {
    [v19 setObject:v15 forKeyedSubscript:*MEMORY[0x263F0DBC0]];
  }
  id v26 = (void *)[v19 copy];

  return v26;
}

+ (HMDUser)userWithDictionary:(id)a3 home:(id)a4
{
  v54[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_stringForKey:", @"userID");
  if (v8)
  {
    uint64_t v9 = [a1 privilegeFromDictionary:v6];
    id v10 = objc_msgSend(v6, "hmf_numberForKey:", @"HM.isUserAllowedRemoteAccess");
    id v11 = +[HMDAccountHandleFormatter defaultFormatter];
    uint64_t v12 = [v11 accountHandleFromString:v8];

    uint64_t v46 = (void *)v12;
    id v13 = [[HMDUser alloc] initWithAccountHandle:v12 home:v7 pairingIdentity:0 privilege:v9];
    id v14 = __displayNameForUser(v13);
    [(HMDUser *)v13 setDisplayName:v14];

    -[HMDUser setRemoteAccessAllowed:](v13, "setRemoteAccessAllowed:", [v10 BOOLValue]);
    id v15 = objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x263F0DBF8]);
    id v16 = v15;
    if (v15) {
      -[HMDUser setCamerasAccessLevel:](v13, "setCamerasAccessLevel:", [v15 integerValue]);
    }
    id v45 = v16;
    if (v13)
    {
      uint64_t v17 = *MEMORY[0x263F0DBC0];
      id v18 = v6;
      BOOL v19 = objc_msgSend(v18, "hmf_numberForKey:", v17);
      id v20 = objc_msgSend(v18, "hmf_numberForKey:", @"HMDUserAnnounceAccessLevelCodingKey");

      uint64_t v21 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v13, v19, v20);
    }
    else
    {
      uint64_t v21 = 0;
    }
    [(HMDUser *)v13 setAnnounceAccessLevel:v21];
    id v22 = [v6 objectForKeyedSubscript:*MEMORY[0x263F0D568]];
    if (v22)
    {
      id v43 = v7;
      id v44 = v10;
      id v23 = (void *)MEMORY[0x263F08928];
      id v24 = (void *)MEMORY[0x263EFFA08];
      v54[0] = objc_opt_class();
      v54[1] = objc_opt_class();
      id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
      id v26 = [v24 setWithArray:v25];
      id v47 = 0;
      id v27 = [v23 unarchivedObjectOfClasses:v26 fromData:v22 error:&v47];
      __int16 v28 = (HMDUser *)v47;

      if (v28)
      {
        id v29 = (void *)MEMORY[0x230FBD990]();
        id v30 = a1;
        id v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v32 = v42 = v29;
          *(_DWORD *)buf = 138543618;
          __int16 v49 = v32;
          __int16 v50 = 2112;
          __int16 v51 = v28;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode restricted guest settings from user dictionary with error: %@", buf, 0x16u);

          id v29 = v42;
        }
      }
      else
      {
        [(HMDUser *)v13 setRestrictedGuestAccessSettings:v27];
      }
      id v7 = v43;

      id v10 = v44;
    }
    uint64_t v37 = (void *)MEMORY[0x230FBD990]();
    id v38 = a1;
    __int16 v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      id v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v49 = v40;
      __int16 v50 = 2112;
      __int16 v51 = v13;
      __int16 v52 = 2112;
      id v53 = v6;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@user [%@] from dictionary: [%@]", buf, 0x20u);
    }
  }
  else
  {
    id v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = a1;
    uint64_t v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v49 = v36;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot create user from dictionary because userID is not given", buf, 0xCu);
    }
    id v13 = 0;
  }

  return v13;
}

+ (HMDUser)userWithDictionary:(id)a3
{
  return (HMDUser *)[a1 userWithDictionary:a3 home:0];
}

+ (unint64_t)privilegeFromDictionary:(id)a3
{
  id v3 = objc_msgSend(a3, "hmf_numberForKey:", @"HM.userAdministratorType");
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 integerValue];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t175 != -1) {
    dispatch_once(&logCategory__hmf_once_t175, &__block_literal_global_673);
  }
  id v2 = (void *)logCategory__hmf_once_v176;
  return v2;
}

void __22__HMDUser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v176;
  logCategory__hmf_once___int16 v176 = v0;
}

+ (id)getSyncDataFromLocalDiskWithArchive:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v33 = 0;
    id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4 options:2 error:&v33];
    id v8 = v33;
    if (!v7)
    {
      id v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = a1;
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v35 = v28;
        __int16 v36 = 2112;
        id v37 = v4;
        __int16 v38 = 2112;
        id v39 = v8;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to read data from file : %@ / %@", buf, 0x20u);
      }
      id v16 = 0;
      goto LABEL_21;
    }
    uint64_t v9 = (void *)MEMORY[0x263F08928];
    id v10 = [(id)objc_opt_class() allowedClassesForSyncData];
    id v32 = v8;
    id v11 = [v9 unarchivedObjectOfClasses:v10 fromData:v7 error:&v32];
    id v12 = v32;

    if (v11)
    {
      id v13 = v11;
      objc_opt_class();
      int v14 = objc_opt_isKindOfClass() & 1;
      if (v14) {
        id v15 = v13;
      }
      else {
        id v15 = 0;
      }
      id v16 = v15;

      if (v14) {
        goto LABEL_20;
      }
      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = a1;
      BOOL v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v20;
        __int16 v36 = 2112;
        id v37 = v13;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unarchived data is the wrong type : %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      id v29 = a1;
      BOOL v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v30;
        __int16 v36 = 2112;
        id v37 = v12;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive from disk : %@", buf, 0x16u);
      }
      id v16 = 0;
    }

LABEL_20:

    id v8 = v12;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v21 = (void *)MEMORY[0x230FBD990]();
  id v22 = a1;
  id v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v24;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@HH1 sync data file does not exist : %@", buf, 0x16u);
  }
  id v16 = 0;
LABEL_22:

  return v16;
}

+ (id)allLastUserSyncDataArchives
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08850] defaultManager];
  id v23 = [MEMORY[0x263EFF980] array];
  id v3 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  uint64_t v21 = v2;
  id v4 = [v2 contentsOfDirectoryAtPath:v3 error:0];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v10 hasPrefix:@"HMDUser-Sync-Data-"])
        {
          id v11 = NSString;
          id v12 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
          id v13 = [v11 stringWithFormat:@"%@/%@", v12, v10];

          if (v13)
          {
            int v14 = (void *)MEMORY[0x230FBD990]();
            id v15 = a1;
            id v16 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              uint64_t v17 = v8;
              v19 = id v18 = v5;
              *(_DWORD *)buf = 138543618;
              id v29 = v19;
              __int16 v30 = 2112;
              id v31 = v13;
              _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Found hh2 shared user last sync data %@", buf, 0x16u);

              id v5 = v18;
              uint64_t v8 = v17;
            }

            [v23 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }

  return v23;
}

+ (id)allowedClassesForSyncData
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:5];
  id v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7, v8, v9);

  return v4;
}

+ (id)allowedClassesForAnnounceNotificationMode
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  id v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

+ (id)sharedZoneNameForUserUUID:(id)a3
{
  id v3 = [a3 UUIDString];
  id v4 = [@"user-data-shared-" stringByAppendingString:v3];

  return v4;
}

+ (id)privateZoneNameForUserUUID:(id)a3
{
  id v3 = [a3 UUIDString];
  id v4 = [@"user-data-private-" stringByAppendingString:v3];

  return v4;
}

+ (id)UUIDWithUserID:(id)a3 forHomeIdentifier:(id)a4 uuid:(id)a5 pairingIdentity:(id)a6
{
  v42[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = v13;
  if (v12)
  {
    uint64_t v15 = [v12 copy];
LABEL_3:
    id v16 = (void *)v15;
    goto LABEL_11;
  }
  uint64_t v17 = [v13 identifier];

  if (v11 && v17)
  {
    id v18 = (void *)MEMORY[0x263F08C38];
    BOOL v19 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"05A41D49-2A4D-4D9E-8A3E-43A779B973BA"];
    id v20 = [v11 UUIDString];
    v42[0] = v20;
    uint64_t v21 = [v14 identifier];
    v42[1] = v21;
    id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
    id v16 = objc_msgSend(v18, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v19, 0, v22);
  }
  else
  {
    id v23 = (void *)MEMORY[0x263F08C38];
    if (!v10 || !v11)
    {
      uint64_t v15 = [MEMORY[0x263F08C38] UUID];
      goto LABEL_3;
    }
    BOOL v19 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"05A41D49-2A4D-4D9E-8A3E-43A779B973BA"];
    id v20 = [v11 UUIDString];
    v41[0] = v20;
    v41[1] = v10;
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
    id v16 = objc_msgSend(v23, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v19, 0, v21);
  }

LABEL_11:
  long long v24 = (void *)MEMORY[0x230FBD990]();
  id v25 = a1;
  long long v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    long long v27 = HMFGetLogIdentifier();
    int v29 = 138544642;
    __int16 v30 = v27;
    __int16 v31 = 2112;
    id v32 = v16;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2112;
    id v36 = v11;
    __int16 v37 = 2112;
    id v38 = v12;
    __int16 v39 = 2112;
    uint64_t v40 = v14;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Created user UUID: %@ from userID: %@ homeUUID: %@ uuid: %@ pairingIdentity: %@", (uint8_t *)&v29, 0x3Eu);
  }

  return v16;
}

+ (id)userIDForAccountHandle:(id)a3
{
  id v3 = [a3 URI];
  id v4 = [v3 unprefixedURI];

  return v4;
}

+ (id)ownerWithUserID:(id)a3 home:(id)a4 pairingIdentity:(id)a5 homeManager:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v29 = 0;
  int v14 = [v13 getOrCreateLocalPairingIdentity:&v29];
  id v15 = v29;
  if (v14)
  {
    if (v10 && v12 && ![v14 isEqual:v12])
    {
      id v22 = +[HMDAccountHandleFormatter defaultFormatter];
      uint64_t v28 = [v22 accountHandleFromString:v10];

      id v23 = objc_alloc(MEMORY[0x263F35A78]);
      long long v24 = [v12 identifier];
      id v25 = [v12 publicKey];
      long long v26 = (void *)[v23 initWithIdentifier:v24 publicKey:v25 privateKey:0 permissions:1];

      uint64_t v17 = (HMDAssistantAccessControl *)v28;
      id v16 = (void *)[objc_alloc((Class)a1) initWithAccountHandle:v28 home:v11 pairingIdentity:v26 privilege:3];
    }
    else
    {
      id v16 = [a1 currentUserWithPrivilege:3 forHome:v11];
      uint64_t v17 = [[HMDAssistantAccessControl alloc] initWithUser:v16];
      [v16 setAssistantAccessControl:v17];
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = a1;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v21;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current user from keychain with error: %@", buf, 0x16u);
    }
    id v16 = 0;
  }

  return v16;
}

+ (id)currentUserWithPrivilege:(unint64_t)a3 forHome:(id)a4
{
  return (id)[a1 currentUserWithPrivilege:a3 forHome:a4 forceHH1Key:0];
}

+ (id)currentUserWithPrivilege:(unint64_t)a3 forHome:(id)a4 forceHH1Key:(BOOL)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = +[HMDAppleAccountManager sharedManager];
  id v10 = [v9 account];
  id v11 = [v10 primaryHandle];

  id v12 = [MEMORY[0x263F35AD0] systemStore];
  id v13 = v12;
  if (a5)
  {
    id v37 = 0;
    id v38 = 0;
    id v36 = 0;
    char v14 = [v12 getControllerPublicKey:&v38 secretKey:0 username:&v37 allowCreation:0 error:&v36];
    id v15 = v38;
    id v16 = v37;
    id v17 = v36;
    id v18 = v17;
    if (v14)
    {
      id v19 = a1;

LABEL_6:
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F425F0]) initWithPairingKeyData:v15];
      id v22 = (void *)[objc_alloc(MEMORY[0x263F35A78]) initWithIdentifier:v16 publicKey:v21 privateKey:0 permissions:(a3 & 0xFFFFFFFFFFFFFFFDLL) == 1];

      a1 = v19;
      goto LABEL_14;
    }
    id v23 = (void *)MEMORY[0x230FBD990]();
    long long v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v25 = v35 = a1;
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v25;
      __int16 v41 = 2112;
      id v42 = v18;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@[HMDUser] Failed to get current user from keychain with error: %@", buf, 0x16u);

      a1 = v35;
    }
  }
  else
  {
    id v37 = 0;
    id v38 = 0;
    char v20 = [v12 getOrCreateHH2ControllerKey:&v38 secretKey:0 keyPair:0 username:&v37];
    id v15 = v38;
    id v16 = v37;
    if (v20)
    {
      id v19 = a1;
      goto LABEL_6;
    }
    long long v26 = (void *)MEMORY[0x230FBD990]();
    long long v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@[HMDUser] Failed to get/create HH2 controller key from keychain", buf, 0xCu);
    }
  }
  id v22 = 0;
LABEL_14:

  if (v22)
  {
    id v29 = (void *)[objc_alloc((Class)a1) initWithAccountHandle:v11 home:v8 pairingIdentity:v22 privilege:a3];
    [v29 refreshDisplayName];
  }
  else
  {
    __int16 v30 = (void *)MEMORY[0x230FBD990]();
    id v31 = a1;
    __int16 v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v33;
      __int16 v41 = 2112;
      id v42 = 0;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current user from keychain with error: %@", buf, 0x16u);
    }
    id v29 = 0;
  }

  return v29;
}

- (HMDUser)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = (HMDUser *)[(HMDUser *)self _initWithCoder:v4];

  return v6;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  id v4 = [(HMDUser *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (id)logIdentifier
{
  id v2 = [(HMDUser *)self uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (NSData)publicKey
{
  id v2 = [(HMDUser *)self pairingIdentity];
  id v3 = [v2 publicKey];
  id v4 = [v3 data];

  return (NSData *)v4;
}

- (NSString)pairingUsername
{
  id v2 = [(HMDUser *)self pairingIdentity];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)setUserID:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = +[HMDAccountHandleFormatter defaultFormatter];
    id v5 = [v4 accountHandleFromString:v6];

    if (v5) {
      [(HMDUser *)self setAccountHandle:v5];
    }
  }
  else
  {
    [(HMDUser *)self setAccountHandle:0];
  }
}

- (NSString)userID
{
  id v2 = [(HMDUser *)self accountHandle];
  id v3 = +[HMDUser userIDForAccountHandle:v2];

  return (NSString *)v3;
}

- (void)sendSharedUserProfileMetadataUpdatedMessage
{
  id v5 = [(HMDUser *)self messageDispatcher];
  id v3 = [MEMORY[0x263F42568] entitledMessageWithName:*MEMORY[0x263F0DD98] messagePayload:MEMORY[0x263EFFA78]];
  id v4 = [(HMDUser *)self uuid];
  [v5 sendMessage:v3 target:v4];
}

- (void)_handleFetchProfilePhoto:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  id v6 = [WeakRetained backingStore];
  uint64_t v7 = [v6 context];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__HMDUser__handleFetchProfilePhoto___block_invoke;
  v9[3] = &unk_264A2F820;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlock:v9];
}

void __36__HMDUser__handleFetchProfilePhoto___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[HMCContext findUserWithModelID:v2];

  id v4 = [v3 sharedUserDataRoot];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 aaProfilePhoto];
    uint64_t v7 = [v6 photoData];

    if (v7)
    {
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = objc_msgSend(v5, "aaProfilePhoto", *MEMORY[0x263F0DD08], *MEMORY[0x263F0DD00], v7);
      id v10 = [v9 cropRect];
      id v11 = v10;
      if (!v10)
      {
        id v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", *MEMORY[0x263F08670], *(double *)(MEMORY[0x263F08670] + 8), *(double *)(MEMORY[0x263F08670] + 16), *(double *)(MEMORY[0x263F08670] + 24));
      }
      id v12 = encodeRootObjectForIncomingXPCMessage(v11, 0);
      v25[1] = v12;
      id v13 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:2];
      [v8 respondWithPayload:v13];

      if (!v10) {
    }
      }
    else
    {
      id v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 32);
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v27 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@No profile photo in root", buf, 0xCu);
      }
      id v23 = *(void **)(a1 + 40);
      uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v23 respondWithError:v9];
    }
  }
  else
  {
    char v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v27 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch shared user root", buf, 0xCu);
    }
    id v18 = *(void **)(a1 + 40);
    uint64_t v7 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v18 respondWithError:v7];
  }
}

- (void)_handleFMFDeviceChangedNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HMDUser__handleFMFDeviceChangedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __47__HMDUser__handleFMFDeviceChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Reevaluating me device for HMDAppleAccountManagerAccountModified observer - handleFMFDeviceChangedNotification", (uint8_t *)&v7, 0xCu);
  }
  if (([*(id *)(a1 + 32) isSharedUsersMeDeviceForProfileMetadata] & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:*(void *)(a1 + 32) name:@"HMDAppleAccountManagerAccountModifiedNotification" object:0];
  }
}

- (void)__handleModifiedAccount:(id)a3
{
  if ([(HMDUser *)self isSharedUsersMeDeviceForProfileMetadata])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__HMDUser___handleModifiedAccount___block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __35__HMDUser___handleModifiedAccount___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accountMetadata];
  [v2 updateAccountMetadata];

  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 home];
  [v3 pushMetadataToStoreForHome:v4];
}

- (void)pushMetadataToStoreForHome:(id)a3
{
  id v4 = a3;
  int v5 = isThisDeviceDesignatedFMFDevice();
  if (![(HMDUser *)self isOwner]
    && v5
    && ![(HMDUser *)self isRestrictedGuest]
    && [(HMDUser *)self isCurrentUser]
    && _os_feature_enabled_impl())
  {
    id v6 = [(HMDUser *)self accountMetadata];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__HMDUser_pushMetadataToStoreForHome___block_invoke;
    v7[3] = &unk_264A29720;
    v7[4] = self;
    id v8 = v4;
    [v6 profilePhotoWithCompletionHandler:v7];
  }
}

void __38__HMDUser_pushMetadataToStoreForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSDictionary;
  id v4 = a2;
  int v5 = [v4 photoData];
  uint64_t v6 = *MEMORY[0x263F0DD08];
  int v7 = [v4 cropRect];

  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, v6, v7, *MEMORY[0x263F0DD00], 0);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v8 accountMetadata];
  id v10 = [v9 iCloudAltDSID];
  [v8 setiCloudAltDSID:v10];

  id v11 = *(void **)(a1 + 32);
  id v12 = [v11 accountMetadata];
  id v13 = [v12 firstName];
  [v11 setFirstName:v13];

  char v14 = *(void **)(a1 + 32);
  id v15 = [v14 accountMetadata];
  id v16 = [v15 lastName];
  [v14 setLastName:v16];

  id v17 = *(void **)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 40);
  id v19 = [v17 iCloudAltDSID];
  id v20 = [*(id *)(a1 + 32) firstName];
  uint64_t v21 = [*(id *)(a1 + 32) lastName];
  [v17 _pushSharedProfileMetadataToStoreForHome:v18 iCloudAltDSID:v19 firstName:v20 lastName:v21 profilePhotoDict:v22];
}

- (NSNumber)uniqueIDForAccessories
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__229783;
  id v16 = __Block_byref_object_dispose__229784;
  id v17 = 0;
  id v3 = [(HMDUser *)self home];
  id v4 = [v3 backingStore];
  int v5 = [v4 context];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__HMDUser_uniqueIDForAccessories__block_invoke;
  v9[3] = &unk_264A2F698;
  v9[4] = self;
  id v6 = v5;
  id v10 = v6;
  id v11 = &v12;
  [v6 unsafeSynchronousBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (NSNumber *)v7;
}

void __33__HMDUser_uniqueIDForAccessories__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uuid];
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v10 = +[_MKFHome findHomeMemberWithUUID:v2 context:v3];

  id v4 = v10;
  if (v10)
  {
    int v5 = [v10 uniqueIDForAccessories];
    char v6 = [v5 isEqualToNumber:&unk_26E4735D0];

    id v4 = v10;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [v10 uniqueIDForAccessories];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v4 = v10;
    }
  }
}

- (double)configuredProofOfLocalityTimeout
{
  id v2 = [MEMORY[0x263F42608] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"HMDPreferenceAllowedToAcceptRemoteMessagesIntervalInHoursKey"];
  id v4 = [v3 numberValue];
  [v4 doubleValue];
  double v6 = v5 * 3600.0;

  return v6;
}

- (BOOL)shouldWeOverrideRemoteAccessAllowedDespiteNoRemoteAccessAllowed
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (![(HMDUser *)self isRemoteAccessAllowed])
  {
    id v4 = [(HMDUser *)self home];
    BOOL v5 = [(HMDUser *)self isRestrictedGuest];
    double v6 = [v4 presenceMonitor];
    uint64_t v7 = [(HMDUser *)self uuid];
    if (v5)
    {
      int v8 = [v6 isUserAtHome:v7];

      uint64_t v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v12)
        {
          id v13 = HMFGetLogIdentifier();
          uint64_t v14 = [(HMDUser *)v10 userID];
          int v33 = 138543618;
          uint64_t v34 = v13;
          __int16 v35 = 2112;
          id v36 = v14;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[RG] : Allowing remote access for [%@] even though remote access is not allowed", (uint8_t *)&v33, 0x16u);
        }
        BOOL v3 = 1;
      }
      else
      {
        if (v12)
        {
          __int16 v30 = HMFGetLogIdentifier();
          id v31 = [(HMDUser *)v10 userID];
          int v33 = 138543618;
          uint64_t v34 = v30;
          __int16 v35 = 2112;
          id v36 = v31;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@[RG] : Not allowing remote access for [%@] as the user is not at Home", (uint8_t *)&v33, 0x16u);
        }
        BOOL v3 = 0;
      }
      goto LABEL_21;
    }
    id v15 = [v6 getLastLocalActivityTimeStampForUserUUID:v7];

    if (!v15)
    {
      BOOL v3 = 0;
LABEL_20:

LABEL_21:
      return v3;
    }
    [v15 timeIntervalSinceNow];
    double v17 = fabs(v16);
    uint64_t v18 = [(HMDUser *)self configuredProofOfLocalityTimeout];
    double v20 = v19;
    uint64_t v21 = (void *)MEMORY[0x230FBD990](v18);
    id v22 = self;
    id v23 = HMFGetOSLogHandle();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    BOOL v3 = v17 <= v20;
    if (v17 > v20)
    {
      if (v24)
      {
        id v25 = HMFGetLogIdentifier();
        long long v26 = [NSNumber numberWithDouble:v17];
        int v33 = 138543874;
        uint64_t v34 = v25;
        __int16 v35 = 2112;
        id v36 = v26;
        __int16 v37 = 2112;
        id v38 = v15;
        long long v27 = "%{public}@User was last local %@ seconds ago at %@";
        uint64_t v28 = v23;
        uint32_t v29 = 32;
        goto LABEL_18;
      }
    }
    else if (v24)
    {
      id v25 = HMFGetLogIdentifier();
      long long v26 = [(HMDUser *)v22 userID];
      int v33 = 138543618;
      uint64_t v34 = v25;
      __int16 v35 = 2112;
      id v36 = v26;
      long long v27 = "%{public}@Allowing remote access for [%@] even though remote access is not allowed";
      uint64_t v28 = v23;
      uint32_t v29 = 22;
LABEL_18:
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v33, v29);
    }
    goto LABEL_20;
  }
  return 1;
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4 = a3;
  if ([(HMDUser *)self isRestrictedGuest])
  {
    BOOL v5 = [(HMDUser *)self queue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __51__HMDUser_handlePrimaryResidentUpdateNotification___block_invoke;
    v6[3] = &unk_264A2F820;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __51__HMDUser_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    double v6 = [*(id *)(a1 + 40) name];
    int v7 = 138543618;
    int v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Received resident update notification: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)areAccessoriesInAllowedList:(id)a3
{
  id v4 = a3;
  if (-[HMDUser isRestrictedGuest](self, "isRestrictedGuest") && [v4 count])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__HMDUser_areAccessoriesInAllowedList___block_invoke;
    v7[3] = &unk_264A2F348;
    v7[4] = self;
    char v5 = objc_msgSend(v4, "na_all:", v7);
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

uint64_t __39__HMDUser_areAccessoriesInAllowedList___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 restrictedGuestAccessSettings];
  char v5 = [v4 uuidsOfAllowedAccessories];
  uint64_t v6 = [v5 containsObject:v3];

  return v6;
}

- (BOOL)isAccessCurrentlyAllowedBySchedule
{
  id v3 = [(HMDUser *)self home];
  if ([(HMDUser *)self isRestrictedGuest])
  {
    id v4 = [(HMDUser *)self restrictedGuestAccessSettings];
    char v5 = [v4 schedule];

    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x263F0E6E0];
      int v7 = [MEMORY[0x263EFF910] date];
      int v8 = [v3 timeZone];
      char v9 = [v6 isDate:v7 withinAllowedTimeForSchedule:v5 forHomeInTimeZone:v8];
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)_notifyEveryOneAboutRestrictedGuestScheduleNotification:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = @"kUserUUIDKey";
  char v5 = [(HMDUser *)self uuid];
  v19[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

  logAndPostNotification(v4, self, v6);
  if (HMFEqualObjects())
  {
    int v7 = (id *)MEMORY[0x263F0DD20];
LABEL_5:
    id v8 = *v7;
    char v9 = [(HMDUser *)self messageDispatcher];
    id v10 = [MEMORY[0x263F42568] entitledMessageWithName:v8 messagePayload:MEMORY[0x263EFFA78]];
    uint64_t v11 = [(HMDUser *)self uuid];
    [v9 sendMessage:v10 target:v11];

    goto LABEL_9;
  }
  if (HMFEqualObjects())
  {
    int v7 = (id *)MEMORY[0x263F0DD18];
    goto LABEL_5;
  }
  BOOL v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    int v16 = 138543362;
    double v17 = v15;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Nothing to notify to clients", (uint8_t *)&v16, 0xCu);
  }
LABEL_9:
}

- (void)handleRestrictedGuestScheduleTimer:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDUser *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__HMDUser_handleRestrictedGuestScheduleTimer___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__HMDUser_handleRestrictedGuestScheduleTimer___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = objc_msgSend(v2, "hmf_stringForKey:", @"HMD.BGTM.NK");

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 40);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v52 = v7;
    __int16 v53 = 2112;
    id v54 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@RG schedule timer fired: %@", buf, 0x16u);
  }
  id v8 = [*(id *)(a1 + 40) restrictedGuestScheduleStartTimerID];
  int v9 = HMFEqualObjects();

  id v10 = [*(id *)(a1 + 40) restrictedGuestScheduleEndTimerID];
  char v11 = HMFEqualObjects();

  if (v9 & 1) != 0 || (v11)
  {
    int v16 = +[HMDBackgroundTaskManager sharedManager];
    double v17 = *(void **)(a1 + 40);
    if (v9)
    {
      uint64_t v18 = [v17 restrictedGuestAccessSettings];
      double v19 = [v18 nextScheduledInterval];

      if (v19)
      {
        double v20 = [MEMORY[0x263EFF910] now];
        char v21 = [v19 containsDate:v20];

        if (v21)
        {
          id v22 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) _notifyEveryOneAboutRestrictedGuestScheduleNotification:@"HMDUserRestrictedGuestScheduleStartedNotification"]);
          id v23 = *(id *)(a1 + 40);
          BOOL v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            id v25 = HMFGetLogIdentifier();
            long long v26 = [v19 endDate];
            *(_DWORD *)buf = 138543618;
            __int16 v52 = v25;
            __int16 v53 = 2112;
            id v54 = v26;
            _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Going to schedule the end period timer: %@", buf, 0x16u);
          }
          long long v27 = [*(id *)(a1 + 40) restrictedGuestScheduleEndTimerID];
          uint64_t v28 = [v19 endDate];
          uint64_t v29 = *(void *)(a1 + 40);
          id v50 = 0;
          char v30 = [v16 scheduleTaskWithIdentifier:v27 fireDate:v28 onObserver:v29 selector:sel_handleRestrictedGuestScheduleTimer_ error:&v50];
          id v31 = v50;

          if (v30) {
            goto LABEL_31;
          }
          __int16 v32 = (void *)MEMORY[0x230FBD990]();
          id v33 = *(id *)(a1 + 40);
          uint64_t v34 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
LABEL_30:

LABEL_31:

            goto LABEL_32;
          }
          __int16 v35 = HMFGetLogIdentifier();
          id v36 = [v19 endDate];
          *(_DWORD *)buf = 138543874;
          __int16 v52 = v35;
          __int16 v53 = 2112;
          id v54 = v36;
          __int16 v55 = 2112;
          id v56 = v31;
          __int16 v37 = "%{public}@Failed to schedule end timer: %@ / %@";
LABEL_22:
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, v37, buf, 0x20u);

          goto LABEL_30;
        }
        __int16 v32 = (void *)MEMORY[0x230FBD990]();
        id v33 = *(id *)(a1 + 40);
        uint64_t v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v52 = v48;
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Looks like we are not within the allowed time interval anymore.", buf, 0xCu);
        }
LABEL_29:
        id v31 = 0;
        goto LABEL_30;
      }
      __int16 v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = *(id *)(a1 + 40);
      uint64_t v34 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
LABEL_28:
        double v19 = 0;
        goto LABEL_29;
      }
      uint64_t v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v52 = v46;
      id v47 = "%{public}@Looks like the schedule is not valid anymore.";
    }
    else
    {
      [v17 _notifyEveryOneAboutRestrictedGuestScheduleNotification:@"HMDUserRestrictedGuestScheduleEndedNotification"];
      id v38 = [*(id *)(a1 + 40) restrictedGuestAccessSettings];
      double v19 = [v38 nextScheduledInterval];

      __int16 v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = *(id *)(a1 + 40);
      uint64_t v34 = HMFGetOSLogHandle();
      BOOL v39 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
      if (v19)
      {
        if (v39)
        {
          uint64_t v40 = HMFGetLogIdentifier();
          __int16 v41 = [v19 startDate];
          *(_DWORD *)buf = 138543618;
          __int16 v52 = v40;
          __int16 v53 = 2112;
          id v54 = v41;
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Going to schedule the start period timer: %@", buf, 0x16u);
        }
        id v42 = [*(id *)(a1 + 40) restrictedGuestScheduleStartTimerID];
        uint64_t v43 = [v19 startDate];
        uint64_t v44 = *(void *)(a1 + 40);
        id v49 = 0;
        char v45 = [v16 scheduleTaskWithIdentifier:v42 fireDate:v43 onObserver:v44 selector:sel_handleRestrictedGuestScheduleTimer_ error:&v49];
        id v31 = v49;

        if (v45) {
          goto LABEL_31;
        }
        __int16 v32 = (void *)MEMORY[0x230FBD990]();
        id v33 = *(id *)(a1 + 40);
        uint64_t v34 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          goto LABEL_30;
        }
        __int16 v35 = HMFGetLogIdentifier();
        id v36 = [v19 startDate];
        *(_DWORD *)buf = 138543874;
        __int16 v52 = v35;
        __int16 v53 = 2112;
        id v54 = v36;
        __int16 v55 = 2112;
        id v56 = v31;
        __int16 v37 = "%{public}@Failed to schedule start timer: %@ / %@";
        goto LABEL_22;
      }
      if (!v39) {
        goto LABEL_28;
      }
      uint64_t v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v52 = v46;
      id v47 = "%{public}@No more intervals in the schedule. Nothing to schedule";
    }
    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, v47, buf, 0xCu);

    goto LABEL_28;
  }
  BOOL v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v52 = v15;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@This is neither start nor end timer. File a radar for BTM", buf, 0xCu);
  }
LABEL_32:
}

- (void)_handleRestrictedGuestNewSchedule:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUser *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    id v10 = [v4 startDate];
    char v11 = [v4 endDate];
    *(_DWORD *)buf = 138543874;
    char v30 = v9;
    __int16 v31 = 2112;
    __int16 v32 = v10;
    __int16 v33 = 2112;
    uint64_t v34 = v11;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Calculated new interval : [%@, %@]", buf, 0x20u);
  }
  BOOL v12 = +[HMDBackgroundTaskManager sharedManager];
  id v13 = [MEMORY[0x263EFF910] now];
  int v14 = [v4 containsDate:v13];

  if (v14)
  {
    id v15 = [(HMDUser *)v7 restrictedGuestScheduleEndTimerID];
    [v4 endDate];
  }
  else
  {
    id v15 = [(HMDUser *)v7 restrictedGuestScheduleStartTimerID];
    [v4 startDate];
  int v16 = };
  id v28 = 0;
  char v17 = [v12 scheduleTaskWithIdentifier:v15 fireDate:v16 onObserver:v7 selector:sel_handleRestrictedGuestScheduleTimer_ error:&v28];
  id v18 = v28;
  double v19 = (void *)MEMORY[0x230FBD990]();
  double v20 = v7;
  char v21 = HMFGetOSLogHandle();
  id v22 = v21;
  if (v17)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      char v30 = v23;
      __int16 v31 = 2112;
      __int16 v32 = v15;
      __int16 v33 = 2112;
      uint64_t v34 = v16;
      BOOL v24 = "%{public}@Scheduled new timer for RG : %@ / %@";
      id v25 = v22;
      os_log_type_t v26 = OS_LOG_TYPE_INFO;
      uint32_t v27 = 32;
LABEL_11:
      _os_log_impl(&dword_22F52A000, v25, v26, v24, buf, v27);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    char v30 = v23;
    __int16 v31 = 2112;
    __int16 v32 = v16;
    __int16 v33 = 2112;
    uint64_t v34 = v15;
    __int16 v35 = 2112;
    id v36 = v18;
    BOOL v24 = "%{public}@Failed to schedule RG schedule timer: %@ / %@ / %@";
    id v25 = v22;
    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    uint32_t v27 = 42;
    goto LABEL_11;
  }
}

- (void)cancelRestrictedGuestScheduledTimers
{
  id v5 = +[HMDBackgroundTaskManager sharedManager];
  id v3 = [(HMDUser *)self restrictedGuestScheduleStartTimerID];
  [v5 cancelTaskWithIdentifier:v3 onObserver:self];

  id v4 = [(HMDUser *)self restrictedGuestScheduleEndTimerID];
  [v5 cancelTaskWithIdentifier:v4 onObserver:self];
}

- (void)scheduleRestrictedGuestAccessTimersWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUser *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMDUser_scheduleRestrictedGuestAccessTimersWithReason___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDUser_scheduleRestrictedGuestAccessTimersWithReason___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) restrictedGuestAccessSettings];
    int v7 = [v6 schedule];
    uint64_t v8 = *(void *)(a1 + 40);
    int v11 = 138543874;
    BOOL v12 = v5;
    __int16 v13 = 2112;
    int v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Going to schedule timers for restricted guest: %@, reason: %@", (uint8_t *)&v11, 0x20u);
  }
  [*(id *)(a1 + 32) cancelRestrictedGuestScheduledTimers];
  int v9 = [*(id *)(a1 + 32) restrictedGuestAccessSettings];
  id v10 = [v9 nextScheduledInterval];

  if (v10) {
    [*(id *)(a1 + 32) _handleRestrictedGuestNewSchedule:v10];
  }
}

- (void)updateRestrictedGuestSettingsFromWorkingStoreIfNeeded
{
  if ([(HMDUser *)self isRestrictedGuest])
  {
    id v3 = [(HMDUser *)self restrictedGuestAccessSettings];
    int v4 = [v3 updateRestrictedGuestSettingsFromWorkingStore:self];

    if (v4)
    {
      logAndPostNotification(@"HMDUserScheduleDidChangeNotification", self, 0);
      [(HMDUser *)self scheduleRestrictedGuestAccessTimersWithReason:@"Updated schedule from DB"];
    }
  }
}

- (void)setRestrictedGuestAccessSettings:(id)a3
{
  int v4 = (HMDRestrictedGuestHomeAccessSettings *)a3;
  os_unfair_lock_lock_with_options();
  restrictedGuestAccessSettings = self->_restrictedGuestAccessSettings;
  self->_restrictedGuestAccessSettings = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDRestrictedGuestHomeAccessSettings)restrictedGuestAccessSettings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int v4 = self->_restrictedGuestAccessSettings;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)restrictedGuestScheduleEndTimerID
{
  id v2 = NSString;
  id v3 = [(HMDUser *)self uuid];
  int v4 = [v3 UUIDString];
  id v5 = [v2 stringWithFormat:@"RGScheduleEnd.%@", v4];

  return v5;
}

- (id)restrictedGuestScheduleStartTimerID
{
  id v2 = NSString;
  id v3 = [(HMDUser *)self uuid];
  int v4 = [v3 UUIDString];
  id v5 = [v2 stringWithFormat:@"RGScheduleStart.%@", v4];

  return v5;
}

- (NSNumber)notificationContextNFCIdentifier
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUser *)self nfcIssuerKeyIdentifier];
  int v4 = v3;
  if (v3)
  {
    id v5 = (unsigned int *)[v3 bytes];
    id v6 = [NSNumber numberWithUnsignedInt:*v5];
  }
  else
  {
    int v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      __int16 v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@NFC issuer key identifier for user is nil", (uint8_t *)&v12, 0xCu);
    }
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)notificationContextHAPIdentifier
{
  v5[2] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  v5[1] = 0;
  id v2 = [(HMDUser *)self uuid];
  [v2 getUUIDBytes:v5];

  id v3 = [NSNumber numberWithUnsignedInt:LODWORD(v5[0])];
  return (NSNumber *)v3;
}

- (void)configurePersonSettingsManager
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(HMDUser *)self isCurrentUser])
  {
    id v3 = [(HMDUser *)self home];
    int v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    int v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = HMFGetLogIdentifier();
        int v12 = 138543362;
        __int16 v13 = v8;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating the person settings manager", (uint8_t *)&v12, 0xCu);
      }
      int v9 = [[HMDPersonSettingsManager alloc] initWithHome:v3 workQueue:v5->_queue];
      [(HMDUser *)v5 setPersonSettingsManager:v9];

      id v10 = [(HMDUser *)v5 personSettingsManager];
      [v10 configure];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = HMFGetLogIdentifier();
        int v12 = 138543362;
        __int16 v13 = v11;
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Not creating person settings manager because home reference is nil", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)configurePhotosPersonDataManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v9 = [(HMDUser *)self home];
  if (v9
    && ([(HMDUser *)self isRunningOnHomeOwnersDevice]
     || [(HMDUser *)self isCurrentUser])
    && [(HMDUser *)self isAllowedToSharePhotosPersonManagerData])
  {
    id v3 = [HMDUserPhotosPersonDataManager alloc];
    int v4 = [(HMDUser *)self messageDispatcher];
    id v5 = [v9 backingStore];
    id v6 = [v5 context];
    int v7 = [(HMDUserPhotosPersonDataManager *)v3 initWithUser:self messageDispatcher:v4 backingStoreContext:v6 workQueue:self->_queue];
    [(HMDUser *)self setPhotosPersonDataManager:v7];

    uint64_t v8 = [(HMDUser *)self photosPersonDataManager];
    [v8 configure];
  }
}

- (HMDPhotosPersonManager)photosPersonManager
{
  id v2 = [(HMDUser *)self photosPersonDataManager];
  id v3 = [v2 personManager];

  return (HMDPhotosPersonManager *)v3;
}

- (HMPhotosPersonManagerSettings)photosPersonManagerSettings
{
  id v2 = [(HMDUser *)self photosPersonDataManager];
  id v3 = [v2 settings];
  int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[HMDUserPhotosPersonDataManager defaultSettings];
  }
  id v6 = v5;

  return (HMPhotosPersonManagerSettings *)v6;
}

- (id)announceNotificationFileName
{
  id v3 = [(HMDUser *)self uuid];
  int v4 = [(HMDUser *)self announceNotificationFileNameForUserUUID:v3];

  return v4;
}

- (id)announceNotificationFileNameForUserUUID:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  id v6 = [v3 stringWithFormat:@"%@/HMDUser-Announce-Notification-Mode-%@.plist", v5, v4];

  return v6;
}

- (void)_removeAnnounceNotificationModeFileFromDiskForUserUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(NSURL);
  id v6 = [(HMDUser *)self announceNotificationFileNameForUserUUID:v4];
  int v7 = (void *)[v5 initFileURLWithPath:v6];

  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  id v14 = 0;
  [v8 removeItemAtURL:v7 error:&v14];
  id v9 = v14;

  if (v9)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    int v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while removing announce notification settings file from disk : %@", buf, 0x16u);
    }
  }
}

- (void)_migrateAnnounceNotificationModeIfNeeded
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v58 = [(HMDUser *)self home];
  [(HMDUser *)self userIDsToMigrateAnnounceSettingsFrom];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v57 = v69;
    unint64_t v5 = 0x263F08000uLL;
    uint64_t v6 = *(void *)v75;
    uint64_t v60 = *(void *)v75;
    do
    {
      uint64_t v7 = 0;
      uint64_t v61 = v4;
      do
      {
        if (*(void *)v75 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = -[HMDUser announceNotificationFileNameForUserUUID:](self, "announceNotificationFileNameForUserUUID:", *(void *)(*((void *)&v74 + 1) + 8 * v7), v56, v57);
        id v9 = [*(id *)(v5 + 2128) defaultManager];
        char v10 = [v9 fileExistsAtPath:v8];

        int v11 = (void *)MEMORY[0x230FBD990]();
        int v12 = self;
        __int16 v13 = HMFGetOSLogHandle();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if (v10)
        {
          if (v14)
          {
            __int16 v15 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v80 = v15;
            __int16 v81 = 2112;
            id v82 = v8;
            _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to read HH1 announce setting file : %@", buf, 0x16u);
          }
          id v73 = 0;
          uint64_t v16 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v8 options:2 error:&v73];
          id v17 = v73;
          if (v16)
          {
            id v18 = (void *)MEMORY[0x263F08928];
            uint64_t v19 = [(id)objc_opt_class() allowedClassesForAnnounceNotificationMode];
            id v72 = v17;
            double v20 = [v18 unarchivedObjectOfClasses:v19 fromData:v16 error:&v72];
            id v21 = v72;

            id v63 = v21;
            if (v20)
            {
              id v22 = v20;
              objc_opt_class();
              int v23 = objc_opt_isKindOfClass() & 1;
              if (v23) {
                BOOL v24 = v22;
              }
              else {
                BOOL v24 = 0;
              }
              id v59 = v24;

              id v25 = (void *)MEMORY[0x230FBD990]();
              os_log_type_t v26 = v12;
              uint32_t v27 = HMFGetOSLogHandle();
              id v28 = v27;
              if (v23)
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  uint64_t v29 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  uint64_t v80 = v29;
                  __int16 v81 = 2112;
                  id v82 = v22;
                  _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Found HH1 announce notification mode for current user : %@", buf, 0x16u);
                }
                char v30 = [v22 objectForKeyedSubscript:@"HMD.announce.notification.mode"];
                if (v30)
                {
                  __int16 v31 = [v58 backingStore];
                  __int16 v32 = [v31 context];

                  __int16 v33 = [v32 managedObjectContext];
                  v68[0] = MEMORY[0x263EF8330];
                  v68[1] = 3221225472;
                  v69[0] = __51__HMDUser__migrateAnnounceNotificationModeIfNeeded__block_invoke;
                  v69[1] = &unk_264A2F2F8;
                  v69[2] = v26;
                  id v70 = v30;
                  id v71 = v33;
                  id v34 = v33;
                  [v34 performBlockAndWait:v68];

                  int v35 = 2;
                }
                else
                {
                  uint64_t v46 = (void *)MEMORY[0x230FBD990]();
                  id v47 = v26;
                  uint64_t v48 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v49 = id v56 = v46;
                    *(_DWORD *)buf = 138543618;
                    uint64_t v80 = v49;
                    __int16 v81 = 2112;
                    id v82 = v22;
                    _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@That's weird. Announce notification dictionary contain nil value for notification mode : %@", buf, 0x16u);

                    uint64_t v46 = v56;
                  }

                  int v35 = 3;
                }
              }
              else
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  char v45 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  uint64_t v80 = v45;
                  __int16 v81 = 2112;
                  id v82 = v22;
                  _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unarchived data is the wrong type : %@", buf, 0x16u);
                }
                int v35 = 3;
              }
              uint64_t v4 = v61;
            }
            else
            {
              __int16 v41 = (void *)MEMORY[0x230FBD990]();
              id v42 = v12;
              uint64_t v43 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                uint64_t v44 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                uint64_t v80 = v44;
                __int16 v81 = 2112;
                id v82 = v21;
                _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive from disk : %@", buf, 0x16u);
              }
              int v35 = 3;
              uint64_t v4 = v61;
            }

            id v17 = v63;
          }
          else
          {
            uint64_t v37 = (void *)MEMORY[0x230FBD990]();
            id v38 = v12;
            BOOL v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              uint64_t v40 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              uint64_t v80 = v40;
              __int16 v81 = 2112;
              id v82 = v8;
              __int16 v83 = 2112;
              id v84 = v17;
              _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Unable to read data from file : %@ / %@", buf, 0x20u);
            }
            int v35 = 3;
            uint64_t v4 = v61;
          }

          BOOL v50 = v35 == 3;
          unint64_t v5 = 0x263F08000;
          uint64_t v6 = v60;
          if (!v50) {
            goto LABEL_41;
          }
        }
        else
        {
          if (v14)
          {
            id v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v80 = v36;
            __int16 v81 = 2112;
            id v82 = v8;
            _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@HH1 announce setting file do not exist : %@", buf, 0x16u);
          }
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v4);
  }
LABEL_41:

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v51 = obj;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v64 objects:v78 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v65 != v54) {
          objc_enumerationMutation(v51);
        }
        -[HMDUser _removeAnnounceNotificationModeFileFromDiskForUserUUID:](self, "_removeAnnounceNotificationModeFileFromDiskForUserUUID:", *(void *)(*((void *)&v64 + 1) + 8 * i), v56);
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v64 objects:v78 count:16];
    }
    while (v53);
  }
}

uint64_t __51__HMDUser__migrateAnnounceNotificationModeIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (int)[*(id *)(a1 + 40) intValue];
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _updateAnnounceNotificationModeToLocalStore:v3 managedObjectContext:v4];
}

- (id)userIDsToMigrateAnnounceSettingsFrom
{
  v8[1] = *MEMORY[0x263EF8340];
  if ([(HMDUser *)self isOwner])
  {
    uint64_t v3 = [(HMDUser *)self uuid];
    v8[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    uint64_t v3 = [(HMDUser *)self home];
    unint64_t v5 = [v3 homeManager];
    uint64_t v6 = [v3 uuid];
    uint64_t v4 = [v5 hh1UserIDsForCurrentUserForHomeUUID:v6];
  }
  return v4;
}

- (void)_readAnnounceNotificationModeFromLocalStore
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDUser *)self isCurrentUser];
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  if (v3)
  {
    [(HMDUser *)self _migrateAnnounceNotificationModeIfNeeded];
    unint64_t v5 = [(HMDUser *)self home];
    uint64_t v6 = [v5 uuid];
    uint64_t v7 = [v5 backingStore];
    uint64_t v8 = [v7 context];

    id v9 = [v8 managedObjectContext];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __54__HMDUser__readAnnounceNotificationModeFromLocalStore__block_invoke;
    v15[3] = &unk_264A2F2F8;
    id v16 = v6;
    id v17 = v9;
    id v18 = self;
    id v10 = v9;
    id v11 = v6;
    [v10 performBlockAndWait:v15];
  }
  else
  {
    int v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      BOOL v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      double v20 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Not reading announce setting from local store as this user is not the current user", buf, 0xCu);
    }
  }
}

void __54__HMDUser__readAnnounceNotificationModeFromLocalStore__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = +[MKFLocalBulletinAnnounceUserSettingRegistration fetchAnnounceRegistrationWithHomeUUID:*(void *)(a1 + 32) managedObjectContext:*(void *)(a1 + 40)];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990](objc_msgSend(*(id *)(a1 + 48), "setAnnounceNotificationModeForCurrentDevice:", (int)objc_msgSend(v2, "announceNotificationMode")));
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "announceNotificationModeForCurrentDevice"));
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2112;
      __int16 v13 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Announce Notification Mode : %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Did not find announce setting in local store.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_updateAnnounceNotificationModeToLocalStore:(unint64_t)a3 managedObjectContext:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_msgSend(v6, "hmd_assertIsExecuting");
  uint64_t v7 = [(HMDUser *)self home];
  uint64_t v8 = [v7 uuid];
  id v9 = (void *)MEMORY[0x230FBD990]();
  int v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    __int16 v13 = [NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138543618;
    id v47 = v12;
    __int16 v48 = 2112;
    id v49 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Going to store announce notification mode (%@) to local store", buf, 0x16u);
  }
  uint64_t v14 = +[MKFLocalBulletinAnnounceUserSettingRegistration fetchAnnounceRegistrationWithHomeUUID:v8 managedObjectContext:v6];
  if (!v14) {
    uint64_t v14 = [[MKFLocalBulletinAnnounceUserSettingRegistration alloc] initWithContext:v6];
  }
  [(MKFLocalBulletinAnnounceUserSettingRegistration *)v14 setEnabled:1];
  [(MKFLocalBulletinAnnounceUserSettingRegistration *)v14 setHomeUUID:v8];
  unint64_t v43 = a3;
  [(MKFLocalBulletinAnnounceUserSettingRegistration *)v14 setAnnounceNotificationMode:a3];
  id v44 = 0;
  [v6 save:&v44];
  id v15 = v44;
  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = v10;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v41 = v6;
    double v20 = v19 = v15;
    [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v21 = v8;
    v23 = id v22 = v7;
    BOOL v24 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    id v47 = v20;
    __int16 v48 = 2112;
    id v49 = v23;
    __int16 v50 = 2112;
    id v51 = v19;
    __int16 v52 = 2112;
    uint64_t v53 = v24;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Storing announce notification mode (%@) saved to local store with error : %@, Success : %@", buf, 0x2Au);

    uint64_t v7 = v22;
    uint64_t v8 = v21;

    id v15 = v19;
    id v6 = v41;
  }

  if (!v15)
  {
    id v42 = v7;
    id v25 = [MEMORY[0x263EFFA40] standardUserDefaults];
    os_log_type_t v26 = [v25 dictionaryForKey:@"deviceAnnounceMode"];
    uint32_t v27 = (void *)[v26 mutableCopy];

    if (!v27)
    {
      uint32_t v27 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v28 = [NSNumber numberWithUnsignedInteger:v43];
    uint64_t v29 = [v8 UUIDString];
    [v27 setValue:v28 forKey:v29];

    char v30 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v30 setObject:v27 forKey:@"deviceAnnounceMode"];

    __int16 v31 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v31 synchronize];

    __int16 v32 = objc_opt_new();
    __int16 v33 = (void *)MEMORY[0x263EFFA08];
    char v45 = @"deviceAnnounceMode";
    id v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
    int v35 = [v33 setWithArray:v34];
    [v32 synchronizeUserDefaultsDomain:@"com.apple.homed" keys:v35];

    id v36 = (void *)MEMORY[0x230FBD990]();
    uint64_t v37 = v17;
    id v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      BOOL v39 = HMFGetLogIdentifier();
      uint64_t v40 = [NSNumber numberWithUnsignedInteger:v43];
      *(_DWORD *)buf = 138543618;
      id v47 = v39;
      __int16 v48 = 2112;
      id v49 = v40;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Setting announce notification mode (%@) to defaults for NPSManager", buf, 0x16u);
    }

    id v15 = 0;
    uint64_t v7 = v42;
  }
}

- (void)_saveAnnounceSettingsToLocalStore:(unint64_t)a3
{
  id v5 = [(HMDUser *)self home];
  id v6 = [v5 backingStore];
  uint64_t v7 = [v6 context];

  uint64_t v8 = [v7 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__HMDUser__saveAnnounceSettingsToLocalStore___block_invoke;
  v10[3] = &unk_264A2E458;
  id v11 = v8;
  unint64_t v12 = a3;
  v10[4] = self;
  id v9 = v8;
  [v9 performBlock:v10];
}

uint64_t __45__HMDUser__saveAnnounceSettingsToLocalStore___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAnnounceNotificationModeToLocalStore:*(void *)(a1 + 48) managedObjectContext:*(void *)(a1 + 40)];
}

- (void)_updateAnnounceNotificationMode:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [(HMDUser *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(HMDUser *)self isCurrentUser];
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  id v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      unint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceNotificationModeForCurrentDevice](v8, "announceNotificationModeForCurrentDevice"));
      __int16 v13 = [NSNumber numberWithUnsignedInteger:a3];
      int v15 = 138543874;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v12;
      __int16 v19 = 2112;
      double v20 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating Announce Setting from %@ to %@", (uint8_t *)&v15, 0x20u);
    }
    if ([(HMDUser *)v8 announceNotificationModeForCurrentDevice] != a3)
    {
      [(HMDUser *)v8 setAnnounceNotificationModeForCurrentDevice:a3];
      [(HMDUser *)v8 _saveAnnounceSettingsToLocalStore:[(HMDUser *)v8 announceNotificationModeForCurrentDevice]];
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v14;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Announce settings can only be updated on current user", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)updateAnnounceNotificationMode:(unint64_t)a3
{
  id v5 = [(HMDUser *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __42__HMDUser_updateAnnounceNotificationMode___block_invoke;
  v6[3] = &unk_264A2C6A0;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __42__HMDUser_updateAnnounceNotificationMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAnnounceNotificationMode:*(void *)(a1 + 40)];
}

- (void)_handleAnnounceSettingsUpdate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUser *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDUser *)self isCurrentUser])
  {
    uint64_t v6 = *MEMORY[0x263F0DBC8];
    uint64_t v20 = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    uint64_t v8 = [v4 unarchivedObjectForKey:v6 ofClasses:v7];

    if (v8)
    {
      -[HMDUser _updateAnnounceNotificationMode:](self, "_updateAnnounceNotificationMode:", [v8 deviceNotificationMode]);
      [v4 respondWithSuccess];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      int v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v17 = HMFGetLogIdentifier();
        id v18 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        id v22 = v17;
        __int16 v23 = 2112;
        BOOL v24 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing announce user settings in message payload: %@", buf, 0x16u);
      }
      __int16 v19 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Missing announce settings" reason:@"Need announce settings in message" suggestion:0];
      [v4 respondWithError:v19];

      uint64_t v8 = 0;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    int v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = HMFGetLogIdentifier();
      __int16 v13 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      id v22 = v12;
      __int16 v23 = 2112;
      BOOL v24 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Announce settings can only be updated on current user: %@", buf, 0x16u);
    }
    uint64_t v8 = [MEMORY[0x263F087E8] hmErrorWithCode:48 description:@"This can only be set for the user's devices." reason:@"Announce notifications are only delivered on devices the user owns." suggestion:0];
    [v4 respondWithError:v8];
  }
}

- (void)handleRemovedAccessory:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"HMDAccessoryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v11 = v6;

  if (v11)
  {
    uint64_t v7 = [(HMDUser *)self userDataController];
    uint64_t v8 = [v11 uuid];
    [v7 handleRemovedAccessory:v8];

    id v9 = [(HMDUser *)self accessorySettingsDataController];
    int v10 = [v11 uuid];
    [v9 handleRemovedAccessoryWithModelID:v10];
  }
}

- (void)removeAccessoriesFromAssistantAccessControlList:(id)a3
{
  id v5 = a3;
  if ([(HMDUser *)self isCurrentUserAndOwner])
  {
    id v4 = [(HMDUser *)self assistantAccessControl];
    [v4 removeAccessoriesAddedByOldController:v5];
  }
}

- (void)enableUserListeningHistoryForAccessory:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__HMDUser_enableUserListeningHistoryForAccessory___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__HMDUser_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessorySettingsDataController];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) accessorySettingsDataController];
    [v3 enableUserListeningHistoryForAccessory:*(void *)(a1 + 40)];
  }
}

- (void)_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUser *)self home];
  id v6 = v5;
  if (v5
    && ([v5 homeManager],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 homes],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 containsObject:v6],
        v8,
        v7,
        (v9 & 1) != 0))
  {
    if ([(HMDUser *)self isCurrentUser])
    {
      int v10 = [v4 arrayForKey:*MEMORY[0x263F0DC88]];
      id v11 = v10;
      if (v10)
      {
        id v44 = v4;
        unint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v48 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v47 + 1) + 8 * i)];
              [v12 addObject:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
          }
          while (v15);
        }

        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __73__HMDUser__handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke;
        aBlock[3] = &unk_264A2F3E8;
        id v4 = v44;
        id v19 = v44;
        uint64_t v46 = (void (**)(void, void, void))v19;
        uint64_t v20 = _Block_copy(aBlock);
        uint64_t v21 = [(HMDUser *)self accessorySettingsDataController];

        if (v21)
        {
          id v22 = [(HMDUser *)self accessorySettingsDataController];
          [v22 handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:v12 completion:v20];
        }
        else
        {
          uint64_t v40 = (void *)MEMORY[0x230FBD990]();
          id v41 = self;
          id v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            unint64_t v43 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v53 = v43;
            _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);
          }
          id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"User data controller not found" reason:@"No settings for this user" suggestion:0];
          [v19 respondWithError:v22];
        }

        BOOL v39 = v46;
      }
      else
      {
        __int16 v33 = (void *)MEMORY[0x230FBD990]();
        id v34 = self;
        int v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          id v36 = HMFGetLogIdentifier();
          uint64_t v37 = [v4 messagePayload];
          *(_DWORD *)buf = 138543618;
          uint64_t v53 = v36;
          __int16 v54 = 2112;
          id v55 = v37;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Missing user update listening history control accessories in message payload: %@", buf, 0x16u);
        }
        unint64_t v12 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Missing access control accessories" reason:@"Need access control accessories in message" suggestion:0];
        id v38 = [v4 responseHandler];

        if (!v38) {
          goto LABEL_31;
        }
        BOOL v39 = [v4 responseHandler];
        ((void (**)(void, void *, void))v39)[2](v39, v12, 0);
      }

LABEL_31:
      goto LABEL_18;
    }
    uint64_t v29 = (void *)MEMORY[0x230FBD990]();
    char v30 = self;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v53 = v32;
      __int16 v54 = 2112;
      id v55 = v4;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Can only modify own ULH control: %@", buf, 0x16u);
    }
    uint32_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = 2028;
  }
  else
  {
    __int16 v23 = (void *)MEMORY[0x230FBD990]();
    BOOL v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Not processing user listening history update since the homes mismatch.", buf, 0xCu);
    }
    uint32_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = 2018;
  }
  id v11 = [v27 hmPrivateErrorWithCode:v28];
  [v4 respondWithError:v11];
LABEL_18:
}

void __73__HMDUser__handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v4)[2](v4, v5, 0);
  }
}

- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HMDUser_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __72__HMDUser_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:*(void *)(a1 + 40)];
}

- (void)_handleMediaContentProfileAccessControlUpdate:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUser *)self home];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 homeManager];
    id v8 = [v7 homes];
    char v9 = [v8 containsObject:v6];

    if (v9)
    {
      if (![(HMDUser *)self isCurrentUser])
      {
        uint32_t v27 = (void *)MEMORY[0x230FBD990]();
        uint64_t v28 = self;
        uint64_t v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          char v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v51 = v30;
          __int16 v52 = 2112;
          id v53 = v4;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Can only modify own Media Profile Content control: %@", buf, 0x16u);
        }
        id v11 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
        [v4 respondWithError:v11];
        goto LABEL_30;
      }
      int v10 = [v4 arrayForKey:*MEMORY[0x263F0DCA0]];
      id v11 = v10;
      if (v10)
      {
        unint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v42 = v11;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v46 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v45 + 1) + 8 * i)];
              [v12 addObject:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v49 count:16];
          }
          while (v15);
        }

        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__HMDUser__handleMediaContentProfileAccessControlUpdate___block_invoke;
        aBlock[3] = &unk_264A2F3E8;
        id v19 = v4;
        id v44 = (void (**)(void, void, void))v19;
        uint64_t v20 = _Block_copy(aBlock);
        uint64_t v21 = [(HMDUser *)self accessorySettingsDataController];

        if (v21)
        {
          id v22 = [(HMDUser *)self accessorySettingsDataController];
          [v22 handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:v12 completion:v20];
        }
        else
        {
          id v38 = (void *)MEMORY[0x230FBD990]();
          BOOL v39 = self;
          uint64_t v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            id v41 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v51 = v41;
            _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);
          }
          id v22 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"User data controller not found" reason:@"No settings for this user" suggestion:0];
          [v19 respondWithError:v22];
        }

        uint64_t v37 = v44;
        id v11 = v42;
      }
      else
      {
        __int16 v31 = (void *)MEMORY[0x230FBD990]();
        __int16 v32 = self;
        __int16 v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          id v34 = HMFGetLogIdentifier();
          int v35 = [v4 messagePayload];
          *(_DWORD *)buf = 138543618;
          id v51 = v34;
          __int16 v52 = 2112;
          id v53 = v35;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Missing access control accessories in message payload: %@", buf, 0x16u);
        }
        unint64_t v12 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Missing access control accessories" reason:@"Need access control accessories in message" suggestion:0];
        id v36 = [v4 responseHandler];

        if (!v36) {
          goto LABEL_29;
        }
        uint64_t v37 = [v4 responseHandler];
        ((void (**)(void, void *, void))v37)[2](v37, v12, 0);
      }

LABEL_29:
LABEL_30:

      goto LABEL_31;
    }
  }
  __int16 v23 = (void *)MEMORY[0x230FBD990]();
  BOOL v24 = self;
  uint64_t v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    os_log_type_t v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v51 = v26;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Not processing media content profile update message as not part of homeManager homes.", buf, 0xCu);
  }
LABEL_31:
}

void __57__HMDUser__handleMediaContentProfileAccessControlUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v4)[2](v4, v5, 0);
  }
}

- (void)handleMediaContentProfileAccessControlUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMDUser_handleMediaContentProfileAccessControlUpdate___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __56__HMDUser_handleMediaContentProfileAccessControlUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMediaContentProfileAccessControlUpdate:*(void *)(a1 + 40)];
}

- (void)_handleAssistantAccessControlUpdate:(id)a3
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDUser *)self home];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 homeManager];
    id v8 = [v7 homes];
    char v9 = [v8 containsObject:v6];

    if (v9)
    {
      int v10 = [(HMDUser *)self assistantAccessControl];
      id v11 = [v10 accessories];
      unint64_t v12 = (void *)[v11 copy];
      id v95 = 0;
      id v13 = +[HMDAssistantAccessControl accessControlWithMessage:v4 user:self currentAccessories:v12 error:&v95];
      id v14 = v95;

      if (!v13)
      {
        __int16 v23 = (void *)MEMORY[0x230FBD990]();
        BOOL v24 = self;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          os_log_type_t v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          int v98 = v26;
          __int16 v99 = 2112;
          id v100 = v4;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Failed to create access control from message: %@", buf, 0x16u);
        }
        [v4 respondWithError:v14];
        id v13 = 0;
        goto LABEL_53;
      }
      if (![(HMDUser *)self isCurrentUser]) {
        _HMFPreconditionFailure();
      }
      if (![(HMDUser *)self isOwner])
      {
        __int16 v83 = v10;
        id v86 = v14;
        uint32_t v27 = (void *)MEMORY[0x263EFF980];
        uint64_t v28 = [v13 accessories];
        uint64_t v29 = objc_msgSend(v27, "arrayWithCapacity:", objc_msgSend(v28, "count"));

        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        char v30 = [v13 accessories];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v89 objects:v96 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v90;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v90 != v33) {
                objc_enumerationMutation(v30);
              }
              int v35 = [*(id *)(*((void *)&v89 + 1) + 8 * i) uuid];
              [v29 addObject:v35];
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v89 objects:v96 count:16];
          }
          while (v32);
        }

        id v36 = (void *)MEMORY[0x230FBD990]();
        uint64_t v37 = self;
        id v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          int v98 = v39;
          __int16 v99 = 2112;
          id v100 = v13;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Updating shared user assistant access control to: %@", buf, 0x16u);
        }
        uint64_t v40 = [v13 areActivityNotificationsEnabledForPersonalRequests];
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke_600;
        aBlock[3] = &unk_264A2F3E8;
        id v41 = v4;
        id v88 = v41;
        id v42 = _Block_copy(aBlock);
        unint64_t v43 = [(HMDUser *)v37 accessorySettingsDataController];

        int v10 = v83;
        if (v43)
        {
          id v44 = [(HMDUser *)v37 accessorySettingsDataController];
          [v44 handleAssistantAccessControlAccessoryUUIDsUpdated:v29 activityNotificationsEnabledForPersonalRequests:v40 completion:v42];
        }
        else
        {
          __int16 v52 = (void *)MEMORY[0x230FBD990]();
          id v53 = v37;
          uint64_t v54 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v55 = __int16 v81 = v52;
            *(_DWORD *)buf = 138543362;
            int v98 = v55;
            _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);

            __int16 v52 = v81;
          }

          id v44 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:9005 description:@"User data controller not found. No settings for this user." underlyingError:0];
          [v41 respondWithError:v44];
        }

        id v14 = v86;
        goto LABEL_53;
      }
      if (!v10)
      {
        long long v45 = (void *)MEMORY[0x230FBD990]();
        long long v46 = self;
        long long v47 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          long long v48 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          int v98 = v48;
          _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Cannot update without an existing access control", buf, 0xCu);
        }
        long long v49 = [v4 responseHandler];

        if (!v49) {
          goto LABEL_53;
        }
        long long v50 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:9004];
        id v51 = [v4 responseHandler];
        v51[2](v51, v50, 0);

        goto LABEL_49;
      }
      objc_msgSend(v13, "setOptions:", objc_msgSend(v10, "options") | objc_msgSend(v13, "options") | 1);
      if (isInternalBuild())
      {
        uint64_t v15 = [v13 accessories];
        if ([v15 count])
        {
          uint64_t v16 = [(HMDUser *)self assistantAccessControl];
          __int16 v17 = [v16 accessories];
          if (![v17 count])
          {
            id v85 = v14;
            id v18 = [(HMDUser *)self assistantAccessControl];
            char v82 = [v18 isEnabled];

            if (v82)
            {
              id v14 = v85;
              goto LABEL_42;
            }
            uint64_t v15 = [v13 user];
            uint64_t v56 = (void *)MEMORY[0x230FBD990]();
            uint64_t v57 = self;
            id v58 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v59 = v84 = v56;
              *(_DWORD *)buf = 138543618;
              int v98 = v59;
              __int16 v99 = 2112;
              id v100 = v15;
              _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Enabling assistant access controls for internal user: %@", buf, 0x16u);

              uint64_t v56 = v84;
            }

            uint64_t v60 = [HMDAssistantAccessControl alloc];
            uint64_t v16 = [v13 accessories];
            uint64_t v61 = [(HMDAssistantAccessControl *)v60 initWithUser:v15 appleAccessories:v16 enabled:1];
            __int16 v17 = v13;
            id v13 = (void *)v61;
            id v14 = v85;
          }
        }
      }
LABEL_42:
      uint64_t v62 = (void *)MEMORY[0x230FBD990]();
      id v63 = self;
      long long v64 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        long long v65 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        int v98 = v65;
        __int16 v99 = 2112;
        id v100 = v13;
        _os_log_impl(&dword_22F52A000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@Updating owner user assistant access control to: %@", buf, 0x16u);
      }
      if (!HMFEqualObjects())
      {
        id v71 = v14;
        id v72 = [v13 accessories];
        id v73 = objc_msgSend(v72, "na_map:", &__block_literal_global_596);

        long long v74 = (void *)MEMORY[0x230FBD990]();
        long long v75 = v63;
        long long v76 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          long long v77 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          int v98 = v77;
          __int16 v99 = 2112;
          id v100 = v13;
          _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@Updating owner user assistant access control to: %@", buf, 0x16u);
        }
        uint64_t v78 = [v13 areActivityNotificationsEnabledForPersonalRequests];
        v93[0] = MEMORY[0x263EF8330];
        v93[1] = 3221225472;
        v93[2] = __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke_597;
        v93[3] = &unk_264A2F3E8;
        id v94 = v4;
        uint64_t v79 = _Block_copy(v93);
        uint64_t v80 = [(HMDUser *)v75 accessorySettingsDataController];
        [v80 handleAssistantAccessControlAccessoryUUIDsUpdated:v73 activityNotificationsEnabledForPersonalRequests:v78 completion:v79];

        id v14 = v71;
        goto LABEL_53;
      }
      long long v66 = (void *)MEMORY[0x230FBD990]();
      long long v67 = v63;
      uint64_t v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        uint64_t v69 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        int v98 = v69;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Updated access control resulted in no change", buf, 0xCu);
      }
      id v70 = [v4 responseHandler];

      if (!v70)
      {
LABEL_53:

        goto LABEL_54;
      }
      long long v50 = [v4 responseHandler];
      v50[2](v50, 0, 0);
LABEL_49:

      goto LABEL_53;
    }
  }
  id v19 = (void *)MEMORY[0x230FBD990]();
  uint64_t v20 = self;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v98 = v22;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Not processing assistant access control update message as not part of homeManager homes.", buf, 0xCu);
  }
LABEL_54:
}

void __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke_597(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v4)[2](v4, v5, 0);
  }
}

void __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke_600(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v4)[2](v4, v5, 0);
  }
}

uint64_t __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)handleAssistantAccessControlUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__HMDUser_handleAssistantAccessControlUpdate___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __46__HMDUser_handleAssistantAccessControlUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAssistantAccessControlUpdate:*(void *)(a1 + 40)];
}

- (BOOL)isCurrentUserAndOwner
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(HMDUser *)self isCurrentUser])
  {
    if ([(HMDUser *)self isOwner]) {
      return 1;
    }
    id v4 = (void *)MEMORY[0x230FBD990]();
    char v9 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v7;
      id v8 = "%{public}@Only owners may modify assistant access controls";
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v7;
      id v8 = "%{public}@Can only update current user's assistant access controls";
LABEL_8:
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v10, 0xCu);
    }
  }

  return 0;
}

- (void)setAssistantAccessControl:(id)a3
{
  id v4 = (HMDAssistantAccessControl *)a3;
  os_unfair_lock_lock_with_options();
  assistantAccessControl = self->_assistantAccessControl;
  self->_assistantAccessControl = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDAssistantAccessControl)assistantAccessControl
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_assistantAccessControl;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSUUID)assistantAccessControlModelUUID
{
  id v2 = [(HMDUser *)self assistantAccessControl];
  id v3 = [v2 modelID];

  return (NSUUID *)v3;
}

- (BOOL)isValid
{
  id v2 = [(HMDUser *)self pairingIdentity];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isRemoteGateway
{
  return objc_opt_isKindOfClass() & 1;
}

- (unint64_t)audioAnalysisUserDropInAccessLevel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t audioAnalysisUserDropInAccessLevel = self->_audioAnalysisUserDropInAccessLevel;
  os_unfair_lock_unlock(p_lock);
  return audioAnalysisUserDropInAccessLevel;
}

- (void)setAudioAnalysisUserDropInAccessLevel:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t audioAnalysisUserDropInAccessLevel = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)announceAccessLevel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t announceAccessLevel = self->_announceAccessLevel;
  os_unfair_lock_unlock(p_lock);
  return announceAccessLevel;
}

- (void)setAnnounceAccessLevel:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t announceAccessLevel = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)defaultAnnounceUserAccessLevel
{
  if ([(HMDUser *)self isOwner]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)isAnnounceAccessAllowed
{
  unint64_t v3 = [(HMDUser *)self announceAccessLevel];
  if (!v3) {
    unint64_t v3 = [(HMDUser *)self defaultAnnounceUserAccessLevel];
  }
  return v3 == 2;
}

- (void)setCamerasAccessLevel:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_camerasAccessLevel == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_camerasAccessLevel = a3;
    os_unfair_lock_unlock(p_lock);
    logAndPostNotification(@"HMDUserCamerasAccessLevelDidChangeNotification", self, 0);
  }
}

- (unint64_t)camerasAccessLevel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t camerasAccessLevel = self->_camerasAccessLevel;
  os_unfair_lock_unlock(p_lock);
  return camerasAccessLevel;
}

- (BOOL)_setRemoteAccessAllowed:(BOOL)a3
{
  int v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int remoteAccessAllowed = self->_remoteAccessAllowed;
  if (remoteAccessAllowed != v3) {
    self->_int remoteAccessAllowed = v3;
  }
  BOOL v7 = remoteAccessAllowed != v3;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)setRemoteAccessAllowed:(BOOL)a3
{
  if ([(HMDUser *)self _setRemoteAccessAllowed:a3])
  {
    logAndPostNotification(@"HMDUserRemoteAccessDidChangeNotification", self, 0);
  }
}

- (BOOL)isRemoteAccessAllowed
{
  if ([(HMDUser *)self isOwner]) {
    return 1;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL remoteAccessAllowed = self->_remoteAccessAllowed;
  os_unfair_lock_unlock(p_lock);
  return remoteAccessAllowed;
}

- (BOOL)refreshDisplayName
{
  int v3 = [(HMDUser *)self displayName];
  id v4 = __displayNameForUser(self);
  char v5 = HMFEqualObjects();
  if ((v5 & 1) == 0) {
    [(HMDUser *)self setDisplayName:v4];
  }

  return v5 ^ 1;
}

- (void)setDisplayName:(id)a3
{
  id v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_displayName = &self->_displayName;
  if ((HMFEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_displayName, a3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSString)displayName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_displayName;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    char v5 = v4;
  }
  else
  {
    char v5 = [(HMDUser *)self userID];
  }
  id v6 = v5;

  return v6;
}

- (HMUserPresenceAuthorization)presenceAuthStatus
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_presenceAuthStatus;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPresenceAuthStatus:(id)a3
{
  id v4 = (HMUserPresenceAuthorization *)a3;
  os_unfair_lock_lock_with_options();
  presenceAuthStatus = self->_presenceAuthStatus;
  self->_presenceAuthStatus = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)__handleRemovedAccount:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDUser *)self accountHandle];
  if (v5)
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    int v10 = [v9 handles];
    int v11 = [v10 containsObject:v5];

    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v16 = 138543618;
        __int16 v17 = v15;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification account was removed: %@", (uint8_t *)&v16, 0x16u);
      }
      __registerForAccountNotifications(v13);
      __handleUpdatedAccount(v13);
    }
  }
}

- (void)__handleAddedAccount:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDUser *)self accountHandle];
  if (v5)
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    int v10 = [v9 handles];
    int v11 = [v10 containsObject:v5];

    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v20 = 138543618;
        uint64_t v21 = v15;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification account was added: %@", (uint8_t *)&v20, 0x16u);
      }
      __registerForAccountNotifications(v13);
      __updateWithAccount(v13, v9);
      __handleUpdatedAccount(v13);
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Account handle does not exist", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (BOOL)requiresMakoSupport
{
  id v2 = [(HMDUser *)self accountHandle];
  BOOL v3 = [v2 type] == 2;

  return v3;
}

- (id)account
{
  BOOL v3 = +[HMDAccountRegistry sharedRegistry];
  id v4 = [(HMDUser *)self accountHandle];
  if (v4 && [v3 accountExistsForHandle:v4])
  {
    char v5 = [v3 accountForHandle:v4];
  }
  else
  {
    id v6 = [(HMDUser *)self mergeIdentifier];
    if (!v6
      && ([(HMDUser *)self accountIdentifier],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v7 senderCorrelationIdentifier],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v6)
      || ([v3 existingAccountWithMergeIdentifier:v6],
          (char v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (v4)
      {
        char v5 = [v3 accountForHandle:v4];
      }
      else
      {
        char v5 = 0;
      }
    }
  }
  return v5;
}

- (void)_handleNeedsiTunesMultiUserRepair:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDUser *)self isCurrentUser])
  {
    char v5 = [v4 numberForKey:*MEMORY[0x263F0DCB0]];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = [v5 BOOLValue];
      if (v7 != [(HMDUser *)self needsiTunesMultiUserRepair])
      {
        id v8 = [(HMDUser *)self home];
        id v9 = (void *)MEMORY[0x230FBD990]();
        int v10 = self;
        int v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = HMFGetLogIdentifier();
          id v13 = [NSNumber numberWithBool:v7];
          int v25 = 138543618;
          os_log_type_t v26 = v12;
          __int16 v27 = 2112;
          id v28 = v13;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Setting needs iTunes multi-user repair %@.", (uint8_t *)&v25, 0x16u);
        }
        [(HMDUser *)v10 setNeedsiTunesMultiUserRepair:v7];
        [v8 saveToCurrentAccountWithReason:@"Needs iTunes Multi-User Repair Updated"];
        id v14 = [v8 homeManager];
        uint64_t v15 = [(HMDUser *)v10 uuid];
        [v14 updateGenerationCounterWithReason:@"Needs iTunes Multi-User Repair Updated" sourceUUID:v15 shouldNotifyClients:1];
      }
      [v4 respondWithSuccess];
    }
    else
    {
      int v20 = (void *)MEMORY[0x230FBD990]();
      uint64_t v21 = self;
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        int v25 = 138543618;
        os_log_type_t v26 = v23;
        __int16 v27 = 2112;
        id v28 = v4;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing value to set iTunes Multi User Repair: %@", (uint8_t *)&v25, 0x16u);
      }
      uint64_t v24 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Need a value" reason:@"Need a value" suggestion:0];
      [v4 respondWithError:v24];

      id v6 = 0;
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      int v25 = 138543618;
      os_log_type_t v26 = v19;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message to current user: %@", (uint8_t *)&v25, 0x16u);
    }
    id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"User is not current user" reason:@"Can only set on current user" suggestion:0];
    [v4 respondWithError:v6];
  }
}

- (void)_handleShareClientRepairRequest:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [v4 uuidForKey:*MEMORY[0x263F0DD80]];
  id v6 = [(HMDUser *)self uuid];
  char v7 = HMFEqualObjects();

  if (v7)
  {
    id v8 = [(HMDUser *)self home];
    id v9 = [v8 currentUser];
    char v10 = [v9 isOwner];

    if (v10)
    {
      int v11 = [v8 uuid];
      uint64_t v12 = *MEMORY[0x263F0DD50];
      id v13 = [v4 uuidForKey:*MEMORY[0x263F0DD50]];
      char v14 = [v11 isEqual:v13];

      if (v14)
      {
        uint64_t v15 = *MEMORY[0x263F0DD70];
        int v16 = [v4 dataForKey:*MEMORY[0x263F0DD70]];

        if (v16)
        {
          __int16 v17 = (void *)MEMORY[0x263F08928];
          uint64_t v18 = objc_opt_class();
          id v19 = [v4 dataForKey:v15];
          id v59 = 0;
          id v55 = [v17 unarchivedObjectOfClass:v18 fromData:v19 error:&v59];
          id v20 = v59;

          if (v55)
          {
            v64[0] = v15;
            uint64_t v21 = encodeRootObject();
            v65[0] = v21;
            v64[1] = *MEMORY[0x263F0DD40];
            __int16 v22 = objc_msgSend(v4, "stringForKey:");
            v65[1] = v22;
            v64[2] = v12;
            id v23 = [v4 stringForKey:v12];
            v65[2] = v23;
            id v53 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:3];

            uint64_t v54 = [[HMDHomeKitVersion alloc] initWithVersionString:@"7.0"];
            uint64_t v62 = @"kRequiredCapabilitiesKey";
            v60[0] = @"kHomedSupportedFeaturesKey";
            v60[1] = @"kHomedVersionKey";
            v61[0] = &unk_26E474488;
            uint64_t v24 = NSNumber;
            int v25 = [(HMDHomeKitVersion *)v54 versionString];
            [v25 doubleValue];
            os_log_type_t v26 = objc_msgSend(v24, "numberWithDouble:");
            v61[1] = v26;
            __int16 v27 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
            id v63 = v27;
            id v28 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];

            uint64_t v29 = (void *)MEMORY[0x230FBD990]();
            char v30 = self;
            uint64_t v31 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              uint64_t v32 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              long long v67 = v32;
              __int16 v68 = 2112;
              id v69 = v28;
              _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Sending user share repair message with device capabilites %@.", buf, 0x16u);
            }
            objc_initWeak((id *)buf, v30);
            v56[0] = MEMORY[0x263EF8330];
            v56[1] = 3221225472;
            v56[2] = __43__HMDUser__handleShareClientRepairRequest___block_invoke;
            v56[3] = &unk_264A2D420;
            objc_copyWeak(&v58, (id *)buf);
            id v57 = v4;
            [(HMDUser *)v30 _sendAccountMessage:@"HMDUCM.rRepr" payload:v53 deviceCapabilities:v28 multicast:1 preferPrimary:0 completion:v56];

            objc_destroyWeak(&v58);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            if (!v20)
            {
              id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Unable to decode repair info" reason:@"Corrupted repair payload" suggestion:0];
            }
            long long v49 = (void *)MEMORY[0x230FBD990]();
            long long v50 = self;
            id v51 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              __int16 v52 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              long long v67 = v52;
              __int16 v68 = 2112;
              id v69 = v20;
              _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unable to decoderepairInfo. %@", buf, 0x16u);
            }
            [v4 respondWithError:v20];
          }
        }
        else
        {
          long long v45 = (void *)MEMORY[0x230FBD990]();
          long long v46 = self;
          long long v47 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            long long v48 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            long long v67 = v48;
            _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Payload does not have repair info.", buf, 0xCu);
          }
          id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Unable to determine required arguments" reason:@"Missing repair payload" suggestion:0];
          [v4 respondWithError:v20];
        }
      }
      else
      {
        id v41 = (void *)MEMORY[0x230FBD990]();
        id v42 = self;
        unint64_t v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v67 = v44;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Share request does not have valid home.", buf, 0xCu);
        }
        id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Home not valid" reason:@"Missing home or invalid home" suggestion:0];
        [v4 respondWithError:v20];
      }
    }
    else
    {
      uint64_t v37 = (void *)MEMORY[0x230FBD990]();
      id v38 = self;
      BOOL v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v67 = v40;
        __int16 v68 = 2112;
        id v69 = v4;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message from owner: %@", buf, 0x16u);
      }
      id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"From user is not owner" reason:@"Can currently only repair from home owner" suggestion:0];
      [v4 respondWithError:v20];
    }
  }
  else
  {
    uint64_t v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = self;
    int v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v67 = v36;
      __int16 v68 = 2112;
      id v69 = v4;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Attempt to send repair request to mismatched user from message: %@", buf, 0x16u);
    }
    id v8 = [MEMORY[0x263F087E8] hmErrorWithCode:3 description:@"Unable to find to user in payload" reason:@"Need validated to user in payload" suggestion:0];
    [v4 respondWithError:v8];
  }
}

void __43__HMDUser__handleShareClientRepairRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = WeakRetained;
    char v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send remote share client repair message: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 32) respondWithError:v5];
  }
  else
  {
    [*(id *)(a1 + 32) respondWithSuccess];
  }
}

- (void)_sendAccountMessage:(id)a3 payload:(id)a4 deviceCapabilities:(id)a5 multicast:(BOOL)a6 preferPrimary:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v31 = a4;
  id v30 = a5;
  id v15 = (void (**)(id, void *, void))a8;
  uint64_t v16 = [(HMDUser *)self home];
  __int16 v17 = [(HMDUser *)self accountHandle];
  uint64_t v18 = [v16 primaryResident];
  id v19 = [v18 device];
  id v20 = [v16 messageTargetUUID];
  if (v9 && v19)
  {
    uint64_t v21 = [[HMDRemoteDeviceMessageDestination alloc] initWithTarget:v20 device:v19];
    __int16 v22 = +[HMDRemoteMessage secureMessageWithName:v14 qualityOfService:17 destination:v21 messagePayload:v31];
LABEL_6:
    id v23 = v22;

    [v23 setResponseHandler:v15];
    uint64_t v24 = [(HMDUser *)self messageDispatcher];
    [v24 sendMessage:v23];

    goto LABEL_7;
  }
  if (v17)
  {
    uint64_t v21 = [[HMDRemoteAccountMessageDestination alloc] initWithTarget:v20 handle:v17 multicast:v10 deviceCapabilities:v30];
    __int16 v22 = [[HMDRemoteMessage alloc] initWithName:v14 qualityOfService:17 destination:v21 payload:v31 type:0 timeout:1 secure:180.0];
    goto LABEL_6;
  }
  int v25 = (void *)MEMORY[0x230FBD990]();
  os_log_type_t v26 = self;
  __int16 v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v28 = v29 = v25;
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v28;
    __int16 v34 = 2112;
    id v35 = v14;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot send account message named %@ because account handle is nil and either preferring primary is NO or no primary resident exists", buf, 0x16u);

    int v25 = v29;
  }

  id v23 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
  v15[2](v15, v23, 0);
LABEL_7:
}

- (void)_sendSecureShareClientPayloadToMostEligibleDevice:(id)a3 completion:(id)a4
{
  v36[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[HMDHomeKitVersion alloc] initWithVersionString:@"6.2"];
  uint64_t v9 = *MEMORY[0x263F0DD40];
  BOOL v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F0DD40]];
  char v11 = [v10 isEqualToString:@"com.apple.applemediaservices.multiuser"];

  if (v11)
  {
    int v12 = HMDHomeKitVersion6_1String;
  }
  else
  {
    id v13 = [v6 objectForKeyedSubscript:v9];
    int v14 = [v13 isEqualToString:@"com.apple.mediaservicesbroker.container"];

    if (!v14) {
      goto LABEL_6;
    }
    int v12 = &HMDHomeKitVersion7_0String;
  }
  id v15 = [[HMDHomeKitVersion alloc] initWithVersionString:*v12];

  id v8 = v15;
LABEL_6:
  id v35 = @"kRequiredCapabilitiesKey";
  v33[0] = @"kHomedSupportedFeaturesKey";
  v33[1] = @"kHomedVersionKey";
  v34[0] = &unk_26E474470;
  uint64_t v16 = NSNumber;
  __int16 v17 = [(HMDHomeKitVersion *)v8 versionString];
  [v17 doubleValue];
  uint64_t v18 = objc_msgSend(v16, "numberWithDouble:");
  v34[1] = v18;
  id v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  v36[0] = v19;
  id v20 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];

  uint64_t v21 = (void *)MEMORY[0x230FBD990]();
  __int16 v22 = self;
  id v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v30 = v24;
    __int16 v31 = 2112;
    uint64_t v32 = v20;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending user share message with device capabilites %@.", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v22);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __72__HMDUser__sendSecureShareClientPayloadToMostEligibleDevice_completion___block_invoke;
  v26[3] = &unk_264A2EAE0;
  objc_copyWeak(&v28, (id *)buf);
  id v25 = v7;
  id v27 = v25;
  [(HMDUser *)v22 _sendAccountMessage:@"HMDUCM.rsr" payload:v6 deviceCapabilities:v20 multicast:0 preferPrimary:1 completion:v26];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

void __72__HMDUser__sendSecureShareClientPayloadToMostEligibleDevice_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x263F0DD30]);
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = WeakRetained;
  char v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    int v13 = 138543874;
    int v14 = v12;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Received user share message response. nonce:%@ Error: %@", (uint8_t *)&v13, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleMultiUserSharePayloadRequest:(id)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuidForKey:*MEMORY[0x263F0DD80]];
  id v6 = [(HMDUser *)self uuid];
  char v7 = HMFEqualObjects();

  if (v7)
  {
    if ([(HMDUser *)self isOwner])
    {
      uint64_t v8 = [v4 uuidForKey:*MEMORY[0x263F0DD48]];
      if (!v8)
      {
        id v42 = (void *)MEMORY[0x230FBD990]();
        unint64_t v43 = self;
        id v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          long long v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          char v82 = v45;
          __int16 v83 = 2112;
          id v84 = v4;
          _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Could not determine from user in message: %@", buf, 0x16u);
        }
        id v10 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Unable to find from user in message payload" reason:@"Need valid from user in message payload" suggestion:0];
        [v4 respondWithError:v10];
        uint64_t v9 = 0;
        goto LABEL_43;
      }
      uint64_t v9 = (void (**)(void, void, void))v8;
      id v10 = [(HMDUser *)self home];
      char v11 = [v10 users];
      int v12 = objc_msgSend(v11, "hmf_firstObjectWithUUID:", v9);
      if (!v12)
      {
        long long v46 = (void *)MEMORY[0x230FBD990]();
        long long v47 = self;
        long long v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          long long v49 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          char v82 = v49;
          __int16 v83 = 2112;
          id v84 = v9;
          __int16 v85 = 2112;
          id v86 = v10;
          __int16 v87 = 2112;
          id v88 = v11;
          _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Could not determine from user with uuid: %@ home: %@ users: %@", buf, 0x2Au);
        }
        id v25 = (void *)MEMORY[0x263F087E8];
        os_log_type_t v26 = @"Unable to find from user in home";
        id v27 = @"Need valid from user";
        uint64_t v28 = 2;
LABEL_29:
        long long v50 = [v25 hmErrorWithCode:v28 description:v26 reason:v27 suggestion:0];
        [v4 respondWithError:v50];
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      int v13 = [v10 uuid];
      int v14 = [v4 uuidForKey:*MEMORY[0x263F0DD50]];
      char v15 = [v13 isEqual:v14];

      if (v15)
      {
        uint64_t v16 = [v4 dataForKey:*MEMORY[0x263F0DD90]];
        if (v16)
        {
          __int16 v17 = (void *)v16;
          uint64_t v18 = [v4 dataForKey:*MEMORY[0x263F0DD88]];
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            id v20 = [v4 stringForKey:*MEMORY[0x263F0DD40]];

            if (v20)
            {
              if ([v12 isCurrentUser])
              {
                if ([(HMDUser *)self userCloudShareWithOwnerMessagingState] != 2)
                {
                  id v71 = [v4 messagePayload];
                  v78[0] = MEMORY[0x263EF8330];
                  v78[1] = 3221225472;
                  v78[2] = __47__HMDUser__handleMultiUserSharePayloadRequest___block_invoke;
                  v78[3] = &unk_264A296D8;
                  id v79 = v4;
                  uint64_t v80 = self;
                  [(HMDUser *)self _sendSecureShareClientPayloadToMostEligibleDevice:v71 completion:v78];

                  id v72 = (void *)MEMORY[0x230FBD990]();
                  id v73 = self;
                  long long v74 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                  {
                    long long v75 = HMFGetLogIdentifier();
                    [(HMDUser *)v73 accountHandle];
                    v76 = long long v77 = v72;
                    *(_DWORD *)buf = 138543618;
                    char v82 = v75;
                    __int16 v83 = 2112;
                    id v84 = v76;
                    _os_log_impl(&dword_22F52A000, v74, OS_LOG_TYPE_INFO, "%{public}@Received request to send client payload to user : %@", buf, 0x16u);

                    id v72 = v77;
                  }

                  goto LABEL_42;
                }
                uint64_t v21 = (void *)MEMORY[0x230FBD990]();
                __int16 v22 = self;
                id v23 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  uint64_t v24 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  char v82 = v24;
                  _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending cloud share with owner message was blocked.", buf, 0xCu);
                }
                id v25 = (void *)MEMORY[0x263F087E8];
                os_log_type_t v26 = @"Unable to send the message";
                id v27 = @"Sending cloud share with owner message was blocked.";
                uint64_t v28 = 52;
                goto LABEL_29;
              }
              long long v66 = (void *)MEMORY[0x230FBD990]();
              long long v67 = self;
              __int16 v68 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                id v69 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                char v82 = v69;
                __int16 v83 = 2112;
                id v84 = v12;
                __int16 v85 = 2112;
                id v86 = v4;
                _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, "%{public}@From user %@ is not current user for message: %@", buf, 0x20u);
              }
              uint64_t v70 = [v4 responseHandler];

              if (!v70) {
                goto LABEL_42;
              }
              long long v50 = [v4 responseHandler];
              uint64_t v64 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
LABEL_40:
              long long v65 = (void *)v64;
              v50[2](v50, v64, 0);

              goto LABEL_41;
            }
          }
          else
          {
          }
        }
        id v59 = (void *)MEMORY[0x230FBD990]();
        uint64_t v60 = self;
        uint64_t v61 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          uint64_t v62 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          char v82 = v62;
          _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_ERROR, "%{public}@Payload did not have required fields.", buf, 0xCu);
        }
        id v63 = [v4 responseHandler];

        if (!v63) {
          goto LABEL_42;
        }
        long long v50 = [v4 responseHandler];
        uint64_t v56 = (void *)MEMORY[0x263F087E8];
        id v57 = @"Unable to determine required arguments";
        id v58 = @"Missing either URL, token or container ID";
      }
      else
      {
        id v51 = (void *)MEMORY[0x230FBD990]();
        __int16 v52 = self;
        id v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          uint64_t v54 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          char v82 = v54;
          _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@Share request does not have valid home.", buf, 0xCu);
        }
        id v55 = [v4 responseHandler];

        if (!v55) {
          goto LABEL_42;
        }
        long long v50 = [v4 responseHandler];
        uint64_t v56 = (void *)MEMORY[0x263F087E8];
        id v57 = @"Home not valid";
        id v58 = @"Missing home or invalid home";
      }
      uint64_t v64 = [v56 hmErrorWithCode:3 description:v57 reason:v58 suggestion:0];
      goto LABEL_40;
    }
    uint64_t v37 = (void *)MEMORY[0x230FBD990]();
    id v38 = self;
    BOOL v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v82 = v40;
      __int16 v83 = 2112;
      id v84 = v4;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message to owner: %@", buf, 0x16u);
    }
    id v41 = [v4 responseHandler];

    if (v41)
    {
      uint64_t v9 = [v4 responseHandler];
      __int16 v34 = (void *)MEMORY[0x263F087E8];
      id v35 = @"To user is not owner";
      uint64_t v36 = @"Can currently only share to owner";
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v29 = (void *)MEMORY[0x230FBD990]();
    id v30 = self;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v82 = v32;
      __int16 v83 = 2112;
      id v84 = v4;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Attempt to send client payload to mismatched identifier from message: %@", buf, 0x16u);
    }
    uint64_t v33 = [v4 responseHandler];

    if (v33)
    {
      uint64_t v9 = [v4 responseHandler];
      __int16 v34 = (void *)MEMORY[0x263F087E8];
      id v35 = @"Unable to find to user in payload";
      uint64_t v36 = @"Need validated to user in payload";
LABEL_22:
      id v10 = [v34 hmErrorWithCode:3 description:v35 reason:v36 suggestion:0];
      ((void (**)(void, void *, void))v9)[2](v9, v10, 0);
LABEL_43:
    }
  }
}

void __47__HMDUser__handleMultiUserSharePayloadRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = [*(id *)(a1 + 32) responseHandler];

  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        char v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v17 = v11;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send cloud share with owner message. Error: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 40) _handleCloudShareWithOwnerMessageError];
    }
    if (v5)
    {
      uint64_t v14 = *MEMORY[0x263F0DD30];
      id v15 = v5;
      int v12 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    }
    else
    {
      int v12 = 0;
    }
    int v13 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void *))v13)[2](v13, v6, v12);
  }
}

- (void)_handleShareLookupInfoRequest:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kUserUUIDKey"];
  id v6 = [(HMDUser *)self uuid];
  char v7 = HMFEqualObjects();

  if (v7)
  {
    uint64_t v8 = [(HMDUser *)self accountHandle];

    if (v8)
    {
      id v9 = [(HMDUser *)self accountHandle];
      id v10 = [v9 cloudKitLookupInfo];

      if (!v10)
      {
        id v10 = [v4 responseHandler];

        if (v10)
        {
          id v30 = [v4 responseHandler];
          __int16 v31 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Can't create lookup info" reason:@"Unable to convert account handle to lookup info" suggestion:0];
          ((void (**)(void, void *, void))v30)[2](v30, v31, 0);

          id v10 = 0;
        }
        goto LABEL_19;
      }
      char v11 = encodeRootObject();
      uint64_t v32 = *MEMORY[0x263F0DD60];
      uint64_t v33 = v11;
      int v12 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      int v13 = (void *)MEMORY[0x230FBD990]();
      uint64_t v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v35 = v16;
        __int16 v36 = 2112;
        id v37 = v10;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Obtained share lookup: %@", buf, 0x16u);
      }
      __int16 v17 = [v4 responseHandler];

      if (v17)
      {
        __int16 v18 = [v4 responseHandler];
        ((void (**)(void, void, void *))v18)[2](v18, 0, v12);
      }
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    id v25 = (void *)MEMORY[0x230FBD990]();
    os_log_type_t v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v28;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Do not have account handle: %@", buf, 0x16u);
    }
    uint64_t v29 = [v4 responseHandler];

    if (v29)
    {
      id v10 = [v4 responseHandler];
      uint64_t v24 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"No account handle" reason:@"User has no account handle" suggestion:0];
      goto LABEL_17;
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v22;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Attempt to send client payload to mismatched identifier from message: %@", buf, 0x16u);
    }
    id v23 = [v4 responseHandler];

    if (v23)
    {
      id v10 = [v4 responseHandler];
      uint64_t v24 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
LABEL_17:
      char v11 = (void *)v24;
      v10[2](v10, v24, 0);
      goto LABEL_18;
    }
  }
LABEL_20:
}

- (void)_handleLegacyPairingIdentityRequest:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kUserUUIDKey"];
  id v6 = [(HMDUser *)self uuid];
  char v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    id v25 = (void *)MEMORY[0x230FBD990]();
    os_log_type_t v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v28;
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Attempt to retrieve pairing identity with mismatching identifier from message: %@", buf, 0x16u);
    }
    uint64_t v29 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    goto LABEL_15;
  }
  BOOL v8 = [(HMDUser *)self isCurrentUser];
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  char v11 = HMFGetOSLogHandle();
  int v12 = v11;
  if (!v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v30;
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Attempt to retrieve pairing identity for not current user: %@", buf, 0x16u);
    }
    uint64_t v29 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2014];
LABEL_15:
    id v15 = (void *)v29;
    [v4 respondWithError:v29];
    goto LABEL_20;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v36 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received request to retrieve all pairing identities for the current user", buf, 0xCu);
  }
  uint64_t v14 = [(HMDUser *)v10 keyStore];
  id v15 = [v14 allAccessoryPairingKeys];

  uint64_t v16 = [v4 entitlements];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  void v32[2] = __47__HMDUser__handleLegacyPairingIdentityRequest___block_invoke;
  v32[3] = &__block_descriptor_40_e28__16__0__HAPPairingIdentity_8l;
  v32[4] = v16;
  __int16 v17 = objc_msgSend(v15, "na_map:", v32);
  __int16 v18 = encodeRootObject();
  id v19 = (void *)MEMORY[0x230FBD990]();
  uint64_t v20 = v10;
  uint64_t v21 = HMFGetOSLogHandle();
  __int16 v22 = v21;
  if (v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v23;
      __int16 v37 = 2112;
      id v38 = v17;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Sending legacy identities : %@", buf, 0x16u);
    }
    uint64_t v33 = *MEMORY[0x263F0DCC8];
    __int16 v34 = v18;
    uint64_t v24 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v4 respondWithPayload:v24];
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v31;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode the pairing identities.", buf, 0xCu);
    }
    uint64_t v24 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    [v4 respondWithError:v24];
  }

LABEL_20:
}

id __47__HMDUser__handleLegacyPairingIdentityRequest___block_invoke(uint64_t a1, void *a2)
{
  if ((*(unsigned char *)(a1 + 32) & 0x10) != 0)
  {
    id v4 = (objc_class *)MEMORY[0x263F425E8];
    id v5 = a2;
    id v6 = [v4 alloc];
    id v2 = [v5 identifier];
    char v7 = [v5 publicKey];
    BOOL v8 = [v5 privateKey];

    BOOL v3 = (void *)[v6 initWithIdentifier:v2 publicKey:v7 privateKey:v8];
  }
  else
  {
    id v2 = a2;
    BOOL v3 = [v2 publicPairingIdentity];
  }

  return v3;
}

- (void)fetchPairingIdentityForClientWithMessage:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v51 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to retrieve pairing identity for user", buf, 0xCu);
  }
  id v9 = [(HMDUser *)v6 pairingIdentity];
  if (!v9)
  {
    uint64_t v29 = MEMORY[0x230FBD990]();
    id v30 = v6;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v51 = v32;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not find the pairing identity for the user", buf, 0xCu);
    }
    uint64_t v33 = (void *)v29;
    goto LABEL_21;
  }
  if (([v4 entitlements] & 0x10) != 0 && -[HMDUser isCurrentUser](v6, "isCurrentUser"))
  {
    id v10 = [(HMDUser *)v6 keyStore];
    char v11 = [v9 identifier];
    int v12 = [v10 getHH2ControllerKeyWithIdentifier:v11];

    if (v12)
    {
      int v13 = [v12 privateKey];
      uint64_t v14 = [v12 publicKey];
      id v15 = [v9 publicKey];
      char v16 = [v14 isEqual:v15];

      if (v16)
      {
        id v17 = objc_alloc(MEMORY[0x263F425E8]);
        __int16 v18 = [v9 identifier];
        id v19 = [v9 publicKey];
        uint64_t v20 = [v17 initWithIdentifier:v18 publicKey:v19 privateKey:v13];

        int v12 = (void *)v20;
        goto LABEL_10;
      }
      unint64_t v43 = (void *)MEMORY[0x230FBD990]();
      id v44 = v6;
      long long v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        long long v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v51 = v46;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to get matching public key for this user", buf, 0xCu);
      }
      long long v47 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 description:@"Local pairing identity does not match user pairing identity" reason:0 suggestion:0 underlyingError:0];
      [v4 respondWithError:v47];
    }
    else
    {
      uint64_t v39 = (void *)MEMORY[0x230FBD990]();
      uint64_t v40 = v6;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v51 = v42;
        __int16 v52 = 2112;
        id v53 = 0;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to lookup our local pairing identity with error: %@", buf, 0x16u);
      }
      int v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:@"Local pairing identity was not found" reason:0 suggestion:0 underlyingError:0];
      [v4 respondWithError:v13];
    }

    goto LABEL_33;
  }
  int v12 = [v9 publicPairingIdentity];
LABEL_10:
  uint64_t v21 = (void *)MEMORY[0x230FBD990]();
  __int16 v22 = v6;
  id v23 = HMFGetOSLogHandle();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
  if (!v12)
  {
    if (v24)
    {
      __int16 v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v51 = v34;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Unable to retrieve pairing identity for user.", buf, 0xCu);
    }
    uint64_t v33 = v21;
LABEL_21:
    int v12 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v4 respondWithError:v12];
    goto LABEL_33;
  }
  if (v24)
  {
    id v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v51 = v25;
    __int16 v52 = 2112;
    id v53 = v12;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Found pairing identity for user: %@", buf, 0x16u);
  }
  uint64_t v26 = encodeRootObject();
  id v27 = (void *)v26;
  if (v26)
  {
    uint64_t v48 = *MEMORY[0x263F0DCC8];
    uint64_t v49 = v26;
    uint64_t v28 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    [v4 respondWithPayload:v28];
  }
  else
  {
    id v35 = (void *)MEMORY[0x230FBD990]();
    __int16 v36 = v22;
    __int16 v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v51 = v38;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode the pairing identity.", buf, 0xCu);
    }
    uint64_t v28 = [MEMORY[0x263F087E8] hmErrorWithCode:52];
    [v4 respondWithError:v28];
  }

LABEL_33:
}

- (void)_handlePairingIdentityRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kUserUUIDKey"];
  id v6 = [(HMDUser *)self uuid];
  char v7 = HMFEqualObjects();

  if (v7)
  {
    [(HMDUser *)self fetchPairingIdentityForClientWithMessage:v4];
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Attempt to retrieve pairing identity with mismatching identifier from message: %@", (uint8_t *)&v13, 0x16u);
    }
    int v12 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    [v4 respondWithError:v12];
  }
}

- (BOOL)matchingPairingIdentityIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDUser *)self pairingIdentity];
  id v6 = [v5 identifier];
  char v7 = [v6 isEqualToString:v4];

  return v7;
}

- (void)deregisterIdentity
{
  id v4 = [(HMDUser *)self pairingIdentity];
  if (v4)
  {
    BOOL v3 = +[HMDIdentityRegistry sharedRegistry];
    [v3 deregisterIdentity:v4 object:self];
  }
}

- (void)registerIdentity
{
  id v5 = [(HMDUser *)self pairingIdentity];
  BOOL v3 = [(HMDUser *)self account];
  if (v5 && v3)
  {
    id v4 = +[HMDIdentityRegistry sharedRegistry];
    [v4 registerIdentity:v5 account:v3 object:self];
  }
}

- (void)setPairingIdentity:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  _userPairingIdentity(v6, self->_privilege);
  id v4 = (HAPPairingIdentity *)objc_claimAutoreleasedReturnValue();
  pairingIdentity = self->_pairingIdentity;
  self->_pairingIdentity = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HAPPairingIdentity)pairingIdentity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_pairingIdentity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSUUID)spiClientIdentifier
{
  return (NSUUID *)spiClientIdentifierForUUID(self->_uuid);
}

- (void)setMergeIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  mergeIdentifier = self->_mergeIdentifier;
  self->_mergeIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)mergeIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_mergeIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v5 = (HMDAccountIdentifier *)[v4 copy];
    accountIdentifier = self->_accountIdentifier;
    self->_accountIdentifier = v5;

    os_unfair_lock_unlock(&self->_lock);
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __32__HMDUser_setAccountIdentifier___block_invoke;
    v8[3] = &unk_264A2F820;
    id v9 = v4;
    id v10 = self;
    dispatch_async(queue, v8);
  }
}

void __32__HMDUser_setAccountIdentifier___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    __handleUpdatedAccount(*(void **)(a1 + 40));
  }
  id v2 = [*(id *)(a1 + 40) home];
  [v2 saveToCurrentAccountWithReason:@"userUserIDUpdated"];
}

- (HMDAccountIdentifier)accountIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_accountIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAccountHandle:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v5 = (HMDAccountHandle *)[v4 copy];
    accountHandle = self->_accountHandle;
    self->_accountHandle = v5;

    os_unfair_lock_unlock(&self->_lock);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__HMDUser_setAccountHandle___block_invoke;
    block[3] = &unk_264A2F7F8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __28__HMDUser_setAccountHandle___block_invoke(uint64_t a1)
{
}

- (id)accountHandle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_accountHandle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isCurrentUser
{
  id v2 = self;
  BOOL v3 = [(HMDUser *)self dataSource];
  LOBYTE(v2) = [v3 isCurrentUser:v2];

  return (char)v2;
}

- (BOOL)updateAdministrator:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HMDUser *)self privilege] && [(HMDUser *)self privilege] != 4) {
    return 0;
  }
  if (v3) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 0;
  }
  [(HMDUser *)self setPrivilege:v5];
  return 1;
}

- (void)setPrivilege:(unint64_t)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t privilege = self->_privilege;
  if (privilege == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_unint64_t privilege = a3;
    os_unfair_lock_unlock(p_lock);
    v10[0] = @"kUserUUIDKey";
    char v7 = [(HMDUser *)self uuid];
    v10[1] = @"HMDUserPreviousPrivilegeKey";
    v11[0] = v7;
    BOOL v8 = [NSNumber numberWithUnsignedInteger:privilege];
    v11[1] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

    logAndPostNotification(@"HMDUserPrivilegeDidChangeNotification", self, v9);
  }
}

- (BOOL)isRestrictedGuest
{
  return [(HMDUser *)self privilege] == 5;
}

- (BOOL)isPending
{
  return [(HMDUser *)self privilege] == 2;
}

- (BOOL)isOwner
{
  return [(HMDUser *)self privilege] == 3;
}

- (BOOL)isAdministrator
{
  return [(HMDUser *)self privilege] == 3 || [(HMDUser *)self privilege] == 4;
}

- (unint64_t)privilege
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t privilege = self->_privilege;
  os_unfair_lock_unlock(p_lock);
  return privilege;
}

- (unint64_t)_compatiblePrivilege
{
  unint64_t v3 = [(HMDUser *)self privilege];
  if (v3 < 5) {
    return qword_2303E4928[v3];
  }
  return [(HMDUser *)self privilege];
}

- (void)setHome:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMDHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMDHome *)WeakRetained;
}

- (unint64_t)allowedRemoteEventAccessUserTypes
{
  unint64_t v2 = [(HMDUser *)self privilege];
  if (v2 > 5) {
    return 0;
  }
  else {
    return qword_2303E48F8[v2];
  }
}

- (void)deregisterForMessages
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Deregistering user", (uint8_t *)&v8, 0xCu);
  }
  char v7 = [(HMDUser *)v4 messageDispatcher];
  [v7 deregisterReceiver:v4];
}

- (void)registerForMessages
{
  v37[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HMDUser *)self messageDispatcher];
  uint64_t v4 = *MEMORY[0x263F0DCD0];
  id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:13];
  v37[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  [v3 registerForMessage:v4 receiver:self policies:v6 selector:sel__handlePairingIdentityRequest_];

  uint64_t v7 = *MEMORY[0x263F0DC58];
  int v8 = +[HMDXPCMessagePolicy policyWithEntitlements:13];
  __int16 v36 = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  [v3 registerForMessage:v7 receiver:self policies:v9 selector:sel__handleLegacyPairingIdentityRequest_];

  uint64_t v10 = *MEMORY[0x263F0DD68];
  char v11 = +[HMDXPCMessagePolicy policyWithEntitlements:517];
  id v35 = v11;
  int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  [v3 registerForMessage:v10 receiver:self policies:v12 selector:sel__handleShareLookupInfoRequest_];

  uint64_t v13 = *MEMORY[0x263F0DD38];
  uint64_t v14 = +[HMDXPCMessagePolicy policyWithEntitlements:517];
  __int16 v34 = v14;
  __int16 v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  [v3 registerForMessage:v13 receiver:self policies:v15 selector:sel__handleMultiUserSharePayloadRequest_];

  uint64_t v16 = *MEMORY[0x263F0DD78];
  uint64_t v17 = +[HMDXPCMessagePolicy policyWithEntitlements:517];
  uint64_t v33 = v17;
  __int16 v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  [v3 registerForMessage:v16 receiver:self policies:v18 selector:sel__handleShareClientRepairRequest_];

  uint64_t v19 = *MEMORY[0x263F0DCB8];
  uint64_t v20 = +[HMDXPCMessagePolicy policyWithEntitlements:517];
  uint64_t v32 = v20;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  [v3 registerForMessage:v19 receiver:self policies:v21 selector:sel__handleNeedsiTunesMultiUserRepair_];

  if ([(HMDUser *)self isCurrentUser])
  {
    uint64_t v22 = *MEMORY[0x263F0DBD0];
    id v23 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    __int16 v31 = v23;
    BOOL v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    [v3 registerForMessage:v22 receiver:self policies:v24 selector:sel__handleAnnounceSettingsUpdate_];
  }
  id v25 = [(HMDUser *)self home];
  uint64_t v26 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v25 userPrivilege:3 remoteAccessRequired:0];

  uint64_t v27 = *MEMORY[0x263F0DD10];
  uint64_t v28 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v30[0] = v28;
  v30[1] = v26;
  uint64_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  [v3 registerForMessage:v27 receiver:self policies:v29 selector:sel__handleFetchProfilePhoto_];
}

- (void)unconfigure
{
  [(HMDUser *)self deregisterForMessages];
  unint64_t v3 = [(HMDUser *)self shareMessenger];
  [v3 unconfigure];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];
}

- (void)_recoverTrustManagerDueToUUIDChange
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v3 = [(HMDUser *)self cloudShareTrustManager];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]([(HMDUser *)self setCloudShareTrustManager:0]);
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Configure new trust manager", (uint8_t *)&v8, 0xCu);
    }
    [(HMDUser *)v5 configureCloudShareTrustManager];
  }
}

- (void)updateSharedBackingStoreControllerParticipants
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HMDUser_updateSharedBackingStoreControllerParticipants__block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __57__HMDUser_updateSharedBackingStoreControllerParticipants__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sharedBackingStoreController];
  [v1 updateParticipants];
}

- (void)_recoverUserSettingsDueToUUIDChange
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v3 = [(HMDUser *)self home];
  id v4 = [(HMDUser *)self privateBackingStoreController];
  if (v4)
  {
  }
  else
  {
    id v5 = [(HMDUser *)self sharedBackingStoreController];

    if (!v5) {
      goto LABEL_11;
    }
  }
  if ([(HMDUser *)self isCurrentUser])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v20 = 138543362;
      uint64_t v21 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Clearing participants from old user settings backingstores", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v10 = [(HMDUser *)v7 sharedBackingStoreController];
    [v10 clearParticipants];
  }
  [(HMDUser *)self setUserDataController:0];
  [(HMDUser *)self setSharedBackingStoreController:0];
  char v11 = (void *)MEMORY[0x230FBD990]([(HMDUser *)self setPrivateBackingStoreController:0]);
  int v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v20 = 138543362;
    uint64_t v21 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Initializing new user settings backingstores", (uint8_t *)&v20, 0xCu);
  }
  [(HMDUser *)v12 initializeUserSettingsWithHome:v3];
LABEL_11:
  if (![(HMDUser *)self isCurrentUser])
  {
    __int16 v15 = [v3 currentUser];
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v19;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating participants in current users shared settings backingstore: %@", (uint8_t *)&v20, 0x16u);
    }
    [v15 updateSharedBackingStoreControllerParticipants];
  }
}

- (void)recoverUserCloudDataDueToUUIDChangeFromOldUUID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HMDUser_recoverUserCloudDataDueToUUIDChangeFromOldUUID___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __58__HMDUser_recoverUserCloudDataDueToUUIDChangeFromOldUUID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _recoverUserSettingsDueToUUIDChange];
  [*(id *)(a1 + 32) _recoverTrustManagerDueToUUIDChange];
  unint64_t v2 = [*(id *)(a1 + 32) photosPersonDataManager];
  [v2 recoverDueToUUIDChangeFromOldUUID:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) home];
  unint64_t v3 = [v4 walletKeyManager];
  [v3 recoverDueToUUIDChangeOfUser:*(void *)(a1 + 32) fromOldUUID:*(void *)(a1 + 40)];
}

- (void)_handleCloudShareWithOwnerMessageError
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_userCloudShareWithOwnerMessagingState) {
    self->_userCloudShareWithOwnerMessagingState = 2;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setUserCloudShareWithOwnerMessagingState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_userCloudShareWithOwnerMessagingState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)userCloudShareWithOwnerMessagingState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t userCloudShareWithOwnerMessagingState = self->_userCloudShareWithOwnerMessagingState;
  os_unfair_lock_unlock(p_lock);
  return userCloudShareWithOwnerMessagingState;
}

- (int64_t)sharedUserSettingsLogEventBackingStoreControllerRunState
{
  unint64_t v2 = [(HMDUser *)self userDataController];
  int64_t v3 = [v2 sharedUserSettingsLogEventBackingStoreControllerRunState];

  return v3;
}

- (void)initializeUserSettingsWithHome:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Initializing user settings with home: %@", buf, 0x16u);
  }
  if ([v4 isOwnerUser])
  {
    if (![(HMDUser *)v6 isRestrictedGuest])
    {
      id v9 = [v4 backingStore];
      uint64_t v10 = [v9 context];

      char v11 = [HMDUserAccessorySettingsDataController alloc];
      int v12 = [(HMDUser *)v6 userUUID];
      uint64_t v13 = [(HMDUserAccessorySettingsDataController *)v11 initWithUserModelID:v12 managedObjectContext:v10];
      [(HMDUser *)v6 setAccessorySettingsDataController:v13];
LABEL_8:
    }
  }
  else if ([(HMDUser *)v6 isCurrentUser])
  {
    uint64_t v14 = +[HMDCoreData sharedInstance];
    uint64_t v10 = (void *)[v14 newManagedObjectContext];

    __int16 v15 = [v4 uuid];
    uint64_t v16 = HMDWorkingContextNameForHomeUUID(v15);
    [v10 setName:v16];

    uint64_t v17 = @"HMD.1P";
    [v10 setTransactionAuthor:@"HMD.1P"];

    int v12 = +[HMDCoreData sharedInstance];
    __int16 v18 = [HMDSharedUserAccessorySettingsDataController alloc];
    uint64_t v13 = [(HMDUser *)v6 userUUID];
    uint64_t v19 = [v4 uuid];
    int v20 = [v12 cloudPrivateStore];
    uint64_t v21 = [(HMDSharedUserAccessorySettingsDataController *)v18 initWithUserModelID:v13 homeModelID:v19 privateStore:v20 managedObjectContext:v10];
    [(HMDUser *)v6 setAccessorySettingsDataController:v21];

    goto LABEL_8;
  }
  queue = v6->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HMDUser_initializeUserSettingsWithHome___block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = v6;
  dispatch_async(queue, block);
}

uint64_t __42__HMDUser_initializeUserSettingsWithHome___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) configurePhotosPersonDataManager];
  unint64_t v2 = *(void **)(a1 + 32);
  return [v2 configurePersonSettingsManager];
}

- (id)sharedZoneName
{
  int64_t v3 = objc_opt_class();
  id v4 = [(HMDUser *)self uuid];
  id v5 = [v3 sharedZoneNameForUserUUID:v4];

  return v5;
}

- (id)privateZoneName
{
  int64_t v3 = objc_opt_class();
  id v4 = [(HMDUser *)self uuid];
  id v5 = [v3 privateZoneNameForUserUUID:v4];

  return v5;
}

- (void)handleUserDataControllerInitialized:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HMDUser_handleUserDataControllerInitialized___block_invoke;
  block[3] = &unk_264A2F7F8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __47__HMDUser_handleUserDataControllerInitialized___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCurrentUser] && isiPhoneDevice())
  {
    id v4 = [[HMDSiriMultiUserNewLanguageNotificationManagerContext alloc] initWithUser:*(void *)(a1 + 32) workQueue:*(void *)(*(void *)(a1 + 32) + 352)];
    [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)v4 configure];
    unint64_t v2 = [[HMDSiriMultiUserNewLanguageNotificationManager alloc] initWithContext:v4];
    [*(id *)(a1 + 32) setSiriMultiUserNewLanguageNotificationManager:v2];

    int64_t v3 = [*(id *)(a1 + 32) siriMultiUserNewLanguageNotificationManager];
    [v3 checkAllMediaAccessoriesAndPostNotificationIfNecessary];
  }
}

- (void)configureWithHome:(id)a3
{
  v38[3] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 msgDispatcher];
  [(HMDUser *)self setMessageDispatcher:v5];

  [(HMDUser *)self setHome:v4];
  if (![(HMDUser *)self isRemoteGateway])
  {
    isWatch();
    [(HMDUser *)self configureCloudShareTrustManager];
    [(HMDUser *)self initializeUserSettingsWithHome:v4];
  }
  id v6 = [(HMDUser *)self assistantAccessControl];
  [(HMDUser *)self _readAnnounceNotificationModeFromLocalStore];
  if (v6
    || ([v4 owner],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqual:self],
        v8,
        v9)
    && (id v6 = [[HMDAssistantAccessControl alloc] initWithUser:self], [(HMDUser *)self setAssistantAccessControl:v6], v6))
  {
    uint64_t v7 = [(HMDUser *)self accessorySettingsDataController];
    [(HMDAssistantAccessControl *)v6 configureWithSettingsController:v7];
  }
  uint64_t v10 = (void *)MEMORY[0x230FBD990]([(HMDUser *)self registerForMessages]);
  char v11 = self;
  int v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    uint64_t v14 = [(HMDUser *)v11 userID];
    __int16 v15 = [(HMDUser *)v11 account];
    [(HMDUser *)v11 isCurrentUser];
    uint64_t v16 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    __int16 v37 = v15;
    LOWORD(v38[0]) = 2112;
    *(id *)((char *)v38 + 2) = v16;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Configuring [%@] with account: %@, isCurrentUser: %@", buf, 0x2Au);
  }
  if (![(HMDUser *)v11 isCurrentUser])
  {
    uint64_t v17 = (void *)MEMORY[0x230FBD990]();
    __int16 v18 = v11;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = HMFGetLogIdentifier();
      uint64_t v21 = [(HMDUser *)v18 userID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Registering for account notifications & Auditing the account as [%@] is not current user.", buf, 0x16u);
    }
    __registerForAccountNotifications(v18);
    __int16 v22 = v18;
    id v23 = v22;
    if (v22)
    {
      queue = v22->_queue;
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ____auditAccount_block_invoke;
      __int16 v37 = &unk_264A2F7F8;
      v38[0] = v22;
      dispatch_async(queue, buf);
    }
  }
  [(HMDUser *)v11 registerIdentity];
  id v25 = [MEMORY[0x263F08A00] defaultCenter];
  [v25 addObserver:v11 selector:sel_handleRemovedAccessory_ name:@"HMDHomeAccessoryRemovedNotification" object:v4];

  __int16 v26 = [MEMORY[0x263F08A00] defaultCenter];
  id v27 = [(HMDUser *)v11 userDataController];
  [v26 addObserver:v11 selector:sel_handleUserDataControllerInitialized_ name:@"HMDUserDataControllerInitializedNotificationKey" object:v27];

  if ([(HMDUser *)v11 isRestrictedGuest])
  {
    [(HMDUser *)v11 cancelRestrictedGuestScheduledTimers];
    uint64_t v28 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v29 = [v4 residentDeviceManager];
    [v28 addObserver:v11 selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v29];
  }
  id v30 = +[HMDFMFHandler sharedHandler];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  void v34[2] = __29__HMDUser_configureWithHome___block_invoke;
  v34[3] = &unk_264A29690;
  v34[4] = v11;
  id v31 = v4;
  id v35 = v31;
  [v30 queryFMFStatusWithCompletion:v34];

  if ([(HMDUser *)v11 isOwner])
  {
    uint64_t v32 = [(HMDUser *)v11 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__HMDUser_configureWithHome___block_invoke_2;
    block[3] = &unk_264A2F7F8;
    void block[4] = v11;
    dispatch_async(v32, block);
  }
}

uint64_t __29__HMDUser_configureWithHome___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSharedUsersMeDeviceForProfileMetadata];
  if (result)
  {
    int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = +[HMDAppleAccountManager sharedManager];
    [v3 addObserver:v4 selector:sel___handleModifiedAccount_ name:@"HMDAppleAccountManagerAccountModifiedNotification" object:v5];

    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:*(void *)(a1 + 32) selector:sel__handleFMFDeviceChangedNotification_ name:@"HMDFMFStatusUpdateNotification" object:0];

    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    return [v7 pushMetadataToStoreForHome:v8];
  }
  return result;
}

uint64_t __29__HMDUser_configureWithHome___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshDisplayName];
}

- (BOOL)isSharedUsersMeDeviceForProfileMetadata
{
  if (!_os_feature_enabled_impl()
    || [(HMDUser *)self isOwner]
    || [(HMDUser *)self isRestrictedGuest]
    || ![(HMDUser *)self isCurrentUser])
  {
    return 0;
  }
  return isThisDeviceDesignatedFMFDevice();
}

- (BOOL)hasDeviceWithHomeKitVersionGreaterThanVersion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[HMDHomeKitVersion alloc] initWithVersionString:v4];
  id v6 = [(HMDUser *)self account];
  [v6 devices];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        char v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "version", (void)v14);
        char v12 = [v11 isGreaterThanVersion:v5];

        if (v12)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)dumpState
{
  v61[16] = *MEMORY[0x263EF8340];
  int64_t v3 = [(HMDUser *)self home];
  id v4 = NSString;
  id v57 = [(HMDUser *)self uuid];
  uint64_t v56 = [v4 stringWithFormat:@"UUID: %@", v57];
  v61[0] = v56;
  id v5 = NSString;
  [v3 isAccessToHomeAllowed];
  id v55 = HMFBooleanToString();
  uint64_t v54 = [v5 stringWithFormat:@"Is Access Allowed: %@", v55];
  v61[1] = v54;
  id v6 = NSString;
  [(HMDUser *)self isCurrentUser];
  id v53 = HMFBooleanToString();
  __int16 v52 = [v6 stringWithFormat:@"Is Current User: %@", v53];
  void v61[2] = v52;
  id v7 = NSString;
  [(HMDUser *)self isAdministrator];
  id v51 = HMFBooleanToString();
  long long v50 = [v7 stringWithFormat:@"Is Admin: %@", v51];
  v61[3] = v50;
  uint64_t v8 = NSString;
  [(HMDUser *)self isRemoteAccessAllowed];
  uint64_t v49 = HMFBooleanToString();
  uint64_t v48 = [v8 stringWithFormat:@"Is Remote Access Allowed: %@", v49];
  v61[4] = v48;
  long long v47 = objc_msgSend(NSString, "stringWithFormat:", @"User Privilege: %lu", -[HMDUser privilege](self, "privilege"));
  v61[5] = v47;
  uint64_t v9 = NSString;
  long long v46 = [(HMDUser *)self restrictedGuestAccessSettings];
  long long v45 = [v46 uuidsOfAllowedAccessories];
  id v44 = [v9 stringWithFormat:@"allowedAccessories: %@", v45];
  v61[6] = v44;
  uint64_t v10 = NSString;
  unint64_t v43 = [(HMDUser *)self restrictedGuestAccessSettings];
  id v42 = [v43 schedule];
  id v41 = [v10 stringWithFormat:@"schedule : %@", v42];
  v61[7] = v41;
  char v11 = NSString;
  int v40 = shouldLogPrivateInformation();
  if (v40)
  {
    char v12 = [(HMDUser *)self displayName];
  }
  else
  {
    char v12 = @"...";
  }
  uint64_t v33 = v12;
  uint64_t v39 = [v11 stringWithFormat:@"Display Name: %@", v12];
  v61[8] = v39;
  uint64_t v13 = NSString;
  [(HMDUser *)self camerasAccessLevel];
  id v38 = HMUserCameraAccessLevelAsString();
  __int16 v36 = [v13 stringWithFormat:@"Cameras Access Level: %@", v38];
  v61[9] = v36;
  long long v14 = NSString;
  [(HMDUser *)self isAnnounceAccessAllowed];
  id v35 = HMFBooleanToString();
  __int16 v34 = [v14 stringWithFormat:@"Is Announce Access Allowed: %@", v35];
  v61[10] = v34;
  long long v15 = NSString;
  long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  long long v17 = [v15 stringWithFormat:@"Announce Access Level: %@", v16];
  v61[11] = v17;
  id v58 = v3;
  __int16 v18 = [NSString stringWithFormat:@"Home: %@", v3];
  v61[12] = v18;
  uint64_t v19 = NSString;
  int v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  uint64_t v21 = [v19 stringWithFormat:@"AudioDropIn: %@", v20];
  v61[13] = v21;
  __int16 v22 = NSString;
  [(HMDUser *)self isPending];
  id v23 = HMFBooleanToString();
  uint64_t v24 = [v22 stringWithFormat:@"Is Pending User: %@", v23];
  v61[14] = v24;
  id v25 = NSString;
  __int16 v26 = [(HMDUser *)self matterCASEAuthenticatedTagID];
  id v27 = [v25 stringWithFormat:@"CATID: %@", v26];
  v61[15] = v27;
  __int16 v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:16];

  if (v40) {
  v59[0] = *MEMORY[0x263F41FA8];
  }
  uint64_t v28 = [v37 componentsJoinedByString:@", "];
  v59[1] = @"Photos Person Manager Settings";
  v60[0] = v28;
  uint64_t v29 = [(HMDUser *)self photosPersonManagerSettings];
  id v30 = [v29 description];
  v60[1] = v30;
  id v31 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];

  return v31;
}

- (id)attributeDescriptions
{
  v57[16] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v56 = [(HMDUser *)self uuid];
  id v55 = [v56 UUIDString];
  uint64_t v54 = objc_msgSend(v3, "initWithName:value:", @"UUID");
  v57[0] = v54;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  id v53 = [(HMDUser *)self mergeIdentifier];
  __int16 v52 = objc_msgSend(v4, "initWithName:value:", @"MID");
  v57[1] = v52;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  id v51 = [(HMDUser *)self pairingIdentity];
  long long v50 = objc_msgSend(v5, "initWithName:value:options:formatter:", @"PAID");
  v57[2] = v50;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v49 = [(HMDUser *)self accountHandle];
  uint64_t v48 = objc_msgSend(v6, "initWithName:value:", @"HNDL");
  v57[3] = v48;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v8 = [(HMDUser *)self displayName];
  long long v46 = [MEMORY[0x263F42610] defaultFormatter];
  long long v47 = (void *)v8;
  long long v45 = objc_msgSend(v7, "initWithName:value:options:formatter:", @"DN", v8, 0);
  v57[4] = v45;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  unint64_t v10 = [(HMDUser *)self privilege];
  if (v10 > 5) {
    char v11 = @"None";
  }
  else {
    char v11 = off_264A29920[v10];
  }
  id v44 = (void *)[v9 initWithName:@"PV" value:v11];
  v57[5] = v44;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDUser *)self isRemoteAccessAllowed];
  unint64_t v43 = HMFBooleanToString();
  id v42 = (void *)[v12 initWithName:@"RA" value:v43];
  v57[6] = v42;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  id v41 = [(HMDUser *)self presenceAuthStatus];
  int v40 = (void *)[v13 initWithName:@"PA" value:v41];
  v57[7] = v40;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v39 = [(HMDUser *)self home];
  id v38 = (void *)[v14 initWithName:@"HM" value:v39];
  v57[8] = v38;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDUser *)self camerasAccessLevel];
  __int16 v37 = HMUserCameraAccessLevelAsString();
  __int16 v36 = (void *)[v15 initWithName:@"CA" value:v37];
  v57[9] = v36;
  id v16 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDUser *)self isAnnounceAccessAllowed];
  id v35 = HMFBooleanToString();
  __int16 v34 = (void *)[v16 initWithName:@"AA" value:v35];
  v57[10] = v34;
  id v17 = objc_alloc(MEMORY[0x263F424F8]);
  __int16 v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  uint64_t v19 = (void *)[v17 initWithName:@"AL" value:v18];
  v57[11] = v19;
  id v20 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  __int16 v22 = (void *)[v20 initWithName:@"AAN" value:v21];
  v57[12] = v22;
  id v23 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDUser *)self isPending];
  uint64_t v24 = HMFBooleanToString();
  id v25 = (void *)[v23 initWithName:@"PU" value:v24];
  v57[13] = v25;
  id v26 = objc_alloc(MEMORY[0x263F424F8]);
  id v27 = [(HMDUser *)self matterCASEAuthenticatedTagID];
  uint64_t v28 = (void *)[v26 initWithName:@"CATID" value:v27];
  v57[14] = v28;
  id v29 = objc_alloc(MEMORY[0x263F424F8]);
  id v30 = [(HMDUser *)self restrictedGuestAccessSettings];
  id v31 = (void *)[v29 initWithName:@"RGS" value:v30];
  v57[15] = v31;
  id v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:16];

  return v33;
}

- (id)shortDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDUser *)self uuid];
  id v6 = [v5 UUIDString];
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (BOOL)isAccountEqualWithUser:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = (HMDUser *)a3;
  id v5 = v4;
  if (v4 == self
    || ([(HMDUser *)v4 account],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(HMDUser *)self account],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isEqual:v7],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x230FBD990]();
    char v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543874;
      id v16 = v13;
      __int16 v17 = 2112;
      __int16 v18 = v5;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Accounts do not match : [otherUser : %@] [self : %@]", (uint8_t *)&v15, 0x20u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = (HMDUser *)a3;
  id v5 = v4;
  if (v4 != self)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    char v8 = v7;

    if (!v8) {
      goto LABEL_16;
    }
    BOOL v9 = [(HMDUser *)v8 home];
    unint64_t v10 = [v9 uuid];
    char v11 = [(HMDUser *)self home];
    id v12 = [v11 uuid];
    char v13 = [v10 isEqual:v12];

    if (v13)
    {
      id v14 = [(HMDUser *)v8 account];
      int v15 = [(HMDUser *)self account];
      char v16 = [v14 isEqual:v15];

      if (v16)
      {
        BOOL v17 = 1;
LABEL_17:

        goto LABEL_18;
      }
      __int16 v18 = (void *)MEMORY[0x230FBD990]();
      id v23 = self;
      id v20 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_15;
      }
      uint64_t v21 = HMFGetLogIdentifier();
      int v25 = 138543874;
      id v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v8;
      __int16 v29 = 2112;
      id v30 = v23;
      __int16 v22 = "%{public}@Accounts do not match : [otherUser : %@] [self : %@]";
    }
    else
    {
      __int16 v18 = (void *)MEMORY[0x230FBD990]();
      __int16 v19 = self;
      id v20 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:

LABEL_16:
        BOOL v17 = 0;
        goto LABEL_17;
      }
      uint64_t v21 = HMFGetLogIdentifier();
      int v25 = 138543874;
      id v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v8;
      __int16 v29 = 2112;
      id v30 = v19;
      __int16 v22 = "%{public}@Homes do not match: [otherUser: %@] [self : %@]";
    }
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)&v25, 0x20u);

    goto LABEL_15;
  }
  BOOL v17 = 1;
LABEL_18:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v2 = [(HMDUser *)self pairingIdentity];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)dealloc
{
  if (self->_pairingIdentity)
  {
    unint64_t v3 = +[HMDIdentityRegistry sharedRegistry];
    [v3 deregisterIdentity:self->_pairingIdentity object:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDUser;
  [(HMDUser *)&v4 dealloc];
}

- (HMDUser)initWithAccountHandle:(id)a3 homeUUID:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6 keyStore:(id)a7 dataSource:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v39.receiver = self;
  v39.super_class = (Class)HMDUser;
  __int16 v19 = [(HMDUser *)&v39 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dataSource, a8);
    objc_storeStrong((id *)&v20->_keyStore, a7);
    uint64_t v21 = _userPairingIdentity(v16, a6);
    pairingIdentity = v20->_pairingIdentity;
    v20->_pairingIdentity = (HAPPairingIdentity *)v21;

    id v23 = [v14 remoteDestinationString];
    uint64_t v24 = +[HMDUser UUIDWithUserID:v23 forHomeIdentifier:v15 uuid:0 pairingIdentity:v20->_pairingIdentity];
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v24;

    HMDispatchQueueNameString();
    id v26 = objc_claimAutoreleasedReturnValue();
    __int16 v27 = (const char *)[v26 UTF8String];
    uint64_t v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create(v27, v28);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v29;

    uint64_t v31 = [v14 copy];
    accountHandle = v20->_accountHandle;
    v20->_accountHandle = (HMDAccountHandle *)v31;

    v20->_unint64_t privilege = a6;
    v20->_BOOL remoteAccessAllowed = 1;
    id v33 = (NAFuture *)objc_alloc_init(MEMORY[0x263F58190]);
    cloudShareIDFuture = v20->_cloudShareIDFuture;
    v20->_cloudShareIDFuture = v33;

    v20->_unint64_t camerasAccessLevel = HMUserDefaultCamerasAccessLevel();
    v20->_unint64_t announceAccessLevel = 0;
    v20->_announceNotificationModeForCurrentDevice = 0;
    v20->_needsiTunesMultiUserRepair = 0;
    v20->_int64_t userCloudShareWithOwnerMessagingState = 0;
    if ([(HMDUser *)v20 isRestrictedGuest])
    {
      id v35 = [HMDRestrictedGuestHomeAccessSettings alloc];
      uint64_t v36 = [(HMDRestrictedGuestHomeAccessSettings *)v35 initWithAllowedAccessories:MEMORY[0x263EFFA68] schedule:0];
      restrictedGuestAccessSettings = v20->_restrictedGuestAccessSettings;
      v20->_restrictedGuestAccessSettings = (HMDRestrictedGuestHomeAccessSettings *)v36;
    }
  }

  return v20;
}

- (HMDUser)initWithAccountHandle:(id)a3 homeUUID:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  char v13 = objc_alloc_init(HMDUserDataSource);
  id v14 = [MEMORY[0x263F35AD0] systemStore];
  id v15 = [(HMDUser *)self initWithAccountHandle:v12 homeUUID:v11 pairingIdentity:v10 privilege:a6 keyStore:v14 dataSource:v13];

  return v15;
}

- (HMDUser)initWithAccountHandle:(id)a3 home:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6 dataSource:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a5;
  id v15 = a3;
  id v16 = [v12 uuid];
  id v17 = [MEMORY[0x263F35AD0] systemStore];
  id v18 = [(HMDUser *)self initWithAccountHandle:v15 homeUUID:v16 pairingIdentity:v14 privilege:a6 keyStore:v17 dataSource:v13];

  if (v18) {
    objc_storeWeak((id *)&v18->_home, v12);
  }

  return v18;
}

- (HMDUser)initWithAccountHandle:(id)a3 home:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(HMDUserDataSource);
  id v14 = [(HMDUser *)self initWithAccountHandle:v12 home:v11 pairingIdentity:v10 privilege:a6 dataSource:v13];

  return v14;
}

- (HMDUser)initWithModelObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuid];

  if (v5)
  {
    id v6 = [v4 accountHandle];
    if (!v6)
    {
      id v5 = [v4 userID];

      if (!v5) {
        goto LABEL_28;
      }
      id v7 = +[HMDAccountHandleFormatter defaultFormatter];
      char v8 = [v4 userID];
      id v6 = [v7 accountHandleFromString:v8];
    }
    BOOL v9 = [v4 idsMergeIdentifier];
    id v10 = [v4 pairingIdentity];
    if (v10)
    {
      id v11 = (void *)MEMORY[0x263F35A78];
      id v12 = [v4 pairingIdentity];
      id v13 = objc_msgSend(v11, "hmd_pairingIdentityWithDictionary:", v12);
    }
    else
    {
      id v13 = 0;
    }

    id v14 = [v4 privilege];
    id v15 = -[HMDUser initWithAccountHandle:homeUUID:pairingIdentity:privilege:](self, "initWithAccountHandle:homeUUID:pairingIdentity:privilege:", v6, 0, v13, [v14 integerValue]);

    if (v15)
    {
      uint64_t v16 = [v4 uuid];
      uuid = v15->_uuid;
      v15->_uuid = (NSUUID *)v16;

      id v18 = [v4 remoteAccessAllowed];
      v15->_BOOL remoteAccessAllowed = [v18 BOOLValue];

      __int16 v19 = (void *)MEMORY[0x263F0E8C8];
      id v20 = [v4 presenceAuthorizationStatus];
      uint64_t v21 = [v19 authWithNumber:v20];
      presenceAuthStatus = v15->_presenceAuthStatus;
      v15->_presenceAuthStatus = (HMUserPresenceAuthorization *)v21;

      uint64_t v23 = [v4 accountIdentifier];
      accountIdentifier = v15->_accountIdentifier;
      v15->_accountIdentifier = (HMDAccountIdentifier *)v23;

      objc_storeStrong((id *)&v15->_mergeIdentifier, v9);
      int v25 = [v4 camerasAccessLevel];

      if (v25)
      {
        id v26 = [v4 camerasAccessLevel];
        v15->_unint64_t camerasAccessLevel = [v26 integerValue];
      }
      id v27 = v4;
      if ([v27 propertyWasSet:@"announceAccessLevel"])
      {
        uint64_t v28 = [v27 announceAccessLevel];
        uint64_t v29 = (uint64_t)v15;
        id v30 = 0;
        uint64_t v31 = v28;
      }
      else
      {
        uint64_t v28 = [v27 announceAccessAllowed];
        uint64_t v29 = (uint64_t)v15;
        id v30 = v28;
        uint64_t v31 = 0;
      }
      uint64_t v32 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:](v29, v30, v31);

      v15->_unint64_t announceAccessLevel = v32;
      uint64_t v33 = [v27 matterCASEAuthenticatedTagID];
      if (v33)
      {
        __int16 v34 = (void *)v33;
        id v35 = [v27 matterCASEAuthenticatedTagID];
        uint64_t v36 = [v35 integerValue];

        if (v36)
        {
          uint64_t v37 = [v27 matterCASEAuthenticatedTagID];
          matterCASEAuthenticatedTagID = v15->_matterCASEAuthenticatedTagID;
          v15->_matterCASEAuthenticatedTagID = (NSNumber *)v37;
        }
      }
      if ([(HMDUser *)v15 isRestrictedGuest])
      {
        id v39 = v27;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v40 = v39;
        }
        else {
          int v40 = 0;
        }
        id v41 = v40;

        if (v41)
        {
          uint64_t v42 = [v41 allowedAccessoryUUIDs];
          unint64_t v43 = (void *)v42;
          id v44 = (void *)MEMORY[0x263EFFA68];
          if (v42) {
            id v44 = (void *)v42;
          }
          id v45 = v44;

          long long v46 = [[HMDRestrictedGuestHomeAccessSettings alloc] initWithAllowedAccessories:v45 schedule:0];
          restrictedGuestAccessSettings = v15->_restrictedGuestAccessSettings;
          v15->_restrictedGuestAccessSettings = v46;
        }
      }
      uint64_t v48 = [v27 matCredIPKExternalRepresentation];
      acwgIssuerPublicKeyExternalRepresentation = v15->_acwgIssuerPublicKeyExternalRepresentation;
      v15->_acwgIssuerPublicKeyExternalRepresentation = (NSData *)v48;
    }
    uint64_t v50 = +[HMDAccountMetadataFactory makeInstance];
    accountMetadata = v15->_accountMetadata;
    v15->_accountMetadata = (HMDAccountMetadata *)v50;

    uint64_t v52 = [v4 iCloudAltDSID];
    iCloudAltDSID = v15->_iCloudAltDSID;
    v15->_iCloudAltDSID = (NSString *)v52;

    uint64_t v54 = [v4 firstName];
    firstName = v15->_firstName;
    v15->_firstName = (NSString *)v54;

    uint64_t v56 = [v4 lastName];
    lastName = v15->_lastName;
    v15->_lastName = (NSString *)v56;

    self = v15;
    id v5 = self;
  }
LABEL_28:

  return v5;
}

- (id)privateSettingValuesByKeyPath
{
  unint64_t v2 = [(HMDUser *)self userDataController];
  unint64_t v3 = [v2 privateSettingValuesByKeyPath];

  return v3;
}

- (id)sharedSettingValuesByKeyPath
{
  unint64_t v2 = [(HMDUser *)self userDataController];
  unint64_t v3 = [v2 sharedSettingValuesByKeyPath];

  return v3;
}

- (void)_setUuidUnsafely:(id)a3
{
}

@end
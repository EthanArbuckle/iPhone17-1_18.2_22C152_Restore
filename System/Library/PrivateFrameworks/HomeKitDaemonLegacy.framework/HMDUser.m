@interface HMDUser
+ (BOOL)supportsSecureCoding;
+ (HMDUser)userWithDictionary:(id)a3;
+ (HMDUser)userWithDictionary:(id)a3 home:(id)a4;
+ (id)UUIDWithUserID:(id)a3 forHomeIdentifier:(id)a4 uuid:(id)a5 pairingIdentity:(id)a6;
+ (id)av_authorizedPeerForPairingIdentity:(id)a3 isOwner:(BOOL)a4;
+ (id)currentUserWithPrivilege:(unint64_t)a3 forHome:(id)a4;
+ (id)currentUserWithPrivilege:(unint64_t)a3 forHome:(id)a4 forceHH1Key:(BOOL)a5;
+ (id)logCategory;
+ (id)ownerWithUserID:(id)a3 home:(id)a4 pairingIdentity:(id)a5 homeManager:(id)a6;
+ (id)privateZoneNameForUserUUID:(id)a3;
+ (id)sharedZoneNameForUserUUID:(id)a3;
+ (id)userDictionaryWithUserID:(id)a3 privilege:(unint64_t)a4 remoteAccessAllowed:(BOOL)a5 cameraAccessLevel:(unint64_t)a6 announceAccessAllowed:(id)a7 announceAccessLevel:(unint64_t)a8 audioAnalysisUserDropInAccessLevel:(unint64_t)a9;
+ (id)userIDForAccountHandle:(id)a3;
+ (unint64_t)hmdUserPrivilegeFromHMMTRUserPrivilege:(unint64_t)a3;
+ (unint64_t)hmmtrUserPrivilegeFromHMDUserPrivilege:(unint64_t)a3;
+ (unint64_t)privilegeFromDictionary:(id)a3;
- (AVOutputDeviceAuthorizedPeer)av_authorizedPeer;
- (BOOL)_isExplicitContentValueEnabledForAppleMediaAccessory:(id)a3;
- (BOOL)_setRemoteAccessAllowed:(BOOL)a3;
- (BOOL)cloudShareTrustManager:(id)a3 shouldShareTrustWithUser:(id)a4;
- (BOOL)hasCameraClipsAccess;
- (BOOL)hasDeviceWithHomeKitVersionGreaterThanVersion:(id)a3;
- (BOOL)isAccountEqualWithUser:(id)a3;
- (BOOL)isAdministrator;
- (BOOL)isAnnounceAccessAllowed;
- (BOOL)isCurrentUser;
- (BOOL)isCurrentUserAndOwner;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOwner;
- (BOOL)isOwnerCapableForTrustManager:(id)a3;
- (BOOL)isPending;
- (BOOL)isRemoteAccessAllowed;
- (BOOL)isRemoteGateway;
- (BOOL)isRunningOnHomeOwnersDevice;
- (BOOL)isValid;
- (BOOL)matchingPairingIdentityIdentifier:(id)a3;
- (BOOL)needsiTunesMultiUserRepair;
- (BOOL)refreshDisplayName;
- (BOOL)requiresMakoSupport;
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
- (HMDAssistantAccessControl)assistantAccessControl;
- (HMDCloudShareMessenger)shareMessenger;
- (HMDCloudShareTrustManager)cloudShareTrustManager;
- (HMDHome)home;
- (HMDPersonSettingsManager)personSettingsManager;
- (HMDPhotosPersonManager)photosPersonManager;
- (HMDSettingsControllerDependency)privateSettingsControllerDependency;
- (HMDSettingsControllerDependency)sharedSettingsControllerDependency;
- (HMDSiriMultiUserNewLanguageNotificationManager)siriMultiUserNewLanguageNotificationManager;
- (HMDUser)initWithAccountHandle:(id)a3 home:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6;
- (HMDUser)initWithAccountHandle:(id)a3 home:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6 dataSource:(id)a7;
- (HMDUser)initWithAccountHandle:(id)a3 homeUUID:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6;
- (HMDUser)initWithAccountHandle:(id)a3 homeUUID:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6 keyStore:(id)a7 dataSource:(id)a8;
- (HMDUser)initWithCoder:(id)a3;
- (HMDUser)initWithModelObject:(id)a3;
- (HMDUserDataController)userDataController;
- (HMDUserDataSource)dataSource;
- (HMDUserPhotosPersonDataManager)photosPersonDataManager;
- (HMDUserSettingsBackingStoreController)privateBackingStoreController;
- (HMDUserSettingsBackingStoreController)sharedBackingStoreController;
- (HMFMessageDispatcher)messageDispatcher;
- (HMPhotosPersonManagerSettings)photosPersonManagerSettings;
- (HMUserPresenceAuthorization)presenceAuthStatus;
- (NAFuture)cloudShareIDFuture;
- (NSData)nfcIssuerKeyIdentifier;
- (NSData)publicKey;
- (NSNumber)matterCASEAuthenticatedTagID;
- (NSNumber)notificationContextHAPIdentifier;
- (NSNumber)notificationContextNFCIdentifier;
- (NSNumber)uniqueIDForAccessories;
- (NSString)accessCode;
- (NSString)displayName;
- (NSString)pairingUsername;
- (NSString)userID;
- (NSUUID)accessCodeChangedByUserUUID;
- (NSUUID)assistantAccessControlModelUUID;
- (NSUUID)uuid;
- (OS_dispatch_queue)messageReceiveQueue;
- (OS_dispatch_queue)queue;
- (id)_initWithCoder:(id)a3;
- (id)account;
- (id)accountHandle;
- (id)allAccessoryUUID;
- (id)announceNotificationFileName;
- (id)announceNotificationFileNameForUserUUID:(id)a3;
- (id)announceUserSettingsModelWithChangeType:(unint64_t)a3;
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
- (id)privateSettingValuesByKeyPath;
- (id)privateZoneName;
- (id)pushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4;
- (id)settingsController:(id)a3 willUpdateSettingAtKeyPath:(id)a4 withValue:(id)a5;
- (id)settingsControllerFollowerKeyPaths:(id)a3;
- (id)sharedSettingValuesByKeyPath;
- (id)sharedZoneName;
- (id)shortDescription;
- (id)spiClientIdentifier;
- (id)syncDataFileNameWithHomeUUID:(id)a3;
- (id)trustTargetUUID;
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
- (unint64_t)privilege;
- (unint64_t)userAccessPolicy;
- (void)__handleAddedAccount:(id)a3;
- (void)__handleRemovedAccount:(id)a3;
- (void)_encodeWithCoder:(id)a3;
- (void)_handleAnnounceSettingsUpdate:(id)a3;
- (void)_handleAssistantAccessControlUpdate:(id)a3;
- (void)_handleCloudShareWithOwnerMessageError;
- (void)_handleLegacyPairingIdentityRequest:(id)a3;
- (void)_handleMediaContentProfileAccessControlUpdate:(id)a3;
- (void)_handleMultiUserSharePayloadRequest:(id)a3;
- (void)_handleNeedsiTunesMultiUserRepair:(id)a3;
- (void)_handlePairingIdentityRequest:(id)a3;
- (void)_handleShareClientRepairRequest:(id)a3;
- (void)_handleShareLookupInfoRequest:(id)a3;
- (void)_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3;
- (void)_recoverTrustManagerDueToUUIDChange;
- (void)_recoverUserSettingsDueToUUIDChange;
- (void)_sendAccountMessage:(id)a3 payload:(id)a4 deviceCapabilities:(id)a5 multicast:(BOOL)a6 preferPrimary:(BOOL)a7 completion:(id)a8;
- (void)_sendSecureShareClientPayloadToMostEligibleDevice:(id)a3 completion:(id)a4;
- (void)_setUuidUnsafely:(id)a3;
- (void)_transactionUserUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)_updateAnnounceNotificationMode:(unint64_t)a3;
- (void)applyConditionalValueUpdateToModels:(id)a3;
- (void)backingStoreController:(id)a3 didUpdatePhotosPersonManagerSettingsModel:(id)a4 previousPhotosPersonManagerSettingsModel:(id)a5;
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
- (void)handleRemovedAccessory:(id)a3;
- (void)handleUpdatedCATForUser;
- (void)handleUserDataControllerInitialized:(id)a3;
- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3;
- (void)initializeUserSettingsWithHome:(id)a3;
- (void)migrateCloudZone:(id)a3 migrationQueue:(id)a4 completion:(id)a5;
- (void)postUserSettingsUpdatedNotificationWithReason:(id)a3;
- (void)recoverUserCloudDataDueToUUIDChangeFromOldUUID:(id)a3;
- (void)registerForMessages;
- (void)registerIDSActivityObserver:(id)a3 subActivity:(id)a4 subjectDevice:(id)a5;
- (void)registerIdentity;
- (void)removeAccessoriesFromAssistantAccessControlList:(id)a3;
- (void)removeCloudData;
- (void)removeCloudShareID;
- (void)saveAnnounceNotificationModeForCurrentUserToLocalDisk;
- (void)savePersonClassificationSettingsForCurrentUserToLocalDisk;
- (void)saveSyncDataToLocalDisk:(id)a3;
- (void)setAccessCode:(id)a3;
- (void)setAccessCodeChangedByUserUUID:(id)a3;
- (void)setAccountHandle:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAnnounceAccessLevel:(unint64_t)a3;
- (void)setAnnounceNotificationModeForCurrentDevice:(unint64_t)a3;
- (void)setAssistantAccessControl:(id)a3;
- (void)setAudioAnalysisUserDropInAccessLevel:(unint64_t)a3;
- (void)setCamerasAccessLevel:(unint64_t)a3;
- (void)setCloudShareID:(id)a3;
- (void)setCloudShareTrustManager:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHome:(id)a3;
- (void)setMatterCASEAuthenticatedTagID:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setNeedsiTunesMultiUserRepair:(BOOL)a3;
- (void)setPairingIdentity:(id)a3;
- (void)setPersonSettingsManager:(id)a3;
- (void)setPhotosPersonDataManager:(id)a3;
- (void)setPresenceAuthStatus:(id)a3;
- (void)setPrivateBackingStoreController:(id)a3;
- (void)setPrivateSettingsControllerDependency:(id)a3;
- (void)setPrivilege:(unint64_t)a3;
- (void)setRemoteAccessAllowed:(BOOL)a3;
- (void)setShareMessenger:(id)a3;
- (void)setSharedBackingStoreController:(id)a3;
- (void)setSharedSettingsControllerDependency:(id)a3;
- (void)setSiriMultiUserNewLanguageNotificationManager:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUserCloudShareWithOwnerMessagingState:(int64_t)a3;
- (void)setUserDataController:(id)a3;
- (void)setUserID:(id)a3;
- (void)settingsController:(id)a3 didUpdateWithCompletion:(id)a4;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)unconfigure;
- (void)updateAnnounceNotificationMode:(unint64_t)a3;
- (void)updateCloudShareID:(id)a3;
- (void)updateIDSActivityObserver:(id)a3;
- (void)updateSharedBackingStoreControllerParticipants;
- (void)updateSupportsHH2MigrationByOwnerManual:(BOOL)a3 supportsHH2MigrationByOwnerAuto:(BOOL)a4;
- (void)userDataControllerDidUpdateAssistantAccessControl:(id)a3;
- (void)userDataControllerDidUpdateMediaContentProfile:(id)a3;
- (void)userDataControllerDidUpdateSupportsAutomaticHH2Migration:(id)a3;
- (void)userDataControllerDidUpdateUserListeningHistoryUpdateControl:(id)a3;
@end

@implementation HMDUser

- (id)shortDescription
{
  v3 = NSString;
  v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMDUser *)self uuid];
  v6 = [v5 UUIDString];
  v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
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

- (HMDHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isAdministrator
{
  return [(HMDUser *)self privilege] == 3 || [(HMDUser *)self privilege] == 4;
}

- (BOOL)isOwner
{
  return [(HMDUser *)self privilege] == 3;
}

- (unint64_t)privilege
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t privilege = self->_privilege;
  os_unfair_lock_unlock(p_lock);
  return privilege;
}

- (NSString)userID
{
  v2 = [(HMDUser *)self accountHandle];
  v3 = +[HMDUser userIDForAccountHandle:v2];

  return (NSString *)v3;
}

- (id)accountHandle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_accountHandle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (id)userIDForAccountHandle:(id)a3
{
  v3 = [a3 URI];
  v4 = [v3 unprefixedURI];

  return v4;
}

+ (unint64_t)hmdUserPrivilegeFromHMMTRUserPrivilege:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 2;
  }
  else {
    return qword_1D54D37D8[a3 - 1];
  }
}

+ (unint64_t)hmmtrUserPrivilegeFromHMDUserPrivilege:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return qword_1D54D37B0[a3];
  }
}

- (AVOutputDeviceAuthorizedPeer)av_authorizedPeer
{
  v3 = [(HMDUser *)self pairingIdentity];
  if (v3)
  {
    v4 = +[HMDUser av_authorizedPeerForPairingIdentity:v3 isOwner:[(HMDUser *)self privilege] == 3];
  }
  else
  {
    v4 = 0;
  }

  return (AVOutputDeviceAuthorizedPeer *)v4;
}

+ (id)av_authorizedPeerForPairingIdentity:(id)a3 isOwner:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (objc_class *)MEMORY[0x1E4F165E0];
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
    LOBYTE(v3) = MEMORY[0x1F40E8578](v4);
  }
  return v3;
}

- (NSData)nfcIssuerKeyIdentifier
{
  v2 = [(HMDUser *)self pairingIdentity];
  int v3 = +[HMDHome nfcIssuerKeyIdentifierWithPairingIdentity:v2];

  return (NSData *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_sharedBackingStoreController, 0);
  objc_storeStrong((id *)&self->_cloudShareTrustManager, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_siriMultiUserNewLanguageNotificationManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_privateBackingStoreController, 0);
  objc_storeStrong((id *)&self->_shareMessenger, 0);
  objc_storeStrong((id *)&self->_privateSettingsControllerDependency, 0);
  objc_storeStrong((id *)&self->_sharedSettingsControllerDependency, 0);
  objc_storeStrong((id *)&self->_userDataController, 0);
  objc_storeStrong((id *)&self->_accessCodeChangedByUserUUID, 0);
  objc_storeStrong((id *)&self->_accessCode, 0);
  objc_storeStrong((id *)&self->_personSettingsManager, 0);
  objc_storeStrong((id *)&self->_photosPersonDataManager, 0);
  objc_storeStrong((id *)&self->_cloudShareIDFuture, 0);
  objc_storeStrong((id *)&self->_cloudShareID, 0);
  objc_storeStrong((id *)&self->_matterCASEAuthenticatedTagID, 0);
  objc_storeStrong((id *)&self->_assistantAccessControl, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_storeStrong((id *)&self->_presenceAuthStatus, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHandle, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (HAPKeyStore)keyStore
{
  return (HAPKeyStore *)objc_getProperty(self, a2, 304, 1);
}

- (void)setSharedBackingStoreController:(id)a3
{
}

- (HMDUserSettingsBackingStoreController)sharedBackingStoreController
{
  return (HMDUserSettingsBackingStoreController *)objc_getProperty(self, a2, 296, 1);
}

- (void)setCloudShareTrustManager:(id)a3
{
}

- (HMDCloudShareTrustManager)cloudShareTrustManager
{
  return (HMDCloudShareTrustManager *)objc_getProperty(self, a2, 288, 1);
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
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 272, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSiriMultiUserNewLanguageNotificationManager:(id)a3
{
}

- (HMDSiriMultiUserNewLanguageNotificationManager)siriMultiUserNewLanguageNotificationManager
{
  return (HMDSiriMultiUserNewLanguageNotificationManager *)objc_getProperty(self, a2, 256, 1);
}

- (HMDUserDataSource)dataSource
{
  return (HMDUserDataSource *)objc_getProperty(self, a2, 248, 1);
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
  return (HMDUserSettingsBackingStoreController *)objc_getProperty(self, a2, 240, 1);
}

- (void)setShareMessenger:(id)a3
{
}

- (HMDCloudShareMessenger)shareMessenger
{
  return (HMDCloudShareMessenger *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPrivateSettingsControllerDependency:(id)a3
{
}

- (HMDSettingsControllerDependency)privateSettingsControllerDependency
{
  return (HMDSettingsControllerDependency *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSharedSettingsControllerDependency:(id)a3
{
}

- (HMDSettingsControllerDependency)sharedSettingsControllerDependency
{
  return (HMDSettingsControllerDependency *)objc_getProperty(self, a2, 216, 1);
}

- (unint64_t)userAccessPolicy
{
  return self->_userAccessPolicy;
}

- (void)setUserDataController:(id)a3
{
}

- (HMDUserDataController)userDataController
{
  return (HMDUserDataController *)objc_getProperty(self, a2, 200, 1);
}

- (void)setAccessCodeChangedByUserUUID:(id)a3
{
}

- (NSUUID)accessCodeChangedByUserUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAccessCode:(id)a3
{
}

- (NSString)accessCode
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setPersonSettingsManager:(id)a3
{
}

- (HMDPersonSettingsManager)personSettingsManager
{
  return (HMDPersonSettingsManager *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPhotosPersonDataManager:(id)a3
{
}

- (HMDUserPhotosPersonDataManager)photosPersonDataManager
{
  return (HMDUserPhotosPersonDataManager *)objc_getProperty(self, a2, 168, 1);
}

- (NAFuture)cloudShareIDFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCloudShareID:(id)a3
{
}

- (HMBShareUserID)cloudShareID
{
  return (HMBShareUserID *)objc_getProperty(self, a2, 152, 1);
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

- (id)allAccessoryUUID
{
  v2 = [(HMDUser *)self home];
  int v3 = [v2 accessories];
  unint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_769);

  return v4;
}

uint64_t __27__HMDUser_allAccessoryUUID__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (BOOL)_isExplicitContentValueEnabledForAppleMediaAccessory:(id)a3
{
  unint64_t v4 = [a3 settingsController];
  v5 = [v4 rootGroup];
  id v6 = [v5 groups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke;
  v8[3] = &unk_1E6A14D28;
  v8[4] = self;
  LOBYTE(self) = objc_msgSend(v6, "na_any:", v8);

  return (char)self;
}

uint64_t __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 settings];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke_2;
  v6[3] = &unk_1E6A14D00;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __64__HMDUser__isExplicitContentValueEnabledForAppleMediaAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 value];
  v5 = [v3 keyPath];
  int v6 = [v5 isEqualToString:@"root.music.allowExplicitContent"];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v13 = 138543618;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@setting found = %@", (uint8_t *)&v13, 0x16u);
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDUser *)self home];
  int v6 = [v5 accessories];
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_707);

  id v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Aggregating settings to migrate user settings for Accessories = %@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_708;
  v13[3] = &unk_1E6A14CD8;
  id v14 = v7;
  __int16 v15 = v9;
  id v12 = v7;
  objc_msgSend(v4, "na_each:", v13);
}

void __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_708(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F2E1EA10]) {
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
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_2;
        v16[3] = &unk_1E6A17240;
        id v8 = *(void **)(a1 + 32);
        v16[4] = *(void *)(a1 + 40);
        uint64_t v9 = objc_msgSend(v8, "na_any:", v16);
        v10 = (void *)MEMORY[0x1D9452090]();
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
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Aggregated value = %@ for allowExplicitContent", buf, 0x16u);
        }
        __int16 v15 = [NSNumber numberWithBool:v9];
        [v5 setNumberValue:v15];
      }
    }
  }
}

uint64_t __47__HMDUser_applyConditionalValueUpdateToModels___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@checking allowExplicitContent setting for accessory %@", (uint8_t *)&v10, 0x16u);
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDUser *)self home];
  id v9 = [v8 userWithUUID:v7];

  id v10 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v18, v17);
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
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Removed cloud share trust", (uint8_t *)&v9, 0xCu);
  }
  [(HMDUser *)v6 setUserCloudShareWithOwnerMessagingState:0];
}

- (void)didFinishConfiguringForCloudShareTrustManager:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Trust has been configured", (uint8_t *)&v9, 0xCu);
  }
}

- (void)cloudShareTrustManager:(id)a3 didFetchOwnerCloudShareID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  int v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    BOOL v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Trust manager did fetch owner cloud share id: %@", (uint8_t *)&v12, 0x16u);
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(HMDUser *)self isOwner]
    && [(HMDUser *)self isCurrentUser]
    && ([v7 isOwner] & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Will share cloud share trust with user: %@", (uint8_t *)&v14, 0x16u);
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
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__HMDUser_configureCloudShareTrustManager__block_invoke;
      block[3] = &unk_1E6A19B30;
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
    dispatch_once(&trustTargetUUID_onceToken, &__block_literal_global_704);
  }
  id v3 = (void *)MEMORY[0x1E4F29128];
  uint64_t v4 = trustTargetUUID_namespace;
  id v5 = [(HMDUser *)self uuid];
  id v6 = [v5 UUIDString];
  id v7 = [v6 dataUsingEncoding:4];
  BOOL v8 = objc_msgSend(v3, "hmf_UUIDWithNamespace:data:", v4, v7);

  return v8;
}

uint64_t __26__HMDUser_trustTargetUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"79E0D39A-83CC-42C1-99FC-5B4E0745E284"];
  uint64_t v1 = trustTargetUUID_namespace;
  trustTargetUUID_namespace = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)updateCloudShareID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUser *)self cloudShareID];

  if (!v5)
  {
    [(HMDUser *)self setCloudShareID:v4];
    int v14 = [(HMDUser *)self home];
    [v14 saveToCurrentAccountWithReason:@"HMDUserCloudShareIDCodingKey"];

    id v15 = (void *)MEMORY[0x1D9452090]();
    __int16 v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      __int16 v20 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@User has updated their cloud share id and is cloud share ready", (uint8_t *)&v19, 0xCu);
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
    BOOL v8 = (void *)MEMORY[0x1D9452090]();
    int v9 = self;
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v19 = 138543362;
      __int16 v20 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Cloud Share ID has unexpectedly changed", (uint8_t *)&v19, 0xCu);
    }
    int v12 = [[HMDAssertionLogEvent alloc] initWithReason:@"Cloud Share ID has unexpectedly changed"];
    BOOL v13 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v13 submitLogEvent:v12];
LABEL_9:
  }
}

- (void)removeCloudShareID
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUser *)self cloudShareID];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = HMFGetLogIdentifier();
      int v9 = 138543362;
      BOOL v10 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing cloud share id", (uint8_t *)&v9, 0xCu);
    }
    [(HMDUser *)v5 setCloudShareID:0];
    BOOL v8 = [(HMDUser *)v5 home];
    [v8 saveToCurrentAccountWithReason:@"HMDUserCloudShareIDCodingKey"];
  }
}

- (void)userDataControllerDidUpdateSupportsAutomaticHH2Migration:(id)a3
{
}

- (void)updateSupportsHH2MigrationByOwnerManual:(BOOL)a3 supportsHH2MigrationByOwnerAuto:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  char v7 = [(HMDUser *)self userDataController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__HMDUser_updateSupportsHH2MigrationByOwnerManual_supportsHH2MigrationByOwnerAuto___block_invoke;
  v8[3] = &unk_1E6A14CB0;
  v8[4] = self;
  BOOL v9 = v5;
  BOOL v10 = v4;
  [v7 updateSupportsHH2MigrationByOwnerManual:v5 supportsHH2MigrationByOwnerAuto:v4 completion:v8];
}

void __83__HMDUser_updateSupportsHH2MigrationByOwnerManual_supportsHH2MigrationByOwnerAuto___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      BOOL v8 = HMFGetLogIdentifier();
      BOOL v9 = HMFBooleanToString();
      BOOL v10 = HMFBooleanToString();
      int v12 = 138544130;
      BOOL v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Failed to completed updating supports automatic HH2 migration by owner manual to %@, by owner auto to %@ with error %@", (uint8_t *)&v12, 0x2Au);
    }
  }
  else if (v7)
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    BOOL v13 = v11;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Completed updating supports automatic HH2 migration by owner", (uint8_t *)&v12, 0xCu);
  }
}

- (void)userDataControllerDidUpdateUserListeningHistoryUpdateControl:(id)a3
{
}

- (BOOL)userDataController:(id)a3 isHAPAccessory:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDUser *)self home];
  uint64_t v9 = [v8 accessoryWithUUID:v7];
  BOOL v10 = (void *)v9;
  if (!v8)
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    __int16 v16 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
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
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    int v12 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v7;
      id v15 = "%{public}@Did not find accessory %@.";
LABEL_7:
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, 0x16u);

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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDUser *)self home];
  uint64_t v9 = [v8 accessoryWithUUID:v7];
  BOOL v10 = (void *)v9;
  if (!v8)
  {
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    __int16 v16 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
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
    uint64_t v11 = (void *)MEMORY[0x1D9452090]();
    int v12 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      id v23 = v7;
      id v15 = "%{public}@Did not find accessory %@.";
LABEL_7:
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, 0x16u);

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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDUser *)self home];
  uint64_t v9 = [v8 accessoryWithUUID:v7];
  BOOL v10 = (void *)v9;
  if (!v8)
  {
    __int16 v18 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = HMFGetLogIdentifier();
      int v23 = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      id v26 = v7;
      uint64_t v21 = "%{public}@Don't have home to find accessory %@.";
LABEL_15:
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v23, 0x16u);
    }
LABEL_16:

    LOBYTE(v17) = 0;
    goto LABEL_19;
  }
  if (!v9)
  {
    __int16 v18 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    id v19 = HMFGetOSLogHandle();
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
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDUser *)self home];
  uint64_t v9 = [v8 accessoryWithUUID:v7];
  BOOL v10 = v9;
  if (!v8)
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v18;
      __int16 v30 = 2112;
      id v31 = v7;
      id v19 = "%{public}@Don't have home to find accessory %@.";
LABEL_9:
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v9)
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    int v20 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v18;
      __int16 v30 = 2112;
      id v31 = v7;
      id v19 = "%{public}@Did not find accessory %@.";
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
  uint64_t v21 = (void *)MEMORY[0x1D9452090](v11, v12, v13);
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
    v33 = v10;
    __int16 v34 = 2112;
    v35 = v25;
    __int16 v36 = 1024;
    int v37 = v26;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not valid home: %@, accessory: %@, category: %@, supports: %d", (uint8_t *)&v28, 0x30u);
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)userDataController:(id)a3 isPersonalRequestCapableAccessoryID:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDUser *)self home];
  uint64_t v9 = [v8 accessoryWithUUID:v7];
  BOOL v10 = v9;
  if (!v8)
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v18;
      __int16 v30 = 2112;
      id v31 = v7;
      id v19 = "%{public}@Don't have home to find accessory %@.";
LABEL_9:
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v9)
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    int v20 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v28 = 138543618;
      v29 = v18;
      __int16 v30 = 2112;
      id v31 = v7;
      id v19 = "%{public}@Did not find accessory %@.";
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
  uint64_t v21 = (void *)MEMORY[0x1D9452090](v11, v12, v13);
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
    v33 = v10;
    __int16 v34 = 2112;
    v35 = v25;
    __int16 v36 = 1024;
    int v37 = v26;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not valid home: %@, accessory: %@, category: %@, supports: %d", (uint8_t *)&v28, 0x30u);
  }
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (void)backingStoreController:(id)a3 didUpdatePhotosPersonManagerSettingsModel:(id)a4 previousPhotosPersonManagerSettingsModel:(id)a5
{
  queue = self->_queue;
  id v7 = a4;
  dispatch_assert_queue_V2(queue);
  id v8 = [(HMDUser *)self photosPersonDataManager];
  [v8 handleUpdatedSettingsModel:v7];
}

- (id)backingStoreController:(id)a3 createParticipantManagerForCloudZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDUser *)self sharedBackingStoreController];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v14 = 138543618;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Did stop backing store controller: %@", (uint8_t *)&v14, 0x16u);
  }
  [(HMDUser *)v6 postUserSettingsUpdatedNotificationWithReason:@"User Settings Removed"];
  id v9 = [(HMDUser *)v6 privateBackingStoreController];

  if (v9 == v4)
  {
    BOOL v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = v6;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Nil-ing out the person settings manager", (uint8_t *)&v14, 0xCu);
    }
    [(HMDUser *)v11 setPersonSettingsManager:0];
  }
}

- (void)didStartLocalZoneForBackingStoreController:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Did start local zone for backing store controller: %@", (uint8_t *)&v11, 0x16u);
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
  id v3 = [v2 owner];
  id v4 = [v2 currentUser];
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (id)settingsControllerFollowerKeyPaths:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  char v5 = @"root.music.allowiTunesAccount";
  v6[0] = @"root.siri.identifyVoice";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (id)settingsController:(id)a3 willUpdateSettingAtKeyPath:(id)a4 withValue:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 isEqualToString:@"root.siri.identifyVoice"]
    || [v10 type] != 2)
  {
    goto LABEL_8;
  }
  int v11 = [v10 numberValue];
  int v12 = [v11 isEqualToNumber:&unk_1F2DC9BB0];

  if (v12)
  {
    __int16 v13 = [MEMORY[0x1E4F1CA48] array];
    id v14 = [(HMDUser *)self userDataController];
    uint64_t v15 = [v14 updateListeningHistoryModelToReset];

    [(HMDSettingAttachedSettingUpdate *)v13 addObject:v15];
    if ([(HMDUser *)self isOwner])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__HMDUser_settingsController_willUpdateSettingAtKeyPath_withValue___block_invoke;
      aBlock[3] = &unk_1E6A19B30;
      aBlock[4] = self;
      __int16 v16 = _Block_copy(aBlock);
    }
    else
    {
      __int16 v22 = [(HMDUser *)self userDataController];
      int v23 = [v22 assistantAccessControlModelToReset];

      if (v23)
      {
        [(HMDSettingAttachedSettingUpdate *)v13 addObject:v23];
      }
      else
      {
        uint64_t v24 = (void *)MEMORY[0x1D9452090]();
        __int16 v25 = self;
        int v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          __int16 v36 = v27;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Did not get access control model to turn off voice ID!", buf, 0xCu);
        }
      }

      __int16 v16 = 0;
    }
    int v28 = (void *)[objc_alloc(MEMORY[0x1E4F2EAB8]) initNumberSettingWithValue:&unk_1F2DC9BB0];
    v29 = [[HMDSettingAttachedSettingUpdate alloc] initWithKeyPath:@"root.music.playbackInfluencesForYou" settingValue:v28];
    __int16 v30 = [HMDSettingOnChangeAttachedUpdatesResult alloc];
    __int16 v34 = v29;
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    int v20 = [(HMDSettingOnChangeAttachedUpdatesResult *)v30 initWithSettingsToUpdate:v31 models:v13 onCommitCompletion:v16];

    goto LABEL_19;
  }
  id v17 = [v10 numberValue];
  int v18 = [v17 isEqualToNumber:&unk_1F2DC9BC8];

  if (!v18)
  {
LABEL_8:
    int v20 = 0;
    goto LABEL_9;
  }
  __int16 v16 = (void *)[objc_alloc(MEMORY[0x1E4F2EAB8]) initNumberSettingWithValue:&unk_1F2DC9BC8];
  __int16 v13 = [[HMDSettingAttachedSettingUpdate alloc] initWithKeyPath:@"root.music.allowiTunesAccount" settingValue:v16];
  id v19 = [HMDSettingOnChangeAttachedUpdatesResult alloc];
  v33 = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  int v20 = [(HMDSettingOnChangeAttachedUpdatesResult *)v19 initWithSettingsToUpdate:v15 models:MEMORY[0x1E4F1CBF0] onCommitCompletion:0];
LABEL_19:

LABEL_9:
  return v20;
}

void __67__HMDUser_settingsController_willUpdateSettingAtKeyPath_withValue___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    char v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v20 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Identify voice was turned off for owner.", buf, 0xCu);
  }
  id v6 = [HMDAssistantAccessControl alloc];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v7 assistantAccessControl];
  uint64_t v9 = [v8 isEnabled];
  id v10 = [*(id *)(a1 + 32) assistantAccessControl];
  uint64_t v11 = [v10 areActivityNotificationsEnabledForPersonalRequests];
  int v12 = [(HMDAssistantAccessControl *)v6 initWithUser:v7 appleAccessories:MEMORY[0x1E4F1CBF0] hapAccessoryIdentifiers:MEMORY[0x1E4F1CBF0] enabled:v9 activityNotificationsEnabledForPersonalRequests:v11];

  __int16 v13 = [*(id *)(a1 + 32) home];
  id v14 = [v13 backingStore];
  uint64_t v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  __int16 v16 = [v14 transaction:@"userAssistantAccessControlUpdated" options:v15];

  id v17 = [(HMDAssistantAccessControl *)v12 model];
  [v16 add:v17 withMessage:0];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__HMDUser_settingsController_willUpdateSettingAtKeyPath_withValue___block_invoke_678;
  v18[3] = &unk_1E6A197F0;
  v18[4] = *(void *)(a1 + 32);
  [v16 run:v18];
}

void __67__HMDUser_settingsController_willUpdateSettingAtKeyPath_withValue___block_invoke_678(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Set assistant access control off on turning off voice identification %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)settingsController:(id)a3 didUpdateWithCompletion:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  [(HMDUser *)self postUserSettingsUpdatedNotificationWithReason:@"User Settings Updated"];
  v5[2](v5, 0);
}

- (id)dictionaryEncoding
{
  id v3 = [(HMDUser *)self userID];
  unint64_t v4 = [(HMDUser *)self privilege];
  BOOL v5 = [(HMDUser *)self isRemoteAccessAllowed];
  unint64_t v6 = [(HMDUser *)self camerasAccessLevel];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"));
  int v8 = +[HMDUser userDictionaryWithUserID:v3 privilege:v4 remoteAccessAllowed:v5 cameraAccessLevel:v6 announceAccessAllowed:v7 announceAccessLevel:[(HMDUser *)self announceAccessLevel] audioAnalysisUserDropInAccessLevel:[(HMDUser *)self audioAnalysisUserDropInAccessLevel]];

  return v8;
}

- (void)removeCloudData
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  unint64_t v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing user cloud data", buf, 0xCu);
  }
  queue = v4->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__HMDUser_removeCloudData__block_invoke;
  block[3] = &unk_1E6A19B30;
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
  id v3 = [*(id *)(a1 + 32) sharedBackingStoreController];
  [v3 destroyZone];

  unint64_t v4 = [*(id *)(a1 + 32) privateBackingStoreController];
  [v4 destroyZone];

  id v5 = [*(id *)(a1 + 32) photosPersonDataManager];
  [v5 removeCloudDataDueToUserRemoval];
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  id v7 = [(HMDUser *)self home];
  if ([(HMDUser *)self isRemoteGateway])
  {
    int v8 = [HMDResidentUserModel alloc];
    uint64_t v9 = [(HMDUser *)self uuid];
    __int16 v10 = [v7 uuid];
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
  if (a4 < 3) {
    goto LABEL_8;
  }
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser privilege](self, "privilege"));
  [(HMDResidentUserModel *)v11 setPrivilege:v15];

  __int16 v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"));
  [(HMDResidentUserModel *)v11 setRemoteAccessAllowed:v16];

  if (a4 == 3)
  {
LABEL_8:
    int v17 = 0;
  }
  else
  {
    int v18 = [(HMDUser *)self presenceAuthStatus];

    if (v18)
    {
      id v19 = [(HMDUser *)self presenceAuthStatus];
      int v20 = [v19 number];
      [(HMDResidentUserModel *)v11 setPresenceAuthorizationStatus:v20];
    }
    int v17 = 1;
  }
  uint64_t v21 = [(HMDUser *)self pairingIdentity];
  __int16 v22 = objc_msgSend(v21, "hmd_dictionaryEncoding");
  [(HMDResidentUserModel *)v11 setPairingIdentity:v22];

  int v23 = [(HMDUser *)self userID];
  [(HMDResidentUserModel *)v11 setUserID:v23];

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
  [(HMDResidentUserModel *)v11 setCamerasAccessLevel:v24];

  __int16 v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  [(HMDUserModel *)v11 setAudioAnalysisUserDropInAccessLevel:v25];

  int v26 = [(HMDUser *)self matterCASEAuthenticatedTagID];
  [(HMDResidentUserModel *)v11 setMatterCASEAuthenticatedTagID:v26];

  if (v17)
  {
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"));
    [(HMDResidentUserModel *)v11 setAnnounceAccessAllowed:v27];

    int v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
    [(HMDResidentUserModel *)v11 setAnnounceAccessLevel:v28];
  }
  return v11;
}

- (id)newModelWithChangeType:(unint64_t)a3
{
  id v5 = [(HMDUser *)self home];
  unint64_t v6 = [HMDUserModel alloc];
  id v7 = [(HMDUser *)self uuid];
  int v8 = [v5 uuid];
  uint64_t v9 = [(HMDBackingStoreModelObject *)v6 initWithObjectChangeType:a3 uuid:v7 parentUUID:v8];

  return v9;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return [(HMDUser *)self modelObjectWithChangeType:a3 version:4];
}

- (id)backingStoreObjects:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v6 = [(HMDUser *)self modelObjectWithChangeType:1 version:a3];
  [v5 addObject:v6];

  if (a3 >= 4)
  {
    id v7 = [(HMDUser *)self assistantAccessControl];
    int v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 model];
      __int16 v10 = v9;
      if (v9)
      {
        [v9 setObjectChangeType:1];
        [v5 addObject:v10];
      }
    }
    uint64_t v11 = [(HMDUser *)self announceUserSettingsModelWithChangeType:1];
    [v5 addObject:v11];

    uint64_t v12 = [(HMDUser *)self accessCode];
    if (v12)
    {
    }
    else
    {
      __int16 v13 = [(HMDUser *)self accessCodeChangedByUserUUID];

      if (!v13)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    id v14 = [(HMDUser *)self accessCode];
    uint64_t v15 = [(HMDUser *)self uuid];
    __int16 v16 = [(HMDUser *)self accessCodeChangedByUserUUID];
    int v17 = +[HMDAccessCodeDataManager createUserAccessCodeModelFromAccessCode:v14 forUserUUID:v15 changedByUserUUID:v16];

    [v5 addObject:v17];
    goto LABEL_10;
  }
LABEL_11:
  int v18 = (void *)[v5 copy];

  return v18;
}

- (id)announceUserSettingsModelWithChangeType:(unint64_t)a3
{
  id v5 = [HMDAnnounceUserSettingsModel alloc];
  unint64_t v6 = [(HMDUser *)self uuid];
  id v7 = [(HMDAnnounceUserSettingsModel *)v5 initWithUserUUID:v6];

  [(HMDBackingStoreModelObject *)v7 setObjectChangeType:a3];
  int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
  [(HMDAnnounceUserSettingsModel *)v7 setAnnounceNotificationModeForCurrentDevice:v8];

  return v7;
}

- (void)migrateCloudZone:(id)a3 migrationQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  __int16 v13 = [(HMDUser *)self home];
  objc_initWeak(location, self);
  __int16 v32 = v12;
  v33 = v11;
  id v31 = v13;
  if ([(HMDUser *)self isOwner])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke;
    aBlock[3] = &unk_1E6A14BE8;
    __int16 v34 = &v58;
    objc_copyWeak(&v58, location);
    id v14 = v9;
    id v52 = v14;
    id v29 = v10;
    id v15 = v10;
    id v57 = v15;
    id v16 = v11;
    id v53 = v16;
    id v17 = v12;
    id v54 = v17;
    id v30 = v8;
    id v18 = v8;
    id v55 = v18;
    id v19 = v13;
    id v56 = v19;
    int v20 = _Block_copy(aBlock);
    uint64_t v21 = [v19 uuid];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_652;
    v43[3] = &unk_1E6A14C38;
    objc_copyWeak(&v50, location);
    id v48 = v15;
    id v44 = v14;
    id v45 = v16;
    id v46 = v17;
    id v22 = v20;
    id v49 = v22;
    id v47 = v19;
    [v18 cloudRecordsForParentID:v21 completionHandler:v43];
    int v23 = &v52;
    uint64_t v24 = &v57;
    __int16 v25 = &v53;
    int v26 = &v54;
    uint64_t v27 = &v55;
    int v28 = &v56;

    objc_destroyWeak(&v50);
    id v8 = v30;
    id v10 = v29;
  }
  else
  {
    id v22 = [v13 uuid];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_657;
    v35[3] = &unk_1E6A14C88;
    __int16 v34 = &v42;
    objc_copyWeak(&v42, location);
    id v41 = v10;
    id v36 = v9;
    id v37 = v11;
    id v38 = v12;
    id v39 = v13;
    id v40 = v8;
    [v40 cloudRecordsForParentID:v22 completionHandler:v35];
    int v23 = &v41;
    uint64_t v24 = &v36;
    __int16 v25 = &v37;
    int v26 = &v38;
    uint64_t v27 = &v39;
    int v28 = &v40;
  }

  objc_destroyWeak(v34);
  objc_destroyWeak(location);
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke(uint64_t a1, char a2)
{
  unint64_t v4 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained assistantAccessControl];
    id v8 = [v7 modelID];

    id v9 = [v6 assistantAccessControl];

    if (!v9)
    {
      id v10 = [[HMDAssistantAccessControl alloc] initWithUser:v6];
      uint64_t v11 = [(HMDAssistantAccessControl *)v10 modelID];

      id v8 = (void *)v11;
    }
    uint64_t v12 = *(void **)(a1 + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_3;
    v15[3] = &unk_1E6A14BC0;
    objc_copyWeak(&v22, v4);
    id v16 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 64);
    char v23 = a2;
    id v13 = v8;
    id v20 = v13;
    [v12 cloudRecordWithObjectID:v13 completionHandler:v15];

    objc_destroyWeak(&v22);
  }
  else
  {
    id v14 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2;
    block[3] = &unk_1E6A193D0;
    id v27 = *(id *)(a1 + 72);
    id v25 = *(id *)(a1 + 40);
    id v26 = *(id *)(a1 + 48);
    dispatch_async(v14, block);

    id v13 = v27;
  }
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_652(uint64_t a1, void *a2, void *a3)
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v85 = a2;
  id v84 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    from = (id *)(a1 + 80);
    id v86 = WeakRetained;
    v87 = (id *)a1;
    uint64_t v88 = [WeakRetained pairingUsername];
    if (!v88)
    {
      v33 = (void *)MEMORY[0x1D9452090]();
      id v34 = v86;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v116 = v36;
        __int16 v117 = 2112;
        id v118 = v34;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@User %@ does not have a pairing identity, cannot migrate", buf, 0x16u);
      }
      __int16 v32 = *(void **)(a1 + 64);
      if (!v32) {
        goto LABEL_72;
      }
      id v37 = *(NSObject **)(a1 + 32);
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_654;
      v105[3] = &unk_1E6A193D0;
      id v108 = v32;
      id v106 = *(id *)(a1 + 40);
      id v107 = *(id *)(a1 + 48);
      dispatch_async(v37, v105);

      id v6 = v108;
      goto LABEL_71;
    }
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v7 = v85;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v101 objects:v121 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v102 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = [*(id *)(*((void *)&v101 + 1) + 8 * i) extractObjectChange];
          if (v11)
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            id v13 = (isKindOfClass & 1) != 0 ? v11 : 0;
            id v14 = v13;
            if (isKindOfClass)
            {
              id v15 = [v11 pairingIdentity];
              id v16 = [v15 objectForKeyedSubscript:@"HAP.identifier"];

              if ([v16 isEqualToString:v88]) {
                [v6 addObject:v11];
              }
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v101 objects:v121 count:16];
      }
      while (v8);
    }

    if ([v6 count] == 1)
    {
      id v17 = [v6 firstObject];
      id v18 = [v86 uuid];
      id v19 = [v17 uuid];
      char v20 = [v18 isEqual:v19];

      if ((v20 & 1) == 0)
      {
        id v21 = (void *)MEMORY[0x1D9452090]();
        id v22 = v86;
        char v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = HMFGetLogIdentifier();
          id v25 = [v22 uuid];
          id v26 = [v17 uuid];
          *(_DWORD *)buf = 138543874;
          v116 = v24;
          __int16 v117 = 2112;
          id v118 = v25;
          __int16 v119 = 2112;
          v120 = v26;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Fixing up user.uuid from %@ to %@", buf, 0x20u);
        }
        id v27 = v87[7];
        int v28 = [v22 uuid];
        [v27 dropAllChangesWithObjectID:v28];

        id v29 = [v17 uuid];
        [v22 setUUID:v29];

        [v22 configureWithHome:v87[7]];
      }
      (*((void (**)(void))v87[9] + 2))();

LABEL_71:
      __int16 v32 = (void *)v88;
      goto LABEL_72;
    }
    if ((unint64_t)[v6 count] < 2)
    {
      id v53 = (void *)MEMORY[0x1D9452090]();
      id v54 = v86;
      id v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        id v56 = HMFGetLogIdentifier();
        id v57 = [v54 uuid];
        *(_DWORD *)buf = 138543618;
        v116 = v56;
        __int16 v117 = 2112;
        id v118 = v57;
        _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@Did not find record for user %@, looking into transactions to determine new transaction is needed", buf, 0x16u);
      }
      id v58 = [v54 home];
      v59 = [v54 uuid];
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_655;
      v89[3] = &unk_1E6A14C10;
      objc_copyWeak(&v92, from);
      id v90 = v87[5];
      id v91 = v87[9];
      [v58 cleanChangesIfNoAddChangeObjectID:v59 completion:v89];

      objc_destroyWeak(&v92);
      goto LABEL_71;
    }
    id v38 = [v87[7] uuid];
    id v39 = [v86 pairingIdentity];
    id v40 = +[HMDUser UUIDWithUserID:0 forHomeIdentifier:v38 uuid:0 pairingIdentity:v39];

    id v41 = [MEMORY[0x1E4F1CA48] array];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v98 = 0u;
    long long v97 = 0u;
    id v42 = v6;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v97 objects:v114 count:16];
    if (v43)
    {
      id v44 = 0;
      uint64_t v45 = *(void *)v98;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v98 != v45) {
            objc_enumerationMutation(v42);
          }
          id v47 = *(void **)(*((void *)&v97 + 1) + 8 * j);
          id v48 = [v47 uuid];
          int v49 = [v40 isEqual:v48];

          if (v49)
          {
            id v50 = v47;

            id v44 = v50;
          }
          v51 = [v47 uuid];
          [v41 addObject:v51];
        }
        uint64_t v43 = [v42 countByEnumeratingWithState:&v97 objects:v114 count:16];
      }
      while (v43);

      if (v44)
      {
        [v42 removeObject:v44];
        char v52 = 0;
LABEL_47:
        if (([v41 containsObject:v40] & 1) == 0) {
          [v41 addObject:v40];
        }
        [v87[7] dropAllChangesWithArrayOfObjectIDs:v41];
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v6 = v42;
        uint64_t v60 = [v6 countByEnumeratingWithState:&v93 objects:v113 count:16];
        if (v60)
        {
          uint64_t v61 = *(void *)v94;
          do
          {
            for (uint64_t k = 0; k != v60; ++k)
            {
              if (*(void *)v94 != v61) {
                objc_enumerationMutation(v6);
              }
              v63 = *(void **)(*((void *)&v93 + 1) + 8 * k);
              [v63 setObjectChangeType:3];
              [v87[5] addObject:v63];
            }
            uint64_t v60 = [v6 countByEnumeratingWithState:&v93 objects:v113 count:16];
          }
          while (v60);
        }

        v64 = [v86 uuid];
        char v65 = [v64 isEqual:v40];

        if ((v65 & 1) == 0)
        {
          v67 = (void *)MEMORY[0x1D9452090]();
          id v68 = v86;
          v69 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v70 = HMFGetLogIdentifier();
            v71 = [v68 uuid];
            *(_DWORD *)buf = 138543874;
            v116 = v70;
            __int16 v117 = 2112;
            id v118 = v71;
            __int16 v119 = 2112;
            v120 = v40;
            _os_log_impl(&dword_1D49D5000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@Fixing up user.uuid from %@ to calculated %@", buf, 0x20u);
          }
          [v68 setUUID:v40];
          uint64_t v66 = [v68 configureWithHome:v87[7]];
        }
        if (v52)
        {
          v72 = (void *)MEMORY[0x1D9452090](v66);
          id v73 = v86;
          v74 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            v75 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v116 = v75;
            _os_log_impl(&dword_1D49D5000, v74, OS_LOG_TYPE_DEFAULT, "%{public}@Missing cloud record for owner user, creating", buf, 0xCu);
          }
          id v76 = v87[5];
          v77 = [v73 modelObjectWithChangeType:1];
          [v76 addObject:v77];

          (*((void (**)(void))v87[9] + 2))();
        }
        else
        {
          [v87[7] dropAllChangesWithObjectID:v40];
          v78 = [v86 modelObjectWithChangeType:2];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v79 = v78;
          }
          else {
            v79 = 0;
          }
          id v80 = v79;

          if (v80)
          {
            v81 = [MEMORY[0x1E4F29128] UUID];
            v82 = [v81 UUIDString];
            [v80 setChangeTag:v82];

            [v87[5] addObject:v80];
          }
          (*((void (**)(void))v87[9] + 2))();
        }
        goto LABEL_71;
      }
    }
    else
    {

      id v44 = 0;
    }
    char v52 = 1;
    goto LABEL_47;
  }
  id v30 = *(void **)(a1 + 64);
  if (v30)
  {
    id v86 = 0;
    id v31 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_3_653;
    block[3] = &unk_1E6A193D0;
    id v112 = v30;
    id v110 = *(id *)(a1 + 40);
    id v111 = *(id *)(a1 + 48);
    dispatch_async(v31, block);

    __int16 v32 = v112;
LABEL_72:

    id WeakRetained = v86;
  }
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_657(uint64_t a1, void *a2, void *a3)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained pairingUsername];
    id v10 = (void *)v9;
    if (v9)
    {
      uint64_t v75 = a1;
      v77 = (void *)v9;
      v71 = v8;
      id v69 = v6;
      v72 = [MEMORY[0x1E4F1CA48] array];
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v70 = v5;
      obuint64_t j = v5;
      uint64_t v11 = [obj countByEnumeratingWithState:&v88 objects:v101 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v89;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v89 != v13) {
              objc_enumerationMutation(obj);
            }
            id v15 = [*(id *)(*((void *)&v88 + 1) + 8 * i) extractObjectChange];
            if (v15)
            {
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              id v17 = (isKindOfClass & 1) != 0 ? v15 : 0;
              id v18 = v17;
              if (isKindOfClass)
              {
                id v19 = [v15 pairingIdentity];
                char v20 = [v19 objectForKeyedSubscript:@"HAP.identifier"];

                if ([v20 isEqualToString:v77]) {
                  [v72 addObject:v15];
                }
              }
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v88 objects:v101 count:16];
        }
        while (v12);
      }

      if ((unint64_t)[v72 count] >= 2)
      {
        id v21 = [*(id *)(a1 + 56) uuid];
        id v22 = [v8 pairingIdentity];
        uint64_t v23 = +[HMDUser UUIDWithUserID:0 forHomeIdentifier:v21 uuid:0 pairingIdentity:v22];

        uint64_t v24 = (void *)MEMORY[0x1D9452090]();
        id v25 = v8;
        id v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          id v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v103 = v27;
          __int16 v104 = 2112;
          uint64_t v105 = v23;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Duplicate users: forcing add/update for user uuid %@", buf, 0x16u);
        }
        id v73 = v25;
        uint64_t v28 = [v25 modelObjectWithChangeType:1];
        id v29 = [HMDUserModel alloc];
        id v30 = [*(id *)(a1 + 56) uuid];
        id v31 = [(HMDBackingStoreModelObject *)v29 initWithObjectChangeType:1 uuid:v23 parentUUID:v30];

        __int16 v32 = [MEMORY[0x1E4F29128] UUID];
        v33 = [v32 UUIDString];
        [(HMDUserModel *)v31 setChangeTag:v33];

        id v68 = (void *)v28;
        id v34 = [(HMDBackingStoreModelObject *)v31 merge:v28];
        v67 = v31;
        [*(id *)(a1 + 48) addObject:v31];
        v74 = [MEMORY[0x1E4F1CA48] array];
        [v74 addObject:v23];
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v76 = v72;
        uint64_t v35 = [v76 countByEnumeratingWithState:&v84 objects:v100 count:16];
        id v36 = (void *)v23;
        if (v35)
        {
          uint64_t v37 = v35;
          uint64_t v38 = *(void *)v85;
          do
          {
            for (uint64_t j = 0; j != v37; ++j)
            {
              if (*(void *)v85 != v38) {
                objc_enumerationMutation(v76);
              }
              id v40 = *(void **)(*((void *)&v84 + 1) + 8 * j);
              id v41 = [v40 uuid];
              char v42 = [v36 isEqual:v41];

              if ((v42 & 1) == 0)
              {
                uint64_t v43 = (void *)MEMORY[0x1D9452090]();
                id v44 = v73;
                uint64_t v45 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  id v46 = HMFGetLogIdentifier();
                  id v47 = [v40 uuid];
                  *(_DWORD *)buf = 138543618;
                  long long v103 = v46;
                  __int16 v104 = 2112;
                  uint64_t v105 = (uint64_t)v47;
                  _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Duplicate user: obsoleting user uuid %@", buf, 0x16u);
                }
                id v48 = [HMDObsoleteUserModel alloc];
                int v49 = [v40 uuid];
                a1 = v75;
                id v50 = [*(id *)(v75 + 56) uuid];
                v51 = [(HMDBackingStoreModelObject *)v48 initWithObjectChangeType:1 uuid:v49 parentUUID:v50];

                v83[0] = MEMORY[0x1E4F143A8];
                v83[1] = 3221225472;
                v83[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_661;
                v83[3] = &unk_1E6A14C60;
                v83[4] = v40;
                char v52 = objc_msgSend(obj, "hmf_objectPassingTest:", v83);
                id v53 = v52;
                if (v52 && [v52 encodeObjectChange:v51]) {
                  [*(id *)(v75 + 64) updateCloudRecord:v53 completionHandler:0];
                }
                id v54 = [MEMORY[0x1E4F29128] UUID];
                id v55 = [v54 UUIDString];
                [(HMDObsoleteUserModel *)v51 setChangeTag:v55];

                [*(id *)(v75 + 40) addObject:v51];
                id v56 = [v40 uuid];
                [v74 addObject:v56];
              }
            }
            uint64_t v37 = [v76 countByEnumeratingWithState:&v84 objects:v100 count:16];
          }
          while (v37);
        }

        [*(id *)(a1 + 56) dropAllChangesWithArrayOfObjectIDs:v74];
      }
      id v57 = *(void **)(v75 + 72);
      if (v57)
      {
        id v58 = *(NSObject **)(v75 + 32);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_663;
        block[3] = &unk_1E6A193D0;
        id v82 = v57;
        id v80 = *(id *)(v75 + 40);
        id v81 = *(id *)(v75 + 48);
        dispatch_async(v58, block);
      }
      id v6 = v69;
      id v5 = v70;
      uint64_t v8 = v71;
      id v10 = v77;
    }
    else
    {
      uint64_t v61 = (void *)MEMORY[0x1D9452090]();
      id v62 = v8;
      v63 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        v64 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v103 = v64;
        __int16 v104 = 2112;
        uint64_t v105 = (uint64_t)v62;
        _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_ERROR, "%{public}@User %@ does not have a pairing identity, cannot migrate", buf, 0x16u);
      }
      char v65 = *(void **)(a1 + 72);
      if (!v65)
      {
        id v10 = 0;
        goto LABEL_46;
      }
      uint64_t v66 = *(NSObject **)(a1 + 32);
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_659;
      v92[3] = &unk_1E6A193D0;
      id v95 = v65;
      id v93 = *(id *)(a1 + 40);
      id v94 = *(id *)(a1 + 48);
      dispatch_async(v66, v92);

      v72 = v95;
    }

LABEL_46:
    goto LABEL_47;
  }
  v59 = *(void **)(a1 + 72);
  if (v59)
  {
    uint64_t v60 = *(NSObject **)(a1 + 32);
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_658;
    v96[3] = &unk_1E6A193D0;
    id v99 = v59;
    id v97 = *(id *)(a1 + 40);
    id v98 = *(id *)(a1 + 48);
    dispatch_async(v60, v96);

    id v10 = v99;
    goto LABEL_46;
  }
LABEL_47:
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_658(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_659(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_661(uint64_t a1, void *a2)
{
  id v3 = [a2 objectID];
  unint64_t v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_663(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_3_653(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_654(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_655(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (a2 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = WeakRetained;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Missing cloud record for owner user, creating", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v8 modelObjectWithChangeType:1];
    [v11 addObject:v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained assistantAccessControl];

    if (v9)
    {
      if (!v5)
      {
        id v25 = *(void **)(a1 + 56);
        id v26 = [v8 assistantAccessControl];
        id v27 = [v26 modelID];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_5;
        v40[3] = &unk_1E6A14B98;
        objc_copyWeak(&v45, (id *)(a1 + 80));
        id v41 = *(id *)(a1 + 40);
        id v44 = *(id *)(a1 + 72);
        id v42 = *(id *)(a1 + 32);
        id v43 = *(id *)(a1 + 48);
        [v25 cleanChangesIfNoAddChangeObjectID:v27 completion:v40];

        objc_destroyWeak(&v45);
        goto LABEL_22;
      }
      if (*(unsigned char *)(a1 + 88))
      {
        id v10 = [v8 assistantAccessControl];
        uint64_t v11 = [v10 model];

        [v11 setObjectChangeType:1];
        uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
        int v13 = [v12 UUIDString];
        [v11 setChangeTag:v13];

        [*(id *)(a1 + 40) addObject:v11];
      }
    }
    else
    {
      if (!v5)
      {
        uint64_t v28 = [v8 home];
        uint64_t v29 = *(void *)(a1 + 64);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_647;
        v34[3] = &unk_1E6A14B98;
        objc_copyWeak(&v39, (id *)(a1 + 80));
        id v35 = *(id *)(a1 + 48);
        id v38 = *(id *)(a1 + 72);
        id v36 = *(id *)(a1 + 32);
        id v37 = *(id *)(a1 + 40);
        [v28 cleanChangesIfNoAddChangeObjectID:v29 completion:v34];

        objc_destroyWeak(&v39);
        goto LABEL_22;
      }
      uint64_t v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = v8;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v51 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Assistant access control does not exist but cloud record does, re-running it to add access control", buf, 0xCu);
      }
      id v19 = [v5 extractObjectChange];
      if (v19)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          id v21 = v19;
        }
        else {
          id v21 = 0;
        }
        id v22 = v21;
        if (isKindOfClass) {
          [*(id *)(a1 + 48) addObject:v19];
        }
      }
    }
    uint64_t v23 = *(void **)(a1 + 72);
    if (v23)
    {
      uint64_t v24 = *(NSObject **)(a1 + 32);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_649;
      v30[3] = &unk_1E6A193D0;
      id v33 = v23;
      id v31 = *(id *)(a1 + 40);
      id v32 = *(id *)(a1 + 48);
      dispatch_async(v24, v30);
    }
  }
  else
  {
    id v14 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_4;
    block[3] = &unk_1E6A193D0;
    id v49 = *(id *)(a1 + 72);
    id v47 = *(id *)(a1 + 40);
    id v48 = *(id *)(a1 + 48);
    dispatch_async(v14, block);
  }
LABEL_22:
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && (a2 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = WeakRetained;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v20 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Missing cloud record for Assistant access control but object exists, creating add transaction to push to cloud", buf, 0xCu);
    }
    uint64_t v11 = [v8 assistantAccessControl];
    uint64_t v12 = [v11 model];

    [v12 setObjectChangeType:1];
    [*(id *)(a1 + 32) addObject:v12];
  }
  int v13 = *(void **)(a1 + 56);
  if (v13)
  {
    id v14 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_645;
    block[3] = &unk_1E6A193D0;
    id v18 = v13;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    dispatch_async(v14, block);
  }
}

void __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_2_647(uint64_t a1, char a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && (a2 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = WeakRetained;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Assistant access control does not exist and cloud record does not exist, creating default Assistant access control", buf, 0xCu);
    }
    uint64_t v11 = [[HMDAssistantAccessControl alloc] initWithUser:v8];
    uint64_t v12 = [(HMDAssistantAccessControl *)v11 model];
    int v13 = v12;
    if (v12)
    {
      [v12 setObjectChangeType:1];
      [*(id *)(a1 + 32) addObject:v13];
    }
  }
  id v14 = *(void **)(a1 + 56);
  if (v14)
  {
    uint64_t v15 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_648;
    block[3] = &unk_1E6A193D0;
    id v19 = v14;
    id v17 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 32);
    dispatch_async(v15, block);
  }
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_649(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_648(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __54__HMDUser_migrateCloudZone_migrationQueue_completion___block_invoke_645(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
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
      if (isWatch() && [(HMDUser *)self isCurrentUser])
      {
        int v13 = (void *)MEMORY[0x1D9452090]();
        id v14 = self;
        uint64_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          id v16 = HMFGetLogIdentifier();
          int v32 = 138543362;
          id v33 = v16;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Removed announce user settings from user", (uint8_t *)&v32, 0xCu);
        }
        [(HMDUser *)v14 setAnnounceNotificationModeForCurrentDevice:0];
        [v7 respondWithSuccess];
      }
      else
      {
        id v17 = (void *)MEMORY[0x1D9452090]();
        id v18 = self;
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          char v20 = HMFGetLogIdentifier();
          int v32 = 138543362;
          id v33 = v20;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Ignorning removed announce user settings from user, not watch or not current user", (uint8_t *)&v32, 0xCu);
        }
      }
    }
    else
    {
      id v21 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = 0;
      }
      id v23 = v22;

      if (v23)
      {
        uint64_t v24 = [(HMDUser *)self home];
        id v25 = [v24 accessCodeManager];
        id v26 = [v25 dataManager];

        if (v26)
        {
          [v26 handleRemovedUserAccessCodeModel:v23 forUser:self message:v7];
        }
        else
        {
          id v27 = (void *)MEMORY[0x1D9452090]();
          uint64_t v28 = self;
          uint64_t v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            id v30 = HMFGetLogIdentifier();
            int v32 = 138543362;
            id v33 = v30;
            _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Not handling removed HMDUserAccessCodeModel because self.home.accessCodeManager.dataManager is nil.", (uint8_t *)&v32, 0xCu);
          }
          id v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
          [v7 respondWithError:v31];
        }
      }
    }
  }
}

- (void)handleUpdatedCATForUser
{
  id v2 = [(HMDUser *)self home];
  [v2 handleCATUpdate];
}

- (void)_transactionUserUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v154 = a5;
  group = dispatch_group_create();
  id v10 = [v9 accountHandle];

  if (v10)
  {
    uint64_t v11 = [v9 accountHandle];
    if (!v11)
    {
LABEL_8:
      v153 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    id v12 = [v9 userID];

    if (!v12) {
      goto LABEL_8;
    }
    int v13 = +[HMDAccountHandleFormatter defaultFormatter];
    id v14 = [v9 userID];
    uint64_t v11 = [v13 accountHandleFromString:v14];

    if (!v11) {
      goto LABEL_8;
    }
  }
  uint64_t v15 = [(HMDUser *)self accountHandle];
  char v16 = HMFEqualObjects();

  v153 = (HMDUser *)v11;
  if ((v16 & 1) == 0) {
    [(HMDUser *)self setAccountHandle:v11];
  }
LABEL_9:
  id v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    char v20 = HMFGetLogIdentifier();
    id v21 = [(HMDUser *)v18 userID];
    uint64_t v22 = [(HMDUser *)v18 account];
    [(HMDUser *)v18 isCurrentUser];
    id v23 = HMFBooleanToString();
    *(_DWORD *)buf = 138544387;
    v159 = v20;
    __int16 v160 = 2112;
    v161 = v153;
    __int16 v162 = 2117;
    v163 = v21;
    __int16 v164 = 2112;
    uint64_t v165 = (uint64_t)v22;
    __int16 v166 = 2112;
    v167 = v23;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Updated account handle [%@] for %{sensitive}@, account: %@, isCurrentUser: %@", buf, 0x34u);
  }
  if ([v9 propertyWasSet:@"accountIdentifier"])
  {
    uint64_t v24 = [v9 accountIdentifier];
    id v25 = [(HMDUser *)v18 accountIdentifier];
    char v26 = HMFEqualObjects();

    if ((v26 & 1) == 0)
    {
      id v27 = [v9 accountIdentifier];
      [(HMDUser *)v18 setAccountIdentifier:v27];
    }
  }
  v152 = [(HMDUser *)v18 home];
  uint64_t v28 = [(HMDUser *)v18 uuid];
  uint64_t v29 = [v9 uuid];
  char v30 = [v28 isEqual:v29];

  if ((v30 & 1) == 0)
  {
    id v31 = (void *)MEMORY[0x1D9452090]();
    int v32 = v18;
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      id v35 = [v9 uuid];
      id v36 = [(HMDUser *)v32 uuid];
      *(_DWORD *)buf = 138543874;
      v159 = v34;
      __int16 v160 = 2112;
      v161 = v35;
      __int16 v162 = 2112;
      v163 = v36;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating uuid: %@ from %@", buf, 0x20u);
    }
    [(HMDUser *)v32 deregisterForMessages];
    id v37 = [v154 transactionResult];
    uint64_t v38 = [v37 source];

    if (v38 != 1)
    {
      id v39 = (void *)MEMORY[0x1D9452090]();
      id v40 = v32;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        id v42 = HMFGetLogIdentifier();
        id v43 = [v152 name];
        *(_DWORD *)buf = 138543618;
        v159 = v42;
        __int16 v160 = 2112;
        v161 = v43;
        _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Home %@ needs to run migration because user UUID was changed", buf, 0x16u);
      }
      id v44 = [(HMDUser *)v40 uuid];
      [v152 dropAllChangesWithObjectID:v44];

      [v152 setMigrationNeeded:1];
    }
    id v45 = [(HMDUser *)v32 uuid];
    id v46 = [v9 uuid];
    [(HMDUser *)v32 setUUID:v46];

    [(HMDUser *)v32 registerForMessages];
    [(HMDUser *)v32 recoverUserCloudDataDueToUUIDChangeFromOldUUID:v45];
  }
  uint64_t v47 = [v9 privilege];
  if (v47)
  {
    id v48 = (void *)v47;
    uint64_t v49 = [(HMDUser *)v18 privilege];
    id v50 = [v9 privilege];
    uint64_t v51 = [v50 integerValue];

    if (v49 != v51)
    {
      uint64_t v52 = (void *)MEMORY[0x1D9452090]();
      id v53 = v18;
      id v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        id v55 = HMFGetLogIdentifier();
        unint64_t v56 = [(HMDUser *)v53 privilege];
        if (v56 > 4) {
          id v57 = @"None";
        }
        else {
          id v57 = off_1E6A14D48[v56];
        }
        id v58 = [v9 privilege];
        unsigned int v59 = [v58 intValue];
        if (v59 > 4) {
          uint64_t v60 = @"None";
        }
        else {
          uint64_t v60 = off_1E6A14D48[v59];
        }
        *(_DWORD *)buf = 138543874;
        v159 = v55;
        __int16 v160 = 2112;
        v161 = (HMDUser *)v57;
        __int16 v162 = 2112;
        v163 = v60;
        _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_INFO, "%{public}@User Privilege got updated from : %@ -> %@", buf, 0x20u);
      }
      uint64_t v61 = [v9 privilege];
      -[HMDUser setPrivilege:](v53, "setPrivilege:", [v61 integerValue]);
    }
  }
  uint64_t v62 = [v9 remoteAccessAllowed];
  if (v62)
  {
    v63 = (void *)v62;
    v64 = [v9 remoteAccessAllowed];
    int v65 = [v64 BOOLValue];
    int v66 = [(HMDUser *)v18 isRemoteAccessAllowed];

    if (v65 != v66)
    {
      v67 = [v9 remoteAccessAllowed];
      -[HMDUser setRemoteAccessAllowed:](v18, "setRemoteAccessAllowed:", [v67 BOOLValue]);
    }
  }
  id v68 = [v9 camerasAccessLevel];
  uint64_t v69 = [v68 integerValue];

  uint64_t v70 = [v9 camerasAccessLevel];
  if (v70)
  {
    v71 = (void *)v70;
    uint64_t v72 = [(HMDUser *)v18 camerasAccessLevel];

    if (v69 != v72)
    {
      id v73 = (void *)MEMORY[0x1D9452090]();
      v74 = v18;
      uint64_t v75 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        id v76 = HMFGetLogIdentifier();
        [(HMDUser *)v74 camerasAccessLevel];
        HMUserCameraAccessLevelAsString();
        v77 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        HMUserCameraAccessLevelAsString();
        v78 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v159 = v76;
        __int16 v160 = 2112;
        v161 = v77;
        __int16 v162 = 2112;
        v163 = v78;
        _os_log_impl(&dword_1D49D5000, v75, OS_LOG_TYPE_INFO, "%{public}@Updating cameras access value from %@ to %@", buf, 0x20u);
      }
      [(HMDUser *)v74 setCamerasAccessLevel:v69];
    }
  }
  uint64_t v79 = [v9 announceAccessLevel];
  if (v79)
  {
    id v80 = (void *)v79;
    id v81 = [v9 announceAccessLevel];
    uint64_t v82 = [v81 unsignedIntegerValue];
    uint64_t v83 = [(HMDUser *)v18 announceAccessLevel];

    if (v82 != v83)
    {
      long long v84 = [v9 announceAccessLevel];
      uint64_t v92 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v18, 0, v84);
LABEL_52:
      [(HMDUser *)v18 setAnnounceAccessLevel:v92];
      goto LABEL_53;
    }
  }
  long long v84 = [v9 announceAccessLevel];
  if (v84)
  {
LABEL_53:

    goto LABEL_54;
  }
  uint64_t v85 = [v9 announceAccessAllowed];
  if (v85)
  {
    long long v86 = (void *)v85;
    long long v87 = [v9 announceAccessAllowed];
    int v88 = [v87 BOOLValue];
    int v89 = [(HMDUser *)v18 isAnnounceAccessAllowed];

    if (v88 != v89)
    {
      long long v84 = [v9 announceAccessAllowed];
      int v90 = [v84 BOOLValue];
      uint64_t v91 = 1;
      if (v90) {
        uint64_t v91 = 2;
      }
      if (v18) {
        uint64_t v92 = v91;
      }
      else {
        uint64_t v92 = 0;
      }
      goto LABEL_52;
    }
  }
LABEL_54:
  id v93 = [v9 audioAnalysisUserDropInAccessLevel];
  uint64_t v94 = [v93 integerValue];

  uint64_t v95 = [v9 audioAnalysisUserDropInAccessLevel];
  if (v95)
  {
    long long v96 = (void *)v95;
    uint64_t v97 = [(HMDUser *)v18 audioAnalysisUserDropInAccessLevel];

    if (v94 != v97)
    {
      id v98 = (void *)MEMORY[0x1D9452090]();
      id v99 = v18;
      long long v100 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
      {
        long long v101 = HMFGetLogIdentifier();
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](v99, "audioAnalysisUserDropInAccessLevel"));
        long long v102 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        long long v103 = [NSNumber numberWithUnsignedInteger:v94];
        *(_DWORD *)buf = 138543874;
        v159 = v101;
        __int16 v160 = 2112;
        v161 = v102;
        __int16 v162 = 2112;
        v163 = v103;
        _os_log_impl(&dword_1D49D5000, v100, OS_LOG_TYPE_INFO, "%{public}@Updating audio analysis user Dropin value from %@ to %@", buf, 0x20u);
      }
      [(HMDUser *)v99 setAudioAnalysisUserDropInAccessLevel:v94];
    }
  }
  uint64_t v104 = [v9 matterCASEAuthenticatedTagID];
  if (v104)
  {
    uint64_t v105 = (void *)v104;
    uint64_t v106 = [v9 matterCASEAuthenticatedTagID];
    if ([v106 integerValue])
    {
      id v107 = [v9 matterCASEAuthenticatedTagID];
      id v108 = [(HMDUser *)v18 matterCASEAuthenticatedTagID];
      char v109 = [v107 isEqual:v108];

      if ((v109 & 1) == 0)
      {
        id v110 = (void *)MEMORY[0x1D9452090]();
        id v111 = v18;
        id v112 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
        {
          v113 = HMFGetLogIdentifier();
          v148 = [(HMDUser *)v111 matterCASEAuthenticatedTagID];
          uint64_t v114 = [v148 integerValue];
          v115 = [(HMDUser *)v111 matterCASEAuthenticatedTagID];
          [v9 matterCASEAuthenticatedTagID];
          v116 = id v150 = v8;
          uint64_t v117 = [v116 integerValue];
          [v9 matterCASEAuthenticatedTagID];
          id v118 = v149 = v110;
          *(_DWORD *)buf = 138544642;
          v159 = v113;
          __int16 v160 = 2048;
          v161 = (HMDUser *)v114;
          __int16 v162 = 2112;
          v163 = v115;
          __int16 v164 = 2048;
          uint64_t v165 = v117;
          __int16 v166 = 2112;
          v167 = v118;
          __int16 v168 = 2112;
          v169 = v111;
          _os_log_impl(&dword_1D49D5000, v112, OS_LOG_TYPE_INFO, "%{public}@Updating CATID from 0x%lX (%@) to 0x%lX (%@) for user %@", buf, 0x3Eu);

          id v110 = v149;
          id v8 = v150;
        }
        __int16 v119 = [v9 matterCASEAuthenticatedTagID];
        [(HMDUser *)v111 setMatterCASEAuthenticatedTagID:v119];

        [(HMDUser *)v111 handleUpdatedCATForUser];
      }
    }
    else
    {
    }
  }
  v120 = [v9 setProperties];
  int v121 = [v120 containsObject:@"presenceAuthorizationStatus"];

  if (v121)
  {
    uint64_t v122 = (void *)MEMORY[0x1E4F2EBC0];
    v123 = [v9 presenceAuthorizationStatus];
    v124 = [v122 authWithNumber:v123];

    if (isPresenceAuthorizationValid())
    {
      v125 = [(HMDUser *)v18 presenceAuthStatus];
      char v126 = HMFEqualObjects();

      if ((v126 & 1) == 0)
      {
        v127 = (void *)MEMORY[0x1D9452090]();
        v128 = v18;
        v129 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
        {
          v130 = HMFGetLogIdentifier();
          [(HMDUser *)v128 presenceAuthStatus];
          id v131 = v8;
          v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v159 = v130;
          __int16 v160 = 2112;
          v161 = v128;
          __int16 v162 = 2112;
          v163 = v132;
          __int16 v164 = 2112;
          uint64_t v165 = (uint64_t)v124;
          _os_log_impl(&dword_1D49D5000, v129, OS_LOG_TYPE_INFO, "%{public}@Updating the presence auth status for user %@ from %@ to %@", buf, 0x2Au);

          id v8 = v131;
        }

        [(HMDUser *)v128 setPresenceAuthStatus:v124];
      }
    }
    else
    {
      v133 = (void *)MEMORY[0x1D9452090]();
      v134 = v18;
      v135 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
      {
        v136 = HMFGetLogIdentifier();
        [v9 presenceAuthorizationStatus];
        id v137 = v8;
        v138 = (HMDUser *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v159 = v136;
        __int16 v160 = 2112;
        v161 = v138;
        _os_log_impl(&dword_1D49D5000, v135, OS_LOG_TYPE_INFO, "%{public}@Ignoring the value for presence auth in user model: %@", buf, 0x16u);

        id v8 = v137;
      }
    }
  }
  v139 = [v154 transactionResult];
  v140 = [v9 pairingIdentity];

  if (v140)
  {
    v141 = (void *)MEMORY[0x1E4F5BE00];
    v142 = [v9 pairingIdentity];
    v143 = objc_msgSend(v141, "hmd_pairingIdentityWithDictionary:", v142);

    v144 = [(HMDUser *)v18 pairingIdentity];
    char v145 = HMFEqualObjects();

    if ((v145 & 1) == 0) {
      [(HMDUser *)v18 setPairingIdentity:v143];
    }
  }
  [v139 markChanged];
  v146 = [v152 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__HMDUser__transactionUserUpdated_newValues_message___block_invoke;
  block[3] = &unk_1E6A197C8;
  id v156 = v154;
  id v157 = 0;
  id v147 = v154;
  dispatch_group_notify(group, v146, block);
}

- (uint64_t)announceUserAccessLevelFromAnnounceAccessAllowed:(void *)a3 announceAccessLevel:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
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
  uint64_t v52 = *MEMORY[0x1E4F143B8];
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
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id v15 = v17;

    if (v15)
    {
      id v18 = [(HMDUser *)self assistantAccessControl];

      if (v18)
      {
        id v19 = [(HMDUser *)self assistantAccessControl];
        [v19 transactionObjectUpdated:v8 newValues:v16 message:v10];

        goto LABEL_44;
      }
      uint64_t v22 = [[HMDAssistantAccessControl alloc] initWithUser:self model:v15];
      if (v22) {
        [(HMDUser *)self setAssistantAccessControl:v22];
      }
LABEL_43:

      goto LABEL_44;
    }
    id v20 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    uint64_t v22 = v21;

    if (!v22)
    {
      id v31 = [(HMDUser *)self home];
      id v32 = v20;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v33 = v32;
      }
      else {
        id v33 = 0;
      }
      id v34 = v33;

      id v35 = v31;
      if (v34)
      {
        id v36 = [v31 accessCodeManager];
        id v37 = [v36 dataManager];

        if (v37)
        {
          [v37 handleUpdatedUserAccessCodeModel:v34 forUser:self message:v10];
        }
        else
        {
          id v41 = (void *)MEMORY[0x1D9452090]();
          id v46 = self;
          id v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v43 = id v45 = v41;
            *(_DWORD *)buf = 138543362;
            uint64_t v49 = v43;
            _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Not handling updated HMDUserAccessCodeModel because self.home.accessCodeManager.dataManager is nil.", buf, 0xCu);

            id v41 = v45;
          }

          id v44 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
          [v10 respondWithError:v44];
        }
        id v35 = v31;
      }
      uint64_t v22 = 0;
      goto LABEL_43;
    }
    if (isWatch())
    {
      BOOL v23 = [(HMDUser *)self isCurrentUser];
      uint64_t v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = self;
      char v26 = HMFGetOSLogHandle();
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if (v23)
      {
        if (v27)
        {
          HMFGetLogIdentifier();
          uint64_t v28 = v47 = v24;
          uint64_t v29 = [(HMDAssistantAccessControl *)v22 announceNotificationModeForCurrentDevice];
          *(_DWORD *)buf = 138543618;
          uint64_t v49 = v28;
          __int16 v50 = 2112;
          uint64_t v51 = v29;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Updated announce notification settings for watch to %@", buf, 0x16u);

          uint64_t v24 = v47;
        }

        char v30 = [(HMDAssistantAccessControl *)v22 announceNotificationModeForCurrentDevice];
        -[HMDUser setAnnounceNotificationModeForCurrentDevice:](v25, "setAnnounceNotificationModeForCurrentDevice:", [v30 unsignedIntegerValue]);

        [v10 respondWithSuccess];
        goto LABEL_43;
      }
      if (!v27) {
        goto LABEL_37;
      }
      uint64_t v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v38;
      id v39 = "%{public}@Ignoring announce settings update as it is not for the current user";
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = self;
      char v26 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
LABEL_37:

        id v40 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
        [v10 respondWithError:v40];

        goto LABEL_43;
      }
      uint64_t v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v38;
      id v39 = "%{public}@Ignoring announce settings update as it is not on a watch";
    }
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, v39, buf, 0xCu);

    goto LABEL_37;
  }
  id v13 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  [(HMDUser *)self _transactionUserUpdated:v15 newValues:v12 message:v10];
LABEL_44:
}

- (void)_encodeWithCoder:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUser *)self home];
  id v6 = [(HMDUser *)self uuid];
  id v7 = [v6 UUIDString];
  [v4 encodeObject:v7 forKey:@"userUUID"];

  [v4 encodeConditionalObject:v5 forKey:@"home"];
  id v8 = [(HMDUser *)self userDataController];
  [v8 encodeWithCoder:v4];

  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
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
        id v10 = (void *)MEMORY[0x1D9452090]();
        uint64_t v11 = self;
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          id v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v92 = v13;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Display name was nil for non-current user", buf, 0xCu);
        }
        id v14 = [[HMDAssertionLogEvent alloc] initWithReason:@"Display name was nil for non-current user"];
        id v15 = +[HMDMetricsManager sharedLogEventSubmitter];
        [v15 submitLogEvent:v14];

        id v9 = &stru_1F2C9F1A8;
      }
    }
    [v4 encodeObject:v9 forKey:@"userDisplayName"];
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isCurrentUser](self, "isCurrentUser"), @"HM.isCurrentUser");
    if (objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess"))
    {
      int v90 = [(HMDUser *)self pairingIdentity];
      if (v90)
      {
        id v35 = objc_alloc(MEMORY[0x1E4F65508]);
        id v36 = [v90 identifier];
        id v37 = [v90 publicKey];
        uint64_t v38 = (void *)[v35 initWithIdentifier:v36 publicKey:v37 privateKey:0];

        [v4 encodeObject:v38 forKey:*MEMORY[0x1E4F2E310]];
      }
      id v39 = [(HMDUser *)self userDataController];
      id v40 = [v39 mediaContentProfileAccessControlAccessoriesToEncode];

      id v41 = __accessoriesFromAccessoryUUIDs(v40, v5);
      if (v41)
      {
        id v42 = [(HMDUser *)self userDataController];
        int v43 = [v42 isInitialized];

        if (v43)
        {
          id v44 = (void *)[v41 copy];
          [v4 encodeObject:v44 forKey:*MEMORY[0x1E4F2E2E0]];
        }
      }

      id v45 = [(HMDUser *)self userDataController];
      id v46 = [v45 userListeningHistoryUpdateControlModelAccessoriesToEncode];

      if (v46)
      {
        uint64_t v47 = [(HMDUser *)self userDataController];
        int v48 = [v47 isInitialized];

        if (v48) {
          [v4 encodeObject:v46 forKey:*MEMORY[0x1E4F2E2C8]];
        }
      }

      uint64_t v49 = [(HMDUser *)self userID];
      [v4 encodeObject:v49 forKey:@"userID"];

      objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isAdministrator](self, "isAdministrator"), @"isAdminUser");
      objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isOwner](self, "isOwner"), @"HM.isOwnerUser");
      objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"), @"HM.isUserAllowedRemoteAccess");
      __int16 v50 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
      [v4 encodeObject:v50 forKey:*MEMORY[0x1E4F2E268]];

      BOOL v51 = [(HMDUser *)self isAnnounceAccessAllowed];
      [v4 encodeBool:v51 forKey:*MEMORY[0x1E4F2E230]];
      uint64_t v52 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
      [v4 encodeObject:v52 forKey:*MEMORY[0x1E4F2D088]];

      uint64_t v53 = [v5 isAccessToHomeAllowed];
      [v4 encodeBool:v53 forKey:*MEMORY[0x1E4F2D2B8]];
      if ((v53 & 1) == 0)
      {
        uint64_t v54 = [v5 accessNotAllowedReasonCode];
        [v4 encodeInteger:v54 forKey:*MEMORY[0x1E4F2D178]];
      }
      id v55 = [v5 overriddenHomeAccessControl];
      unint64_t v56 = v55;
      if (v55)
      {
        uint64_t v57 = [v55 unsignedIntegerValue];
        [v4 encodeInteger:v57 forKey:*MEMORY[0x1E4F2D170]];
      }
      id v58 = [(HMDUser *)self presenceAuthStatus];
      [v58 addToCoder:v4];

      if ([(HMDUser *)self isCurrentUser])
      {
        unsigned int v59 = [v5 presenceComputeStatus];
        [v59 addToCoder:v4];

        uint64_t v60 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser needsiTunesMultiUserRepair](self, "needsiTunesMultiUserRepair"));
        [v4 encodeObject:v60 forKey:*MEMORY[0x1E4F2E2F8]];
      }
      if ([(HMDUser *)self isOwner])
      {
        uint64_t v61 = [(HMDUser *)self assistantAccessControl];
        [v4 encodeObject:v61 forKey:*MEMORY[0x1E4F2E250]];
      }
      else
      {
        uint64_t v62 = [(HMDUser *)self userDataController];
        uint64_t v61 = [v62 assistantAccessControlAccessoriesToEncode];

        if (v61)
        {
          v63 = __accessoriesFromAccessoryUUIDs(v61, v5);
          BOOL v88 = [v63 count] != 0;
          v64 = objc_msgSend(v63, "na_map:", &__block_literal_global_629);
          objc_msgSend(v63, "na_map:", &__block_literal_global_633);
          int v65 = v89 = v9;
          int v66 = v56;
          v67 = [HMDAssistantAccessControl alloc];
          id v68 = [(HMDUser *)self userDataController];
          uint64_t v69 = [v68 assistantAccessControlActivityNotificationsEnabledForPersonalRequests];
          uint64_t v70 = v67;
          unint64_t v56 = v66;
          v71 = [(HMDAssistantAccessControl *)v70 initWithUser:self appleAccessories:v64 hapAccessoryIdentifiers:v65 enabled:v88 activityNotificationsEnabledForPersonalRequests:v69];

          uint64_t v72 = [(HMDUser *)self userDataController];
          -[HMDAssistantAccessControl setOptions:](v71, "setOptions:", [v72 assistantAccessControlRequiresAuthenticationForSecureRequests] ^ 1);

          [v4 encodeObject:v71 forKey:*MEMORY[0x1E4F2E250]];
          id v9 = v89;
        }
      }

      id v73 = [(HMDUser *)self userDataController];
      uint64_t v74 = [v73 supportsHH2MigrationByOwnerManual];

      [v4 encodeBool:v74 forKey:*MEMORY[0x1E4F2E3C8]];
      if ([(HMDUser *)self isCurrentUser])
      {
        uint64_t v75 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2E668]), "initWithDeviceNotificationMode:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
        [v4 encodeObject:v75 forKey:*MEMORY[0x1E4F2E238]];
      }
      id v76 = [(HMDUser *)self photosPersonDataManager];
      v77 = [v76 settings];
      [v4 encodeObject:v77 forKey:*MEMORY[0x1E4F2E320]];

      v78 = [(HMDUser *)self photosPersonDataManager];
      uint64_t v79 = [v78 zoneUUID];
      [v4 encodeObject:v79 forKey:*MEMORY[0x1E4F2E330]];
    }
    id v80 = [(HMDUser *)self account];
    id v81 = [v80 senderCorrelationIdentifier];

    if (v81 && (objc_msgSend(v4, "hmd_entitlements") & 0x1000) != 0) {
      [v4 encodeObject:v81 forKey:*MEMORY[0x1E4F2E350]];
    }

    goto LABEL_51;
  }
  id v16 = [(HMDUser *)self accountHandle];
  [v4 encodeObject:v16 forKey:@"HM.handle"];

  id v17 = [(HMDUser *)self userID];
  [v4 encodeObject:v17 forKey:@"userID"];

  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    id v18 = [(HMDUser *)self accountIdentifier];
    [v4 encodeObject:v18 forKey:@"HM.accountId"];
  }
  id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser _compatiblePrivilege](self, "_compatiblePrivilege"));
  [v4 encodeObject:v19 forKey:@"userPrivilege"];

  id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser privilege](self, "privilege"));
  [v4 encodeObject:v20 forKey:@"HM.userAdministratorType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HMDUser isRemoteAccessAllowed](self, "isRemoteAccessAllowed"), @"HM.isUserAllowedRemoteAccess");
  id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser camerasAccessLevel](self, "camerasAccessLevel"));
  [v4 encodeObject:v21 forKey:*MEMORY[0x1E4F2E268]];

  BOOL v22 = [(HMDUser *)self isAnnounceAccessAllowed];
  [v4 encodeBool:v22 forKey:*MEMORY[0x1E4F2E230]];
  BOOL v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  [v4 encodeObject:v23 forKey:@"HMDUserAnnounceAccessLevelCodingKey"];

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  [v4 encodeObject:v24 forKey:*MEMORY[0x1E4F2D088]];

  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || (objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteUserAdministrator"))
  {
    id v25 = [(HMDUser *)self presenceAuthStatus];
    [v25 addToCoder:v4];
  }
  char v26 = [(HMDUser *)self encodingRemoteDisplayName];
  [v4 encodeObject:v26 forKey:@"userDisplayName"];

  BOOL v27 = [(HMDUser *)self pairingIdentity];
  uint64_t v28 = [v27 identifier];
  [v4 encodeObject:v28 forKey:@"pairingUsername"];

  uint64_t v29 = [(HMDUser *)self pairingIdentity];
  char v30 = [v29 publicKey];
  id v31 = [v30 data];
  [v4 encodeObject:v31 forKey:@"userPublicKey"];

  id v32 = [(HMDUser *)self pairingIdentity];
  [v4 encodeObject:v32 forKey:*MEMORY[0x1E4F2E310]];

  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount"))
  {
    id v33 = [(HMDUser *)self assistantAccessControl];
    [v4 encodeObject:v33 forKey:*MEMORY[0x1E4F2E250]];
  }
  if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || (objc_msgSend(v4, "hmd_isForRemoteUserAdministrator") & 1) != 0)
  {
LABEL_50:
    uint64_t v83 = [(HMDUser *)self accessCode];
    [v4 encodeObject:v83 forKey:@"HMDUserAccessCodeCodingKey"];

    id v9 = [(HMDUser *)self accessCodeChangedByUserUUID];
    [v4 encodeObject:v9 forKey:@"HMDUserAccessCodeChangedByUserUUIDCodingKey"];
LABEL_51:

    goto LABEL_52;
  }
  id v34 = objc_msgSend(v4, "hmd_user");
  if ([(HMDUser *)self isEqual:v34])
  {

    goto LABEL_50;
  }
  int v82 = objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount");

  if (v82) {
    goto LABEL_50;
  }
LABEL_52:
  long long v84 = [(HMDUser *)self matterCASEAuthenticatedTagID];
  [v4 encodeObject:v84 forKey:@"HMDUserMatterCATIDCodingKey"];

  if (objc_msgSend(v4, "hmd_isForLocalStore"))
  {
    uint64_t v85 = [(HMDUser *)self cloudShareID];
    [v4 encodeObject:v85 forKey:@"HMDUserCloudShareIDCodingKey"];

    if ([(HMDUser *)self isCurrentUser])
    {
      long long v86 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUser needsiTunesMultiUserRepair](self, "needsiTunesMultiUserRepair"));
      [v4 encodeObject:v86 forKey:*MEMORY[0x1E4F2E2F8]];
    }
  }
  if ([(HMDUser *)self isCurrentUser]
    && ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
     || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") && isiOSDevice()))
  {
    long long v87 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2E668]), "initWithDeviceNotificationMode:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
    [v4 encodeObject:v87 forKey:*MEMORY[0x1E4F2E238]];
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
  id v4 = (void *)MEMORY[0x1D9452090]();
  [(HMDUser *)self _encodeWithCoder:v5];
}

- (id)_initWithCoder:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class() || ![v4 decodeBoolForKey:@"userIsRemoteGateway"])
  {
    if ([v4 containsValueForKey:@"HM.handle"])
    {
      id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.handle"];
    }
    else
    {
      id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
      if (v8)
      {
        id v7 = +[HMDAccountHandle accountHandleForDestination:v8];
      }
      else
      {
        id v7 = 0;
      }
    }
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.userAdministratorType"];
    uint64_t v70 = v9;
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
    uint64_t v13 = *MEMORY[0x1E4F2E310];
    if ([v4 containsValueForKey:*MEMORY[0x1E4F2E310]])
    {
      id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v13];
    }
    else
    {
      id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingUsername"];
      id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userPublicKey"];
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v16];
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F5BE00]) initWithIdentifier:v15 publicKey:v17 privateKey:0 permissions:(v10 & 0xFFFFFFFFFFFFFFFDLL) == 1];
    }
    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    id v19 = [(HMDUser *)self initWithAccountHandle:v7 home:v18 pairingIdentity:v14 privilege:2];
    if (!v19)
    {
LABEL_55:
      self = v19;

      id v6 = (HMDResidentUser *)self;
      goto LABEL_56;
    }
    id v68 = v14;
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserCloudShareIDCodingKey"];
    cloudShareID = v19->_cloudShareID;
    v19->_cloudShareID = (HMBShareUserID *)v20;

    uint64_t v69 = v7;
    if (v19->_cloudShareID)
    {
      BOOL v22 = (void *)MEMORY[0x1D9452090]();
      BOOL v23 = v19;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v72 = v25;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@User has decoded their cloud share id and is cloud share ready", buf, 0xCu);
      }
      [v23[20] finishWithResult:v19->_cloudShareID];
    }
    v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userUUID"];
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v67];
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.userAdministratorType"];
    uint64_t v29 = v28;
    if (v28)
    {
      v19->_unint64_t privilege = [v28 integerValue];
    }
    else
    {
      char v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userPrivilege"];
      uint64_t v31 = [v30 integerValue];
      uint64_t v32 = 3;
      if (v31 != 1) {
        uint64_t v32 = v31;
      }
      v19->_unint64_t privilege = v32;
    }
    v19->_unint64_t privilege = v10;
    if ([v4 containsValueForKey:@"userDisplayName"])
    {
      uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDisplayName"];
      displayName = v19->_displayName;
      v19->_displayName = (NSString *)v33;
    }
    id v35 = [(HMDUser *)v19 userID];
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
        v19->_BOOL remoteAccessAllowed = v41;
        uint64_t v42 = [MEMORY[0x1E4F2EBC0] authWithCoder:v4];
        presenceAuthStatus = v19->_presenceAuthStatus;
        v19->_presenceAuthStatus = (HMUserPresenceAuthorization *)v42;

        id v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E268]];
        id v45 = v44;
        if (v44) {
          v19->_camerasAccessLevel = [v44 integerValue];
        }
        uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E250]];
        assistantAccessControl = v19->_assistantAccessControl;
        v19->_assistantAccessControl = (HMDAssistantAccessControl *)v46;

        uint64_t v48 = *MEMORY[0x1E4F2E230];
        id v49 = v4;
        uint64_t v50 = [v49 decodeBoolForKey:v48];
        BOOL v51 = [NSNumber numberWithBool:v50];
        uint64_t v52 = [v49 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserAnnounceAccessLevelCodingKey"];

        uint64_t v53 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v19, v51, v52);
        v19->_announceAccessLevel = v53;
        uint64_t v54 = [v49 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2D088]];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v55 = v54;
        }
        else {
          id v55 = 0;
        }
        id v56 = v55;

        uint64_t v57 = [v56 integerValue];
        v19->_audioAnalysisUserDropInAccessLevel = v57;
        if ([(HMDUser *)v19 isCurrentUser]
          && ((objc_msgSend(v49, "hmd_isForLocalStore") & 1) != 0
           || isWatch() && objc_msgSend(v49, "hmd_isForRemoteTransportOnSameAccount")))
        {
          id v58 = [v49 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E238]];
          v19->_announceNotificationModeForCurrentDevice = [v58 deviceNotificationMode];
        }
        unsigned int v59 = [v49 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2E2F8]];
        v19->_needsiTunesMultiUserRepair = [v59 BOOLValue];

        id v14 = v68;
        if ([v49 containsValueForKey:@"HMDUserAccessCodeCodingKey"])
        {
          uint64_t v60 = [v49 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserAccessCodeCodingKey"];
          accessCode = v19->_accessCode;
          v19->_accessCode = (NSString *)v60;
        }
        if ([v49 containsValueForKey:@"HMDUserAccessCodeChangedByUserUUIDCodingKey"])
        {
          uint64_t v62 = [v49 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserAccessCodeChangedByUserUUIDCodingKey"];
          accessCodeChangedByUserUUID = v19->_accessCodeChangedByUserUUID;
          v19->_accessCodeChangedByUserUUID = (NSUUID *)v62;
        }
        if ([v49 containsValueForKey:@"HMDUserMatterCATIDCodingKey"])
        {
          uint64_t v64 = [v49 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserMatterCATIDCodingKey"];
          matterCASEAuthenticatedTagID = v19->_matterCASEAuthenticatedTagID;
          v19->_matterCASEAuthenticatedTagID = (NSNumber *)v64;
        }
        id v7 = v69;
        goto LABEL_55;
      }
    }
    uint64_t v37 = __displayNameForUser(v19);
    uint64_t v38 = v19->_displayName;
    v19->_displayName = (NSString *)v37;

    goto LABEL_35;
  }
  id v6 = [[HMDResidentUser alloc] initWithCoder:v4];
LABEL_56:

  return v6;
}

+ (id)userDictionaryWithUserID:(id)a3 privilege:(unint64_t)a4 remoteAccessAllowed:(BOOL)a5 cameraAccessLevel:(unint64_t)a6 announceAccessAllowed:(id)a7 announceAccessLevel:(unint64_t)a8 audioAnalysisUserDropInAccessLevel:(unint64_t)a9
{
  BOOL v11 = a5;
  id v14 = a7;
  id v15 = (void *)MEMORY[0x1E4F1CA60];
  id v16 = a3;
  id v17 = [v15 dictionary];
  [v17 setObject:v16 forKeyedSubscript:@"userID"];

  id v18 = [NSNumber numberWithUnsignedInteger:a4];
  [v17 setObject:v18 forKeyedSubscript:@"HM.userAdministratorType"];

  id v19 = [NSNumber numberWithBool:v11];
  [v17 setObject:v19 forKeyedSubscript:@"HM.isUserAllowedRemoteAccess"];

  uint64_t v20 = [NSNumber numberWithUnsignedInteger:a6];
  [v17 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F2E268]];

  id v21 = [NSNumber numberWithUnsignedInteger:a8];
  [v17 setObject:v21 forKeyedSubscript:@"HMDUserAnnounceAccessLevelCodingKey"];

  BOOL v22 = [NSNumber numberWithUnsignedInteger:a9];
  [v17 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F2D088]];

  if (v14) {
    [v17 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F2E230]];
  }
  BOOL v23 = (void *)[v17 copy];

  return v23;
}

+ (HMDUser)userWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_stringForKey:", @"userID");
  if (v8)
  {
    uint64_t v9 = [a1 privilegeFromDictionary:v6];
    uint64_t v10 = objc_msgSend(v6, "hmf_numberForKey:", @"HM.isUserAllowedRemoteAccess");
    BOOL v11 = +[HMDAccountHandleFormatter defaultFormatter];
    uint64_t v12 = [v11 accountHandleFromString:v8];

    uint64_t v13 = [[HMDUser alloc] initWithAccountHandle:v12 home:v7 pairingIdentity:0 privilege:v9];
    id v14 = __displayNameForUser(v13);
    [(HMDUser *)v13 setDisplayName:v14];

    uint64_t v28 = v10;
    -[HMDUser setRemoteAccessAllowed:](v13, "setRemoteAccessAllowed:", [v10 BOOLValue]);
    id v15 = objc_msgSend(v6, "hmf_numberForKey:", *MEMORY[0x1E4F2E268]);
    id v16 = v15;
    if (v15) {
      -[HMDUser setCamerasAccessLevel:](v13, "setCamerasAccessLevel:", [v15 integerValue]);
    }
    id v17 = v7;
    if (v13)
    {
      uint64_t v18 = *MEMORY[0x1E4F2E230];
      id v19 = v6;
      uint64_t v20 = objc_msgSend(v19, "hmf_numberForKey:", v18);
      id v21 = objc_msgSend(v19, "hmf_numberForKey:", @"HMDUserAnnounceAccessLevelCodingKey");

      uint64_t v22 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:]((uint64_t)v13, v20, v21);
    }
    else
    {
      uint64_t v22 = 0;
    }
    [(HMDUser *)v13 setAnnounceAccessLevel:v22];

    id v7 = v17;
  }
  else
  {
    BOOL v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = a1;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      char v30 = v26;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot create user from dictionary because userID is not given", buf, 0xCu);
    }
    uint64_t v13 = 0;
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
  if (logCategory__hmf_once_t133 != -1) {
    dispatch_once(&logCategory__hmf_once_t133, &__block_literal_global_603);
  }
  id v2 = (void *)logCategory__hmf_once_v134;
  return v2;
}

uint64_t __22__HMDUser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v134;
  logCategory__hmf_once_v134 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
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
  v42[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v12)
  {
    uint64_t v15 = [v12 copy];
LABEL_3:
    id v16 = (void *)v15;
    goto LABEL_11;
  }
  id v17 = [v13 identifier];

  if (v11 && v17)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F29128];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"05A41D49-2A4D-4D9E-8A3E-43A779B973BA"];
    uint64_t v20 = [v11 UUIDString];
    v42[0] = v20;
    id v21 = [v14 identifier];
    v42[1] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    id v16 = objc_msgSend(v18, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v19, 0, v22);
  }
  else
  {
    BOOL v23 = (void *)MEMORY[0x1E4F29128];
    if (!v10 || !v11)
    {
      uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
      goto LABEL_3;
    }
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"05A41D49-2A4D-4D9E-8A3E-43A779B973BA"];
    uint64_t v20 = [v11 UUIDString];
    v41[0] = v20;
    v41[1] = v10;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    id v16 = objc_msgSend(v23, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v19, 0, v21);
  }

LABEL_11:
  id v24 = (void *)MEMORY[0x1D9452090]();
  id v25 = a1;
  uint64_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    BOOL v27 = HMFGetLogIdentifier();
    int v29 = 138544642;
    char v30 = v27;
    __int16 v31 = 2112;
    uint64_t v32 = v16;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2112;
    id v36 = v11;
    __int16 v37 = 2112;
    id v38 = v12;
    __int16 v39 = 2112;
    id v40 = v14;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Created user UUID: %@ from userID: %@ homeUUID: %@ uuid: %@ pairingIdentity: %@", (uint8_t *)&v29, 0x3Eu);
  }

  return v16;
}

+ (id)ownerWithUserID:(id)a3 home:(id)a4 pairingIdentity:(id)a5 homeManager:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v29 = 0;
  id v14 = [v13 getOrCreateLocalPairingIdentity:&v29];
  id v15 = v29;
  if (v14)
  {
    if (v10 && v12 && ![v14 isEqual:v12])
    {
      uint64_t v22 = +[HMDAccountHandleFormatter defaultFormatter];
      uint64_t v28 = [v22 accountHandleFromString:v10];

      id v23 = objc_alloc(MEMORY[0x1E4F5BE00]);
      id v24 = [v12 identifier];
      id v25 = [v12 publicKey];
      uint64_t v26 = (void *)[v23 initWithIdentifier:v24 publicKey:v25 privateKey:0 permissions:1];

      id v17 = (HMDAssistantAccessControl *)v28;
      id v16 = (void *)[objc_alloc((Class)a1) initWithAccountHandle:v28 home:v11 pairingIdentity:v26 privilege:3];
    }
    else
    {
      id v16 = [a1 currentUserWithPrivilege:3 forHome:v11];
      id v17 = [[HMDAssistantAccessControl alloc] initWithUser:v16];
      [v16 setAssistantAccessControl:v17];
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = a1;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v21;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current user from keychain with error: %@", buf, 0x16u);
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = +[HMDAppleAccountManager sharedManager];
  uint64_t v9 = [v8 account];
  id v10 = [v9 primaryHandle];

  id v11 = [MEMORY[0x1E4F5BE48] systemStore];
  id v12 = getCurrentPairingIdentityWithPrivilege(a3, v11);

  if (v12)
  {
    id v13 = (void *)[objc_alloc((Class)a1) initWithAccountHandle:v10 home:v7 pairingIdentity:v12 privilege:a3];
    [v13 refreshDisplayName];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = a1;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current user from keychain with error: %@", (uint8_t *)&v19, 0x16u);
    }
    id v13 = 0;
  }

  return v13;
}

- (HMDUser)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = (HMDUser *)[(HMDUser *)self _initWithCoder:v4];

  return v6;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMDUser *)self messageTargetUUID];
  unint64_t v5 = (void *)[v3 initWithTarget:v4];

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
    unint64_t v5 = [v4 accountHandleFromString:v6];

    if (v5) {
      [(HMDUser *)self setAccountHandle:v5];
    }
  }
  else
  {
    [(HMDUser *)self setAccountHandle:0];
  }
}

- (NSNumber)uniqueIDForAccessories
{
  return 0;
}

- (NSNumber)notificationContextNFCIdentifier
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUser *)self nfcIssuerKeyIdentifier];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = (unsigned int *)[v3 bytes];
    id v6 = [NSNumber numberWithUnsignedInt:*v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@NFC issuer key identifier for user is nil", (uint8_t *)&v12, 0xCu);
    }
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)notificationContextHAPIdentifier
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = 0;
  id v2 = [(HMDUser *)self uuid];
  [v2 getUUIDBytes:v5];

  id v3 = [NSNumber numberWithUnsignedInt:LODWORD(v5[0])];
  return (NSNumber *)v3;
}

- (void)configurePersonSettingsManager
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(HMDUser *)self isCurrentUser])
  {
    id v3 = [(HMDUser *)self home];
    id v4 = (void *)MEMORY[0x1D9452090]();
    unint64_t v5 = self;
    id v6 = HMFGetOSLogHandle();
    id v7 = v6;
    if (v3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier();
        int v15 = 138543362;
        id v16 = v8;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating the person settings manager", (uint8_t *)&v15, 0xCu);
      }
      uint64_t v9 = [HMDPersonSettingsManager alloc];
      id v10 = [(HMDUser *)v5 privateBackingStoreController];
      id v11 = [v10 localZone];
      int v12 = [(HMDPersonSettingsManager *)v9 initWithHome:v3 localZone:v11 workQueue:v5->_queue];
      [(HMDUser *)v5 setPersonSettingsManager:v12];

      id v13 = [(HMDUser *)v5 personSettingsManager];
      [v13 configure];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v15 = 138543362;
        id v16 = v14;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Not creating person settings manager because home reference is nil", (uint8_t *)&v15, 0xCu);
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
     || [(HMDUser *)self isCurrentUser]))
  {
    id v3 = [HMDUserPhotosPersonDataManager alloc];
    id v4 = [(HMDUser *)self messageDispatcher];
    unint64_t v5 = [(HMDUser *)self sharedBackingStoreController];
    id v6 = [v5 localZone];
    id v7 = [(HMDUserPhotosPersonDataManager *)v3 initWithUser:self messageDispatcher:v4 localZone:v6 workQueue:self->_queue];
    [(HMDUser *)self setPhotosPersonDataManager:v7];

    id v8 = [(HMDUser *)self photosPersonDataManager];
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
  id v4 = v3;
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

- (void)saveSyncDataToLocalDisk:(id)a3
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUser *)self home];
  if (v5)
  {
    id v6 = [(HMDUser *)self userID];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      v35[0] = @"HMD.sync.data.homeUUID";
      id v8 = [v5 uuid];
      id v9 = [v8 UUIDString];
      v36[0] = v9;
      v36[1] = self;
      v35[1] = @"HMD.sync.data.user";
      v35[2] = @"HMD.sync.data.timestamp";
      id v10 = [MEMORY[0x1E4F1C9C8] now];
      v35[3] = @"HMD.sync.data.data";
      v36[2] = v10;
      v36[3] = v4;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];

      int v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        char v30 = v15;
        __int16 v31 = 2112;
        __int16 v32 = v11;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Storing sync data for for user: %@", buf, 0x16u);
      }
      id v16 = encodeRootObject();
      if (v16)
      {
        uint64_t v17 = [v5 uuid];
        uint64_t v18 = [(HMDUser *)v13 syncDataFileNameWithHomeUUID:v17];

        int v19 = +[HMDPersistentStore writeData:v16 toStorePath:v18 dataLabel:@"SyncData"];
        uint64_t v20 = (void *)MEMORY[0x1D9452090]();
        __int16 v21 = v13;
        uint64_t v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v23 = v28 = v7;
          *(_DWORD *)buf = 138543874;
          char v30 = v23;
          __int16 v31 = 2112;
          __int16 v32 = v19;
          __int16 v33 = 2112;
          uint64_t v34 = v18;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Stored [%@] bytes to [%@]", buf, 0x20u);

          id v7 = v28;
        }
      }
      else
      {
        id v24 = (void *)MEMORY[0x1D9452090]();
        id v25 = v13;
        uint64_t v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          BOOL v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          char v30 = v27;
          __int16 v31 = 2112;
          __int16 v32 = v11;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nothing to store as there is no data after archiving %@", buf, 0x16u);
        }
      }
    }
  }
}

- (id)syncDataFileNameWithHomeUUID:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = (id)hh1ToHH2PerDeviceMigrationDirectoryPath;
  id v7 = [(HMDUser *)self uuid];
  id v8 = [v4 stringWithFormat:@"%@/HMDUser-Sync-Data-%@-%@.plist", v6, v5, v7];

  return v8;
}

- (id)announceNotificationFileName
{
  id v3 = [(HMDUser *)self uuid];
  id v4 = [(HMDUser *)self announceNotificationFileNameForUserUUID:v3];

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

- (void)savePersonClassificationSettingsForCurrentUserToLocalDisk
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(HMDUser *)self isCurrentUser])
  {
    id v3 = [(HMDUser *)self personSettingsManager];
    id v4 = v3;
    if (v3)
    {
      [v3 savePersonManagerSettingsToLocalDiskForMigration];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = HMFGetLogIdentifier();
        int v13 = 138543362;
        uint64_t v14 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@No person settings manager. Not storing person classification settings to local disk", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Not a current user. Not storing person classification settings to local disk", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)saveAnnounceNotificationModeForCurrentUserToLocalDisk
{
  v30[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDUser *)self isCurrentUser];
  id v4 = (void *)MEMORY[0x1D9452090]();
  if (v3)
  {
    id v29 = @"HMD.announce.notification.mode";
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceNotificationModeForCurrentDevice](self, "announceNotificationModeForCurrentDevice"));
    v30[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v23 = 138543618;
      id v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Storing announce notification mode for user:[%@]", (uint8_t *)&v23, 0x16u);
    }
    id v11 = [objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v11 encodeObject:v6 forKey:*MEMORY[0x1E4F284E8]];
    [v11 finishEncoding];
    int v12 = [v11 encodedData];
    if (v12)
    {
      int v13 = [(HMDUser *)v8 announceNotificationFileName];
      uint64_t v14 = +[HMDPersistentStore writeData:v12 toStorePath:v13 dataLabel:@"AnnounceNotificationModeSettings"];
      uint64_t v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = v8;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v23 = 138543874;
        id v24 = v18;
        __int16 v25 = 2112;
        uint64_t v26 = v14;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Stored [%@] bytes to [%@]", (uint8_t *)&v23, 0x20u);
      }
    }
    else
    {
      int v19 = (void *)MEMORY[0x1D9452090]();
      uint64_t v20 = v8;
      __int16 v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        int v23 = 138543618;
        id v24 = v22;
        __int16 v25 = 2112;
        uint64_t v26 = v6;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nothing to store as there is no data after archiving %@", (uint8_t *)&v23, 0x16u);
      }
    }
    goto LABEL_13;
  }
  id v6 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    int v23 = 138543362;
    id v24 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Not a current user. Not storing announce notification mode to local disk", (uint8_t *)&v23, 0xCu);
LABEL_13:
  }
}

- (void)_updateAnnounceNotificationMode:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDUser *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(HMDUser *)self isCurrentUser];
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceNotificationModeForCurrentDevice](v8, "announceNotificationModeForCurrentDevice"));
      int v13 = [NSNumber numberWithUnsignedInteger:a3];
      int v19 = 138543874;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating Announce Setting from %@ to %@", (uint8_t *)&v19, 0x20u);
    }
    if ([(HMDUser *)v8 announceNotificationModeForCurrentDevice] != a3)
    {
      [(HMDUser *)v8 setAnnounceNotificationModeForCurrentDevice:a3];
      uint64_t v14 = [(HMDUser *)v8 home];
      uint64_t v15 = *MEMORY[0x1E4F2E240];
      [v14 saveToCurrentAccountWithReason:*MEMORY[0x1E4F2E240]];
      id v16 = [v14 homeManager];
      uint64_t v17 = [(HMDUser *)v8 uuid];
      [v16 updateGenerationCounterWithReason:v15 sourceUUID:v17 shouldNotifyClients:1];
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v18;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Announce settings can only be updated on current user", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)updateAnnounceNotificationMode:(unint64_t)a3
{
  id v5 = [(HMDUser *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __42__HMDUser_updateAnnounceNotificationMode___block_invoke;
  v6[3] = &unk_1E6A189D0;
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUser *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDUser *)self isCurrentUser])
  {
    uint64_t v6 = *MEMORY[0x1E4F2E238];
    uint64_t v20 = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    id v8 = [v4 unarchivedObjectForKey:v6 ofClasses:v7];

    if (v8)
    {
      -[HMDUser _updateAnnounceNotificationMode:](self, "_updateAnnounceNotificationMode:", [v8 deviceNotificationMode]);
      [v4 respondWithSuccess];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1D9452090]();
      uint64_t v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        uint64_t v18 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v17;
        __int16 v23 = 2112;
        id v24 = v18;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing announce user settings in message payload: %@", buf, 0x16u);
      }
      int v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Missing announce settings" reason:@"Need announce settings in message" suggestion:0];
      [v4 respondWithError:v19];

      id v8 = 0;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      int v13 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Announce settings can only be updated on current user: %@", buf, 0x16u);
    }
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:@"This can only be set for the user's devices." reason:@"Announce notifications are only delivered on devices the user owns." suggestion:0];
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
  id v9 = v6;

  if (v9)
  {
    id v7 = [(HMDUser *)self userDataController];
    id v8 = [v9 uuid];
    [v7 handleRemovedAccessory:v8];
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
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HMDUser_enableUserListeningHistoryForAccessory___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__HMDUser_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userDataController];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) userDataController];
    [v3 enableUserListeningHistoryForAccessory:*(void *)(a1 + 40)];
  }
}

- (void)_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUser *)self home];
  id v6 = v5;
  if (v5
    && ([v5 homeManager],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 homes],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 containsObject:v6],
        v8,
        v7,
        (v9 & 1) != 0))
  {
    if ([(HMDUser *)self isCurrentUser])
    {
      id v10 = [v4 arrayForKey:*MEMORY[0x1E4F2E2D0]];
      id v11 = v10;
      if (v10)
      {
        id v44 = v4;
        int v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
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
              uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v47 + 1) + 8 * i)];
              [v12 addObject:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
          }
          while (v15);
        }

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __73__HMDUser__handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke;
        aBlock[3] = &unk_1E6A197F0;
        id v4 = v44;
        id v19 = v44;
        uint64_t v46 = (void (**)(void, void, void))v19;
        uint64_t v20 = _Block_copy(aBlock);
        __int16 v21 = [(HMDUser *)self userDataController];

        if (v21)
        {
          uint64_t v22 = [(HMDUser *)self userDataController];
          [v22 handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:v12 completion:v20];
        }
        else
        {
          id v40 = (void *)MEMORY[0x1D9452090]();
          char v41 = self;
          uint64_t v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            int v43 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            uint64_t v53 = v43;
            _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);
          }
          uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"User data controller not found" reason:@"No settings for this user" suggestion:0];
          [v19 respondWithError:v22];
        }

        __int16 v39 = v46;
      }
      else
      {
        __int16 v33 = (void *)MEMORY[0x1D9452090]();
        uint64_t v34 = self;
        __int16 v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          id v36 = HMFGetLogIdentifier();
          __int16 v37 = [v4 messagePayload];
          *(_DWORD *)buf = 138543618;
          uint64_t v53 = v36;
          __int16 v54 = 2112;
          id v55 = v37;
          _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Missing user update listening history control accessories in message payload: %@", buf, 0x16u);
        }
        int v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Missing access control accessories" reason:@"Need access control accessories in message" suggestion:0];
        id v38 = [v4 responseHandler];

        if (!v38) {
          goto LABEL_31;
        }
        __int16 v39 = [v4 responseHandler];
        ((void (**)(void, void *, void))v39)[2](v39, v12, 0);
      }

LABEL_31:
      goto LABEL_18;
    }
    id v29 = (void *)MEMORY[0x1D9452090]();
    char v30 = self;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v53 = v32;
      __int16 v54 = 2112;
      id v55 = v4;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Can only modify own ULH control: %@", buf, 0x16u);
    }
    __int16 v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = 2028;
  }
  else
  {
    __int16 v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v53 = v26;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Not processing user listening history update since the homes mismatch.", buf, 0xCu);
    }
    __int16 v27 = (void *)MEMORY[0x1E4F28C58];
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
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__HMDUser_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
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
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUser *)self home];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 homeManager];
    id v8 = [v7 homes];
    char v9 = [v8 containsObject:v6];

    if (v9)
    {
      if (![(HMDUser *)self isCurrentUser])
      {
        __int16 v27 = (void *)MEMORY[0x1D9452090]();
        uint64_t v28 = self;
        id v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          char v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          BOOL v51 = v30;
          __int16 v52 = 2112;
          id v53 = v4;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Can only modify own Media Profile Content control: %@", buf, 0x16u);
        }
        id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
        [v4 respondWithError:v11];
        goto LABEL_30;
      }
      id v10 = [v4 arrayForKey:*MEMORY[0x1E4F2E2E8]];
      id v11 = v10;
      if (v10)
      {
        int v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v42 = v11;
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
              uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v45 + 1) + 8 * i)];
              [v12 addObject:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v49 count:16];
          }
          while (v15);
        }

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__HMDUser__handleMediaContentProfileAccessControlUpdate___block_invoke;
        aBlock[3] = &unk_1E6A197F0;
        id v19 = v4;
        id v44 = (void (**)(void, void, void))v19;
        uint64_t v20 = _Block_copy(aBlock);
        __int16 v21 = [(HMDUser *)self userDataController];

        if (v21)
        {
          uint64_t v22 = [(HMDUser *)self userDataController];
          [v22 handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:v12 completion:v20];
        }
        else
        {
          id v38 = (void *)MEMORY[0x1D9452090]();
          __int16 v39 = self;
          id v40 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            char v41 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            BOOL v51 = v41;
            _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);
          }
          uint64_t v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"User data controller not found" reason:@"No settings for this user" suggestion:0];
          [v19 respondWithError:v22];
        }

        __int16 v37 = v44;
        id v11 = v42;
      }
      else
      {
        __int16 v31 = (void *)MEMORY[0x1D9452090]();
        __int16 v32 = self;
        __int16 v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = HMFGetLogIdentifier();
          __int16 v35 = [v4 messagePayload];
          *(_DWORD *)buf = 138543618;
          BOOL v51 = v34;
          __int16 v52 = 2112;
          id v53 = v35;
          _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Missing access control accessories in message payload: %@", buf, 0x16u);
        }
        int v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Missing access control accessories" reason:@"Need access control accessories in message" suggestion:0];
        id v36 = [v4 responseHandler];

        if (!v36) {
          goto LABEL_29;
        }
        __int16 v37 = [v4 responseHandler];
        ((void (**)(void, void *, void))v37)[2](v37, v12, 0);
      }

LABEL_29:
LABEL_30:

      goto LABEL_31;
    }
  }
  __int16 v23 = (void *)MEMORY[0x1D9452090]();
  id v24 = self;
  uint64_t v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    uint64_t v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    BOOL v51 = v26;
    _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Not processing media content profile update message as not part of homeManager homes.", buf, 0xCu);
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
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HMDUser_handleMediaContentProfileAccessControlUpdate___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
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
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUser *)self home];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 homeManager];
    id v8 = [v7 homes];
    char v9 = [v8 containsObject:v6];

    if (v9)
    {
      id v10 = [(HMDUser *)self assistantAccessControl];
      id v11 = [v10 accessories];
      int v12 = (void *)[v11 copy];
      id v98 = 0;
      id v13 = +[HMDAssistantAccessControl accessControlWithMessage:v4 user:self currentAccessories:v12 error:&v98];
      id v14 = v98;

      if (!v13)
      {
        __int16 v23 = (void *)MEMORY[0x1D9452090]();
        id v24 = self;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v101 = v26;
          __int16 v102 = 2112;
          id v103 = v4;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Failed to create access control from message: %@", buf, 0x16u);
        }
        [v4 respondWithError:v14];
        id v13 = 0;
        goto LABEL_60;
      }
      if (![(HMDUser *)self isCurrentUser])
      {
        __int16 v27 = (void *)MEMORY[0x1D9452090]();
        uint64_t v28 = self;
        id v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          char v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v101 = v30;
          __int16 v102 = 2112;
          id v103 = v4;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Can only modify own access control: %@", buf, 0x16u);
        }
        __int16 v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
        [v4 respondWithError:v31];
        goto LABEL_59;
      }
      if (![(HMDUser *)self isOwner])
      {
        long long v87 = v10;
        id v90 = v14;
        __int16 v32 = (void *)MEMORY[0x1E4F1CA48];
        __int16 v33 = [v13 accessories];
        uint64_t v34 = objc_msgSend(v32, "arrayWithCapacity:", objc_msgSend(v33, "count"));

        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        __int16 v35 = [v13 accessories];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v94 objects:v99 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v95;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v95 != v38) {
                objc_enumerationMutation(v35);
              }
              id v40 = [*(id *)(*((void *)&v94 + 1) + 8 * i) uuid];
              [v34 addObject:v40];
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v94 objects:v99 count:16];
          }
          while (v37);
        }

        char v41 = (void *)MEMORY[0x1D9452090]();
        uint64_t v42 = self;
        int v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          id v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          long long v101 = v44;
          __int16 v102 = 2112;
          id v103 = v13;
          _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Updating shared user assistant access control to: %@", buf, 0x16u);
        }
        uint64_t v45 = [v13 areActivityNotificationsEnabledForPersonalRequests];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke;
        aBlock[3] = &unk_1E6A197F0;
        id v46 = v4;
        id v93 = v46;
        long long v47 = _Block_copy(aBlock);
        long long v48 = [(HMDUser *)v42 userDataController];

        id v10 = v87;
        if (v48)
        {
          BOOL v49 = ([v13 options] & 1) == 0;
          long long v50 = [(HMDUser *)v42 userDataController];
          [v50 handleAssistantAccessControlAccessoryUUIDsUpdated:v34 requireAuthenticationForSecureRequests:v49 activityNotificationsEnabledForPersonalRequests:v45 completion:v47];
        }
        else
        {
          uint64_t v57 = (void *)MEMORY[0x1D9452090]();
          id v58 = v42;
          unsigned int v59 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v60 = v85 = v57;
            *(_DWORD *)buf = 138543362;
            long long v101 = v60;
            _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_ERROR, "%{public}@Missing user data controller.", buf, 0xCu);

            uint64_t v57 = v85;
          }

          long long v50 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:9005 description:@"User data controller not found. No settings for this user." underlyingError:0];
          [v46 respondWithError:v50];
        }

        id v14 = v90;
        goto LABEL_60;
      }
      if (!v10)
      {
        BOOL v51 = (void *)MEMORY[0x1D9452090]();
        __int16 v52 = self;
        id v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          uint64_t v54 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v101 = v54;
          _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_INFO, "%{public}@Cannot update without an existing access control", buf, 0xCu);
        }
        id v55 = [v4 responseHandler];

        if (!v55) {
          goto LABEL_60;
        }
        __int16 v31 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:9004];
        uint64_t v56 = [v4 responseHandler];
        v56[2](v56, v31, 0);
        goto LABEL_58;
      }
      objc_msgSend(v13, "setOptions:", objc_msgSend(v10, "options") | objc_msgSend(v13, "options") | 1);
      if (isInternalBuild())
      {
        uint64_t v15 = [v13 accessories];
        if ([v15 count])
        {
          uint64_t v16 = [(HMDUser *)self assistantAccessControl];
          uint64_t v17 = [v16 accessories];
          if (![v17 count])
          {
            id v89 = v14;
            uint64_t v18 = [(HMDUser *)self assistantAccessControl];
            char v86 = [v18 isEnabled];

            if (v86)
            {
              id v14 = v89;
              goto LABEL_45;
            }
            uint64_t v15 = [v13 user];
            uint64_t v61 = (void *)MEMORY[0x1D9452090]();
            uint64_t v62 = self;
            v63 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v64 = BOOL v88 = v61;
              *(_DWORD *)buf = 138543618;
              long long v101 = v64;
              __int16 v102 = 2112;
              id v103 = v15;
              _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_INFO, "%{public}@Enabling assistant access controls for internal user: %@", buf, 0x16u);

              uint64_t v61 = v88;
            }

            int v65 = [HMDAssistantAccessControl alloc];
            uint64_t v16 = [v13 accessories];
            uint64_t v66 = [(HMDAssistantAccessControl *)v65 initWithUser:v15 appleAccessories:v16 enabled:1];
            uint64_t v17 = v13;
            id v13 = (void *)v66;
            id v14 = v89;
          }
        }
      }
LABEL_45:
      v67 = (void *)MEMORY[0x1D9452090]();
      id v68 = self;
      uint64_t v69 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v70 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v101 = v70;
        __int16 v102 = 2112;
        id v103 = v13;
        _os_log_impl(&dword_1D49D5000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@Updating owner user assistant access control to: %@", buf, 0x16u);
      }
      if (HMFEqualObjects())
      {
        v71 = (void *)MEMORY[0x1D9452090]();
        uint64_t v72 = v68;
        uint64_t v73 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          uint64_t v74 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v101 = v74;
          _os_log_impl(&dword_1D49D5000, v73, OS_LOG_TYPE_INFO, "%{public}@Updated access control resulted in no change", buf, 0xCu);
        }
        uint64_t v75 = [v4 responseHandler];

        if (!v75) {
          goto LABEL_60;
        }
        __int16 v31 = [v4 responseHandler];
        v31[2](v31, 0, 0);
LABEL_59:

LABEL_60:
        goto LABEL_61;
      }
      id v76 = [v13 model];
      __int16 v31 = v76;
      if (v76)
      {
        [v76 setObjectChangeType:2];
        v77 = [v6 backingStore];
        v78 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
        uint64_t v56 = [v77 transaction:@"Update Assistant Access Control" options:v78];

        [v56 add:v31 withMessage:v4];
        [v56 run];
      }
      else
      {
        uint64_t v79 = (void *)MEMORY[0x1D9452090]();
        id v80 = v68;
        id v81 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v82 = uint64_t v91 = v79;
          *(_DWORD *)buf = 138543362;
          long long v101 = v82;
          _os_log_impl(&dword_1D49D5000, v81, OS_LOG_TYPE_ERROR, "%{public}@Failed to create transaction", buf, 0xCu);

          uint64_t v79 = v91;
        }

        uint64_t v83 = [v4 responseHandler];

        if (!v83) {
          goto LABEL_59;
        }
        uint64_t v56 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
        long long v84 = [v4 responseHandler];
        v84[2](v84, v56, 0);
      }
LABEL_58:

      goto LABEL_59;
    }
  }
  id v19 = (void *)MEMORY[0x1D9452090]();
  uint64_t v20 = self;
  __int16 v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v101 = v22;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Not processing assistant access control update message as not part of homeManager homes.", buf, 0xCu);
  }
LABEL_61:
}

void __47__HMDUser__handleAssistantAccessControlUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v4)[2](v4, v5, 0);
  }
}

- (void)handleAssistantAccessControlUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HMDUser_handleAssistantAccessControlUpdate___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
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
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(HMDUser *)self isCurrentUser])
  {
    if ([(HMDUser *)self isOwner]) {
      return 1;
    }
    id v4 = (void *)MEMORY[0x1D9452090]();
    char v9 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v7;
      id v8 = "%{public}@Only owners may modify assistant access controls";
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v7;
      id v8 = "%{public}@Can only update current user's assistant access controls";
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v10, 0xCu);
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
  p_locuint64_t k = &self->_lock;
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
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t audioAnalysisUserDropInAccessLevel = self->_audioAnalysisUserDropInAccessLevel;
  os_unfair_lock_unlock(p_lock);
  return audioAnalysisUserDropInAccessLevel;
}

- (void)setAudioAnalysisUserDropInAccessLevel:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t audioAnalysisUserDropInAccessLevel = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)announceAccessLevel
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t announceAccessLevel = self->_announceAccessLevel;
  os_unfair_lock_unlock(p_lock);
  return announceAccessLevel;
}

- (void)setAnnounceAccessLevel:(unint64_t)a3
{
  p_locuint64_t k = &self->_lock;
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
  p_locuint64_t k = &self->_lock;
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
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t camerasAccessLevel = self->_camerasAccessLevel;
  os_unfair_lock_unlock(p_lock);
  return camerasAccessLevel;
}

- (BOOL)_setRemoteAccessAllowed:(BOOL)a3
{
  int v3 = a3;
  p_locuint64_t k = &self->_lock;
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
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_displayName = &self->_displayName;
  if ((HMFEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_displayName, a3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSString)displayName
{
  p_locuint64_t k = &self->_lock;
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
  p_locuint64_t k = &self->_lock;
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
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
      uint64_t v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v16 = 138543618;
        uint64_t v17 = v15;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification account was removed: %@", (uint8_t *)&v16, 0x16u);
      }
      __registerForAccountNotifications(v13);
      __handleUpdatedAccount(v13);
    }
  }
}

- (void)__handleAddedAccount:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
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
      uint64_t v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v20 = 138543618;
        __int16 v21 = v15;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification account was added: %@", (uint8_t *)&v20, 0x16u);
      }
      __registerForAccountNotifications(v13);
      __updateWithAccount(v13, v9);
      __handleUpdatedAccount(v13);
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      int v20 = 138543362;
      __int16 v21 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Account handle does not exist", (uint8_t *)&v20, 0xCu);
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
  if (v4)
  {
    char v5 = [v3 accountForHandle:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_handleNeedsiTunesMultiUserRepair:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDUser *)self isCurrentUser])
  {
    char v5 = [v4 numberForKey:*MEMORY[0x1E4F2E2F8]];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = [v5 BOOLValue];
      if (v7 != [(HMDUser *)self needsiTunesMultiUserRepair])
      {
        id v8 = [(HMDUser *)self home];
        id v9 = (void *)MEMORY[0x1D9452090]();
        int v10 = self;
        int v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = HMFGetLogIdentifier();
          id v13 = [NSNumber numberWithBool:v7];
          int v25 = 138543618;
          uint64_t v26 = v12;
          __int16 v27 = 2112;
          id v28 = v13;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Setting needs iTunes multi-user repair %@.", (uint8_t *)&v25, 0x16u);
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
      int v20 = (void *)MEMORY[0x1D9452090]();
      __int16 v21 = self;
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        int v25 = 138543618;
        uint64_t v26 = v23;
        __int16 v27 = 2112;
        id v28 = v4;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing value to set iTunes Multi User Repair: %@", (uint8_t *)&v25, 0x16u);
      }
      uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Need a value" reason:@"Need a value" suggestion:0];
      [v4 respondWithError:v24];

      id v6 = 0;
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      int v25 = 138543618;
      uint64_t v26 = v19;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message to current user: %@", (uint8_t *)&v25, 0x16u);
    }
    id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"User is not current user" reason:@"Can only set on current user" suggestion:0];
    [v4 respondWithError:v6];
  }
}

- (void)_handleShareClientRepairRequest:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 uuidForKey:*MEMORY[0x1E4F2E3A8]];
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
      uint64_t v12 = *MEMORY[0x1E4F2E378];
      id v13 = [v4 uuidForKey:*MEMORY[0x1E4F2E378]];
      char v14 = [v11 isEqual:v13];

      if (v14)
      {
        uint64_t v15 = *MEMORY[0x1E4F2E398];
        int v16 = [v4 dataForKey:*MEMORY[0x1E4F2E398]];

        if (v16)
        {
          uint64_t v17 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v18 = objc_opt_class();
          id v19 = [v4 dataForKey:v15];
          id v59 = 0;
          id v55 = [v17 unarchivedObjectOfClass:v18 fromData:v19 error:&v59];
          id v20 = v59;

          if (v55)
          {
            v64[0] = v15;
            __int16 v21 = encodeRootObject();
            v65[0] = v21;
            v64[1] = *MEMORY[0x1E4F2E368];
            __int16 v22 = objc_msgSend(v4, "stringForKey:");
            v65[1] = v22;
            v64[2] = v12;
            id v23 = [v4 stringForKey:v12];
            v65[2] = v23;
            id v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];

            uint64_t v54 = [[HMDHomeKitVersion alloc] initWithVersionString:@"7.0"];
            uint64_t v62 = @"kRequiredCapabilitiesKey";
            v60[0] = @"kHomedSupportedFeaturesKey";
            v60[1] = @"kHomedVersionKey";
            v61[0] = &unk_1F2DC6FB8;
            uint64_t v24 = NSNumber;
            int v25 = [(HMDHomeKitVersion *)v54 versionString];
            [v25 doubleValue];
            uint64_t v26 = objc_msgSend(v24, "numberWithDouble:");
            v61[1] = v26;
            __int16 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
            v63 = v27;
            id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];

            uint64_t v29 = (void *)MEMORY[0x1D9452090]();
            char v30 = self;
            __int16 v31 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              __int16 v32 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v67 = v32;
              __int16 v68 = 2112;
              id v69 = v28;
              _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Sending user share repair message with device capabilites %@.", buf, 0x16u);
            }
            objc_initWeak((id *)buf, v30);
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __43__HMDUser__handleShareClientRepairRequest___block_invoke;
            v56[3] = &unk_1E6A17958;
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
              id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Unable to decode repair info" reason:@"Corrupted repair payload" suggestion:0];
            }
            BOOL v49 = (void *)MEMORY[0x1D9452090]();
            long long v50 = self;
            BOOL v51 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              __int16 v52 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v67 = v52;
              __int16 v68 = 2112;
              id v69 = v20;
              _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unable to decoderepairInfo. %@", buf, 0x16u);
            }
            [v4 respondWithError:v20];
          }
        }
        else
        {
          uint64_t v45 = (void *)MEMORY[0x1D9452090]();
          id v46 = self;
          long long v47 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            long long v48 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v67 = v48;
            _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_ERROR, "%{public}@Payload does not have repair info.", buf, 0xCu);
          }
          id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Unable to determine required arguments" reason:@"Missing repair payload" suggestion:0];
          [v4 respondWithError:v20];
        }
      }
      else
      {
        char v41 = (void *)MEMORY[0x1D9452090]();
        uint64_t v42 = self;
        int v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v67 = v44;
          _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Share request does not have valid home.", buf, 0xCu);
        }
        id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Home not valid" reason:@"Missing home or invalid home" suggestion:0];
        [v4 respondWithError:v20];
      }
    }
    else
    {
      uint64_t v37 = (void *)MEMORY[0x1D9452090]();
      uint64_t v38 = self;
      __int16 v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        id v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v67 = v40;
        __int16 v68 = 2112;
        id v69 = v4;
        _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message from owner: %@", buf, 0x16u);
      }
      id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"From user is not owner" reason:@"Can currently only repair from home owner" suggestion:0];
      [v4 respondWithError:v20];
    }
  }
  else
  {
    __int16 v33 = (void *)MEMORY[0x1D9452090]();
    uint64_t v34 = self;
    __int16 v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v67 = v36;
      __int16 v68 = 2112;
      id v69 = v4;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Attempt to send repair request to mismatched user from message: %@", buf, 0x16u);
    }
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Unable to find to user in payload" reason:@"Need validated to user in payload" suggestion:0];
    [v4 respondWithError:v8];
  }
}

void __43__HMDUser__handleShareClientRepairRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    char v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send remote share client repair message: %@", (uint8_t *)&v12, 0x16u);
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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v31 = a4;
  id v30 = a5;
  id v15 = (void (**)(id, void *, void))a8;
  uint64_t v16 = [(HMDUser *)self home];
  uint64_t v17 = [(HMDUser *)self accountHandle];
  uint64_t v18 = [v16 primaryResident];
  id v19 = [v18 device];
  id v20 = [v16 messageTargetUUID];
  if (v9 && v19)
  {
    __int16 v21 = [[HMDRemoteDeviceMessageDestination alloc] initWithTarget:v20 device:v19];
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
    __int16 v21 = [[HMDRemoteAccountMessageDestination alloc] initWithTarget:v20 handle:v17 multicast:v10 deviceCapabilities:v30];
    __int16 v22 = [[HMDRemoteMessage alloc] initWithName:v14 qualityOfService:17 destination:v21 payload:v31 type:0 timeout:1 secure:180.0];
    goto LABEL_6;
  }
  int v25 = (void *)MEMORY[0x1D9452090]();
  uint64_t v26 = self;
  __int16 v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v28 = v29 = v25;
    *(_DWORD *)buf = 138543618;
    __int16 v33 = v28;
    __int16 v34 = 2112;
    id v35 = v14;
    _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot send account message named %@ because account handle is nil and either preferring primary is NO or no primary resident exists", buf, 0x16u);

    int v25 = v29;
  }

  id v23 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  v15[2](v15, v23, 0);
LABEL_7:
}

- (void)_sendSecureShareClientPayloadToMostEligibleDevice:(id)a3 completion:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[HMDHomeKitVersion alloc] initWithVersionString:@"6.2"];
  uint64_t v9 = *MEMORY[0x1E4F2E368];
  BOOL v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2E368]];
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
    int v12 = HMDHomeKitVersion7_0String;
  }
  id v15 = [[HMDHomeKitVersion alloc] initWithVersionString:*v12];

  id v8 = v15;
LABEL_6:
  id v35 = @"kRequiredCapabilitiesKey";
  v33[0] = @"kHomedSupportedFeaturesKey";
  v33[1] = @"kHomedVersionKey";
  v34[0] = &unk_1F2DC6FA0;
  uint64_t v16 = NSNumber;
  uint64_t v17 = [(HMDHomeKitVersion *)v8 versionString];
  [v17 doubleValue];
  uint64_t v18 = objc_msgSend(v16, "numberWithDouble:");
  v34[1] = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  v36[0] = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];

  __int16 v21 = (void *)MEMORY[0x1D9452090]();
  __int16 v22 = self;
  id v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v30 = v24;
    __int16 v31 = 2112;
    __int16 v32 = v20;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending user share message with device capabilites %@.", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v22);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72__HMDUser__sendSecureShareClientPayloadToMostEligibleDevice_completion___block_invoke;
  v26[3] = &unk_1E6A193F8;
  objc_copyWeak(&v28, (id *)buf);
  id v25 = v7;
  id v27 = v25;
  [(HMDUser *)v22 _sendAccountMessage:@"HMDUCM.rsr" payload:v6 deviceCapabilities:v20 multicast:0 preferPrimary:0 completion:v26];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

void __72__HMDUser__sendSecureShareClientPayloadToMostEligibleDevice_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x1E4F2E358]);
  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
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
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Received user share message response. nonce:%@ Error: %@", (uint8_t *)&v13, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleMultiUserSharePayloadRequest:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuidForKey:*MEMORY[0x1E4F2E3A8]];
  id v6 = [(HMDUser *)self uuid];
  char v7 = HMFEqualObjects();

  if (v7)
  {
    if ([(HMDUser *)self isOwner])
    {
      uint64_t v8 = [v4 uuidForKey:*MEMORY[0x1E4F2E370]];
      if (!v8)
      {
        uint64_t v42 = (void *)MEMORY[0x1D9452090]();
        int v43 = self;
        id v44 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          uint64_t v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          int v82 = v45;
          __int16 v83 = 2112;
          id v84 = v4;
          _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Could not determine from user in message: %@", buf, 0x16u);
        }
        id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Unable to find from user in message payload" reason:@"Need valid from user in message payload" suggestion:0];
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
        id v46 = (void *)MEMORY[0x1D9452090]();
        long long v47 = self;
        long long v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          BOOL v49 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          int v82 = v49;
          __int16 v83 = 2112;
          id v84 = v9;
          __int16 v85 = 2112;
          id v86 = v10;
          __int16 v87 = 2112;
          BOOL v88 = v11;
          _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@Could not determine from user with uuid: %@ home: %@ users: %@", buf, 0x2Au);
        }
        id v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = @"Unable to find from user in home";
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
      int v14 = [v4 uuidForKey:*MEMORY[0x1E4F2E378]];
      char v15 = [v13 isEqual:v14];

      if (v15)
      {
        uint64_t v16 = [v4 dataForKey:*MEMORY[0x1E4F2E3B8]];
        if (v16)
        {
          __int16 v17 = (void *)v16;
          uint64_t v18 = [v4 dataForKey:*MEMORY[0x1E4F2E3B0]];
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            id v20 = [v4 stringForKey:*MEMORY[0x1E4F2E368]];

            if (v20)
            {
              if ([v12 isCurrentUser])
              {
                if ([(HMDUser *)self userCloudShareWithOwnerMessagingState] != 2)
                {
                  v71 = [v4 messagePayload];
                  v78[0] = MEMORY[0x1E4F143A8];
                  v78[1] = 3221225472;
                  v78[2] = __47__HMDUser__handleMultiUserSharePayloadRequest___block_invoke;
                  v78[3] = &unk_1E6A14B50;
                  id v79 = v4;
                  id v80 = self;
                  [(HMDUser *)self _sendSecureShareClientPayloadToMostEligibleDevice:v71 completion:v78];

                  uint64_t v72 = (void *)MEMORY[0x1D9452090]();
                  uint64_t v73 = self;
                  uint64_t v74 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v75 = HMFGetLogIdentifier();
                    [(HMDUser *)v73 accountHandle];
                    id v76 = v77 = v72;
                    *(_DWORD *)buf = 138543618;
                    int v82 = v75;
                    __int16 v83 = 2112;
                    id v84 = v76;
                    _os_log_impl(&dword_1D49D5000, v74, OS_LOG_TYPE_INFO, "%{public}@Received request to send client payload to user : %@", buf, 0x16u);

                    uint64_t v72 = v77;
                  }

                  goto LABEL_42;
                }
                __int16 v21 = (void *)MEMORY[0x1D9452090]();
                __int16 v22 = self;
                id v23 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  uint64_t v24 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  int v82 = v24;
                  _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending cloud share with owner message was blocked.", buf, 0xCu);
                }
                id v25 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v26 = @"Unable to send the message";
                id v27 = @"Sending cloud share with owner message was blocked.";
                uint64_t v28 = 52;
                goto LABEL_29;
              }
              uint64_t v66 = (void *)MEMORY[0x1D9452090]();
              v67 = self;
              __int16 v68 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                id v69 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                int v82 = v69;
                __int16 v83 = 2112;
                id v84 = v12;
                __int16 v85 = 2112;
                id v86 = v4;
                _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_ERROR, "%{public}@From user %@ is not current user for message: %@", buf, 0x20u);
              }
              uint64_t v70 = [v4 responseHandler];

              if (!v70) {
                goto LABEL_42;
              }
              long long v50 = [v4 responseHandler];
              uint64_t v64 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
LABEL_40:
              int v65 = (void *)v64;
              v50[2](v50, v64, 0);

              goto LABEL_41;
            }
          }
          else
          {
          }
        }
        id v59 = (void *)MEMORY[0x1D9452090]();
        uint64_t v60 = self;
        uint64_t v61 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          uint64_t v62 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          int v82 = v62;
          _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_ERROR, "%{public}@Payload did not have required fields.", buf, 0xCu);
        }
        v63 = [v4 responseHandler];

        if (!v63) {
          goto LABEL_42;
        }
        long long v50 = [v4 responseHandler];
        uint64_t v56 = (void *)MEMORY[0x1E4F28C58];
        id v57 = @"Unable to determine required arguments";
        id v58 = @"Missing either URL, token or container ID";
      }
      else
      {
        BOOL v51 = (void *)MEMORY[0x1D9452090]();
        __int16 v52 = self;
        id v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          uint64_t v54 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          int v82 = v54;
          _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_ERROR, "%{public}@Share request does not have valid home.", buf, 0xCu);
        }
        id v55 = [v4 responseHandler];

        if (!v55) {
          goto LABEL_42;
        }
        long long v50 = [v4 responseHandler];
        uint64_t v56 = (void *)MEMORY[0x1E4F28C58];
        id v57 = @"Home not valid";
        id v58 = @"Missing home or invalid home";
      }
      uint64_t v64 = [v56 hmErrorWithCode:3 description:v57 reason:v58 suggestion:0];
      goto LABEL_40;
    }
    uint64_t v37 = (void *)MEMORY[0x1D9452090]();
    uint64_t v38 = self;
    __int16 v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      id v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v82 = v40;
      __int16 v83 = 2112;
      id v84 = v4;
      _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Can only send this message to owner: %@", buf, 0x16u);
    }
    char v41 = [v4 responseHandler];

    if (v41)
    {
      uint64_t v9 = [v4 responseHandler];
      __int16 v34 = (void *)MEMORY[0x1E4F28C58];
      id v35 = @"To user is not owner";
      uint64_t v36 = @"Can currently only share to owner";
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v29 = (void *)MEMORY[0x1D9452090]();
    id v30 = self;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v82 = v32;
      __int16 v83 = 2112;
      id v84 = v4;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Attempt to send client payload to mismatched identifier from message: %@", buf, 0x16u);
    }
    __int16 v33 = [v4 responseHandler];

    if (v33)
    {
      uint64_t v9 = [v4 responseHandler];
      __int16 v34 = (void *)MEMORY[0x1E4F28C58];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = [*(id *)(a1 + 32) responseHandler];

  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = *(id *)(a1 + 40);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        char v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v17 = v11;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send cloud share with owner message. Error: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 40) _handleCloudShareWithOwnerMessageError];
    }
    if (v5)
    {
      uint64_t v14 = *MEMORY[0x1E4F2E358];
      id v15 = v5;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
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
  uint64_t v38 = *MEMORY[0x1E4F143B8];
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
          __int16 v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Can't create lookup info" reason:@"Unable to convert account handle to lookup info" suggestion:0];
          ((void (**)(void, void *, void))v30)[2](v30, v31, 0);

          id v10 = 0;
        }
        goto LABEL_19;
      }
      char v11 = encodeRootObject();
      uint64_t v32 = *MEMORY[0x1E4F2E388];
      __int16 v33 = v11;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      int v13 = (void *)MEMORY[0x1D9452090]();
      uint64_t v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v35 = v16;
        __int16 v36 = 2112;
        id v37 = v10;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Obtained share lookup: %@", buf, 0x16u);
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
    id v25 = (void *)MEMORY[0x1D9452090]();
    uint64_t v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v28;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Do not have account handle: %@", buf, 0x16u);
    }
    uint64_t v29 = [v4 responseHandler];

    if (v29)
    {
      id v10 = [v4 responseHandler];
      uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"No account handle" reason:@"User has no account handle" suggestion:0];
      goto LABEL_17;
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    uint64_t v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v35 = v22;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Attempt to send client payload to mismatched identifier from message: %@", buf, 0x16u);
    }
    id v23 = [v4 responseHandler];

    if (v23)
    {
      id v10 = [v4 responseHandler];
      uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kUserUUIDKey"];
  id v6 = [(HMDUser *)self uuid];
  char v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    id v25 = (void *)MEMORY[0x1D9452090]();
    uint64_t v26 = self;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v36 = v28;
      __int16 v37 = 2112;
      id v38 = v4;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Attempt to retrieve pairing identity with mismatching identifier from message: %@", buf, 0x16u);
    }
    uint64_t v29 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    goto LABEL_15;
  }
  BOOL v8 = [(HMDUser *)self isCurrentUser];
  id v9 = (void *)MEMORY[0x1D9452090]();
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
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Attempt to retrieve pairing identity for not current user: %@", buf, 0x16u);
    }
    uint64_t v29 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2014];
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
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Received request to retrieve all pairing identities for the current user", buf, 0xCu);
  }
  uint64_t v14 = [(HMDUser *)v10 keyStore];
  id v15 = [v14 allAccessoryPairingKeys];

  uint64_t v16 = [v4 entitlements];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __47__HMDUser__handleLegacyPairingIdentityRequest___block_invoke;
  v32[3] = &__block_descriptor_40_e28__16__0__HAPPairingIdentity_8l;
  v32[4] = v16;
  __int16 v17 = objc_msgSend(v15, "na_map:", v32);
  __int16 v18 = encodeRootObject();
  id v19 = (void *)MEMORY[0x1D9452090]();
  uint64_t v20 = v10;
  __int16 v21 = HMFGetOSLogHandle();
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
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Sending legacy identities : %@", buf, 0x16u);
    }
    uint64_t v33 = *MEMORY[0x1E4F2E310];
    __int16 v34 = v18;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v4 respondWithPayload:v24];
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v31;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode the pairing identities.", buf, 0xCu);
    }
    uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    [v4 respondWithError:v24];
  }

LABEL_20:
}

id __47__HMDUser__handleLegacyPairingIdentityRequest___block_invoke(uint64_t a1, void *a2)
{
  if ((*(unsigned char *)(a1 + 32) & 0x10) != 0)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F65508];
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
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v44 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to retrieve pairing identity for user", buf, 0xCu);
  }
  id v9 = [(HMDUser *)v6 pairingIdentity];
  if (v9)
  {
    if (([v4 entitlements] & 0x10) != 0 && -[HMDUser isCurrentUser](v6, "isCurrentUser"))
    {
      id v10 = [(HMDUser *)v6 keyStore];
      id v40 = 0;
      char v11 = [v10 getLocalPairingIdentity:&v40];
      id v12 = v40;

      if (!v11)
      {
        __int16 v36 = (void *)MEMORY[0x1D9452090]();
        __int16 v37 = v6;
        id v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v44 = v39;
          __int16 v45 = 2112;
          id v46 = v12;
          _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to lookup our local pairing identity with error: %@", buf, 0x16u);
        }
        uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Local pairing identity was not found" reason:0 suggestion:0 underlyingError:v12];
        [v4 respondWithError:v24];
        goto LABEL_25;
      }
      int v13 = [v11 privateKey];
      id v14 = objc_alloc(MEMORY[0x1E4F65508]);
      id v15 = [v9 identifier];
      uint64_t v16 = [v9 publicKey];
      uint64_t v17 = [v14 initWithIdentifier:v15 publicKey:v16 privateKey:v13];

      id v12 = (id)v17;
    }
    else
    {
      id v12 = [v9 publicPairingIdentity];
    }
    __int16 v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = v6;
    uint64_t v20 = HMFGetOSLogHandle();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v21)
      {
        __int16 v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v44 = v22;
        __int16 v45 = 2112;
        id v46 = v12;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Found pairing identity for user: %@", buf, 0x16u);
      }
      uint64_t v23 = encodeRootObject();
      uint64_t v24 = (void *)v23;
      if (v23)
      {
        uint64_t v41 = *MEMORY[0x1E4F2E310];
        uint64_t v42 = v23;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        [v4 respondWithPayload:v25];
      }
      else
      {
        uint64_t v32 = (void *)MEMORY[0x1D9452090]();
        uint64_t v33 = v19;
        __int16 v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v44 = v35;
          _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to encode the pairing identity.", buf, 0xCu);
        }
        id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
        [v4 respondWithError:v25];
      }

LABEL_25:
      goto LABEL_26;
    }
    if (v21)
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v44 = v31;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Unable to retrieve pairing identity for user.", buf, 0xCu);
    }
    id v30 = v18;
  }
  else
  {
    uint64_t v26 = MEMORY[0x1D9452090]();
    id v27 = v6;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v44 = v29;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find the pairing identity for the user", buf, 0xCu);
    }
    id v30 = (void *)v26;
  }
  id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  [v4 respondWithError:v12];
LABEL_26:
}

- (void)_handlePairingIdentityRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
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
    BOOL v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Attempt to retrieve pairing identity with mismatching identifier from message: %@", (uint8_t *)&v13, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
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
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_pairingIdentity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)spiClientIdentifier
{
  return spiClientIdentifierForUUID(self->_uuid);
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
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__HMDUser_setAccountIdentifier___block_invoke;
    v8[3] = &unk_1E6A197C8;
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
  p_locuint64_t k = &self->_lock;
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
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__HMDUser_setAccountHandle___block_invoke;
    block[3] = &unk_1E6A19B30;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __28__HMDUser_setAccountHandle___block_invoke(uint64_t a1)
{
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
  v11[2] = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
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
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

    logAndPostNotification(@"HMDUserPrivilegeDidChangeNotification", self, v9);
  }
}

- (BOOL)isPending
{
  return [(HMDUser *)self privilege] == 2;
}

- (unint64_t)_compatiblePrivilege
{
  unint64_t v3 = [(HMDUser *)self privilege];
  if (v3 < 5) {
    return qword_1D54D4278[v3];
  }
  return [(HMDUser *)self privilege];
}

- (void)setHome:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)allowedRemoteEventAccessUserTypes
{
  unint64_t v2 = [(HMDUser *)self privilege];
  if (v2 > 4) {
    return 0;
  }
  else {
    return qword_1D54D4250[v2];
  }
}

- (void)deregisterForMessages
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Deregistering user", (uint8_t *)&v8, 0xCu);
  }
  char v7 = [(HMDUser *)v4 messageDispatcher];
  [v7 deregisterReceiver:v4];
}

- (void)registerForMessages
{
  v31[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HMDUser *)self messageDispatcher];
  uint64_t v4 = *MEMORY[0x1E4F2E318];
  id v5 = +[HMDXPCMessagePolicy policyWithEntitlements:13];
  v31[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [v3 registerForMessage:v4 receiver:self policies:v6 selector:sel__handlePairingIdentityRequest_];

  uint64_t v7 = *MEMORY[0x1E4F2E2C0];
  int v8 = +[HMDXPCMessagePolicy policyWithEntitlements:13];
  id v30 = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  [v3 registerForMessage:v7 receiver:self policies:v9 selector:sel__handleLegacyPairingIdentityRequest_];

  uint64_t v10 = *MEMORY[0x1E4F2E390];
  char v11 = +[HMDXPCMessagePolicy policyWithEntitlements:517];
  uint64_t v29 = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  [v3 registerForMessage:v10 receiver:self policies:v12 selector:sel__handleShareLookupInfoRequest_];

  uint64_t v13 = *MEMORY[0x1E4F2E360];
  id v14 = +[HMDXPCMessagePolicy policyWithEntitlements:517];
  uint64_t v28 = v14;
  __int16 v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  [v3 registerForMessage:v13 receiver:self policies:v15 selector:sel__handleMultiUserSharePayloadRequest_];

  uint64_t v16 = *MEMORY[0x1E4F2E3A0];
  uint64_t v17 = +[HMDXPCMessagePolicy policyWithEntitlements:517];
  id v27 = v17;
  __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  [v3 registerForMessage:v16 receiver:self policies:v18 selector:sel__handleShareClientRepairRequest_];

  uint64_t v19 = *MEMORY[0x1E4F2E300];
  uint64_t v20 = +[HMDXPCMessagePolicy policyWithEntitlements:517];
  uint64_t v26 = v20;
  BOOL v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  [v3 registerForMessage:v19 receiver:self policies:v21 selector:sel__handleNeedsiTunesMultiUserRepair_];

  if ([(HMDUser *)self isCurrentUser])
  {
    uint64_t v22 = *MEMORY[0x1E4F2E240];
    uint64_t v23 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    id v25 = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    [v3 registerForMessage:v22 receiver:self policies:v24 selector:sel__handleAnnounceSettingsUpdate_];
  }
}

- (void)unconfigure
{
  [(HMDUser *)self deregisterForMessages];
  unint64_t v3 = [(HMDUser *)self shareMessenger];
  [v3 unconfigure];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];
}

- (void)_recoverTrustManagerDueToUUIDChange
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v3 = [(HMDUser *)self cloudShareTrustManager];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]([(HMDUser *)self setCloudShareTrustManager:0]);
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Configure new trust manager", (uint8_t *)&v8, 0xCu);
    }
    [(HMDUser *)v5 configureCloudShareTrustManager];
  }
}

- (void)updateSharedBackingStoreControllerParticipants
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HMDUser_updateSharedBackingStoreControllerParticipants__block_invoke;
  block[3] = &unk_1E6A19B30;
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
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
    id v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v20 = 138543362;
      BOOL v21 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Clearing participants from old user settings backingstores", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v10 = [(HMDUser *)v7 sharedBackingStoreController];
    [v10 clearParticipants];
  }
  [(HMDUser *)self setUserDataController:0];
  [(HMDUser *)self setSharedBackingStoreController:0];
  char v11 = (void *)MEMORY[0x1D9452090]([(HMDUser *)self setPrivateBackingStoreController:0]);
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    int v20 = 138543362;
    BOOL v21 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Initializing new user settings backingstores", (uint8_t *)&v20, 0xCu);
  }
  [(HMDUser *)v12 initializeUserSettingsWithHome:v3];
LABEL_11:
  if (![(HMDUser *)self isCurrentUser])
  {
    __int16 v15 = [v3 currentUser];
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v20 = 138543618;
      BOOL v21 = v19;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating participants in current users shared settings backingstore: %@", (uint8_t *)&v20, 0x16u);
    }
    [v15 updateSharedBackingStoreControllerParticipants];
  }
}

- (void)recoverUserCloudDataDueToUUIDChangeFromOldUUID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HMDUser_recoverUserCloudDataDueToUUIDChangeFromOldUUID___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
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
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_userCloudShareWithOwnerMessagingState) {
    self->_userCloudShareWithOwnerMessagingState = 2;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setUserCloudShareWithOwnerMessagingState:(int64_t)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_userCloudShareWithOwnerMessagingState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)userCloudShareWithOwnerMessagingState
{
  p_locuint64_t k = &self->_lock;
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
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v53 = v8;
    __int16 v54 = 2112;
    id v55 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Initializing user settings with home: %@", buf, 0x16u);
  }
  if ([(HMDUser *)v6 isCurrentUser])
  {
    id v9 = [[HMDSettingsMessageHandler alloc] initWithQueue:v6->_queue];
    uint64_t v10 = [(HMDUser *)v6 uuid];
    char v11 = [v10 UUIDString];
    id v12 = [@"user-data-private-" stringByAppendingString:v11];

    uint64_t v13 = [(HMDUser *)v6 dataSource];
    id v14 = [v13 userDataBackingStoreControllerWithDelegate:v6 queue:v6->_queue zoneName:v12 shareMessenger:0];
    [(HMDUser *)v6 setPrivateBackingStoreController:v14];

    __int16 v15 = [HMDSettingsControllerDependency alloc];
    uint64_t v16 = [(HMDUser *)v6 uuid];
    uint64_t v17 = [(HMDSettingsControllerDependency *)v15 initWithParentUUID:v16 logName:@"private" queue:v6->_queue metadataFileName:@"UserPrivateSettings.plist" codingKey:*MEMORY[0x1E4F2E348] messageHandler:v9 migrationProvider:0];

    [(HMDUser *)v6 setPrivateSettingsControllerDependency:v17];
    __int16 v18 = [[HMDSettingsController alloc] initWithDependency:v17 delegate:v6];
    uint64_t v19 = [(HMDUser *)v6 privateSettingsControllerDependency];
    int v20 = [(HMDUser *)v6 messageDispatcher];
    BOOL v21 = [(HMDUser *)v6 privateBackingStoreController];
    [v19 configureWithHome:v4 messageDispatcher:v20 backingStoreController:v21];

    [(HMDSettingsMessageHandler *)v9 setPrivateMessageController:v18];
  }
  else
  {
    id v9 = 0;
    __int16 v18 = 0;
  }
  if ([(HMDUser *)v6 isRunningOnHomeOwnersDevice]
    || [(HMDUser *)v6 isCurrentUser])
  {
    __int16 v22 = [(HMDUser *)v6 uuid];
    uint64_t v23 = [v22 UUIDString];
    uint64_t v24 = [@"user-data-shared-" stringByAppendingString:v23];

    id v25 = [HMDCloudShareMessenger alloc];
    uint64_t v26 = [(HMDUser *)v6 uuid];
    id v27 = [(HMDCloudShareMessenger *)v25 initWithMessageTargetUUID:v26 workQueue:v6->_queue home:v4];
    [(HMDUser *)v6 setShareMessenger:v27];

    uint64_t v28 = [(HMDUser *)v6 dataSource];
    queue = v6->_queue;
    id v30 = [(HMDUser *)v6 shareMessenger];
    __int16 v31 = [v28 userDataBackingStoreControllerWithDelegate:v6 queue:queue zoneName:v24 shareMessenger:v30];
    [(HMDUser *)v6 setSharedBackingStoreController:v31];

    uint64_t v32 = [HMDSettingsControllerDependency alloc];
    uint64_t v33 = [(HMDUser *)v6 uuid];
    __int16 v34 = v6->_queue;
    uint64_t v35 = *MEMORY[0x1E4F2E3C0];
    BOOL v51 = @"root.music.playbackInfluencesForYou";
    __int16 v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    __int16 v37 = [(HMDSettingsControllerDependency *)v32 initWithParentUUID:v33 logName:@"shared" queue:v34 metadataFileName:@"UserSharedSettings.plist" codingKey:v35 messageHandler:v9 migrationProvider:v6 keyPathsToPrune:v36];
    [(HMDUser *)v6 setSharedSettingsControllerDependency:v37];

    id v38 = [HMDSettingsController alloc];
    uint64_t v39 = [(HMDUser *)v6 sharedSettingsControllerDependency];
    uint64_t v40 = [(HMDSettingsController *)v38 initWithDependency:v39 delegate:v6];

    uint64_t v41 = [(HMDUser *)v6 sharedSettingsControllerDependency];
    uint64_t v42 = [(HMDUser *)v6 messageDispatcher];
    int v43 = [(HMDUser *)v6 sharedBackingStoreController];
    [v41 configureWithHome:v4 messageDispatcher:v42 backingStoreController:v43];

    [(HMDSettingsMessageHandler *)v9 setSharedMessageController:v40];
  }
  else
  {
    uint64_t v40 = 0;
  }
  if (v40 | (unint64_t)v18)
  {
    id v44 = [(HMDUser *)v6 dataSource];
    __int16 v45 = v6->_queue;
    id v46 = [(HMDUser *)v6 uuid];
    uint64_t v47 = [v4 uuid];
    LOBYTE(v50) = [(HMDUser *)v6 isCurrentUser];
    long long v48 = [v44 userDataControllerWithDelegate:v6 dataSource:v6 queue:v45 userID:v46 homeID:v47 sharedSettingsController:v40 privateSettingsController:v18 isCurrentUser:v50];
    [(HMDUser *)v6 setUserDataController:v48];

    BOOL v49 = [(HMDUser *)v6 userDataController];
    [v49 configure];
  }
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HMDUser_handleUserDataControllerInitialized___block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __47__HMDUser_handleUserDataControllerInitialized___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCurrentUser])
  {
    unint64_t v2 = [MEMORY[0x1E4F65548] productInfo];
    uint64_t v3 = [v2 productClass];

    if (v3 == 1)
    {
      id v4 = [[HMDSiriMultiUserNewLanguageNotificationManagerContext alloc] initWithUser:*(void *)(a1 + 32) workQueue:*(void *)(*(void *)(a1 + 32) + 264)];
      [(HMDSiriMultiUserNewLanguageNotificationManagerContext *)v4 configure];
      id v5 = [[HMDSiriMultiUserNewLanguageNotificationManager alloc] initWithContext:v4];
      [*(id *)(a1 + 32) setSiriMultiUserNewLanguageNotificationManager:v5];

      id v6 = [*(id *)(a1 + 32) siriMultiUserNewLanguageNotificationManager];
      [v6 checkAllMediaAccessoriesAndPostNotificationIfNecessary];
    }
  }
  if ([*(id *)(a1 + 32) isCurrentUser])
  {
    id v8 = [*(id *)(a1 + 32) home];
    uint64_t v7 = [v8 homeManager];
    [v7 updateCurrentUserEligibleForOwnerToAutoMigration];
  }
}

- (void)configureWithHome:(id)a3
{
  v28[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 msgDispatcher];
  [(HMDUser *)self setMessageDispatcher:v5];

  [(HMDUser *)self setHome:v4];
  if (![(HMDUser *)self isRemoteGateway] && !isWatch())
  {
    [(HMDUser *)self configureCloudShareTrustManager];
    [(HMDUser *)self initializeUserSettingsWithHome:v4];
  }
  id v6 = [(HMDUser *)self assistantAccessControl];
  uint64_t v7 = v6;
  if (v6) {
    [v6 configure];
  }
  id v8 = (void *)MEMORY[0x1D9452090]([(HMDUser *)self registerForMessages]);
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    char v11 = HMFGetLogIdentifier();
    id v12 = [(HMDUser *)v9 userID];
    uint64_t v13 = [(HMDUser *)v9 account];
    [(HMDUser *)v9 isCurrentUser];
    id v14 = HMFBooleanToString();
    *(_DWORD *)uint64_t v26 = 138544130;
    *(void *)&void v26[4] = v11;
    *(_WORD *)&v26[12] = 2112;
    *(void *)&v26[14] = v12;
    *(_WORD *)&v26[22] = 2112;
    id v27 = v13;
    LOWORD(v28[0]) = 2112;
    *(id *)((char *)v28 + 2) = v14;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring [%@] with account: %@, isCurrentUser: %@", v26, 0x2Au);
  }
  if (![(HMDUser *)v9 isCurrentUser])
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = v9;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = HMFGetLogIdentifier();
      uint64_t v19 = [(HMDUser *)v16 userID];
      *(_DWORD *)uint64_t v26 = 138543618;
      *(void *)&void v26[4] = v18;
      *(_WORD *)&v26[12] = 2112;
      *(void *)&v26[14] = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Registering for account notifications & Auditing the account as [%@] is not current user.", v26, 0x16u);
    }
    __registerForAccountNotifications(v16);
    int v20 = v16;
    BOOL v21 = v20;
    if (v20)
    {
      queue = v20->_queue;
      *(void *)uint64_t v26 = MEMORY[0x1E4F143A8];
      *(void *)&v26[8] = 3221225472;
      *(void *)&v26[16] = ____auditAccount_block_invoke;
      id v27 = &unk_1E6A19B30;
      v28[0] = v20;
      dispatch_async(queue, v26);
    }
  }
  [(HMDUser *)v9 registerIdentity];
  uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v23 addObserver:v9 selector:sel_handleRemovedAccessory_ name:@"HMDHomeAccessoryRemovedNotification" object:v4];

  uint64_t v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v25 = [(HMDUser *)v9 userDataController];
  [v24 addObserver:v9 selector:sel_handleUserDataControllerInitialized_ name:@"HMDUserDataControllerInitializedNotificationKey" object:v25];
}

- (BOOL)hasDeviceWithHomeKitVersionGreaterThanVersion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
  v50[13] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDUser *)self home];
  id v4 = NSString;
  id v46 = [(HMDUser *)self uuid];
  __int16 v45 = [v4 stringWithFormat:@"UUID: %@", v46];
  v50[0] = v45;
  id v5 = NSString;
  [v3 isAccessToHomeAllowed];
  id v44 = HMFBooleanToString();
  int v43 = [v5 stringWithFormat:@"Is Access Allowed: %@", v44];
  v50[1] = v43;
  id v6 = NSString;
  [(HMDUser *)self isCurrentUser];
  uint64_t v42 = HMFBooleanToString();
  uint64_t v41 = [v6 stringWithFormat:@"Is Current User: %@", v42];
  v50[2] = v41;
  id v7 = NSString;
  [(HMDUser *)self isAdministrator];
  uint64_t v40 = HMFBooleanToString();
  uint64_t v39 = [v7 stringWithFormat:@"Is Admin: %@", v40];
  v50[3] = v39;
  uint64_t v8 = NSString;
  [(HMDUser *)self isRemoteAccessAllowed];
  id v38 = HMFBooleanToString();
  __int16 v37 = [v8 stringWithFormat:@"Is Remote Access Allowed: %@", v38];
  v50[4] = v37;
  __int16 v36 = objc_msgSend(NSString, "stringWithFormat:", @"User Privilege: %lu", -[HMDUser privilege](self, "privilege"));
  v50[5] = v36;
  uint64_t v9 = NSString;
  int v35 = shouldLogPrivateInformation();
  if (v35)
  {
    uint64_t v10 = [(HMDUser *)self displayName];
  }
  else
  {
    uint64_t v10 = @"...";
  }
  id v30 = v10;
  __int16 v34 = [v9 stringWithFormat:@"Display Name: %@", v10];
  v50[6] = v34;
  char v11 = NSString;
  [(HMDUser *)self camerasAccessLevel];
  uint64_t v33 = HMUserCameraAccessLevelAsString();
  __int16 v31 = [v11 stringWithFormat:@"Cameras Access Level: %@", v33];
  v50[7] = v31;
  char v12 = NSString;
  [(HMDUser *)self isAnnounceAccessAllowed];
  uint64_t v13 = HMFBooleanToString();
  long long v14 = [v12 stringWithFormat:@"Is Announce Access Allowed: %@", v13];
  v50[8] = v14;
  long long v15 = NSString;
  long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  long long v17 = [v15 stringWithFormat:@"Announce Access Level: %@", v16];
  v50[9] = v17;
  uint64_t v47 = v3;
  __int16 v18 = [NSString stringWithFormat:@"Home: %@", v3];
  v50[10] = v18;
  uint64_t v19 = NSString;
  int v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  BOOL v21 = [v19 stringWithFormat:@"AudioDropIn: %@", v20];
  v50[11] = v21;
  __int16 v22 = NSString;
  uint64_t v23 = [(HMDUser *)self matterCASEAuthenticatedTagID];
  uint64_t v24 = [v22 stringWithFormat:@"CATID: %@", v23];
  v50[12] = v24;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:13];

  if (v35) {
  v48[0] = *MEMORY[0x1E4F64EA0];
  }
  id v25 = [v32 componentsJoinedByString:@", "];
  v48[1] = @"Photos Person Manager Settings";
  v49[0] = v25;
  uint64_t v26 = [(HMDUser *)self photosPersonManagerSettings];
  id v27 = [v26 description];
  v49[1] = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];

  return v28;
}

- (id)attributeDescriptions
{
  v52[14] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  BOOL v51 = [(HMDUser *)self uuid];
  uint64_t v50 = [v51 UUIDString];
  BOOL v49 = objc_msgSend(v3, "initWithName:value:", @"UUID");
  v52[0] = v49;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  long long v48 = [(HMDUser *)self account];
  uint64_t v47 = [v48 senderCorrelationIdentifier];
  id v46 = objc_msgSend(v4, "initWithName:value:", @"MID");
  v52[1] = v46;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  __int16 v45 = [(HMDUser *)self pairingIdentity];
  id v44 = objc_msgSend(v5, "initWithName:value:options:formatter:", @"PAID");
  v52[2] = v44;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v43 = [(HMDUser *)self accountHandle];
  uint64_t v42 = objc_msgSend(v6, "initWithName:value:", @"HNDL");
  v52[3] = v42;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v8 = [(HMDUser *)self displayName];
  uint64_t v40 = [MEMORY[0x1E4F65538] defaultFormatter];
  uint64_t v41 = (void *)v8;
  uint64_t v39 = objc_msgSend(v7, "initWithName:value:options:formatter:", @"DN", v8, 0);
  v52[4] = v39;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v10 = [(HMDUser *)self privilege];
  if (v10 > 4) {
    char v11 = @"None";
  }
  else {
    char v11 = off_1E6A14D48[v10];
  }
  id v38 = (void *)[v9 initWithName:@"PV" value:v11];
  v52[5] = v38;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDUser *)self isRemoteAccessAllowed];
  __int16 v37 = HMFBooleanToString();
  __int16 v36 = (void *)[v12 initWithName:@"RA" value:v37];
  v52[6] = v36;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v35 = [(HMDUser *)self presenceAuthStatus];
  __int16 v34 = (void *)[v13 initWithName:@"PA" value:v35];
  v52[7] = v34;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v33 = [(HMDUser *)self home];
  uint64_t v32 = (void *)[v14 initWithName:@"HM" value:v33];
  v52[8] = v32;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDUser *)self camerasAccessLevel];
  __int16 v31 = HMUserCameraAccessLevelAsString();
  long long v16 = (void *)[v15 initWithName:@"CA" value:v31];
  v52[9] = v16;
  id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDUser *)self isAnnounceAccessAllowed];
  __int16 v18 = HMFBooleanToString();
  uint64_t v19 = (void *)[v17 initWithName:@"AA" value:v18];
  v52[10] = v19;
  id v20 = objc_alloc(MEMORY[0x1E4F653F8]);
  BOOL v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser announceAccessLevel](self, "announceAccessLevel"));
  __int16 v22 = (void *)[v20 initWithName:@"AL" value:v21];
  v52[11] = v22;
  id v23 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUser audioAnalysisUserDropInAccessLevel](self, "audioAnalysisUserDropInAccessLevel"));
  id v25 = (void *)[v23 initWithName:@"AAN" value:v24];
  v52[12] = v25;
  id v26 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v27 = [(HMDUser *)self matterCASEAuthenticatedTagID];
  uint64_t v28 = (void *)[v26 initWithName:@"CATID" value:v27];
  v52[13] = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:14];

  return v29;
}

- (BOOL)isAccountEqualWithUser:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (HMDUser *)a3;
  id v5 = v4;
  if (v4 == self
    || ([(HMDUser *)v4 pairingIdentity],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(HMDUser *)self pairingIdentity],
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
    unint64_t v10 = (void *)MEMORY[0x1D9452090]();
    char v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543874;
      long long v16 = v13;
      __int16 v17 = 2112;
      __int16 v18 = v5;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Pairing Identity do not match : [otherUser : %@] [self : %@]", (uint8_t *)&v15, 0x20u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDUser *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    id v7 = v6;
    if (v6)
    {
      char v8 = [(HMDUser *)v6 pairingIdentity];
      BOOL v9 = [(HMDUser *)self pairingIdentity];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
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
  v36.receiver = self;
  v36.super_class = (Class)HMDUser;
  __int16 v19 = [(HMDUser *)&v36 init];
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
    id v27 = (const char *)[v26 UTF8String];
    uint64_t v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create(v27, v28);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v29;

    uint64_t v31 = [v14 copy];
    accountHandle = v20->_accountHandle;
    v20->_accountHandle = (HMDAccountHandle *)v31;

    v20->_unint64_t privilege = a6;
    v20->_int remoteAccessAllowed = 1;
    uint64_t v33 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    cloudShareIDFuture = v20->_cloudShareIDFuture;
    v20->_cloudShareIDFuture = v33;

    v20->_unint64_t camerasAccessLevel = HMUserDefaultCamerasAccessLevel();
    v20->_unint64_t announceAccessLevel = 0;
    v20->_announceNotificationModeForCurrentDevice = 0;
    v20->_needsiTunesMultiUserRepair = 0;
    v20->_int64_t userCloudShareWithOwnerMessagingState = 0;
  }

  return v20;
}

- (HMDUser)initWithAccountHandle:(id)a3 homeUUID:(id)a4 pairingIdentity:(id)a5 privilege:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(HMDUserDataSource);
  id v14 = [MEMORY[0x1E4F5BE48] systemStore];
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
  id v17 = [MEMORY[0x1E4F5BE48] systemStore];
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
        goto LABEL_15;
      }
      id v7 = +[HMDAccountHandleFormatter defaultFormatter];
      char v8 = [v4 userID];
      id v6 = [v7 accountHandleFromString:v8];
    }
    BOOL v9 = (void *)MEMORY[0x1E4F5BE00];
    id v10 = [v4 pairingIdentity];
    id v11 = objc_msgSend(v9, "hmd_pairingIdentityWithDictionary:", v10);

    id v12 = [v4 privilege];
    id v13 = -[HMDUser initWithAccountHandle:homeUUID:pairingIdentity:privilege:](self, "initWithAccountHandle:homeUUID:pairingIdentity:privilege:", v6, 0, v11, [v12 integerValue]);

    if (v13)
    {
      uint64_t v14 = [v4 uuid];
      uuid = v13->_uuid;
      v13->_uuid = (NSUUID *)v14;

      id v16 = [v4 remoteAccessAllowed];
      v13->_int remoteAccessAllowed = [v16 BOOLValue];

      id v17 = (void *)MEMORY[0x1E4F2EBC0];
      id v18 = [v4 presenceAuthorizationStatus];
      uint64_t v19 = [v17 authWithNumber:v18];
      presenceAuthStatus = v13->_presenceAuthStatus;
      v13->_presenceAuthStatus = (HMUserPresenceAuthorization *)v19;

      uint64_t v21 = [v4 accountIdentifier];
      accountIdentifier = v13->_accountIdentifier;
      v13->_accountIdentifier = (HMDAccountIdentifier *)v21;

      id v23 = [v4 camerasAccessLevel];

      if (v23)
      {
        uint64_t v24 = [v4 camerasAccessLevel];
        v13->_unint64_t camerasAccessLevel = [v24 integerValue];
      }
      id v25 = v4;
      if ([v25 propertyWasSet:@"announceAccessLevel"])
      {
        id v26 = [v25 announceAccessLevel];
        uint64_t v27 = (uint64_t)v13;
        uint64_t v28 = 0;
        dispatch_queue_t v29 = v26;
      }
      else
      {
        id v26 = [v25 announceAccessAllowed];
        uint64_t v27 = (uint64_t)v13;
        uint64_t v28 = v26;
        dispatch_queue_t v29 = 0;
      }
      uint64_t v30 = -[HMDUser announceUserAccessLevelFromAnnounceAccessAllowed:announceAccessLevel:](v27, v28, v29);

      v13->_unint64_t announceAccessLevel = v30;
      uint64_t v31 = [v25 matterCASEAuthenticatedTagID];
      if (v31)
      {
        uint64_t v32 = (void *)v31;
        uint64_t v33 = [v25 matterCASEAuthenticatedTagID];
        uint64_t v34 = [v33 integerValue];

        if (v34)
        {
          uint64_t v35 = [v25 matterCASEAuthenticatedTagID];
          matterCASEAuthenticatedTagID = v13->_matterCASEAuthenticatedTagID;
          v13->_matterCASEAuthenticatedTagID = (NSNumber *)v35;
        }
      }
    }
    self = v13;

    id v5 = self;
  }
LABEL_15:

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
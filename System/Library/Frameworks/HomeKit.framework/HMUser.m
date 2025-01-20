@interface HMUser
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_mergeWithNewAccessoryInvitations:(id)a3;
- (BOOL)isCurrentUser;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)mergePendingAccessoryInvitationsWithOutgoingInvitation:(id)a3;
- (BOOL)needsiTunesMultiUserRepair;
- (BOOL)rgAllowedPeriod;
- (BOOL)settingsInitialized;
- (BOOL)supportsSharedHomeHH2AutoMigration;
- (HMAnnounceUserSettings)announceUserSettings;
- (HMAssistantAccessControl)assistantAccessControl;
- (HMFPairingIdentity)pairingIdentity;
- (HMHome)home;
- (HMHomeAccessControl)homeAccessControl;
- (HMMediaContentProfileAccessControl)mediaContentProfileAccessControl;
- (HMPhotosPersonManager)photosPersonManager;
- (HMPhotosPersonManagerSettings)photosPersonManagerSettings;
- (HMSettings)privateSettings;
- (HMSettings)settings;
- (HMSettingsController)privateSettingsController;
- (HMSettingsController)settingsController;
- (HMUser)init;
- (HMUser)initWithCoder:(id)a3;
- (HMUser)initWithUserID:(id)a3 name:(id)a4 uuid:(id)a5 home:(id)a6;
- (HMUser)initWithUserID:(id)a3 name:(id)a4 uuid:(id)a5 home:(id)a6 homeAccessControl:(id)a7;
- (HMUserDelegatePrivate)delegate;
- (HMUserListeningHistoryUpdateControl)userListeningHistoryUpdateControl;
- (HMUserSettingsAdapter)privateSettingsAdapter;
- (HMUserSettingsAdapter)sharedSettingsAdapter;
- (IDSURI)userIDSURI;
- (NSDictionary)pendingPrivateSettings;
- (NSDictionary)pendingSharedSettings;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)iCloudAltDSID;
- (NSString)name;
- (NSString)userID;
- (NSUUID)photosPersonManagerZoneUUID;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)_filterAccessoryInvitationsFromOutgoingInvitation:(id)a3;
- (id)assistantAccessControlForHome:(id)a3;
- (id)logIdentifier;
- (id)mediaContentProfileAccessControlForHome:(id)a3;
- (id)messageDestination;
- (id)pendingAccessoryInvitations;
- (id)senderCorrelationIdentifier;
- (id)userListeningHistoryUpdateControlForHome:(id)a3;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_handleMultiUserStatusChangedNotification:(id)a3;
- (void)_handleRGAllowedPeriodEnded:(id)a3;
- (void)_handleRGAllowedPeriodStarted:(id)a3;
- (void)_handleSharedUserProfileMetadataUpdated;
- (void)_handleUpdatedAssistantAccessControl:(id)a3;
- (void)_mergeUserPairingIdentityIfNecessary:(id)a3 withNewPairingIdentity:(id)a4;
- (void)_registerNotificationHandlers;
- (void)_unconfigure;
- (void)_updatePresenceAuthorizationStatus:(unint64_t)a3 completionHandler:(id)a4;
- (void)configurePhotosPersonManager;
- (void)createConfigureAndMergePrivateSettingsIfNecessary:(id)a3 withContext:(id)a4;
- (void)createConfigureAndMergeSharedSettingsIfNecessary:(id)a3 withContext:(id)a4;
- (void)createHH1PrivateSettingsControllerIfNecessary;
- (void)createHH1SettingsControllerIfNecessary;
- (void)fetchAllPairingIdentitiesWithCompletionHandler:(id)a3;
- (void)fetchProfilePhoto:(id)a3;
- (void)fetchProfilePhotoAndCropRect:(id)a3;
- (void)fetchShareLookupInfo:(id)a3;
- (void)pairingIdentityWithCompletionHandler:(id)a3;
- (void)sendClientShareRepairRequest:(id)a3 containerID:(id)a4 completion:(id)a5;
- (void)sendClientShareURL:(id)a3 shareToken:(id)a4 containerID:(id)a5 fromUser:(id)a6 completion:(id)a7;
- (void)setAnnounceUserSettings:(id)a3;
- (void)setAssistantAccessControl:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentUser:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setHome:(id)a3;
- (void)setHomeAccessControl:(id)a3;
- (void)setMediaContentProfileAccessControl:(id)a3;
- (void)setName:(id)a3;
- (void)setNeedsiTunesMultiUserRepair:(BOOL)a3;
- (void)setNeedsiTunesMultiUserRepair:(BOOL)a3 completion:(id)a4;
- (void)setPairingIdentity:(id)a3;
- (void)setPendingAccessoryInvitationsWithOutgoingInvitation:(id)a3;
- (void)setPendingPrivateSettings:(id)a3;
- (void)setPendingSharedSettings:(id)a3;
- (void)setPhotosPersonManager:(id)a3;
- (void)setPhotosPersonManagerSettings:(id)a3;
- (void)setPhotosPersonManagerZoneUUID:(id)a3;
- (void)setPrivateSettingsAdapter:(id)a3;
- (void)setRgAllowedPeriod:(BOOL)a3;
- (void)setSharedSettingsAdapter:(id)a3;
- (void)setSupportsSharedHomeHH2AutoMigration:(BOOL)a3;
- (void)setUserID:(id)a3;
- (void)setUserListeningHistoryUpdateControl:(id)a3;
- (void)setiCloudAltDSID:(id)a3;
- (void)updateAnnounceUserSettings:(id)a3 forHome:(id)a4 completionHandler:(id)a5;
- (void)updateAssistantAccessControl:(id)a3 forHome:(id)a4 completionHandler:(id)a5;
- (void)updateHomeAccessControl:(BOOL)a3 remoteAccess:(BOOL)a4 announceAccess:(BOOL)a5 camerasAccess:(id)a6;
- (void)updateMediaContentProfileAccessControl:(id)a3 forHome:(id)a4 completionHandler:(id)a5;
- (void)updatePhotosPersonManagerSettings:(id)a3 completion:(id)a4;
- (void)updatePresenceAuthorizationStatus:(unint64_t)a3 completionHandler:(id)a4;
- (void)updateUserListeningHistoryUpdateControl:(id)a3 forHome:(id)a4 completionHandler:(id)a5;
@end

@implementation HMUser

- (HMSettings)privateSettings
{
  v3 = [(HMUser *)self privateSettingsAdapter];

  if (v3) {
    [(HMUser *)self privateSettingsAdapter];
  }
  else {
  v4 = [(HMUser *)self privateSettingsController];
  }
  v5 = [v4 settings];

  return (HMSettings *)v5;
}

- (HMSettingsController)privateSettingsController
{
  return (HMSettingsController *)objc_getProperty(self, a2, 200, 1);
}

- (HMUserSettingsAdapter)privateSettingsAdapter
{
  return (HMUserSettingsAdapter *)objc_getProperty(self, a2, 208, 1);
}

- (HMHomeAccessControl)homeAccessControl
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_homeAccessControl;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setCurrentUser:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_currentUser = a3;

  os_unfair_lock_unlock(p_lock);
}

- (HMUser)initWithUserID:(id)a3 name:(id)a4 uuid:(id)a5 home:(id)a6 homeAccessControl:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (HMHomeAccessControl *)a7;
  v30.receiver = self;
  v30.super_class = (Class)HMUser;
  v17 = [(HMUser *)&v30 init];
  if (v17)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v13);
    name = v17->_name;
    v17->_name = (NSString *)v18;

    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v12);
    userID = v17->_userID;
    v17->_userID = (NSString *)v20;

    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v14);
    uuid = v17->_uuid;
    v17->_uuid = (NSUUID *)v22;

    objc_storeWeak((id *)&v17->_home, v15);
    v17->_currentUser = 0;
    [(HMUser *)v17 createHH1SettingsControllerIfNecessary];
    [(HMUser *)v17 createHH1PrivateSettingsControllerIfNecessary];
    if (!v16)
    {
      v24 = +[HMUserCameraAccess accessWithValue:1];
      LOBYTE(v29) = 0;
      LOBYTE(v28) = 0;
      v16 = [[HMHomeAccessControl alloc] initWithUser:v17 allowAccess:1 owner:0 administratorPrivilege:0 remoteAccess:1 presenceAuthStatus:0 presenceComputeStatus:0 announceAccess:v28 camerasAccess:v24 audioAnalysisUserDropInAccessLevel:0 restrictedGuest:v29 restrictedGuestAccessSettings:0];
    }
    objc_storeStrong((id *)&v17->_homeAccessControl, v16);
    uint64_t v25 = +[HMMutableArray array];
    pendingAccessoryInvitations = v17->_pendingAccessoryInvitations;
    v17->_pendingAccessoryInvitations = (HMMutableArray *)v25;
  }
  return v17;
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    int v21 = 138543618;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", (uint8_t *)&v21, 0x16u);
  }
  [(HMUser *)v9 setHome:v7];
  [(HMUser *)v9 setContext:v6];
  id v12 = [v7 homeManager];
  int v13 = [v12 isDaemonRunningWithROARFramework];

  if (v13)
  {
    id v14 = [(HMUser *)v9 pendingPrivateSettings];
    [(HMUser *)v9 createConfigureAndMergePrivateSettingsIfNecessary:v14 withContext:v6];

    [(HMUser *)v9 setPendingPrivateSettings:0];
    id v15 = [(HMUser *)v9 pendingSharedSettings];
    [(HMUser *)v9 createConfigureAndMergeSharedSettingsIfNecessary:v15 withContext:v6];

    [(HMUser *)v9 setPendingSharedSettings:0];
    settingsController = v9->_settingsController;
    v9->_settingsController = 0;

    privateSettingsController = v9->_privateSettingsController;
    v9->_privateSettingsController = 0;
  }
  else
  {
    [(HMUser *)v9 createHH1SettingsControllerIfNecessary];
    [(HMUser *)v9 createHH1PrivateSettingsControllerIfNecessary];
    uint64_t v18 = [(HMUser *)v9 settingsController];
    [v18 configureWithContext:v6];

    privateSettingsController = [(HMUser *)v9 privateSettingsController];
    [privateSettingsController configureWithContext:v6];
  }

  [(HMUser *)v9 configurePhotosPersonManager];
  [(HMUser *)v9 _registerNotificationHandlers];
  v19 = [(HMUser *)v9 homeAccessControl];
  uint64_t v20 = [v19 restrictedGuestAccessSettings];
  [v20 fixupAccessoriesForHome:v7];
}

- (void)createHH1SettingsControllerIfNecessary
{
  if (!self->_settingsController)
  {
    v3 = [HMSettingsController alloc];
    uuid = self->_uuid;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    v5 = [WeakRetained uuid];
    id v6 = [(HMSettingsController *)v3 initWithParentIdentifier:uuid homeUUID:v5 codingKey:@"HMS.settings.shared"];
    settingsController = self->_settingsController;
    self->_settingsController = v6;
  }
}

- (void)createHH1PrivateSettingsControllerIfNecessary
{
  if (!self->_privateSettingsController)
  {
    v3 = [HMSettingsController alloc];
    uuid = self->_uuid;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    v5 = [WeakRetained uuid];
    id v6 = [(HMSettingsController *)v3 initWithParentIdentifier:uuid homeUUID:v5 codingKey:@"HMS.settings.private"];
    privateSettingsController = self->_privateSettingsController;
    self->_privateSettingsController = v6;
  }
}

- (HMSettings)settings
{
  v3 = [(HMUser *)self sharedSettingsAdapter];

  if (v3) {
    [(HMUser *)self sharedSettingsAdapter];
  }
  else {
  v4 = [(HMUser *)self settingsController];
  }
  v5 = [v4 settings];

  return (HMSettings *)v5;
}

- (HMSettingsController)settingsController
{
  return (HMSettingsController *)objc_getProperty(self, a2, 192, 1);
}

- (HMUserSettingsAdapter)sharedSettingsAdapter
{
  return (HMUserSettingsAdapter *)objc_getProperty(self, a2, 216, 1);
}

- (void)setHome:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setContext:(id)a3
{
}

- (HMPhotosPersonManager)photosPersonManager
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_photosPersonManager;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMPhotosPersonManagerSettings)photosPersonManagerSettings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_photosPersonManagerSettings;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_registerNotificationHandlers
{
  v3 = [(HMUser *)self context];
  v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"HMU.au" receiver:self selector:sel__handleUpdatedAssistantAccessControl_];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = [(HMUser *)self home];
  id v7 = [v6 uuid];
  [v5 addObserver:self selector:sel__handleMultiUserStatusChangedNotification_ name:@"HMHomeMultiUserEnabledChangeNotificationKey" object:v7];

  v8 = [(HMUser *)self context];
  v9 = [v8 messageDispatcher];
  [v9 registerForMessage:@"HM.u.rg.start" receiver:self selector:sel__handleRGAllowedPeriodStarted_];

  v10 = [(HMUser *)self context];
  v11 = [v10 messageDispatcher];
  [v11 registerForMessage:@"HM.u.rg.end" receiver:self selector:sel__handleRGAllowedPeriodEnded_];

  id v13 = [(HMUser *)self context];
  id v12 = [v13 messageDispatcher];
  [v12 registerForMessage:@"HMU.m.supmUpdated" receiver:self selector:sel__handleSharedUserProfileMetadataUpdatedMessage_];
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 248, 1);
}

- (HMHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);

  return (HMHome *)WeakRetained;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  id v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)needsiTunesMultiUserRepair
{
  return self->_needsiTunesMultiUserRepair;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t106 != -1) {
    dispatch_once(&logCategory__hmf_once_t106, &__block_literal_global_42351);
  }
  v2 = (void *)logCategory__hmf_once_v107;

  return v2;
}

uint64_t __21__HMUser_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v107;
  logCategory__hmf_once_v107 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (HMAnnounceUserSettings)announceUserSettings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_announceUserSettings;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)configurePhotosPersonManager
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(HMUser *)self photosPersonManagerSettings];
  if ([v3 isImportingFromPhotoLibraryEnabled]
    && ([(HMUser *)self photosPersonManager],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v13;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating photos person manager because importing from photo library is enabled", (uint8_t *)&v16, 0xCu);
    }
    id v14 = [[HMPhotosPersonManager alloc] initWithUser:v11];
    [(HMUser *)v11 setPhotosPersonManager:v14];

    id v15 = [(HMUser *)v11 photosPersonManager];
    [v15 configure];
  }
  else if (([v3 isImportingFromPhotoLibraryEnabled] & 1) == 0)
  {
    id v5 = [(HMUser *)self photosPersonManager];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x19F3A64A0]();
      id v7 = self;
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = HMFGetLogIdentifier();
        int v16 = 138543362;
        v17 = v9;
        _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Destroying photos person manager because importing from photo library is disabled", (uint8_t *)&v16, 0xCu);
      }
      [(HMUser *)v7 setPhotosPersonManager:0];
    }
  }
}

- (void)updatePhotosPersonManagerSettings:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMUser *)self context];
  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"Update photos person manager settings"];
    v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = [v9 identifier];
      id v15 = [v14 shortDescription];
      *(_DWORD *)buf = 138543874;
      v34 = v13;
      __int16 v35 = 2114;
      v36 = v15;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Updating photos person manager settings: %@", buf, 0x20u);
    }
    v31 = @"HMU.mk.ppms";
    int v16 = encodeRootObject(v6);
    v32 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];

    id v18 = objc_alloc(MEMORY[0x1E4F65488]);
    v19 = [(HMUser *)v11 uuid];
    uint64_t v20 = (void *)[v18 initWithTarget:v19];

    int v21 = [MEMORY[0x1E4F654B0] messageWithName:@"HMU.m.uppms" destination:v20 payload:v17];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __63__HMUser_Person__updatePhotosPersonManagerSettings_completion___block_invoke;
    v28[3] = &unk_1E5945510;
    v28[4] = v11;
    id v29 = v9;
    id v30 = v7;
    id v22 = v9;
    [v21 setResponseHandler:v28];
    __int16 v23 = [v8 messageDispatcher];
    [v23 sendMessage:v21 completionHandler:0];

    goto LABEL_9;
  }
  id v24 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v25 = self;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v34 = v27;
    __int16 v35 = 2080;
    v36 = "-[HMUser(Person) updatePhotosPersonManagerSettings:completion:]";
    _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  if (v7)
  {
    v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
LABEL_9:
  }
}

void __63__HMUser_Person__updatePhotosPersonManagerSettings_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v32[0] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v8 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HMU.mk.ppms", v7);

  v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"HMU.mk.ppmzu");
  v10 = (void *)MEMORY[0x19F3A64A0]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v14 = v22 = v5;
      id v15 = [*(id *)(a1 + 40) identifier];
      int v16 = [v15 shortDescription];
      *(_DWORD *)buf = 138544130;
      uint64_t v25 = v14;
      __int16 v26 = 2114;
      v27 = v16;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully updated photos person manager settings: %@, zone UUID: %@", buf, 0x2Au);

      id v5 = v22;
    }

    [*(id *)(a1 + 32) setPhotosPersonManagerSettings:v8];
    [*(id *)(a1 + 32) setPhotosPersonManagerZoneUUID:v9];
    [*(id *)(a1 + 32) configurePhotosPersonManager];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      [*(id *)(a1 + 40) identifier];
      id v18 = v23 = v5;
      v19 = [v18 shortDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v17;
      __int16 v26 = 2114;
      v27 = v19;
      __int16 v28 = 2112;
      id v29 = v23;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to update photos person manager settings: %@", buf, 0x20u);

      id v5 = v23;
    }
  }
  uint64_t v20 = [*(id *)(a1 + 32) context];
  int v21 = [v20 delegateCaller];
  [v21 callCompletion:*(void *)(a1 + 48) error:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_pendingSharedSettings, 0);
  objc_storeStrong((id *)&self->_pendingPrivateSettings, 0);
  objc_storeStrong((id *)&self->_sharedSettingsAdapter, 0);
  objc_storeStrong((id *)&self->_privateSettingsAdapter, 0);
  objc_storeStrong((id *)&self->_privateSettingsController, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_iCloudAltDSID, 0);
  objc_storeStrong((id *)&self->_photosPersonManagerZoneUUID, 0);
  objc_storeStrong((id *)&self->_photosPersonManagerSettings, 0);
  objc_storeStrong((id *)&self->_photosPersonManager, 0);
  objc_storeStrong((id *)&self->_announceUserSettings, 0);
  objc_storeStrong((id *)&self->_privateSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_pairingIdentity, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_userListeningHistoryUpdateControl, 0);
  objc_storeStrong((id *)&self->_mediaContentProfileAccessControl, 0);
  objc_storeStrong((id *)&self->_assistantAccessControl, 0);
  objc_storeStrong((id *)&self->_homeAccessControl, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);

  objc_storeStrong((id *)&self->_pendingAccessoryInvitations, 0);
}

- (void)setRgAllowedPeriod:(BOOL)a3
{
  self->_rgAllowedPeriod = a3;
}

- (BOOL)rgAllowedPeriod
{
  return self->_rgAllowedPeriod;
}

- (void)setPendingSharedSettings:(id)a3
{
}

- (NSDictionary)pendingSharedSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPendingPrivateSettings:(id)a3
{
}

- (NSDictionary)pendingPrivateSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSharedSettingsAdapter:(id)a3
{
}

- (void)setPrivateSettingsAdapter:(id)a3
{
}

- (HMUserDelegatePrivate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMUserDelegatePrivate *)WeakRetained;
}

- (void)setSupportsSharedHomeHH2AutoMigration:(BOOL)a3
{
  self->_supportsSharedHomeHH2AutoMigration = a3;
}

- (BOOL)supportsSharedHomeHH2AutoMigration
{
  return self->_supportsSharedHomeHH2AutoMigration;
}

- (BOOL)settingsInitialized
{
  return self->_settingsInitialized;
}

- (void)setNeedsiTunesMultiUserRepair:(BOOL)a3
{
  self->_needsiTunesMultiUserRepair = a3;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  v4 = [(HMUser *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)createConfigureAndMergeSharedSettingsIfNecessary:(id)a3 withContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(HMUser *)self sharedSettingsAdapter];
  if (!v7)
  {
    id v7 = [[HMUserSettingsAdapter alloc] initWithUser:self settingsType:2];
    [(HMUserSettingsAdapter *)v7 configureWithContext:v6];
    [(HMUser *)self setSharedSettingsAdapter:v7];
  }
  if (v8) {
    [(HMUserSettingsAdapter *)v7 mergeWithDictionary:v8];
  }
}

- (void)createConfigureAndMergePrivateSettingsIfNecessary:(id)a3 withContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(HMUser *)self privateSettingsAdapter];
  if (!v7)
  {
    id v7 = [[HMUserSettingsAdapter alloc] initWithUser:self settingsType:1];
    [(HMUserSettingsAdapter *)v7 configureWithContext:v6];
    [(HMUser *)self setPrivateSettingsAdapter:v7];
  }
  if (v8) {
    [(HMUserSettingsAdapter *)v7 mergeWithDictionary:v8];
  }
}

- (void)_mergeUserPairingIdentityIfNecessary:(id)a3 withNewPairingIdentity:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [v6 identifier];
    id v13 = [v7 identifier];
    *(_DWORD *)buf = 138543874;
    id v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    __int16 v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Pairing Identity for the user has changed from : %@ to %@", buf, 0x20u);
  }
  [(HMUser *)v9 setPairingIdentity:v7];
  id v14 = [(HMUser *)v9 delegate];
  if ([v14 conformsToProtocol:&unk_1EEF70680]) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  if (objc_opt_respondsToSelector())
  {
    v17 = [(HMUser *)v9 context];
    id v18 = [v17 delegateCaller];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __70__HMUser__mergeUserPairingIdentityIfNecessary_withNewPairingIdentity___block_invoke;
    v19[3] = &unk_1E5945650;
    v19[4] = v9;
    id v20 = v7;
    id v21 = v16;
    [v18 invokeBlock:v19];
  }
}

void __70__HMUser__mergeUserPairingIdentityIfNecessary_withNewPairingIdentity___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying client that pairing identity has changed to : %@", (uint8_t *)&v10, 0x16u);
  }
  id v7 = *(void **)(a1 + 48);
  id v8 = *(void **)(a1 + 32);
  v9 = [v8 pairingIdentity];
  [v7 user:v8 didUpdatePairingIdentity:v9];
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v438 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  v373 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v213 = 0;
    goto LABEL_201;
  }
  v381 = self;
  id v382 = v4;
  v389 = [(HMUser *)self home];
  id v5 = [v382 name];
  [(HMUser *)self setName:v5];

  uint64_t v6 = [v382 userID];
  [(HMUser *)self setUserID:v6];

  id v7 = [v382 pendingAccessoryInvitations];
  [(HMUser *)self _mergeWithNewAccessoryInvitations:v7];

  id v8 = [(HMUser *)self homeAccessControl];
  int v9 = [v8 isAccessAllowed];
  int v10 = [v382 homeAccessControl];
  int v11 = v9 ^ [v10 isAccessAllowed];

  int v380 = v11;
  if (v11 == 1)
  {
    __int16 v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = v381;
    HMFGetOSLogHandle();
    uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = [(HMUser *)v13 homeAccessControl];
      [v16 isAccessAllowed];
      HMFBooleanToString();
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = [v382 homeAccessControl];
      [v18 isAccessAllowed];
      HMFBooleanToString();
      v19 = (char *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v426 = v15;
      __int16 v427 = 2112;
      id v428 = v17;
      __int16 v429 = 2112;
      v430 = v19;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Updated isAccessAllowed from %@ to %@", buf, 0x20u);
    }
    id v20 = [(HMUser *)v13 homeAccessControl];
    id v21 = [v382 homeAccessControl];
    objc_msgSend(v20, "setAccessAllowed:", objc_msgSend(v21, "isAccessAllowed"));
  }
  id v22 = [(HMUser *)v381 homeAccessControl];
  uint64_t v23 = [v22 accessNotAllowedReasonCode];
  __int16 v24 = [v382 homeAccessControl];
  LOBYTE(v23) = v23 == [v24 accessNotAllowedReasonCode];

  if ((v23 & 1) == 0)
  {
    uint64_t v25 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v26 = v381;
    HMFGetOSLogHandle();
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      id v29 = NSNumber;
      __int16 v30 = [(HMUser *)v26 homeAccessControl];
      v31 = objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v30, "accessNotAllowedReasonCode"));
      v32 = NSNumber;
      v33 = [v382 homeAccessControl];
      objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "accessNotAllowedReasonCode"));
      v34 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v426 = v28;
      __int16 v427 = 2112;
      id v428 = v31;
      __int16 v429 = 2112;
      v430 = v34;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Updated access not allowed reason code from %@ to %@", buf, 0x20u);
    }
    __int16 v35 = [v382 homeAccessControl];
    uint64_t v36 = [v35 accessNotAllowedReasonCode];
    __int16 v37 = [(HMUser *)v26 homeAccessControl];
    [v37 setAccessNotAllowedReasonCode:v36];

    int v380 = 1;
  }
  id v38 = [(HMUser *)v381 homeAccessControl];
  int v39 = [v38 isOwner];
  v40 = [v382 homeAccessControl];
  int v41 = [v40 isOwner];

  if (v39 != v41)
  {
    v42 = (void *)MEMORY[0x19F3A64A0]();
    v43 = v381;
    HMFGetOSLogHandle();
    v44 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      v46 = [(HMUser *)v43 homeAccessControl];
      [v46 isOwner];
      HMFBooleanToString();
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      v48 = [v382 homeAccessControl];
      [v48 isOwner];
      HMFBooleanToString();
      v49 = (char *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v426 = v45;
      __int16 v427 = 2112;
      id v428 = v47;
      __int16 v429 = 2112;
      v430 = v49;
      _os_log_impl(&dword_19D1A8000, v44, OS_LOG_TYPE_INFO, "%{public}@Updated isOwner from %@ to %@", buf, 0x20u);
    }
    v50 = [(HMUser *)v43 homeAccessControl];
    v51 = [v382 homeAccessControl];
    objc_msgSend(v50, "setOwner:", objc_msgSend(v51, "isOwner"));

    int v380 = 1;
  }
  v52 = [(HMUser *)v381 homeAccessControl];
  int v53 = [v52 isAdministrator];
  v54 = [v382 homeAccessControl];
  int v55 = [v54 isAdministrator];

  if (v53 != v55)
  {
    v56 = (void *)MEMORY[0x19F3A64A0]();
    v57 = v381;
    HMFGetOSLogHandle();
    v58 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v59 = (id)objc_claimAutoreleasedReturnValue();
      v60 = [(HMUser *)v57 homeAccessControl];
      [v60 isAdministrator];
      HMFBooleanToString();
      id v61 = (id)objc_claimAutoreleasedReturnValue();
      v62 = [v382 homeAccessControl];
      [v62 isAdministrator];
      HMFBooleanToString();
      v63 = (char *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v426 = v59;
      __int16 v427 = 2112;
      id v428 = v61;
      __int16 v429 = 2112;
      v430 = v63;
      _os_log_impl(&dword_19D1A8000, v58, OS_LOG_TYPE_INFO, "%{public}@Updated isAdministrator from %@ to %@", buf, 0x20u);
    }
    v64 = [(HMUser *)v57 homeAccessControl];
    v65 = [v382 homeAccessControl];
    objc_msgSend(v64, "setAdministrator:", objc_msgSend(v65, "isAdministrator"));

    int v380 = 1;
  }
  v66 = [(HMUser *)v381 homeAccessControl];
  int v67 = [v66 isRemoteAccessAllowed];
  v68 = [v382 homeAccessControl];
  int v69 = [v68 isRemoteAccessAllowed];

  if (v67 != v69)
  {
    v70 = (void *)MEMORY[0x19F3A64A0]();
    v71 = v381;
    HMFGetOSLogHandle();
    v72 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v73 = (id)objc_claimAutoreleasedReturnValue();
      v74 = [(HMUser *)v71 homeAccessControl];
      [v74 isRemoteAccessAllowed];
      HMFBooleanToString();
      id v75 = (id)objc_claimAutoreleasedReturnValue();
      v76 = [v382 homeAccessControl];
      [v76 isRemoteAccessAllowed];
      HMFBooleanToString();
      v77 = (char *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v426 = v73;
      __int16 v427 = 2112;
      id v428 = v75;
      __int16 v429 = 2112;
      v430 = v77;
      _os_log_impl(&dword_19D1A8000, v72, OS_LOG_TYPE_INFO, "%{public}@Updated isRemoteAccessAllowed from %@ to %@", buf, 0x20u);
    }
    v78 = [(HMUser *)v71 homeAccessControl];
    v79 = [v382 homeAccessControl];
    objc_msgSend(v78, "setRemoteAccessAllowed:", objc_msgSend(v79, "isRemoteAccessAllowed"));

    int v380 = 1;
  }
  v80 = [(HMUser *)v381 homeAccessControl];
  v81 = [v80 presenceAuthStatus];
  v82 = [v382 homeAccessControl];
  v83 = [v82 presenceAuthStatus];
  char v84 = HMFEqualObjects();

  if ((v84 & 1) == 0)
  {
    v85 = (void *)MEMORY[0x19F3A64A0]();
    v86 = v381;
    HMFGetOSLogHandle();
    v87 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v88 = (id)objc_claimAutoreleasedReturnValue();
      v89 = [(HMUser *)v86 homeAccessControl];
      v90 = [v89 presenceAuthStatus];
      v91 = [v382 homeAccessControl];
      v92 = [v91 presenceAuthStatus];
      *(_DWORD *)buf = 138543874;
      id v426 = v88;
      __int16 v427 = 2112;
      id v428 = v90;
      __int16 v429 = 2112;
      v430 = v92;
      _os_log_impl(&dword_19D1A8000, v87, OS_LOG_TYPE_INFO, "%{public}@Updated presence auth status from %@ to %@", buf, 0x20u);
    }
    v93 = [v382 homeAccessControl];
    v94 = [v93 presenceAuthStatus];
    v95 = [(HMUser *)v86 homeAccessControl];
    [v95 setPresenceAuthStatus:v94];

    int v380 = 1;
  }
  v96 = [(HMUser *)v381 homeAccessControl];
  v97 = [v96 presenceComputeStatus];
  v98 = [v382 homeAccessControl];
  v99 = [v98 presenceComputeStatus];
  char v100 = HMFEqualObjects();

  if ((v100 & 1) == 0)
  {
    v101 = (void *)MEMORY[0x19F3A64A0]();
    v102 = v381;
    HMFGetOSLogHandle();
    v103 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v104 = (id)objc_claimAutoreleasedReturnValue();
      v105 = [(HMUser *)v102 homeAccessControl];
      v106 = [v105 presenceComputeStatus];
      v107 = [v382 homeAccessControl];
      v108 = [v107 presenceComputeStatus];
      *(_DWORD *)buf = 138543874;
      id v426 = v104;
      __int16 v427 = 2112;
      id v428 = v106;
      __int16 v429 = 2112;
      v430 = v108;
      _os_log_impl(&dword_19D1A8000, v103, OS_LOG_TYPE_INFO, "%{public}@Updated presence compute status from %@ to %@", buf, 0x20u);
    }
    v109 = [v382 homeAccessControl];
    v110 = [v109 presenceComputeStatus];
    v111 = [(HMUser *)v102 homeAccessControl];
    [v111 setPresenceComputeStatus:v110];

    int v380 = 1;
  }
  v112 = [(HMUser *)v381 homeAccessControl];
  v113 = [v112 camerasAccess];
  v114 = [v382 homeAccessControl];
  v115 = [v114 camerasAccess];
  char v116 = HMFEqualObjects();

  if ((v116 & 1) == 0)
  {
    v117 = (void *)MEMORY[0x19F3A64A0]();
    v118 = v381;
    HMFGetOSLogHandle();
    v119 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v120 = (id)objc_claimAutoreleasedReturnValue();
      v121 = [(HMUser *)v118 homeAccessControl];
      v122 = [v121 camerasAccess];
      v123 = [v382 homeAccessControl];
      v124 = [v123 camerasAccess];
      *(_DWORD *)buf = 138543874;
      id v426 = v120;
      __int16 v427 = 2112;
      id v428 = v122;
      __int16 v429 = 2112;
      v430 = v124;
      _os_log_impl(&dword_19D1A8000, v119, OS_LOG_TYPE_INFO, "%{public}@Updated cameras access from %@ to %@", buf, 0x20u);
    }
    v125 = [v382 homeAccessControl];
    v126 = [v125 camerasAccess];
    v127 = [(HMUser *)v118 homeAccessControl];
    [v127 setCamerasAccess:v126];

    int v380 = 1;
  }
  v128 = [(HMUser *)v381 announceUserSettings];
  v129 = [v382 announceUserSettings];
  char v130 = HMFEqualObjects();

  if ((v130 & 1) == 0)
  {
    v131 = [v382 announceUserSettings];
    [(HMUser *)v381 setAnnounceUserSettings:v131];
  }
  v132 = [(HMUser *)v381 homeAccessControl];
  int v133 = [v132 isAnnounceAccessAllowed];
  v134 = [v382 homeAccessControl];
  int v135 = [v134 isAnnounceAccessAllowed];

  if (v133 != v135)
  {
    v136 = (void *)MEMORY[0x19F3A64A0]();
    v137 = v381;
    HMFGetOSLogHandle();
    v138 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v139 = (id)objc_claimAutoreleasedReturnValue();
      v140 = [(HMUser *)v137 homeAccessControl];
      [v140 isAnnounceAccessAllowed];
      HMFBooleanToString();
      id v141 = (id)objc_claimAutoreleasedReturnValue();
      v142 = [v382 homeAccessControl];
      [v142 isAnnounceAccessAllowed];
      HMFBooleanToString();
      v143 = (char *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v426 = v139;
      __int16 v427 = 2112;
      id v428 = v141;
      __int16 v429 = 2112;
      v430 = v143;
      _os_log_impl(&dword_19D1A8000, v138, OS_LOG_TYPE_INFO, "%{public}@Updated isAnnounceAccessAllowed from %@ to %@", buf, 0x20u);
    }
    v144 = [(HMUser *)v137 homeAccessControl];
    v145 = [v382 homeAccessControl];
    objc_msgSend(v144, "setAnnounceAccessAllowed:", objc_msgSend(v145, "isAnnounceAccessAllowed"));

    int v380 = 1;
  }
  v146 = [(HMUser *)v381 homeAccessControl];
  int v147 = [v146 isRestrictedGuest];
  v148 = [v382 homeAccessControl];
  int v149 = [v148 isRestrictedGuest];

  if (v147 != v149)
  {
    v150 = (void *)MEMORY[0x19F3A64A0]();
    v151 = v381;
    HMFGetOSLogHandle();
    v152 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v153 = (id)objc_claimAutoreleasedReturnValue();
      v154 = [(HMUser *)v151 homeAccessControl];
      [v154 isRestrictedGuest];
      HMFBooleanToString();
      id v155 = (id)objc_claimAutoreleasedReturnValue();
      v156 = [v382 homeAccessControl];
      [v156 isRestrictedGuest];
      HMFBooleanToString();
      v157 = (char *)(id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v426 = v153;
      __int16 v427 = 2112;
      id v428 = v155;
      __int16 v429 = 2112;
      v430 = v157;
      _os_log_impl(&dword_19D1A8000, v152, OS_LOG_TYPE_INFO, "%{public}@Updated isRestrictedGuest from %@ to %@", buf, 0x20u);
    }
    v158 = [(HMUser *)v151 homeAccessControl];
    v159 = [v382 homeAccessControl];
    objc_msgSend(v158, "setRestrictedGuest:", objc_msgSend(v159, "isRestrictedGuest"));

    int v380 = 1;
  }
  v160 = [v382 homeAccessControl];
  v161 = [v160 restrictedGuestAccessSettings];
  [v161 fixupAccessoriesForHome:v389];

  v162 = [(HMUser *)v381 homeAccessControl];
  v163 = [v162 restrictedGuestAccessSettings];
  v164 = [v382 homeAccessControl];
  v165 = [v164 restrictedGuestAccessSettings];
  char v166 = HMFEqualObjects();

  if ((v166 & 1) == 0)
  {
    v167 = (void *)MEMORY[0x19F3A64A0]();
    v168 = v381;
    HMFGetOSLogHandle();
    v169 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v170 = (id)objc_claimAutoreleasedReturnValue();
      v171 = [(HMUser *)v168 homeAccessControl];
      v172 = [v171 restrictedGuestAccessSettings];
      v173 = [v382 homeAccessControl];
      v174 = [v173 restrictedGuestAccessSettings];
      *(_DWORD *)buf = 138543874;
      id v426 = v170;
      __int16 v427 = 2112;
      id v428 = v172;
      __int16 v429 = 2112;
      v430 = v174;
      _os_log_impl(&dword_19D1A8000, v169, OS_LOG_TYPE_INFO, "%{public}@Updated restricted guest access settings from %@ to %@", buf, 0x20u);
    }
    v175 = [v382 homeAccessControl];
    v176 = [v175 restrictedGuestAccessSettings];
    v177 = [(HMUser *)v168 homeAccessControl];
    [v177 setRestrictedGuestAccessSettings:v176];

    int v380 = 1;
  }
  v178 = [(HMUser *)v381 homeAccessControl];
  uint64_t v179 = [v178 audioAnalysisUserDropInAccessLevel];
  v180 = [v382 homeAccessControl];
  LOBYTE(v179) = v179 == [v180 audioAnalysisUserDropInAccessLevel];

  if ((v179 & 1) == 0)
  {
    v181 = (void *)MEMORY[0x19F3A64A0]();
    v182 = v381;
    HMFGetOSLogHandle();
    v183 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v184 = (id)objc_claimAutoreleasedReturnValue();
      v185 = NSNumber;
      v186 = [(HMUser *)v182 homeAccessControl];
      v187 = objc_msgSend(v185, "numberWithUnsignedInteger:", objc_msgSend(v186, "audioAnalysisUserDropInAccessLevel"));
      v188 = NSNumber;
      v189 = [v382 homeAccessControl];
      objc_msgSend(v188, "numberWithUnsignedInteger:", objc_msgSend(v189, "audioAnalysisUserDropInAccessLevel"));
      v190 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      id v426 = v184;
      __int16 v427 = 2112;
      id v428 = v187;
      __int16 v429 = 2112;
      v430 = v190;
      _os_log_impl(&dword_19D1A8000, v183, OS_LOG_TYPE_INFO, "%{public}@Updating audio analysis drop in user access from %@ to %@", buf, 0x20u);
    }
    v191 = [v382 homeAccessControl];
    uint64_t v192 = [v191 audioAnalysisUserDropInAccessLevel];
    v193 = [(HMUser *)v182 homeAccessControl];
    [v193 setAudioAnalysisUserDropInAccessLevel:v192];

    int v380 = 1;
  }
  v379 = [v382 assistantAccessControl];
  v194 = [(HMUser *)v381 assistantAccessControl];
  char v374 = HMFEqualObjects();

  if ((v374 & 1) == 0)
  {
    v195 = (void *)MEMORY[0x19F3A64A0]();
    v383 = v381;
    HMFGetOSLogHandle();
    v196 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v196, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v197 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v426 = v197;
      __int16 v427 = 2112;
      id v428 = v379;
      _os_log_impl(&dword_19D1A8000, v196, OS_LOG_TYPE_DEFAULT, "%{public}@Updated assistant access control via merge: %@", buf, 0x16u);
    }
    v377 = [v379 accessories];
    if ([v377 count])
    {
      v386 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v377, "count"));
      long long v423 = 0u;
      long long v424 = 0u;
      long long v421 = 0u;
      long long v422 = 0u;
      id v198 = v377;
      uint64_t v199 = [v198 countByEnumeratingWithState:&v421 objects:v437 count:16];
      if (v199)
      {
        uint64_t v200 = *(void *)v422;
        do
        {
          for (uint64_t i = 0; i != v199; ++i)
          {
            if (*(void *)v422 != v200) {
              objc_enumerationMutation(v198);
            }
            v202 = *(void **)(*((void *)&v421 + 1) + 8 * i);
            v203 = [v202 uuid];
            v204 = [v389 accessoryWithUUID:v203];

            if (v204)
            {
              [v386 addObject:v204];
            }
            else
            {
              v205 = (void *)MEMORY[0x19F3A64A0]();
              v206 = v383;
              HMFGetOSLogHandle();
              v207 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v207, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                id v208 = (id)objc_claimAutoreleasedReturnValue();
                v209 = [v202 uuid];
                *(_DWORD *)buf = 138543618;
                id v426 = v208;
                __int16 v427 = 2112;
                id v428 = v209;
                _os_log_impl(&dword_19D1A8000, v207, OS_LOG_TYPE_INFO, "%{public}@Unable to find accessory with identifier: %@", buf, 0x16u);
              }
            }
          }
          uint64_t v199 = [v198 countByEnumeratingWithState:&v421 objects:v437 count:16];
        }
        while (v199);
      }

      v210 = (void *)[v379 mutableCopy];
      [v210 setAccessories:v386];
      uint64_t v211 = [v210 copy];

      v212 = (void *)v211;
    }
    else
    {
      v212 = v379;
    }
    v379 = v212;
    -[HMUser setAssistantAccessControl:](v383, "setAssistantAccessControl:");
    if (v389)
    {
      v214 = [(HMUser *)v383 delegate];
      if ([v214 conformsToProtocol:&unk_1EEF70680]) {
        v215 = v214;
      }
      else {
        v215 = 0;
      }
      id v216 = v215;

      if (objc_opt_respondsToSelector())
      {
        v217 = [(HMUser *)v383 context];
        v218 = [v217 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __29__HMUser_mergeFromNewObject___block_invoke;
        block[3] = &unk_1E5944F20;
        block[4] = v383;
        id v418 = v379;
        id v419 = v216;
        id v420 = v389;
        dispatch_async(v218, block);
      }
      else
      {
        v219 = (void *)MEMORY[0x19F3A64A0]();
        v220 = v383;
        HMFGetOSLogHandle();
        v221 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v222 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          id v426 = v222;
          __int16 v427 = 2112;
          id v428 = v216;
          __int16 v429 = 2112;
          v430 = (const char *)v379;
          _os_log_impl(&dword_19D1A8000, v221, OS_LOG_TYPE_INFO, "%{public}@No delegate set to notify: %@, assistant access control via merge: %@", buf, 0x20u);
        }
      }
    }
  }
  v378 = [v382 mediaContentProfileAccessControl];
  v223 = [(HMUser *)v381 mediaContentProfileAccessControl];
  char v224 = HMFEqualObjects();

  if (v224)
  {
    char v225 = v374 ^ 1;
  }
  else
  {
    v226 = (void *)MEMORY[0x19F3A64A0]();
    v384 = v381;
    HMFGetOSLogHandle();
    v227 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v228 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v426 = v228;
      __int16 v427 = 2112;
      id v428 = v378;
      _os_log_impl(&dword_19D1A8000, v227, OS_LOG_TYPE_DEFAULT, "%{public}@Updated media content profile access control: %@", buf, 0x16u);
    }
    v375 = [v378 accessories];
    if ([v375 count])
    {
      v387 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v375, "count"));
      long long v415 = 0u;
      long long v416 = 0u;
      long long v413 = 0u;
      long long v414 = 0u;
      id v229 = v375;
      uint64_t v230 = [v229 countByEnumeratingWithState:&v413 objects:v436 count:16];
      if (v230)
      {
        uint64_t v231 = *(void *)v414;
        do
        {
          for (uint64_t j = 0; j != v230; ++j)
          {
            if (*(void *)v414 != v231) {
              objc_enumerationMutation(v229);
            }
            v233 = *(void **)(*((void *)&v413 + 1) + 8 * j);
            v234 = [v233 uuid];
            v235 = [v389 accessoryWithUUID:v234];

            if (v235)
            {
              [v387 addObject:v235];
            }
            else
            {
              v236 = (void *)MEMORY[0x19F3A64A0]();
              v237 = v384;
              HMFGetOSLogHandle();
              v238 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v238, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                id v239 = (id)objc_claimAutoreleasedReturnValue();
                v240 = [v233 uuid];
                *(_DWORD *)buf = 138543618;
                id v426 = v239;
                __int16 v427 = 2112;
                id v428 = v240;
                _os_log_impl(&dword_19D1A8000, v238, OS_LOG_TYPE_INFO, "%{public}@Unable to find accessory with identifier: %@", buf, 0x16u);
              }
            }
          }
          uint64_t v230 = [v229 countByEnumeratingWithState:&v413 objects:v436 count:16];
        }
        while (v230);
      }

      v241 = (void *)[v378 mutableCopy];
      [v241 setAccessories:v387];
      uint64_t v242 = [v241 copy];

      v243 = (void *)v242;
    }
    else
    {
      v243 = v378;
    }
    v378 = v243;
    -[HMUser setMediaContentProfileAccessControl:](v384, "setMediaContentProfileAccessControl:");
    if (v389)
    {
      v244 = [(HMUser *)v384 delegate];
      if ([v244 conformsToProtocol:&unk_1EEF70680]) {
        v245 = v244;
      }
      else {
        v245 = 0;
      }
      id v246 = v245;

      if (objc_opt_respondsToSelector())
      {
        v247 = [(HMUser *)v384 context];
        v248 = [v247 queue];
        v409[0] = MEMORY[0x1E4F143A8];
        v409[1] = 3221225472;
        v409[2] = __29__HMUser_mergeFromNewObject___block_invoke_353;
        v409[3] = &unk_1E5944F20;
        v409[4] = v384;
        id v410 = v378;
        id v411 = v246;
        id v412 = v389;
        dispatch_async(v248, v409);
      }
      else
      {
        v249 = (void *)MEMORY[0x19F3A64A0]();
        v250 = v384;
        HMFGetOSLogHandle();
        v251 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v251, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          id v252 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          id v426 = v252;
          __int16 v427 = 2112;
          id v428 = v246;
          __int16 v429 = 2112;
          v430 = (const char *)v378;
          _os_log_impl(&dword_19D1A8000, v251, OS_LOG_TYPE_DEBUG, "%{public}@No delegate set to notify: %@, media content profile access control via merge: %@", buf, 0x20u);
        }
      }
    }
    char v225 = 1;
  }
  v376 = [v382 userListeningHistoryUpdateControl];
  v253 = [(HMUser *)v381 userListeningHistoryUpdateControl];
  char v254 = HMFEqualObjects();

  if ((v254 & 1) == 0)
  {
    v255 = (void *)MEMORY[0x19F3A64A0]();
    v385 = v381;
    HMFGetOSLogHandle();
    v256 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v257 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v426 = v257;
      __int16 v427 = 2112;
      id v428 = v376;
      _os_log_impl(&dword_19D1A8000, v256, OS_LOG_TYPE_DEFAULT, "%{public}@Updated user listening history update control: %@", buf, 0x16u);
    }
    v372 = [v376 accessories];
    if ([v372 count])
    {
      v388 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v372, "count"));
      long long v407 = 0u;
      long long v408 = 0u;
      long long v405 = 0u;
      long long v406 = 0u;
      id v258 = v372;
      uint64_t v259 = [v258 countByEnumeratingWithState:&v405 objects:v435 count:16];
      if (v259)
      {
        uint64_t v260 = *(void *)v406;
        do
        {
          for (uint64_t k = 0; k != v259; ++k)
          {
            if (*(void *)v406 != v260) {
              objc_enumerationMutation(v258);
            }
            v262 = *(void **)(*((void *)&v405 + 1) + 8 * k);
            v263 = [v262 uuid];
            v264 = [v389 accessoryWithUUID:v263];

            if (v264)
            {
              [v388 addObject:v264];
            }
            else
            {
              v265 = (void *)MEMORY[0x19F3A64A0]();
              v266 = v385;
              HMFGetOSLogHandle();
              v267 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v267, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                id v268 = (id)objc_claimAutoreleasedReturnValue();
                v269 = [v262 uuid];
                *(_DWORD *)buf = 138543874;
                id v426 = v268;
                __int16 v427 = 2112;
                id v428 = v269;
                __int16 v429 = 2080;
                v430 = "-[HMUser mergeFromNewObject:]";
                _os_log_impl(&dword_19D1A8000, v267, OS_LOG_TYPE_INFO, "%{public}@Unable to find accessory with identifier: %@, %s", buf, 0x20u);
              }
            }
          }
          uint64_t v259 = [v258 countByEnumeratingWithState:&v405 objects:v435 count:16];
        }
        while (v259);
      }

      v270 = (void *)[v376 mutableCopy];
      [v270 setAccessories:v388];
      uint64_t v271 = [v270 copy];

      v272 = (void *)v271;
    }
    else
    {
      v272 = v376;
    }
    v376 = v272;
    -[HMUser setUserListeningHistoryUpdateControl:](v385, "setUserListeningHistoryUpdateControl:");
    if (v389)
    {
      v273 = [(HMUser *)v385 delegate];
      if ([v273 conformsToProtocol:&unk_1EEF70680]) {
        v274 = v273;
      }
      else {
        v274 = 0;
      }
      id v275 = v274;

      if (objc_opt_respondsToSelector())
      {
        v276 = [(HMUser *)v385 context];
        v277 = [v276 queue];
        v401[0] = MEMORY[0x1E4F143A8];
        v401[1] = 3221225472;
        v401[2] = __29__HMUser_mergeFromNewObject___block_invoke_356;
        v401[3] = &unk_1E5944F20;
        v401[4] = v385;
        id v402 = v376;
        id v403 = v275;
        id v404 = v389;
        dispatch_async(v277, v401);
      }
      else
      {
        v278 = (void *)MEMORY[0x19F3A64A0]();
        v279 = v385;
        HMFGetOSLogHandle();
        v280 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v280, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          id v281 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          id v426 = v281;
          __int16 v427 = 2112;
          id v428 = v275;
          __int16 v429 = 2112;
          v430 = (const char *)v376;
          _os_log_impl(&dword_19D1A8000, v280, OS_LOG_TYPE_DEBUG, "%{public}@No delegate set to notify: %@, updated user update listening history via merge: %@", buf, 0x20u);
        }
      }
    }
    char v225 = 1;
  }
  v282 = v381;
  if (v380 && v381 && v389)
  {
    v283 = [(HMUser *)v381 context];
    v284 = [v283 queue];
    v399[0] = MEMORY[0x1E4F143A8];
    v399[1] = 3221225472;
    v399[2] = __29__HMUser_mergeFromNewObject___block_invoke_358;
    v399[3] = &unk_1E5945628;
    v399[4] = v381;
    id v400 = v389;
    dispatch_async(v284, v399);

    v282 = v381;
  }
  v285 = [(HMUser *)v282 senderCorrelationIdentifier];
  v286 = [v382 senderCorrelationIdentifier];
  char v287 = HMFEqualObjects();

  if ((v287 & 1) == 0)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v288 = [v382 senderCorrelationIdentifier];
    senderCorrelationIdentifier = v381->_senderCorrelationIdentifier;
    v381->_senderCorrelationIdentifier = (NSString *)v288;

    os_unfair_lock_unlock(&v381->_lock);
  }
  v290 = [(HMUser *)v381 photosPersonManagerSettings];
  v291 = [v382 photosPersonManagerSettings];
  if ([v290 isEqual:v291])
  {
    v292 = [(HMUser *)v381 photosPersonManagerZoneUUID];
    v293 = [v382 photosPersonManagerZoneUUID];
    char v294 = HMFEqualObjects();

    if (v294) {
      goto LABEL_161;
    }
  }
  else
  {
  }
  v295 = (void *)MEMORY[0x19F3A64A0]();
  v296 = v381;
  HMFGetOSLogHandle();
  v297 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v297, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v298 = (id)objc_claimAutoreleasedReturnValue();
    v299 = [(HMUser *)v296 photosPersonManagerSettings];
    v300 = [v382 photosPersonManagerSettings];
    v301 = [(HMUser *)v296 photosPersonManagerZoneUUID];
    v302 = [v382 photosPersonManagerZoneUUID];
    *(_DWORD *)buf = 138544386;
    id v426 = v298;
    __int16 v427 = 2112;
    id v428 = v299;
    __int16 v429 = 2112;
    v430 = v300;
    __int16 v431 = 2112;
    v432 = v301;
    __int16 v433 = 2112;
    v434 = v302;
    _os_log_impl(&dword_19D1A8000, v297, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings updated from %@ to %@, zoneUUID updated from %@ to %@", buf, 0x34u);
  }
  v303 = [v382 photosPersonManagerSettings];
  [(HMUser *)v296 setPhotosPersonManagerSettings:v303];

  v304 = [v382 photosPersonManagerZoneUUID];
  [(HMUser *)v296 setPhotosPersonManagerZoneUUID:v304];

  [(HMUser *)v296 configurePhotosPersonManager];
  v305 = [(HMUser *)v296 delegate];
  if ([v305 conformsToProtocol:&unk_1EEF70680]) {
    v306 = v305;
  }
  else {
    v306 = 0;
  }
  id v307 = v306;

  if (objc_opt_respondsToSelector())
  {
    v308 = [(HMUser *)v296 context];
    v309 = [v308 queue];
    v397[0] = MEMORY[0x1E4F143A8];
    v397[1] = 3221225472;
    v397[2] = __29__HMUser_mergeFromNewObject___block_invoke_361;
    v397[3] = &unk_1E5945628;
    v397[4] = v296;
    id v398 = v307;
    dispatch_async(v309, v397);
  }
  if (objc_opt_respondsToSelector())
  {
    v310 = [(HMUser *)v296 context];
    v311 = [v310 queue];
    v395[0] = MEMORY[0x1E4F143A8];
    v395[1] = 3221225472;
    v395[2] = __29__HMUser_mergeFromNewObject___block_invoke_364;
    v395[3] = &unk_1E5945628;
    v395[4] = v296;
    id v396 = v307;
    dispatch_async(v311, v395);
  }
  char v225 = 1;
LABEL_161:
  int v312 = [(HMUser *)v381 needsiTunesMultiUserRepair];
  if (v312 != [v382 needsiTunesMultiUserRepair])
  {
    v313 = (void *)MEMORY[0x19F3A64A0]();
    v314 = v381;
    HMFGetOSLogHandle();
    v315 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v315, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v316 = (id)objc_claimAutoreleasedReturnValue();
      v317 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v382, "needsiTunesMultiUserRepair"));
      *(_DWORD *)buf = 138543618;
      id v426 = v316;
      __int16 v427 = 2112;
      id v428 = v317;
      _os_log_impl(&dword_19D1A8000, v315, OS_LOG_TYPE_DEFAULT, "%{public}@Updated needs iTunes repair to %@", buf, 0x16u);
    }
    -[HMUser setNeedsiTunesMultiUserRepair:](v314, "setNeedsiTunesMultiUserRepair:", [v382 needsiTunesMultiUserRepair]);
    v318 = [(HMUser *)v314 delegate];
    if ([v318 conformsToProtocol:&unk_1EEF70680]) {
      v319 = v318;
    }
    else {
      v319 = 0;
    }
    id v320 = v319;

    if (objc_opt_respondsToSelector())
    {
      v321 = [(HMUser *)v314 context];
      v322 = [v321 queue];
      v393[0] = MEMORY[0x1E4F143A8];
      v393[1] = 3221225472;
      v393[2] = __29__HMUser_mergeFromNewObject___block_invoke_367;
      v393[3] = &unk_1E5945628;
      v393[4] = v314;
      id v394 = v320;
      dispatch_async(v322, v393);
    }
    char v225 = 1;
  }
  int v323 = [(HMUser *)v381 supportsSharedHomeHH2AutoMigration];
  if (v323 != [v382 supportsSharedHomeHH2AutoMigration])
  {
    v324 = (void *)MEMORY[0x19F3A64A0]();
    v325 = v381;
    HMFGetOSLogHandle();
    v326 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v326, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v327 = (id)objc_claimAutoreleasedReturnValue();
      [v382 supportsSharedHomeHH2AutoMigration];
      HMFBooleanToString();
      id v328 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v426 = v327;
      __int16 v427 = 2112;
      id v428 = v328;
      _os_log_impl(&dword_19D1A8000, v326, OS_LOG_TYPE_DEFAULT, "%{public}@Updated supports automatic HH2 migration by owner to %@", buf, 0x16u);
    }
    -[HMUser setSupportsSharedHomeHH2AutoMigration:](v325, "setSupportsSharedHomeHH2AutoMigration:", [v382 supportsSharedHomeHH2AutoMigration]);
    v329 = [(HMUser *)v325 delegate];
    if ([v329 conformsToProtocol:&unk_1EEF70680]) {
      v330 = v329;
    }
    else {
      v330 = 0;
    }
    id v331 = v330;

    if (objc_opt_respondsToSelector())
    {
      v332 = [(HMUser *)v325 context];
      v333 = [v332 delegateCaller];
      v390[0] = MEMORY[0x1E4F143A8];
      v390[1] = 3221225472;
      v390[2] = __29__HMUser_mergeFromNewObject___block_invoke_370;
      v390[3] = &unk_1E5945628;
      id v391 = v331;
      v392 = v325;
      [v333 invokeBlock:v390];
    }
    char v225 = 1;
  }
  v334 = [(HMUser *)v381 iCloudAltDSID];
  v335 = [v382 iCloudAltDSID];
  int v336 = HMFEqualObjects();

  if ((v336 & 1) == 0)
  {
    v337 = [v382 iCloudAltDSID];
    [(HMUser *)v381 setiCloudAltDSID:v337];
  }
  v338 = [(HMUser *)v381 givenName];
  v339 = [v382 givenName];
  char v340 = HMFEqualObjects();

  if (v340)
  {
    int v341 = v336 ^ 1;
  }
  else
  {
    v342 = [v382 givenName];
    [(HMUser *)v381 setGivenName:v342];

    int v341 = 1;
  }
  v343 = [(HMUser *)v381 familyName];
  v344 = [v382 familyName];
  char v345 = HMFEqualObjects();

  if (v345)
  {
    if (!v341) {
      goto LABEL_189;
    }
  }
  else
  {
    v346 = [v382 familyName];
    [(HMUser *)v381 setFamilyName:v346];
  }
  [(HMUser *)v381 _handleSharedUserProfileMetadataUpdated];
  char v225 = 1;
LABEL_189:
  BOOL v347 = [(HMUser *)v381 settingsInitialized];
  unsigned int v348 = [v382 settingsInitialized];
  v349 = [v389 homeManager];
  int v350 = [v349 isDaemonRunningWithROARFramework];

  uint64_t v351 = v347 ^ v348;
  if (v350)
  {
    v352 = [(HMUser *)v381 context];
    if (v352)
    {
      v353 = [v382 pendingPrivateSettings];
      BOOL v354 = v353 == 0;

      if (!v354)
      {
        v355 = [v382 pendingPrivateSettings];
        v356 = [(HMUser *)v381 context];
        [(HMUser *)v381 createConfigureAndMergePrivateSettingsIfNecessary:v355 withContext:v356];

        [v382 setPendingPrivateSettings:0];
      }
    }
    v357 = [(HMUser *)v381 context];
    if (v357)
    {
      v358 = [v382 pendingSharedSettings];
      BOOL v359 = v358 == 0;

      if (!v359)
      {
        v360 = [v382 pendingSharedSettings];
        v361 = [(HMUser *)v381 context];
        [(HMUser *)v381 createConfigureAndMergeSharedSettingsIfNecessary:v360 withContext:v361];

        [v382 setPendingSharedSettings:0];
      }
    }
  }
  else
  {
    v362 = [(HMUser *)v381 settingsController];
    v363 = [v382 settingsController];
    [v362 mergeWith:v363 settingsInitializedWasModified:v351];

    v364 = [(HMUser *)v381 privateSettingsController];
    v365 = [v382 privateSettingsController];
    [v364 mergeWith:v365 settingsInitializedWasModified:v351];
  }
  v366 = [(HMUser *)v381 pairingIdentity];
  v367 = [v382 pairingIdentity];
  char v368 = HMFEqualObjects();

  if (v368)
  {
    char v213 = v351 | v225;
  }
  else
  {
    v369 = [(HMUser *)v381 pairingIdentity];
    v370 = [v382 pairingIdentity];
    [(HMUser *)v381 _mergeUserPairingIdentityIfNecessary:v369 withNewPairingIdentity:v370];

    char v213 = 1;
  }

LABEL_201:
  return v213;
}

void __29__HMUser_mergeFromNewObject___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2;
  v5[3] = &unk_1E5944F20;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 invokeBlock:v5];
}

void __29__HMUser_mergeFromNewObject___block_invoke_353(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_354;
  v5[3] = &unk_1E5944F20;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 invokeBlock:v5];
}

void __29__HMUser_mergeFromNewObject___block_invoke_356(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_357;
  v5[3] = &unk_1E5944F20;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 invokeBlock:v5];
}

void __29__HMUser_mergeFromNewObject___block_invoke_358(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_359;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __29__HMUser_mergeFromNewObject___block_invoke_361(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_362;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __29__HMUser_mergeFromNewObject___block_invoke_364(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_365;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __29__HMUser_mergeFromNewObject___block_invoke_367(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__HMUser_mergeFromNewObject___block_invoke_2_368;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_370(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 supportsSharedHomeHH2AutoMigration];

  return [v1 user:v2 didUpdateSupportsSharedHomeHH2AutoMigration:v3];
}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_2_368(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    [*(id *)(a1 + 32) needsiTunesMultiUserRepair];
    id v6 = HMFBooleanToString();
    int v8 = 138543618;
    int v9 = v5;
    __int16 v10 = 2112;
    int v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateNeedsiTunesMultiUserRepair : %@", (uint8_t *)&v8, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 40), "user:didUpdateNeedsiTunesMultiUserRepair:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "needsiTunesMultiUserRepair"));
}

void __29__HMUser_mergeFromNewObject___block_invoke_2_365(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) photosPersonManagerSettings];
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdatePhotosPersonManagerSettings : %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = a1 + 32;
  id v7 = *(void **)(a1 + 32);
  int v8 = *(void **)(v9 + 8);
  __int16 v10 = [v7 photosPersonManagerSettings];
  [v8 user:v7 didUpdatePhotosPersonManagerSettings:v10];
}

void __29__HMUser_mergeFromNewObject___block_invoke_2_362(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) photosPersonManagerSettings];
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdatePersonManagerSettings : %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = a1 + 32;
  id v7 = *(void **)(a1 + 32);
  int v8 = *(void **)(v9 + 8);
  __int16 v10 = [v7 photosPersonManagerSettings];
  [v8 user:v7 didUpdatePersonManagerSettings:v10];
}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_2_359(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) homeAccessControl];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    int v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated access control via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) notifyDelegateOfAccessControlUpdateForUser:*(void *)(a1 + 32)];
}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_2_357(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
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
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated user listening history update control via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) user:*(void *)(a1 + 32) didUpdateUserListeningHistoryUpdateControl:*(void *)(a1 + 40) forHome:*(void *)(a1 + 56)];
}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_2_354(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
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
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated media content profile access control via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) user:*(void *)(a1 + 32) didUpdateMediaContentProfileAccessControl:*(void *)(a1 + 40) forHome:*(void *)(a1 + 56)];
}

uint64_t __29__HMUser_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
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
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated assistant access control via merge: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) user:*(void *)(a1 + 32) didUpdateAssistantAccessControl:*(void *)(a1 + 40) forHome:*(void *)(a1 + 56)];
}

- (BOOL)_mergeWithNewAccessoryInvitations:(id)a3
{
  id v4 = a3;
  id v5 = [HMObjectMergeCollection alloc];
  uint64_t v6 = [(HMUser *)self pendingAccessoryInvitations];
  id v7 = [(HMObjectMergeCollection *)v5 initWithCurrentObjects:v6 newObjects:v4];

  int v8 = [(HMObjectMergeCollection *)v7 removedObjects];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__HMUser__mergeWithNewAccessoryInvitations___block_invoke;
  v15[3] = &unk_1E59434D8;
  v15[4] = self;
  [v8 enumerateObjectsUsingBlock:v15];

  uint64_t v9 = [(HMObjectMergeCollection *)v7 addedObjects];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__HMUser__mergeWithNewAccessoryInvitations___block_invoke_350;
  v14[3] = &unk_1E59434D8;
  v14[4] = self;
  [v9 enumerateObjectsUsingBlock:v14];

  [(HMObjectMergeCollection *)v7 mergeCommonObjects];
  __int16 v10 = [(HMObjectMergeCollection *)v7 finalObjects];
  [(HMMutableArray *)self->_pendingAccessoryInvitations setArray:v10];

  if ([(HMObjectMergeCollection *)v7 isModified])
  {
    uint64_t v11 = [(HMUser *)self home];
    [v11 notifyDelegateOfAccesoryInvitationsUpdateForUser:self];
  }
  BOOL v12 = [(HMObjectMergeCollection *)v7 isModified];

  return v12;
}

void __44__HMUser__mergeWithNewAccessoryInvitations___block_invoke(uint64_t a1, void *a2)
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
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed accessory invitation via user merge: %@", (uint8_t *)&v8, 0x16u);
  }
}

void __44__HMUser__mergeWithNewAccessoryInvitations___block_invoke_350(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v13 = 138543618;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_INFO, "%{public}@Added accessory invitation via user merge: %@", (uint8_t *)&v13, 0x16u);
  }
  int v8 = [v3 accessory];
  uint64_t v9 = [*(id *)(a1 + 32) home];
  __int16 v10 = [v9 accessories];
  id v11 = [v8 uniqueIdentifier];
  uint64_t v12 = objc_msgSend(v10, "hmf_firstObjectWithUniqueIdentifier:", v11);

  [v3 setAccessory:v12];
}

- (HMUser)initWithCoder:(id)a3
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userUUID"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  if (!v6)
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v115 = v18;
      __int16 v116 = 2112;
      unint64_t v117 = 0;
      __int16 v118 = 2112;
      v119 = v5;
      v19 = "%{public}@Failed to initialize from decoded uuid: %@/%@";
      id v20 = v17;
      uint32_t v21 = 32;
LABEL_26:
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    }
LABEL_27:

    v48 = 0;
    goto LABEL_40;
  }
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userDisplayName"];
  int v8 = [v4 decodeBoolForKey:@"HM.isCurrentUser"];
  BOOL v9 = v8;
  if (!v7)
  {
    if (v8)
    {
      __int16 v10 = +[HMLocalization sharedManager];
      id v7 = [v10 getLocalizedString:@"CURRENT_USER"];

      goto LABEL_5;
    }
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v115 = v18;
      __int16 v116 = 2112;
      unint64_t v117 = 0;
      __int16 v118 = 1024;
      LODWORD(v119) = 0;
      v19 = "%{public}@Failed to initialize from decoded name: %@, isCurrentUser: %{BOOL}d";
      id v20 = v17;
      uint32_t v21 = 28;
      goto LABEL_26;
    }
    goto LABEL_27;
  }
LABEL_5:
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
  int v13 = [(HMUser *)self initWithUserID:v11 name:v7 uuid:v6 home:v12];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_currentUser = v9;
    v106 = v11;
    v103 = v12;
    if ([v4 containsValueForKey:@"HM.userAccessAllowed"]) {
      int v15 = [v4 decodeBoolForKey:@"HM.userAccessAllowed"];
    }
    else {
      int v15 = 1;
    }
    v105 = v5;
    uint64_t v109 = [v4 decodeBoolForKey:@"HM.isOwnerUser"];
    uint64_t v108 = [v4 decodeBoolForKey:@"isAdminUser"];
    uint64_t v22 = [v4 decodeBoolForKey:@"HM.isUserAllowedRemoteAccess"];
    char v23 = [v4 decodeBoolForKey:@"HM.u.announce.access"];
    __int16 v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDUserAudioAnalysisUserDropInAccessLevelCodingKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = 0;
    }
    id v26 = v25;

    uint64_t v100 = [v26 unsignedIntegerValue];
    id v104 = v6;
    v107 = v7;
    if ([v4 containsValueForKey:@"HMHomeAccessControlOverrideCodingKey"])
    {
      unint64_t v27 = [v4 decodeIntegerForKey:@"HMHomeAccessControlOverrideCodingKey"];
      id v28 = (void *)MEMORY[0x19F3A64A0]();
      id v29 = v14;
      __int16 v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v115 = v31;
        __int16 v116 = 2048;
        unint64_t v117 = v27;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_INFO, "%{public}@Overriding Home Access Control for current user to 0x%08lx", buf, 0x16u);
      }
      uint64_t v108 = (v27 >> 1) & 1;
      uint64_t v109 = (v27 >> 2) & 1;
      uint64_t v22 = (v27 >> 3) & 1;
      int v15 = v27 & 1;
      uint64_t v98 = (v27 >> 4) & 1;
    }
    else
    {
      LOBYTE(v98) = v23;
    }
    uint64_t v99 = v22;
    unsigned int v101 = v15;
    char v32 = [v4 decodeBoolForKey:@"HM.u.isRG"];
    v111 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.RG.homeAccessSettings"];
    v33 = (void *)MEMORY[0x19F3A64A0]();
    v102 = v14;
    v34 = v14;
    __int16 v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      __int16 v37 = HMFBooleanToString();
      id v38 = HMFBooleanToString();
      int v39 = HMFBooleanToString();
      v40 = HMFBooleanToString();
      *(_DWORD *)buf = 138544898;
      v115 = v36;
      __int16 v116 = 2112;
      unint64_t v117 = (unint64_t)v106;
      __int16 v118 = 2112;
      v119 = v107;
      __int16 v120 = 2112;
      v121 = v37;
      __int16 v122 = 2112;
      v123 = v38;
      __int16 v124 = 2112;
      v125 = v39;
      __int16 v126 = 2112;
      v127 = v40;
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_DEBUG, "%{public}@userID: %@, name: %@, isCurrentUser: %@, isOwner: %@, isAdmin: %@, isRG: %@", buf, 0x48u);
    }
    int v41 = [HMHomeAccessControl alloc];
    v42 = +[HMUserPresenceAuthorization authWithCoder:v4];
    v43 = +[HMUserPresenceCompute computeWithCoder:v4];
    v44 = +[HMUserCameraAccess accessWithCoder:v4];
    LOBYTE(v97) = v32;
    LOBYTE(v96) = v98;
    uint64_t v45 = [(HMHomeAccessControl *)v41 initWithUser:v34 allowAccess:v101 owner:v109 administratorPrivilege:v108 remoteAccess:v99 presenceAuthStatus:v42 presenceComputeStatus:v43 announceAccess:v96 camerasAccess:v44 audioAnalysisUserDropInAccessLevel:v100 restrictedGuest:v97 restrictedGuestAccessSettings:v111];
    id v46 = v34[7];
    v34[7] = (id)v45;

    if ((v101 & 1) == 0)
    {
      if ([v4 containsValueForKey:@"HMHomeAccessNotAllowedReasonCodeCodingKey"]) {
        uint64_t v47 = [v4 decodeIntegerForKey:@"HMHomeAccessNotAllowedReasonCodeCodingKey"];
      }
      else {
        uint64_t v47 = 1;
      }
      v49 = (void *)MEMORY[0x19F3A64A0]();
      v50 = v34;
      v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = HMFGetLogIdentifier();
        int v53 = [NSNumber numberWithUnsignedInteger:v47];
        *(_DWORD *)buf = 138543618;
        v115 = v52;
        __int16 v116 = 2112;
        unint64_t v117 = (unint64_t)v53;
        _os_log_impl(&dword_19D1A8000, v51, OS_LOG_TYPE_INFO, "%{public}@Access is not allowed due to : %@", buf, 0x16u);
      }
      [v34[7] setAccessNotAllowedReasonCode:v47];
    }
    uint64_t v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.assistantAccessControl"];
    id v55 = v34[8];
    v34[8] = (id)v54;

    v56 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v57 = objc_opt_class();
    v58 = objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
    id v59 = [v4 decodeObjectOfClasses:v58 forKey:@"HM.u.mu.accessories"];

    if (v59)
    {
      v60 = [[HMMediaContentProfileAccessControl alloc] initWithUser:v34 accessories:v59];
      id v61 = v34[9];
      v34[9] = v60;
    }
    v62 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v63 = objc_opt_class();
    v64 = objc_msgSend(v62, "setWithObjects:", v63, objc_opt_class(), 0);
    v65 = [v4 decodeObjectOfClasses:v64 forKey:@"HM.u.mc.accessories"];

    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __24__HMUser_initWithCoder___block_invoke;
    v112[3] = &unk_1E59434B0;
    v66 = v34;
    v113 = v66;
    v110 = v65;
    int v67 = objc_msgSend(v65, "na_map:", v112);
    if (v67)
    {
      v68 = [[HMUserListeningHistoryUpdateControl alloc] initWithAccessories:v67];
      id v69 = v66[10];
      v66[10] = v68;
    }
    id v5 = v105;
    if ([v66 isCurrentUser])
    {
      uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.u.announce.Settings"];
      id v71 = v66[16];
      v66[16] = (id)v70;
    }
    v72 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v73 = objc_opt_class();
    uint64_t v74 = objc_opt_class();
    id v75 = objc_msgSend(v72, "setWithObjects:", v73, v74, objc_opt_class(), 0);
    uint64_t v76 = [v4 decodeObjectOfClasses:v75 forKey:@"HM2.u.s.private"];
    id v77 = v66[28];
    v66[28] = (id)v76;

    uint64_t v78 = [v4 decodeObjectOfClasses:v75 forKey:@"HM2.u.s.shared"];
    id v79 = v66[29];
    v66[29] = (id)v78;

    [v66[24] decodeWithCoder:v4];
    [v66[25] decodeWithCoder:v4];
    uint64_t v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.senderCorrelationIdentifier"];
    id v81 = v66[3];
    v66[3] = (id)v80;

    uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.photosPersonManagerSettings"];
    id v83 = v66[18];
    v66[18] = (id)v82;

    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.photosPersonManagerZoneUUID"];
    id v85 = v66[19];
    v66[19] = (id)v84;

    v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.u.itunesRepair"];
    *((unsigned char *)v66 + 33) = [v86 BOOLValue];

    *((unsigned char *)v66 + 34) = [v4 decodeBoolForKey:@"HMSettingsContainerSettingsInitializedKey"];
    *((unsigned char *)v66 + 35) = [v4 decodeBoolForKey:@"HM.u.automaticHH2migration"];
    uint64_t v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.pairingIdentity"];
    id v88 = v66[13];
    v66[13] = (id)v87;

    uint64_t v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.useriCloudAltDSID"];
    id v90 = v66[20];
    v66[20] = (id)v89;

    uint64_t v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.userGivenName"];
    id v92 = v66[21];
    v66[21] = (id)v91;

    uint64_t v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.userFamilyName"];
    id v94 = v66[22];
    v66[22] = (id)v93;

    uint64_t v12 = v103;
    uint64_t v6 = v104;
    id v11 = v106;
    id v7 = v107;
    uint64_t v14 = v102;
  }
  self = v14;

  v48 = self;
LABEL_40:

  return v48;
}

id __24__HMUser_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  id v5 = [v4 accessoryWithUUID:v3];

  return v5;
}

- (id)logIdentifier
{
  v2 = [(HMUser *)self uniqueIdentifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)_handleSharedUserProfileMetadataUpdated
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMUser *)self delegate];
  if ([v3 conformsToProtocol:&unk_1EEF70680]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v16 = v9;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling sharedUserProfileMetadataUpdatedForUser on client delegate", buf, 0xCu);
  }
  if (objc_opt_respondsToSelector())
  {
    __int16 v10 = [(HMUser *)v7 context];
    id v11 = [v10 delegateCaller];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__HMUser__handleSharedUserProfileMetadataUpdated__block_invoke;
    v12[3] = &unk_1E5945628;
    id v13 = v5;
    uint64_t v14 = v7;
    [v11 invokeBlock:v12];
  }
}

uint64_t __49__HMUser__handleSharedUserProfileMetadataUpdated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sharedUserProfileMetadataUpdatedForUser:*(void *)(a1 + 40)];
}

- (void)fetchProfilePhotoAndCropRect:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    uint32_t v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      char v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v34 = v23;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@nil completion", buf, 0xCu);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v24);
  }
  id v5 = v4;
  uint64_t v6 = [(HMUser *)self context];
  if (v6)
  {
    v31 = @"kUserUUIDKey";
    id v7 = [(HMUser *)self uuid];
    int v8 = [v7 UUIDString];
    char v32 = v8;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];

    id v10 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v12 = [(HMUser *)self uuid];
    id v13 = (void *)[v11 initWithTarget:v12];
    uint64_t v14 = (void *)[v10 initWithName:@"HMU.fetchProfilePhoto" destination:v13 payload:v9];

    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    unint64_t v27 = __39__HMUser_fetchProfilePhotoAndCropRect___block_invoke;
    id v28 = &unk_1E5944EF0;
    id v29 = self;
    id v30 = v5;
    [v14 setResponseHandler:&v25];
    int v15 = objc_msgSend(v6, "messageDispatcher", v25, v26, v27, v28, v29);
    [v15 sendMessage:v14];
  }
  else
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v19;
      __int16 v35 = 2080;
      uint64_t v36 = "-[HMUser fetchProfilePhotoAndCropRect:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __39__HMUser_fetchProfilePhotoAndCropRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = 0;
LABEL_3:
    int v8 = 0;
    goto LABEL_7;
  }
  BOOL v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = *(id *)(a1 + 32);
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v31 = v12;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_DEBUG, "%{public}@profile photo response %@", buf, 0x16u);
  }
  int v8 = [v6 valueForKey:@"HM.u.profilePhotoData"];
  uint64_t v29 = objc_opt_class();
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  id v7 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", @"HM.u.profilePhotoCropRect", v13);

  if (!v8)
  {
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = *(id *)(a1 + 32);
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      char v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v23;
      __int16 v32 = 2112;
      id v33 = 0;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get profile photo from response data: %@", buf, 0x16u);
    }
    [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 description:@"No profile photo" reason:@"Unable to find or decode profile photo" suggestion:0];

    goto LABEL_3;
  }
LABEL_7:
  uint64_t v14 = [*(id *)(a1 + 32) context];
  int v15 = [v14 queue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __39__HMUser_fetchProfilePhotoAndCropRect___block_invoke_329;
  v24[3] = &unk_1E5944900;
  id v16 = *(void **)(a1 + 40);
  v24[4] = *(void *)(a1 + 32);
  id v25 = v8;
  id v26 = v7;
  id v27 = v5;
  id v28 = v16;
  id v17 = v5;
  id v18 = v7;
  id v19 = v8;
  dispatch_async(v15, v24);
}

void __39__HMUser_fetchProfilePhotoAndCropRect___block_invoke_329(id *a1)
{
  v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__HMUser_fetchProfilePhotoAndCropRect___block_invoke_2;
  v4[3] = &unk_1E5944360;
  id v8 = a1[8];
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[7];
  [v3 invokeBlock:v4];
}

uint64_t __39__HMUser_fetchProfilePhotoAndCropRect___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)fetchProfilePhoto:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      char v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v23;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@nil completion", buf, 0xCu);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v24);
  }
  id v5 = v4;
  id v6 = [(HMUser *)self context];
  if (v6)
  {
    v31 = @"kUserUUIDKey";
    id v7 = [(HMUser *)self uuid];
    id v8 = [v7 UUIDString];
    __int16 v32 = v8;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];

    id v10 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    uint64_t v12 = [(HMUser *)self uuid];
    id v13 = (void *)[v11 initWithTarget:v12];
    uint64_t v14 = (void *)[v10 initWithName:@"HMU.fetchProfilePhoto" destination:v13 payload:v9];

    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    id v27 = __28__HMUser_fetchProfilePhoto___block_invoke;
    id v28 = &unk_1E5944EF0;
    uint64_t v29 = self;
    id v30 = v5;
    [v14 setResponseHandler:&v25];
    int v15 = objc_msgSend(v6, "messageDispatcher", v25, v26, v27, v28, v29);
    [v15 sendMessage:v14];
  }
  else
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v19;
      __int16 v35 = 2080;
      uint64_t v36 = "-[HMUser fetchProfilePhoto:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __28__HMUser_fetchProfilePhoto___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
LABEL_2:
    id v7 = 0;
    goto LABEL_6;
  }
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v11;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEBUG, "%{public}@profile photo response %@", buf, 0x16u);
  }
  id v7 = [v6 valueForKey:@"HM.u.profilePhotoData"];
  if (!v7)
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = *(id *)(a1 + 32);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = 0;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get profile photo from response data: %@", buf, 0x16u);
    }
    [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 description:@"No profile photo" reason:@"Unable to find or decode profile photo" suggestion:0];

    goto LABEL_2;
  }
LABEL_6:
  uint64_t v12 = [*(id *)(a1 + 32) context];
  id v13 = [v12 queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __28__HMUser_fetchProfilePhoto___block_invoke_327;
  v21[3] = &unk_1E5944360;
  uint64_t v14 = *(void **)(a1 + 40);
  v21[4] = *(void *)(a1 + 32);
  id v23 = v5;
  id v24 = v14;
  id v22 = v7;
  id v15 = v5;
  id v16 = v7;
  dispatch_async(v13, v21);
}

void __28__HMUser_fetchProfilePhoto___block_invoke_327(id *a1)
{
  v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__HMUser_fetchProfilePhoto___block_invoke_2;
  v4[3] = &unk_1E5945138;
  id v7 = a1[7];
  id v5 = a1[5];
  id v6 = a1[6];
  [v3 invokeBlock:v4];
}

uint64_t __28__HMUser_fetchProfilePhoto___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setPhotosPersonManagerZoneUUID:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSUUID *)[v6 copy];
  photosPersonManagerZoneUUID = self->_photosPersonManagerZoneUUID;
  self->_photosPersonManagerZoneUUID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)photosPersonManagerZoneUUID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_photosPersonManagerZoneUUID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPhotosPersonManagerSettings:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (HMPhotosPersonManagerSettings *)[v6 copy];
  photosPersonManagerSettings = self->_photosPersonManagerSettings;
  self->_photosPersonManagerSettings = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPhotosPersonManager:(id)a3
{
  id v4 = (HMPhotosPersonManager *)a3;
  os_unfair_lock_lock_with_options();
  photosPersonManager = self->_photosPersonManager;
  self->_photosPersonManager = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setNeedsiTunesMultiUserRepair:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMUser *)self home];
  id v8 = [v7 currentUser];
  char v9 = [v8 isEqual:self];

  if (v9)
  {
    uint64_t v25 = @"HM.u.itunesRepair";
    id v10 = [NSNumber numberWithBool:v4];
    v26[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

    uint64_t v12 = (void *)MEMORY[0x1E4F654B0];
    id v13 = [(HMUser *)self messageDestination];
    uint64_t v14 = [v12 messageWithName:@"HM.itunesRepair" destination:v13 payload:v11];

    objc_initWeak(&location, self);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __51__HMUser_setNeedsiTunesMultiUserRepair_completion___block_invoke;
    id v21 = &unk_1E5944188;
    objc_copyWeak(&v23, &location);
    id v22 = v6;
    [v14 setResponseHandler:&v18];
    id v15 = [(HMUser *)self context];
    id v16 = [v15 messageDispatcher];
    [v16 sendMessage:v14];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"User is not current user" reason:@"Can only set for current user." suggestion:0];
    (*((void (**)(id, void *))v6 + 2))(v6, v17);
  }
}

void __51__HMUser_setNeedsiTunesMultiUserRepair_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v6 = [WeakRetained context];
    id v7 = [v6 queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__HMUser_setNeedsiTunesMultiUserRepair_completion___block_invoke_2;
    v8[3] = &unk_1E59454E8;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __51__HMUser_setNeedsiTunesMultiUserRepair_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)sendClientShareRepairRequest:(id)a3 containerID:(id)a4 completion:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMUser *)self context];
  if (!v10)
  {
    uint64_t v38 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMUser sendClientShareRepairRequest:containerID:completion:]", @"completion"];
    int v39 = (void *)MEMORY[0x19F3A64A0]();
    v40 = self;
    int v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v51 = v42;
      __int16 v52 = 2112;
      int v53 = (const char *)v38;
      _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v43 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v38 userInfo:0];
    objc_exception_throw(v43);
  }
  uint64_t v12 = (void *)v11;
  if (v11)
  {
    id v13 = [(HMUser *)self home];
    uint64_t v14 = v13;
    if (v13 && ([v13 uuid], id v15 = objc_claimAutoreleasedReturnValue(), v15, v15))
    {
      id v16 = [v14 currentUser];
      id v17 = [v14 owner];
      char v18 = [v16 isEqual:v17];

      if (v18)
      {
        if (v8)
        {
          v48[0] = @"HM.u.to";
          uint64_t v45 = [(HMUser *)self uuid];
          uint64_t v19 = [v45 UUIDString];
          v49[0] = v19;
          v49[1] = v9;
          v48[1] = @"HM.u.container";
          v48[2] = @"HM.u.home";
          id v20 = [v14 uuid];
          id v21 = [v20 UUIDString];
          v49[2] = v21;
          v48[3] = @"HM.u.repairInfo";
          id v22 = encodeRootObject(v8);
          v49[3] = v22;
          v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:4];

          id v23 = objc_alloc(MEMORY[0x1E4F654B0]);
          id v24 = objc_alloc(MEMORY[0x1E4F65488]);
          uint64_t v25 = [(HMUser *)self uuid];
          uint64_t v26 = (void *)[v24 initWithTarget:v25];
          __int16 v27 = (void *)[v23 initWithName:@"HM.shareRepair" destination:v26 payload:v44];

          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __62__HMUser_sendClientShareRepairRequest_containerID_completion___block_invoke;
          v46[3] = &unk_1E5943468;
          id v47 = v10;
          [v27 setResponseHandler:v46];
          id v28 = [v12 messageDispatcher];
          [v28 sendMessage:v27];

          goto LABEL_16;
        }
        uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
        id v30 = @"Repair request is missing";
        v31 = @"Need valid repair request.";
      }
      else
      {
        uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
        id v30 = @"Current User is not owner";
        v31 = @"Can only send from owner user.";
      }
      uint64_t v32 = 3;
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      id v30 = @"Home is invalid";
      v31 = @"Valid home not found.";
      uint64_t v32 = 2;
    }
    uint64_t v37 = [v29 hmErrorWithCode:v32 description:v30 reason:v31 suggestion:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v37);

    goto LABEL_16;
  }
  id v33 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v34 = self;
  __int16 v35 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    uint64_t v36 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v51 = v36;
    __int16 v52 = 2080;
    int v53 = "-[HMUser sendClientShareRepairRequest:containerID:completion:]";
    _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
  }
  uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  (*((void (**)(id, void *))v10 + 2))(v10, v14);
LABEL_16:
}

uint64_t __62__HMUser_sendClientShareRepairRequest_containerID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendClientShareURL:(id)a3 shareToken:(id)a4 containerID:(id)a5 fromUser:(id)a6 completion:(id)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, uint64_t))a7;
  uint64_t v17 = [(HMUser *)self context];
  if (!v16)
  {
    uint64_t v42 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMUser sendClientShareURL:shareToken:containerID:fromUser:completion:]", @"completion"];
    id v43 = (void *)MEMORY[0x19F3A64A0]();
    v44 = self;
    uint64_t v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      id v46 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v62 = v46;
      __int16 v63 = 2112;
      v64 = (const char *)v42;
      _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v47 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v42 userInfo:0];
    objc_exception_throw(v47);
  }
  char v18 = (void *)v17;
  if (!v17)
  {
    id v33 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v34 = self;
    __int16 v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v62 = v36;
      __int16 v63 = 2080;
      v64 = "-[HMUser sendClientShareURL:shareToken:containerID:fromUser:completion:]";
      _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    goto LABEL_14;
  }
  if (!v15 || ([v15 uuid], uint64_t v19 = objc_claimAutoreleasedReturnValue(), v19, !v19))
  {
    uint64_t v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"From user is invalid" reason:@"Valid from user is required." suggestion:0];
LABEL_14:
    id v21 = (void *)v32;
    v16[2](v16, 0, v32);
    goto LABEL_15;
  }
  id v20 = [(HMUser *)self home];
  id v21 = v20;
  if (!v20 || ([v20 uuid], id v22 = objc_claimAutoreleasedReturnValue(), v22, !v22))
  {
    uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = @"Home is invalid";
    int v39 = @"Valid home not found.";
    uint64_t v40 = 2;
LABEL_17:
    int v41 = [v37 hmErrorWithCode:v40 description:v38 reason:v39 suggestion:0];
    v16[2](v16, 0, (uint64_t)v41);

    goto LABEL_15;
  }
  if (!v12)
  {
    uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = @"Share URL is missing";
    int v39 = @"Need share URL.";
    uint64_t v40 = 3;
    goto LABEL_17;
  }
  id v58 = 0;
  id v23 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v58];
  id v24 = v58;
  if (v23)
  {
    v59[0] = @"HM.u.to";
    v51 = [(HMUser *)self uuid];
    v50 = [v51 UUIDString];
    v60[0] = v50;
    v59[1] = @"HM.u.from";
    v49 = [v15 uuid];
    v48 = [v49 UUIDString];
    v60[1] = v48;
    v60[2] = v23;
    v59[2] = @"HM.u.url";
    v59[3] = @"HM.u.token";
    v60[3] = v13;
    v60[4] = v14;
    v59[4] = @"HM.u.container";
    v59[5] = @"HM.u.home";
    [v21 uuid];
    uint64_t v25 = v53 = v24;
    [v25 UUIDString];
    uint64_t v26 = v54 = v23;
    v60[5] = v26;
    id v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:6];

    id v52 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v27 = objc_alloc(MEMORY[0x1E4F65488]);
    id v28 = [(HMUser *)self uuid];
    uint64_t v29 = (void *)[v27 initWithTarget:v28];
    id v30 = (void *)[v52 initWithName:@"HM.shareClientPayload" destination:v29 payload:v55];

    id v24 = v53;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __72__HMUser_sendClientShareURL_shareToken_containerID_fromUser_completion___block_invoke;
    v56[3] = &unk_1E5943468;
    uint64_t v57 = v16;
    [v30 setResponseHandler:v56];
    v31 = [v18 messageDispatcher];
    [v31 sendMessage:v30];

    id v23 = v54;
  }
  else
  {
    v16[2](v16, 0, (uint64_t)v24);
  }

LABEL_15:
}

void __72__HMUser_sendClientShareURL_shareToken_containerID_fromUser_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  objc_msgSend(a3, "hmf_dataForKey:", @"HM.u.clientInfo");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)fetchShareLookupInfo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v20 = (void *)MEMORY[0x19F3A64A0]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v23;
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@nil completion", buf, 0xCu);
    }
    id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
    objc_exception_throw(v24);
  }
  id v5 = v4;
  id v6 = [(HMUser *)self context];
  if (v6)
  {
    v31 = @"kUserUUIDKey";
    id v7 = [(HMUser *)self uuid];
    id v8 = [v7 UUIDString];
    uint64_t v32 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];

    id v10 = objc_alloc(MEMORY[0x1E4F654B0]);
    id v11 = objc_alloc(MEMORY[0x1E4F65488]);
    id v12 = [(HMUser *)self uuid];
    id v13 = (void *)[v11 initWithTarget:v12];
    id v14 = (void *)[v10 initWithName:@"HM.shareLookup" destination:v13 payload:v9];

    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    id v27 = __31__HMUser_fetchShareLookupInfo___block_invoke;
    id v28 = &unk_1E5944EF0;
    uint64_t v29 = self;
    id v30 = v5;
    [v14 setResponseHandler:&v25];
    id v15 = objc_msgSend(v6, "messageDispatcher", v25, v26, v27, v28, v29);
    [v15 sendMessage:v14];
  }
  else
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    char v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v19;
      __int16 v35 = 2080;
      uint64_t v36 = "-[HMUser fetchShareLookupInfo:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __31__HMUser_fetchShareLookupInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEBUG, "%{public}@share lookup response %@", buf, 0x16u);
    }
    id v12 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v13 = objc_opt_class();
    id v14 = [v6 objectForKeyedSubscript:@"HM.shareLookupInfoKey"];
    id v21 = 0;
    id v7 = [v12 unarchivedObjectOfClass:v13 fromData:v14 error:&v21];
    id v15 = v21;

    if (!v7)
    {
      id v16 = (void *)MEMORY[0x19F3A64A0]();
      id v17 = *(id *)(a1 + 32);
      char v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v23 = v19;
        __int16 v24 = 2112;
        id v25 = v15;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive user share lookup info from response data: %@", buf, 0x16u);
      }
      uint64_t v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"No share lookup info" reason:@"Unable to find or decode share lookup" suggestion:0];

      id v15 = (id)v20;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchAllPairingIdentitiesWithCompletionHandler:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMUser *)self context];
  if (v5)
  {
    if (!v4)
    {
      id v23 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v26;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@nil completion", buf, 0xCu);
      }
      id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
      objc_exception_throw(v27);
    }
    if (CFPreferencesGetAppBooleanValue(@"kHMDDemoModeStatusKey", @"com.apple.homed", 0))
    {
      id v6 = (void *)MEMORY[0x19F3A64A0]();
      id v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v9;
        _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@fetchAllPairingIdentitiesWithCompletionHandler completing with empty array because demo mode is on.", buf, 0xCu);
      }
      (*((void (**)(id, void, void))v4 + 2))(v4, MEMORY[0x1E4F1CBF0], 0);
    }
    else
    {
      uint64_t v34 = @"kUserUUIDKey";
      id v14 = [(HMUser *)self uuid];
      id v15 = [v14 UUIDString];
      __int16 v35 = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];

      id v17 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v18 = objc_alloc(MEMORY[0x1E4F65488]);
      uint64_t v19 = [(HMUser *)self uuid];
      uint64_t v20 = (void *)[v18 initWithTarget:v19];
      id v21 = (void *)[v17 initWithName:@"HM.u.legacy.pairingIdentities" destination:v20 payload:v16];

      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      id v30 = __57__HMUser_fetchAllPairingIdentitiesWithCompletionHandler___block_invoke;
      v31 = &unk_1E5944EF0;
      uint64_t v32 = self;
      id v33 = v4;
      [v21 setResponseHandler:&v28];
      id v22 = objc_msgSend(v5, "messageDispatcher", v28, v29, v30, v31, v32);
      [v22 sendMessage:v21];
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v13;
      __int16 v38 = 2080;
      int v39 = "-[HMUser fetchAllPairingIdentitiesWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __57__HMUser_fetchAllPairingIdentitiesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
      id v12 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138543874;
      __int16 v38 = v11;
      __int16 v39 = 2112;
      id v40 = v12;
      __int16 v41 = 2112;
      id v42 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve pairing identity for user : %@ / %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v13 = objc_msgSend(v6, "hmf_dataForKey:", @"HM.pairingIdentity");
    if (v13)
    {
      id v14 = (void *)MEMORY[0x1E4F28DC0];
      id v15 = (void *)MEMORY[0x1E4F1CAD0];
      v36[0] = objc_opt_class();
      v36[1] = objc_opt_class();
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
      id v17 = [v15 setWithArray:v16];
      id v35 = 0;
      id v18 = [v14 unarchivedObjectOfClasses:v17 fromData:v13 error:&v35];
      id v19 = v35;

      uint64_t v20 = (void *)MEMORY[0x19F3A64A0]();
      id v21 = *(id *)(a1 + 32);
      id v22 = HMFGetOSLogHandle();
      id v23 = v22;
      if (v18)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          __int16 v24 = HMFGetLogIdentifier();
          [*(id *)(a1 + 32) uuid];
          id v25 = v34 = v20;
          *(_DWORD *)buf = 138543874;
          __int16 v38 = v24;
          __int16 v39 = 2112;
          id v40 = v25;
          __int16 v41 = 2112;
          id v42 = v18;
          _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved pairing identities for User : %@ / %@", buf, 0x20u);

          uint64_t v20 = v34;
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v38 = v31;
          __int16 v39 = 2112;
          id v40 = v19;
          _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive pairing identities for user from encoded pairing identity data: %@", buf, 0x16u);
        }
        uint64_t v32 = *(void *)(a1 + 40);
        id v33 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        (*(void (**)(uint64_t, void, void *))(v32 + 16))(v32, 0, v33);
      }
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x19F3A64A0]();
      id v27 = *(id *)(a1 + 32);
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v38 = v29;
        _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@The payload did not contain any pairing identities", buf, 0xCu);
      }
      uint64_t v30 = *(void *)(a1 + 40);
      id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      (*(void (**)(uint64_t, void, id))(v30 + 16))(v30, 0, v19);
    }
  }
}

- (void)pairingIdentityWithCompletionHandler:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMUser *)self context];
  if (v5)
  {
    if (!v4)
    {
      id v23 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v26;
        _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@nil completion", buf, 0xCu);
      }
      id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
      objc_exception_throw(v27);
    }
    if (CFPreferencesGetAppBooleanValue(@"kHMDDemoModeStatusKey", @"com.apple.homed", 0))
    {
      id v6 = (void *)MEMORY[0x19F3A64A0]();
      id v7 = self;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v37 = v9;
        _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@pairingIdentityWithCompletionHandler completing with nil because demo mode is on.", buf, 0xCu);
      }
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
    else
    {
      uint64_t v34 = @"kUserUUIDKey";
      id v14 = [(HMUser *)self uuid];
      id v15 = [v14 UUIDString];
      id v35 = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];

      id v17 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v18 = objc_alloc(MEMORY[0x1E4F65488]);
      id v19 = [(HMUser *)self uuid];
      uint64_t v20 = (void *)[v18 initWithTarget:v19];
      id v21 = (void *)[v17 initWithName:@"HM.u.pairingIdentity" destination:v20 payload:v16];

      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      uint64_t v30 = __47__HMUser_pairingIdentityWithCompletionHandler___block_invoke;
      v31 = &unk_1E5944EF0;
      uint64_t v32 = self;
      id v33 = v4;
      [v21 setResponseHandler:&v28];
      id v22 = objc_msgSend(v5, "messageDispatcher", v28, v29, v30, v31, v32);
      [v22 sendMessage:v21];
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v13;
      __int16 v38 = 2080;
      __int16 v39 = "-[HMUser pairingIdentityWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __47__HMUser_pairingIdentityWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    uint64_t v13 = objc_msgSend(v6, "hmf_dataForKey:", @"HM.pairingIdentity");
    if (v13)
    {
      id v28 = 0;
      uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:&v28];
      id v15 = v28;
      id v16 = v15;
      if (!v14)
      {
        id v22 = (void *)MEMORY[0x19F3A64A0]();
        id v23 = *(id *)(a1 + 32);
        __int16 v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v30 = v25;
          __int16 v31 = 2112;
          uint64_t v32 = v16;
          _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive pairing identity for user from encoded pairing identity data: %@", buf, 0x16u);
        }
        uint64_t v26 = *(void *)(a1 + 40);
        id v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v27);

        goto LABEL_15;
      }

      id v16 = (void *)v14;
    }
    else
    {
      id v16 = 0;
    }
    id v17 = (void *)MEMORY[0x19F3A64A0]([*(id *)(a1 + 32) setPairingIdentity:v16]);
    id v18 = *(id *)(a1 + 32);
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      id v21 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      uint64_t v32 = v21;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Successfully retrieved pairing identity for User : %@ / %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:

    goto LABEL_16;
  }
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [*(id *)(a1 + 32) uuid];
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v11;
    __int16 v31 = 2112;
    uint64_t v32 = v12;
    __int16 v33 = 2112;
    id v34 = v5;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve pairing identity for user : %@ / %@", buf, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_16:
}

- (void)_updatePresenceAuthorizationStatus:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v8 = [(HMUser *)self home];
  id v7 = [(HMUser *)self userID];
  [v8 updateForUser:v7 presenceAuthorizationStatus:a3 completionHandler:v6];
}

- (void)updatePresenceAuthorizationStatus:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMUser *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMUser updatePresenceAuthorizationStatus:completionHandler:]", @"completion"];
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v19;
      __int16 v26 = 2112;
      id v27 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__HMUser_updatePresenceAuthorizationStatus_completionHandler___block_invoke;
    block[3] = &unk_1E5944C10;
    block[4] = self;
    unint64_t v23 = a3;
    id v22 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v13;
      __int16 v26 = 2080;
      id v27 = "-[HMUser updatePresenceAuthorizationStatus:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

uint64_t __62__HMUser_updatePresenceAuthorizationStatus_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePresenceAuthorizationStatus:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (BOOL)mergePendingAccessoryInvitationsWithOutgoingInvitation:(id)a3
{
  id v3 = self;
  id v4 = [(HMUser *)self _filterAccessoryInvitationsFromOutgoingInvitation:a3];
  LOBYTE(v3) = [(HMUser *)v3 _mergeWithNewAccessoryInvitations:v4];

  return (char)v3;
}

- (void)setPendingAccessoryInvitationsWithOutgoingInvitation:(id)a3
{
  id v7 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  pendingAccessoryInvitations = self->_pendingAccessoryInvitations;
  id v6 = [(HMUser *)self _filterAccessoryInvitationsFromOutgoingInvitation:v7];
  [(HMMutableArray *)pendingAccessoryInvitations setArray:v6];

  os_unfair_lock_unlock(p_lock);
}

- (id)_filterAccessoryInvitationsFromOutgoingInvitation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v3, "accessoryInvitations", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 state] != 1) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)pendingAccessoryInvitations
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMMutableArray *)self->_pendingAccessoryInvitations array];
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)senderCorrelationIdentifier
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_senderCorrelationIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)isCurrentUser
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_currentUser;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (IDSURI)userIDSURI
{
  v2 = [(HMUser *)self userID];
  if (v2 && IDSFoundationLibraryCore_42280())
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2050000000;
    id v3 = (void *)getIDSURIClass_softClass;
    uint64_t v11 = getIDSURIClass_softClass;
    if (!getIDSURIClass_softClass)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getIDSURIClass_block_invoke;
      v7[3] = &unk_1E5943DD8;
      v7[4] = &v8;
      __getIDSURIClass_block_invoke((uint64_t)v7);
      id v3 = (void *)v9[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v8, 8);
    id v5 = (void *)[[v4 alloc] initWithUnprefixedURI:v2];
  }
  else
  {
    id v5 = 0;
  }

  return (IDSURI *)v5;
}

- (void)setUserID:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  userID = self->_userID;
  self->_userID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)userID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_userID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateUserListeningHistoryUpdateControl:(id)a3 forHome:(id)a4 completionHandler:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v39 = v19;
      id v20 = "%{public}@nil home value on ULH update";
LABEL_10:
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
    }
LABEL_11:

    id v11 = [(HMUser *)v17 context];
    id v15 = [v11 delegateCaller];
    id v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v15 callCompletion:v10 error:v21];

    goto LABEL_12;
  }
  if (!v8)
  {
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v39 = v19;
      id v20 = "%{public}@nil ULH value on ULH update";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v11 = (id)[v8 copy];
  long long v12 = [(HMUser *)self context];
  if (!v10)
  {
    uint64_t v27 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMUser updateUserListeningHistoryUpdateControl:forHome:completionHandler:]", @"completionHandler"];
    uint64_t v28 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v29 = self;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v31;
      __int16 v40 = 2112;
      __int16 v41 = (const char *)v27;
      _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
    objc_exception_throw(v32);
  }
  long long v13 = v12;
  if (v12)
  {
    long long v14 = [v12 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke;
    block[3] = &unk_1E5944900;
    block[4] = self;
    id v37 = v10;
    id v34 = v9;
    id v11 = v11;
    id v35 = v11;
    id v15 = v13;
    id v36 = v15;
    dispatch_async(v14, block);
  }
  else
  {
    id v22 = (void *)MEMORY[0x19F3A64A0]();
    unint64_t v23 = self;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v25;
      __int16 v40 = 2080;
      __int16 v41 = "-[HMUser updateUserListeningHistoryUpdateControl:forHome:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v10 + 2))(v10, v26);

    id v15 = 0;
  }
LABEL_12:
}

void __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke(id *a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] home];
  if (!v2)
  {
    uint64_t v27 = [a1[4] context];
    uint64_t v28 = [v27 delegateCaller];
    id v29 = a1[8];
    uint64_t v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
LABEL_8:
    __int16 v31 = (void *)v30;
    [v28 callCompletion:v29 error:v30];

    goto LABEL_9;
  }
  if (([a1[5] isEqual:v2] & 1) == 0)
  {
    uint64_t v27 = [a1[4] context];
    uint64_t v28 = [v27 delegateCaller];
    id v29 = a1[8];
    uint64_t v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    goto LABEL_8;
  }
  id v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = a1[4];
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = a1[6];
    *(_DWORD *)buf = 138543618;
    id v46 = v6;
    __int16 v47 = 2112;
    id v48 = v7;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Will update user listening history update %@", buf, 0x16u);
  }
  id v8 = [a1[6] accessories];
  id v9 = HMAccessoryUUIDsAsStringForAccessories(v8);

  id v10 = objc_alloc(MEMORY[0x1E4F65488]);
  id v11 = [v2 messageTargetUUID];
  long long v12 = (void *)[v10 initWithTarget:v11];

  long long v13 = (void *)MEMORY[0x1E4F654B0];
  v43[1] = @"kUserUUIDKey";
  v44[0] = v9;
  v43[0] = @"accessories";
  long long v14 = [a1[4] uuid];
  id v15 = [v14 UUIDString];
  v44[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
  uint64_t v17 = [v13 messageWithName:@"HMU.mc" destination:v12 payload:v16];

  objc_initWeak((id *)buf, a1[4]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke_268;
  aBlock[3] = &unk_1E5944AE0;
  objc_copyWeak(&v42, (id *)buf);
  id v40 = a1[6];
  id v41 = a1[8];
  id v18 = _Block_copy(aBlock);
  id v19 = [a1[4] context];
  id v20 = [v19 pendingRequests];

  id v21 = [v17 identifier];
  id v22 = _Block_copy(v18);
  [v20 addCompletionBlock:v22 forIdentifier:v21];

  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  id v34 = __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke_269;
  id v35 = &unk_1E5945510;
  id v23 = v20;
  id v36 = v23;
  id v24 = v21;
  id v37 = v24;
  id v25 = v18;
  id v38 = v25;
  [v17 setResponseHandler:&v32];
  __int16 v26 = objc_msgSend(a1[7], "messageDispatcher", v32, v33, v34, v35);
  [v26 sendMessage:v17 completionHandler:0];

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);

LABEL_9:
}

void __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke_268(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v3)
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      int v13 = 138543618;
      long long v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated user listening history update control %@", (uint8_t *)&v13, 0x16u);
    }
    id v10 = (void *)[*(id *)(a1 + 32) copy];
    [v6 setUserListeningHistoryUpdateControl:v10];
  }
  id v11 = [WeakRetained context];
  long long v12 = [v11 delegateCaller];
  [v12 callCompletion:*(void *)(a1 + 40) error:v3];
}

void __76__HMUser_updateUserListeningHistoryUpdateControl_forHome_completionHandler___block_invoke_269(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)userListeningHistoryUpdateControlForHome:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [(HMUser *)self home];
    int v7 = [v5 isEqual:v6];

    if (v7)
    {
      id v8 = [(HMUser *)self userListeningHistoryUpdateControl];
    }
    else
    {
      id v8 = 0;
    }

    return v8;
  }
  else
  {
    id v10 = (HMUser *)_HMFPreconditionFailure();
    [(HMUser *)v10 setUserListeningHistoryUpdateControl:v12];
  }
  return result;
}

- (void)setUserListeningHistoryUpdateControl:(id)a3
{
  id v4 = (HMUserListeningHistoryUpdateControl *)[a3 copy];
  os_unfair_lock_lock_with_options();
  userListeningHistoryUpdateControl = self->_userListeningHistoryUpdateControl;
  self->_userListeningHistoryUpdateControl = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMUserListeningHistoryUpdateControl)userListeningHistoryUpdateControl
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_userListeningHistoryUpdateControl;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateMediaContentProfileAccessControl:(id)a3 forHome:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMUser updateMediaContentProfileAccessControl:forHome:completionHandler:]", @"completionHandler"];
    id v22 = (void *)MEMORY[0x19F3A64A0]();
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v25;
      __int16 v34 = 2112;
      id v35 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  SEL v11 = (void (**)(void, void))v10;
  id v12 = (void *)[v8 copy];
  int v13 = [(HMUser *)self context];
  if (!v11) {
    goto LABEL_12;
  }
  long long v14 = v13;
  if (v13)
  {
    __int16 v15 = [v13 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke;
    block[3] = &unk_1E5944900;
    block[4] = self;
    __int16 v31 = v11;
    id v28 = v9;
    id v29 = v12;
    id v30 = v14;
    dispatch_async(v15, block);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v19;
      __int16 v34 = 2080;
      id v35 = "-[HMUser updateMediaContentProfileAccessControl:forHome:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v11)[2](v11, v20);
  }
}

void __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke(id *a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] home];
  if (!v2)
  {
    uint64_t v27 = [a1[4] context];
    id v28 = [v27 delegateCaller];
    id v29 = a1[8];
    uint64_t v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
LABEL_8:
    __int16 v31 = (void *)v30;
    [v28 callCompletion:v29 error:v30];

    goto LABEL_9;
  }
  if (([a1[5] isEqual:v2] & 1) == 0)
  {
    uint64_t v27 = [a1[4] context];
    id v28 = [v27 delegateCaller];
    id v29 = a1[8];
    uint64_t v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    goto LABEL_8;
  }
  id v3 = (void *)MEMORY[0x19F3A64A0]();
  id v4 = a1[4];
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = a1[6];
    *(_DWORD *)buf = 138543618;
    v44 = v6;
    __int16 v45 = 2112;
    id v46 = v7;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Will update media content profile access control %@", buf, 0x16u);
  }
  id v8 = [a1[6] accessories];
  uint64_t v32 = HMAccessoryUUIDsAsStringForAccessories(v8);

  id v9 = objc_alloc(MEMORY[0x1E4F65488]);
  id v10 = [v2 messageTargetUUID];
  SEL v11 = (void *)[v9 initWithTarget:v10];

  id v12 = (void *)MEMORY[0x1E4F654B0];
  v41[0] = @"mediaContentAC";
  int v13 = encodeRootObject(a1[6]);
  v42[0] = v13;
  v42[1] = v32;
  v41[1] = @"accessories";
  v41[2] = @"kUserUUIDKey";
  long long v14 = [a1[4] uuid];
  __int16 v15 = [v14 UUIDString];
  v42[2] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
  uint64_t v17 = [v12 messageWithName:@"HMU.mu" destination:v11 payload:v16];

  objc_initWeak((id *)buf, a1[4]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke_266;
  aBlock[3] = &unk_1E5944AE0;
  objc_copyWeak(&v40, (id *)buf);
  id v38 = a1[6];
  id v39 = a1[8];
  id v18 = _Block_copy(aBlock);
  id v19 = [a1[4] context];
  id v20 = [v19 pendingRequests];

  uint64_t v21 = [v17 identifier];
  id v22 = _Block_copy(v18);
  [v20 addCompletionBlock:v22 forIdentifier:v21];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke_267;
  v33[3] = &unk_1E5945510;
  id v23 = v20;
  id v34 = v23;
  id v24 = v21;
  id v35 = v24;
  id v25 = v18;
  id v36 = v25;
  [v17 setResponseHandler:v33];
  id v26 = [a1[7] messageDispatcher];
  [v26 sendMessage:v17 completionHandler:0];

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);

LABEL_9:
}

void __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke_266(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v3)
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138543618;
      int v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated media content profile access control %@", (uint8_t *)&v12, 0x16u);
    }
    [v6 setMediaContentProfileAccessControl:*(void *)(a1 + 32)];
  }
  id v10 = [WeakRetained context];
  SEL v11 = [v10 delegateCaller];
  [v11 callCompletion:*(void *)(a1 + 40) error:v3];
}

void __75__HMUser_updateMediaContentProfileAccessControl_forHome_completionHandler___block_invoke_267(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)mediaContentProfileAccessControlForHome:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [(HMUser *)self home];
    int v7 = [v5 isEqual:v6];

    if (v7)
    {
      id v8 = [(HMUser *)self mediaContentProfileAccessControl];
    }
    else
    {
      id v8 = 0;
    }

    return v8;
  }
  else
  {
    id v10 = (HMUser *)_HMFPreconditionFailure();
    [(HMUser *)v10 setMediaContentProfileAccessControl:v12];
  }
  return result;
}

- (void)setMediaContentProfileAccessControl:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[v5 copy];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_mediaContentProfileAccessControl, v4);
  [v4 setUser:self];
  os_unfair_lock_unlock(&self->_lock);
}

- (HMMediaContentProfileAccessControl)mediaContentProfileAccessControl
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_mediaContentProfileAccessControl;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)assistantAccessControlForHome:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [(HMUser *)self home];
    int v7 = [v5 isEqual:v6];

    if (v7)
    {
      id v8 = [(HMUser *)self assistantAccessControl];
    }
    else
    {
      id v8 = 0;
    }

    return v8;
  }
  else
  {
    id v10 = (HMUser *)_HMFPreconditionFailure();
    [(HMUser *)v10 setAnnounceUserSettings:v12];
  }
  return result;
}

- (void)setAnnounceUserSettings:(id)a3
{
  id v4 = (HMAnnounceUserSettings *)a3;
  os_unfair_lock_lock_with_options();
  announceUserSettings = self->_announceUserSettings;
  self->_announceUserSettings = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateAnnounceUserSettings:(id)a3 forHome:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMUser updateAnnounceUserSettings:forHome:completionHandler:]", @"completionHandler"];
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v24;
      __int16 v33 = 2112;
      id v34 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  SEL v11 = (void (**)(void, void))v10;
  id v12 = [(HMUser *)self context];
  if (!v11) {
    goto LABEL_12;
  }
  int v13 = v12;
  if (v12)
  {
    __int16 v14 = [v12 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke;
    block[3] = &unk_1E5944900;
    block[4] = self;
    uint64_t v30 = v11;
    id v27 = v9;
    id v28 = v8;
    id v29 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v18;
      __int16 v33 = 2080;
      id v34 = "-[HMUser updateAnnounceUserSettings:forHome:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v11)[2](v11, v19);
  }
}

void __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke(id *a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  char v2 = [a1[4] isCurrentUser];
  id v3 = a1[4];
  if (v2)
  {
    id v4 = [v3 home];
    if (v4)
    {
      if ([a1[5] isEqual:v4])
      {
        id v5 = (void *)MEMORY[0x19F3A64A0]();
        id v6 = a1[4];
        int v7 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          id v8 = HMFGetLogIdentifier();
          id v9 = [a1[4] announceUserSettings];
          id v10 = a1[6];
          *(_DWORD *)buf = 138543874;
          __int16 v45 = v8;
          __int16 v46 = 2112;
          uint64_t v47 = v9;
          __int16 v48 = 2112;
          id v49 = v10;
          _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating Announce User Settings from %@ to %@", buf, 0x20u);
        }
        SEL v11 = (void *)MEMORY[0x1E4F654B0];
        id v12 = [a1[4] messageDestination];
        id v42 = @"HM.u.announce.Settings";
        int v13 = encodeRootObject(a1[6]);
        uint64_t v43 = v13;
        __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        uint64_t v15 = [v11 messageWithName:@"HM.u.announce.settings.update" destination:v12 payload:v14];

        objc_initWeak((id *)buf, a1[4]);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke_264;
        aBlock[3] = &unk_1E5944AE0;
        objc_copyWeak(&v41, (id *)buf);
        id v39 = a1[6];
        id v40 = a1[8];
        uint64_t v16 = _Block_copy(aBlock);
        uint64_t v17 = [a1[4] context];
        id v18 = [v17 pendingRequests];

        id v19 = [v15 identifier];
        uint64_t v20 = _Block_copy(v16);
        [v18 addCompletionBlock:v20 forIdentifier:v19];

        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke_265;
        v34[3] = &unk_1E5945510;
        id v21 = v18;
        id v35 = v21;
        id v22 = v19;
        id v36 = v22;
        id v23 = v16;
        id v37 = v23;
        [v15 setResponseHandler:v34];
        id v24 = [a1[7] messageDispatcher];
        [v24 sendMessage:v15 completionHandler:0];

        objc_destroyWeak(&v41);
        objc_destroyWeak((id *)buf);

        goto LABEL_13;
      }
      id v28 = [a1[4] context];
      id v29 = [v28 delegateCaller];
      id v30 = a1[8];
      uint64_t v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    }
    else
    {
      id v28 = [a1[4] context];
      id v29 = [v28 delegateCaller];
      id v30 = a1[8];
      uint64_t v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    }
    uint64_t v32 = (void *)v31;
    [v29 callCompletion:v30 error:v31];

LABEL_13:
    return;
  }
  id v33 = [v3 context];
  id v25 = [v33 delegateCaller];
  id v26 = a1[8];
  id v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  [v25 callCompletion:v26 error:v27];
}

void __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke_264(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (!v3)
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]([WeakRetained setAnnounceUserSettings:*(void *)(a1 + 32)]);
    id v7 = v5;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [v7 announceUserSettings];
      int v13 = 138543618;
      __int16 v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated Announce Settings to %@", (uint8_t *)&v13, 0x16u);
    }
  }
  SEL v11 = [v5 context];
  id v12 = [v11 delegateCaller];
  [v12 callCompletion:*(void *)(a1 + 40) error:v3];
}

void __63__HMUser_updateAnnounceUserSettings_forHome_completionHandler___block_invoke_265(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_handleUpdatedAssistantAccessControl:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMUser *)self context];
  id v6 = [v5 pendingRequests];
  id v7 = [v4 identifier];
  id v8 = [v6 retrieveCompletionBlockForIdentifier:v7];

  if (v8)
  {
LABEL_2:
    [v4 respondWithPayload:0];
    goto LABEL_3;
  }
  uint64_t v9 = [v4 dataForKey:@"assistantAC"];
  if (v9)
  {
    id v10 = (void *)v9;
    id v83 = 0;
    SEL v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v83];
    id v12 = v83;
    uint64_t v73 = self;
    if (v11)
    {
      int v13 = [v4 arrayForKey:@"accessories"];
      if (v13)
      {
        __int16 v14 = v13;
        id v69 = v11;
        uint64_t v70 = v12;
        id v71 = v10;
        id v72 = v4;
        __int16 v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v16 = v14;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v79 objects:v84 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v80;
          uint64_t v74 = *(void *)v80;
          id v75 = v16;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v80 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              id v22 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v21];
              if (v22)
              {
                id v23 = [(HMUser *)self home];
                id v24 = [v23 accessoryWithUUID:v22];

                if (v24)
                {
                  [v15 addObject:v24];
                }
                else
                {
                  id v25 = v15;
                  id v26 = (void *)MEMORY[0x19F3A64A0]();
                  id v27 = self;
                  id v28 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    id v29 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    v86 = v29;
                    __int16 v87 = 2112;
                    id v88 = v21;
                    _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_INFO, "%{public}@Unable to find accessory with identifier: %@", buf, 0x16u);

                    self = v73;
                  }

                  __int16 v15 = v25;
                  uint64_t v19 = v74;
                  id v16 = v75;
                }
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v79 objects:v84 count:16];
          }
          while (v18);
        }

        if ([v15 count])
        {
          id v30 = (void *)[v69 mutableCopy];
          [v30 setAccessories:v15];
          uint64_t v31 = [v30 copy];

          uint64_t v32 = v71;
          id v8 = 0;
        }
        else
        {
          uint64_t v32 = v71;
          id v8 = 0;
          uint64_t v31 = (uint64_t)v69;
        }

        uint64_t v47 = [(HMUser *)self assistantAccessControl];
        __int16 v48 = (void *)v31;
        char v49 = HMFEqualObjects();

        uint64_t v50 = (void *)MEMORY[0x19F3A64A0]();
        v51 = self;
        id v52 = HMFGetOSLogHandle();
        id v53 = v52;
        if (v49)
        {
          id v4 = v72;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            uint64_t v54 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v86 = v54;
            _os_log_impl(&dword_19D1A8000, v53, OS_LOG_TYPE_INFO, "%{public}@Assistant access control did not change. Don't need to notify.", buf, 0xCu);
          }
          id v55 = v48;
        }
        else
        {
          id v55 = v48;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v56 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v86 = v56;
            __int16 v87 = 2112;
            id v88 = v48;
            _os_log_impl(&dword_19D1A8000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Updated assistant access control: %@", buf, 0x16u);
          }
          [(HMUser *)v51 setAssistantAccessControl:v48];
          uint64_t v57 = [(HMUser *)v51 home];
          if (v57)
          {
            id v58 = [(HMUser *)v51 context];
            id v59 = v58;
            if (v58)
            {
              v60 = [v58 delegateCaller];
              v76[0] = MEMORY[0x1E4F143A8];
              v76[1] = 3221225472;
              v76[2] = __47__HMUser__handleUpdatedAssistantAccessControl___block_invoke;
              v76[3] = &unk_1E5945650;
              v76[4] = v51;
              id v77 = v48;
              id v78 = v57;
              [v60 invokeBlock:v76];
            }
            else
            {
              uint64_t v65 = (void *)MEMORY[0x19F3A64A0]();
              v66 = v51;
              int v67 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              {
                v68 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v86 = v68;
                __int16 v87 = 2112;
                id v88 = v48;
                _os_log_impl(&dword_19D1A8000, v67, OS_LOG_TYPE_ERROR, "%{public}@Nil context. Cannot notify delegate of updated assistant access control: %@", buf, 0x16u);
              }
              id v55 = v48;
            }
          }
          else
          {
            id v61 = (void *)MEMORY[0x19F3A64A0]();
            v62 = v51;
            __int16 v63 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              v64 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v86 = v64;
              _os_log_impl(&dword_19D1A8000, v63, OS_LOG_TYPE_ERROR, "%{public}@No home found to perform callback on.", buf, 0xCu);
            }
            id v55 = v48;
          }

          id v4 = v72;
        }

        goto LABEL_2;
      }
      id v39 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v43 = self;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = HMFGetLogIdentifier();
        [v4 messagePayload];
        __int16 v45 = v44 = v11;
        *(_DWORD *)buf = 138543618;
        v86 = v42;
        __int16 v87 = 2112;
        id v88 = v45;
        _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@Missing updated access control accessories from message payload: %@", buf, 0x16u);

        SEL v11 = v44;
        goto LABEL_30;
      }
    }
    else
    {
      id v39 = (void *)MEMORY[0x19F3A64A0]();
      id v40 = self;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        id v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v86 = v42;
        __int16 v87 = 2112;
        id v88 = v12;
        _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive assistant access control from access control data: %@", buf, 0x16u);
LABEL_30:
      }
    }

    __int16 v46 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v46];

    goto LABEL_3;
  }
  id v33 = (void *)MEMORY[0x19F3A64A0]();
  id v34 = self;
  id v35 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    id v36 = HMFGetLogIdentifier();
    id v37 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v86 = v36;
    __int16 v87 = 2112;
    id v88 = v37;
    _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Missing updated serialized access control from message payload: %@", buf, 0x16u);
  }
  id v38 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  [v4 respondWithError:v38];

LABEL_3:
}

void __47__HMUser__handleUpdatedAssistantAccessControl___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) delegate];
  if ([v2 conformsToProtocol:&unk_1EEF70680]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  char v5 = objc_opt_respondsToSelector();
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = *(id *)(a1 + 32);
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      id v10 = HMFGetLogIdentifier();
      SEL v11 = *(void **)(a1 + 40);
      int v14 = 138543618;
      __int16 v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated assistant access control: %@", (uint8_t *)&v14, 0x16u);
    }
    [v4 user:*(void *)(a1 + 32) didUpdateAssistantAccessControl:*(void *)(a1 + 40) forHome:*(void *)(a1 + 48)];
  }
  else
  {
    if (v9)
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = 138543874;
      __int16 v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@No delegate set to notify: %@, assistant access control: %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)_handleRGAllowedPeriodEnded:(id)a3
{
  id v4 = a3;
  if (self)
  {
    uint64_t v5 = [(HMUser *)self home];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(HMUser *)self context];
      id v8 = [v7 queue];

      if (v8)
      {
        BOOL v9 = [(HMUser *)self delegate];
        if ([v9 conformsToProtocol:&unk_1EEF70680]) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
        id v11 = v10;

        if (objc_opt_respondsToSelector())
        {
          id v12 = [(HMUser *)self context];
          uint64_t v13 = [v12 queue];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __38__HMUser__handleRGAllowedPeriodEnded___block_invoke;
          v14[3] = &unk_1E5945628;
          v14[4] = self;
          id v15 = v11;
          dispatch_async(v13, v14);
        }
      }
    }
  }
}

void __38__HMUser__handleRGAllowedPeriodEnded___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__HMUser__handleRGAllowedPeriodEnded___block_invoke_2;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

uint64_t __38__HMUser__handleRGAllowedPeriodEnded___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) homeAccessControl];
    int v8 = 138543618;
    BOOL v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of RG allowed period ended: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) restrictedGuestAllowedPeriodEnded:*(void *)(a1 + 32)];
}

- (void)_handleRGAllowedPeriodStarted:(id)a3
{
  id v4 = a3;
  if (self)
  {
    uint64_t v5 = [(HMUser *)self home];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = [(HMUser *)self context];
      int v8 = [v7 queue];

      if (v8)
      {
        BOOL v9 = [(HMUser *)self delegate];
        if ([v9 conformsToProtocol:&unk_1EEF70680]) {
          __int16 v10 = v9;
        }
        else {
          __int16 v10 = 0;
        }
        id v11 = v10;

        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = [(HMUser *)self context];
          uint64_t v13 = [v12 queue];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __40__HMUser__handleRGAllowedPeriodStarted___block_invoke;
          v14[3] = &unk_1E5945628;
          v14[4] = self;
          id v15 = v11;
          dispatch_async(v13, v14);
        }
      }
    }
  }
}

void __40__HMUser__handleRGAllowedPeriodStarted___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__HMUser__handleRGAllowedPeriodStarted___block_invoke_2;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

uint64_t __40__HMUser__handleRGAllowedPeriodStarted___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) homeAccessControl];
    int v8 = 138543618;
    BOOL v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of RG allowed period started: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) restrictedGuestAllowedPeriodStarted:*(void *)(a1 + 32)];
}

- (void)updateAssistantAccessControl:(id)a3 forHome:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMUser updateAssistantAccessControl:forHome:completionHandler:]", @"completionHandler"];
    id v22 = (void *)MEMORY[0x19F3A64A0]();
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v33 = v25;
      __int16 v34 = 2112;
      id v35 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  id v11 = (void (**)(void, void))v10;
  uint64_t v12 = (void *)[v8 copy];
  uint64_t v13 = [(HMUser *)self context];
  if (!v11) {
    goto LABEL_12;
  }
  int v14 = v13;
  if (v13)
  {
    id v15 = [v13 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke;
    block[3] = &unk_1E5944900;
    block[4] = self;
    uint64_t v31 = v11;
    id v28 = v9;
    id v29 = v12;
    id v30 = v14;
    dispatch_async(v15, block);
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v33 = v19;
      __int16 v34 = 2080;
      id v35 = "-[HMUser updateAssistantAccessControl:forHome:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v11)[2](v11, v20);
  }
}

void __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke(id *a1)
{
  v38[3] = *MEMORY[0x1E4F143B8];
  char v2 = [a1[4] home];
  if (!v2)
  {
    id v22 = [a1[4] context];
    id v23 = [v22 delegateCaller];
    id v24 = a1[8];
    uint64_t v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
LABEL_6:
    id v26 = (void *)v25;
    [v23 callCompletion:v24 error:v25];

    goto LABEL_7;
  }
  if (([a1[5] isEqual:v2] & 1) == 0)
  {
    id v22 = [a1[4] context];
    id v23 = [v22 delegateCaller];
    id v24 = a1[8];
    uint64_t v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    goto LABEL_6;
  }
  id v3 = [a1[6] accessories];
  id v27 = HMAccessoryUUIDsAsStringForAccessories(v3);

  id v4 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v5 = [v2 messageTargetUUID];
  id v6 = (void *)[v4 initWithTarget:v5];

  id v7 = (void *)MEMORY[0x1E4F654B0];
  v37[0] = @"assistantAC";
  id v8 = encodeRootObject(a1[6]);
  v38[0] = v8;
  v38[1] = v27;
  v37[1] = @"accessories";
  v37[2] = @"kUserUUIDKey";
  id v9 = [a1[4] uuid];
  id v10 = [v9 UUIDString];
  v38[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  uint64_t v12 = [v7 messageWithName:@"HMU.au" destination:v6 payload:v11];

  objc_initWeak(&location, a1[4]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E5944AE0;
  objc_copyWeak(&v35, &location);
  id v33 = a1[6];
  id v34 = a1[8];
  uint64_t v13 = _Block_copy(aBlock);
  int v14 = [a1[4] context];
  id v15 = [v14 pendingRequests];

  __int16 v16 = [v12 identifier];
  id v17 = _Block_copy(v13);
  [v15 addCompletionBlock:v17 forIdentifier:v16];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke_189;
  v28[3] = &unk_1E59441B0;
  v28[4] = a1[4];
  id v18 = v15;
  id v29 = v18;
  id v19 = v16;
  id v30 = v19;
  id v20 = v13;
  id v31 = v20;
  [v12 setResponseHandler:v28];
  uint64_t v21 = [a1[7] messageDispatcher];
  [v21 sendMessage:v12 completionHandler:0];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

LABEL_7:
}

void __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (!v3) {
    [WeakRetained setAssistantAccessControl:*(void *)(a1 + 32)];
  }
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = v5;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of updated assistant access control. error: %@", (uint8_t *)&v12, 0x16u);
  }
  id v10 = [v7 context];
  id v11 = [v10 delegateCaller];
  [v11 callCompletion:*(void *)(a1 + 40) error:v3];
}

void __65__HMUser_updateAssistantAccessControl_forHome_completionHandler___block_invoke_189(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v12 = 138543874;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished to update assistant access control. error: %@, response payload: %@", (uint8_t *)&v12, 0x20u);
  }
  id v11 = [*(id *)(a1 + 40) removeCompletionBlockForIdentifier:*(void *)(a1 + 48)];
  if (v11) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)setAssistantAccessControl:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[v5 copy];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_assistantAccessControl, v4);
  [v4 setUser:self];
  os_unfair_lock_unlock(&self->_lock);
}

- (HMAssistantAccessControl)assistantAccessControl
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_assistantAccessControl;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setPairingIdentity:(id)a3
{
  obuint64_t j = [a3 publicPairingIdentity];
  if (obj)
  {
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)&self->_pairingIdentity, obj);
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (HMFPairingIdentity)pairingIdentity
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_pairingIdentity;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)_handleMultiUserStatusChangedNotification:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v11 = 138543362;
    int v12 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying settings delegate of update on multi-user status change.", (uint8_t *)&v11, 0xCu);
  }
  id v9 = [(HMUser *)v6 settingsController];
  [v9 notifyDelegateOfUpdate];

  id v10 = [(HMUser *)v6 privateSettingsController];
  [v10 notifyDelegateOfUpdate];
}

- (void)updateHomeAccessControl:(BOOL)a3 remoteAccess:(BOOL)a4 announceAccess:(BOOL)a5 camerasAccess:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  int v11 = [(HMUser *)self homeAccessControl];
  [v11 setAdministrator:v8];

  int v12 = [(HMUser *)self homeAccessControl];
  [v12 setRemoteAccessAllowed:v7];

  uint64_t v13 = [(HMUser *)self homeAccessControl];
  [v13 setCamerasAccess:v10];

  id v14 = [(HMUser *)self homeAccessControl];
  [v14 setAnnounceAccessAllowed:v6];
}

- (void)setHomeAccessControl:(id)a3
{
  id v4 = (HMHomeAccessControl *)a3;
  os_unfair_lock_lock_with_options();
  homeAccessControl = self->_homeAccessControl;
  self->_homeAccessControl = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setFamilyName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  familyName = self->_familyName;
  self->_familyName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)familyName
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_familyName;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setGivenName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  givenName = self->_givenName;
  self->_givenName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)givenName
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_givenName;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setiCloudAltDSID:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  iCloudAltDSID = self->_iCloudAltDSID;
  self->_iCloudAltDSID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)iCloudAltDSID
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_iCloudAltDSID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_unconfigure
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  id v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      BOOL v8 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring user", (uint8_t *)&v14, 0xCu);
    }
    [(HMUser *)v5 setHome:0];
    homeAccessControl = v5->_homeAccessControl;
    v5->_homeAccessControl = 0;

    id v10 = [(HMUser *)v5 context];
    int v11 = [v10 messageDispatcher];
    [v11 deregisterReceiver:v5];

    [(HMUser *)v5 setContext:0];
    int v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 removeObserver:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      id v15 = v13;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (HMUser)initWithUserID:(id)a3 name:(id)a4 uuid:(id)a5 home:(id)a6
{
  return [(HMUser *)self initWithUserID:a3 name:a4 uuid:a5 home:a6 homeAccessControl:0];
}

- (HMUser)init
{
  char v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
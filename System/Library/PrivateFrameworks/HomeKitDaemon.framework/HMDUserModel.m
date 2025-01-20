@interface HMDUserModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)cd_getHMDUserFromMKFUser:(id)a3;
+ (id)cd_getMKFUserFromUUID:(id)a3;
+ (id)keyedArchiveToken:(id)a3;
+ (id)properties;
+ (id)shareTokenFromKeyedArchiveData:(id)a3;
- (id)cd_fetchManagedObjectInContext:(id)a3 error:(id *)a4;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDUserModel

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 isEqualToString:@"pairingIdentity"])
  {
    if ([v9 isEqualToString:@"photosPersonDataZoneUUID"])
    {
      if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"photosPersonDataZoneUUIDString"])
      {
        v13 = [(HMDUserModel *)self photosPersonDataZoneUUIDString];
        if (v13) {
          id v14 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
        }
        else {
          id v14 = 0;
        }
        v22 = (void *)*MEMORY[0x263EFFD08];
        if (v14) {
          v22 = v14;
        }
        id v11 = v22;

        goto LABEL_28;
      }
LABEL_15:
      id v11 = 0;
      goto LABEL_29;
    }
    if ([v9 isEqualToString:@"reverseShareToken"])
    {
      if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"reverseShareToken"])
      {
        v15 = objc_opt_class();
        v12 = [(HMDUserModel *)self reverseShareToken];
        uint64_t v16 = [v15 shareTokenFromKeyedArchiveData:v12];
        v17 = (void *)v16;
        v18 = (void *)*MEMORY[0x263EFFD08];
        if (v16) {
          v18 = (void *)v16;
        }
        id v11 = v18;

        goto LABEL_21;
      }
      goto LABEL_15;
    }
    if (![v9 isEqualToString:@"ownedHome"])
    {
      v40.receiver = self;
      v40.super_class = (Class)HMDUserModel;
      uint64_t v21 = [(HMDBackingStoreModelObject *)&v40 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
      goto LABEL_23;
    }
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"privilege"])
    {
      v19 = [(HMDUserModel *)self privilege];
      uint64_t v20 = [v19 unsignedIntegerValue];

      if (v20 != 3)
      {
        uint64_t v21 = [MEMORY[0x263EFF9D0] null];
LABEL_23:
        id v11 = (id)v21;
        goto LABEL_29;
      }
LABEL_35:
      v28 = [(HMDBackingStoreModelObject *)self parentUUID];
      id v41 = 0;
      id v11 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v28 ofManagedObjectType:objc_opt_class() error:&v41];
      id v14 = v41;

      if (v11)
      {
        id v29 = v11;
      }
      else
      {
        v35 = (void *)MEMORY[0x230FBD990]();
        v36 = self;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = HMFGetLogIdentifier();
          v39 = [(HMDBackingStoreModelObject *)v36 parentUUID];
          *(_DWORD *)buf = 138543874;
          v44 = v38;
          __int16 v45 = 2112;
          v46 = v39;
          __int16 v47 = 2112;
          id v48 = v14;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFHome with UUID %@: %@", buf, 0x20u);
        }
      }

      goto LABEL_28;
    }
    v24 = [(HMDBackingStoreModelObject *)self uuid];
    id v42 = 0;
    v25 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v24 ofManagedObjectType:objc_opt_class() error:&v42];
    id v14 = v42;

    if (v25)
    {
      v26 = [v25 privilege];
      uint64_t v27 = [v26 unsignedIntegerValue];

      if (v27 == 3)
      {

        goto LABEL_35;
      }
      id v11 = [MEMORY[0x263EFF9D0] null];
    }
    else
    {
      v30 = (void *)MEMORY[0x230FBD990]();
      v31 = self;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        v34 = [(HMDBackingStoreModelObject *)v31 uuid];
        *(_DWORD *)buf = 138543874;
        v44 = v33;
        __int16 v45 = 2112;
        v46 = v34;
        __int16 v47 = 2112;
        id v48 = v14;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFUser with UUID %@: %@", buf, 0x20u);
      }
      id v11 = 0;
    }

LABEL_28:
    goto LABEL_29;
  }
  id v11 = 0;
  if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"pairingIdentity"] && self)
  {
    v12 = [(HMDUserModel *)self pairingIdentity];
    if (v12)
    {
      objc_msgSend(MEMORY[0x263F35A78], "hmd_pairingIdentityWithDictionary:", v12);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
LABEL_21:
  }
LABEL_29:

  return v11;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 isEqualToString:@"pairingIdentity"])
  {
    if ([v9 isEqualToString:@"photosPersonDataZoneUUIDString"])
    {
      uint64_t v16 = [v8 photosPersonDataZoneUUID];
      uint64_t v17 = [v16 UUIDString];
      v18 = (void *)v17;
      v19 = (void *)*MEMORY[0x263EFFD08];
      if (v17) {
        v19 = (void *)v17;
      }
      id v20 = v19;
    }
    else
    {
      if (![v9 isEqualToString:@"reverseShareToken"])
      {
        v24.receiver = self;
        v24.super_class = (Class)HMDUserModel;
        id v20 = [(HMDBackingStoreModelObject *)&v24 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
        goto LABEL_17;
      }
      uint64_t v21 = objc_opt_class();
      uint64_t v16 = [v8 reverseShareToken];
      id v20 = [v21 keyedArchiveToken:v16];
    }

    goto LABEL_17;
  }
  id v11 = v8;
  v12 = v11;
  if (self)
  {
    v13 = [v11 pairingIdentity];
    if (v13)
    {
      id v14 = [v12 pairingIdentity];
      v15 = objc_msgSend(v14, "hmd_dictionaryEncoding");
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  v22 = (void *)*MEMORY[0x263EFFD08];
  if (v15) {
    v22 = v15;
  }
  id v20 = v22;

LABEL_17:
  return v20;
}

- (id)cd_fetchManagedObjectInContext:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(HMDBackingStoreModelObject *)self managedObject];
  if (v6)
  {
    v7 = v6;
    id v8 = [v6 managedObjectContext];

    if (!v8)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = self;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v12 = HMFGetLogIdentifier();
        v13 = [(HMDBackingStoreModelObject *)v10 uuid];
        id v14 = [(HMDBackingStoreModelObject *)v10 parentUUID];
        int v25 = 138544130;
        v26 = v12;
        __int16 v27 = 2112;
        v28 = v7;
        __int16 v29 = 2112;
        v30 = v13;
        __int16 v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_FAULT, "%{public}@[User/Guest] Managed object context appears to be reset on this object %@, someone did something very bad: %@/%@", (uint8_t *)&v25, 0x2Au);
      }
    }
  }
  else
  {
    v15 = [(HMDBackingStoreModelObject *)self uuid];
    uint64_t v16 = +[_MKFHome findHomeMemberWithUUID:v15 context:v5];

    if (v16)
    {
      uint64_t v17 = [v16 castIfMemberIsUser];

      if (v17)
      {
        v7 = [v16 castIfMemberIsUser];
        [(HMDBackingStoreModelObject *)self setManagedObject:v7];
      }
      else
      {
        v18 = [v16 castIfMemberIsGuest];

        if (v18)
        {
          v19 = [v16 castIfMemberIsGuest];
          v7 = HMDCastIfManagedObjectBSORepresentable(v19);
          [(HMDBackingStoreModelObject *)self setManagedObject:v7];
        }
        else
        {
          id v20 = (void *)MEMORY[0x230FBD990]();
          uint64_t v21 = self;
          v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = HMFGetLogIdentifier();
            int v25 = 138543362;
            v26 = v23;
            _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Got the home member which is neither User nor Guest.", (uint8_t *)&v25, 0xCu);
          }
          v7 = 0;
        }
      }
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

+ (id)shareTokenFromKeyedArchiveData:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F08928];
    v6 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    id v15 = 0;
    v7 = [v5 _strictlyUnarchivedObjectOfClasses:v6 fromData:v4 error:&v15];
    id v8 = v15;

    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = a1;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive share token : %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)keyedArchiveToken:(id)a3
{
  if (a3)
  {
    id v4 = encodeRootObject();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)cd_getHMDUserFromMKFUser:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = v4;
  v6 = [HMDUserModel alloc];
  v7 = [v5 modelID];
  uint64_t v8 = [v5 home];
  id v9 = [(id)v8 modelID];
  id v10 = [(HMDBackingStoreModelObject *)v6 initWithUUID:v7 parentUUID:v9];

  id v19 = 0;
  LOBYTE(v8) = [(HMDBackingStoreModelObject *)v10 cd_populateFromManagedObject:v5 error:&v19];
  id v11 = v19;
  if (v8)
  {
    v12 = [[HMDUser alloc] initWithModelObject:v10];
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      v23 = v5;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to populate HMDUserModel from %@, error: %@", buf, 0x20u);
    }
    v12 = (HMDUser *)(id)*MEMORY[0x263EFFD08];
  }
  uint64_t v17 = v12;

  return v17;
}

+ (id)cd_getMKFUserFromUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = v4;
  id v16 = 0;
  v6 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v4 ofManagedObjectType:objc_opt_class() error:&v16];
  id v7 = v16;
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v14 = v6;
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      __int16 v21 = 2112;
      __int16 v22 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find mkfUser with UUID %@: %@", buf, 0x20u);
    }
    id v14 = 0;
  }

  return v14;
}

+ (id)properties
{
  if (properties_onceToken_1621 != -1) {
    dispatch_once(&properties_onceToken_1621, &__block_literal_global_1624);
  }
  v2 = (void *)properties__properties_1622;
  return v2;
}

void __26__HMDUserModel_properties__block_invoke()
{
  v56[53] = *MEMORY[0x263EF8340];
  v55[0] = @"accountHandle";
  v54 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[0] = v54;
  v55[1] = @"accountIdentifier";
  v53 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[1] = v53;
  v55[2] = @"pairingIdentity";
  v52 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[2] = v52;
  v55[3] = @"privilege";
  v51 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[3] = v51;
  v55[4] = @"remoteAccessAllowed";
  v50 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[4] = v50;
  v55[5] = @"presenceAuthorizationStatus";
  uint64_t v49 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[5] = v49;
  v55[6] = @"changeTag";
  id v48 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[6] = v48;
  v55[7] = @"userID";
  __int16 v47 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class() logging:0];
  v56[7] = v47;
  v55[8] = @"camerasAccessLevel";
  v46 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[8] = v46;
  v55[9] = @"announceAccessAllowed";
  __int16 v45 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[9] = v45;
  v55[10] = @"announceAccessLevel";
  v44 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[10] = v44;
  v55[11] = @"analysisAccessSelection";
  v43 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[11] = v43;
  v55[12] = @"matterCASEAuthenticatedTagID";
  id v42 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[12] = v42;
  v55[13] = @"matCredIPKExternalRepresentation";
  id v41 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[13] = v41;
  v55[14] = @"uniqueIDForAccessories";
  objc_super v40 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[14] = v40;
  v55[15] = @"idsMergeIdentifier";
  v39 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[15] = v39;
  v55[16] = @"reverseShareID";
  v38 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[16] = v38;
  v55[17] = @"reverseShareToken";
  v37 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[17] = v37;
  v55[18] = @"allowExplicitContent";
  v36 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[18] = v36;
  v55[19] = @"allowiTunesAccount";
  v35 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[19] = v35;
  v55[20] = @"dolbyAtmosEnabled";
  v34 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[20] = v34;
  v55[21] = @"losslessMusicEnabled";
  uint64_t v33 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[21] = v33;
  v55[22] = @"playbackInfluencesEnabled";
  v32 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[22] = v32;
  v55[23] = @"siriIdentifyVoiceEnabled";
  __int16 v31 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[23] = v31;
  v55[24] = @"ownerAddSceneButtonPresentedCount";
  v30 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[24] = v30;
  v55[25] = @"ownerCompletedSwitchingHomesOnboardingUI";
  __int16 v29 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[25] = v29;
  v55[26] = @"ownerDismissed2024EnergyOnboarding";
  v28 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[26] = v28;
  v55[27] = @"ownerDismissedAccessCodeOnboarding";
  __int16 v27 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[27] = v27;
  v55[28] = @"ownerDismissedAccessoryFirmwareUpdateOnboarding";
  uint64_t v26 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[28] = v26;
  v55[29] = @"ownerDismissedAnnounceOnboarding";
  id v25 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[29] = v25;
  v55[30] = @"ownerDismissedCameraRecordingOnboarding";
  __int16 v24 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[30] = v24;
  v55[31] = @"ownerDismissedCameraRecordingSetupBanner";
  uint64_t v23 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[31] = v23;
  v55[32] = @"ownerDismissedCameraUpgradeOfferBanner";
  __int16 v22 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[32] = v22;
  v55[33] = @"ownerDismissedHomeTheaterOnboarding";
  __int16 v21 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[33] = v21;
  v55[34] = @"ownerDismissedIdentifyVoiceOnboarding";
  uint64_t v20 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[34] = v20;
  v55[35] = @"ownerDismissedIdentifyVoiceSetupBanner";
  __int16 v19 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[35] = v19;
  v55[36] = @"ownerDismissedNaturalLightingOnboarding";
  __int16 v18 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[36] = v18;
  v55[37] = @"ownerDismissedTVViewingProfileOnboarding";
  uint64_t v17 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[37] = v17;
  v55[38] = @"ownerDismissedTVViewingProfileSetupBanner";
  id v16 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[38] = v16;
  v55[39] = @"ownerDismissedUserSplitMediaAccountWarning";
  id v15 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[39] = v15;
  v55[40] = @"ownerDismissedWalletKeyExpressModeOnboarding";
  id v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[40] = v14;
  v55[41] = @"ownerDismissedWelcomeUI";
  v13 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[41] = v13;
  v55[42] = @"ownerHasUserSeenRMVNewLanguageNotification";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[42] = v12;
  v55[43] = @"activityNotificationsEnabledForPersonalRequests";
  id v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[43] = v11;
  v55[44] = @"accessoriesWithPersonalRequestsEnabled";
  id v10 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[44] = v10;
  v55[45] = @"accessoriesWithMediaContentProfileEnabled";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[45] = v0;
  v55[46] = @"accessoriesWithListeningHistoryEnabled";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[46] = v1;
  v55[47] = @"photosPersonDataZoneUUIDString";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[47] = v2;
  v55[48] = @"sharePhotosFaceClassifications";
  uint64_t v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[48] = v3;
  v55[49] = @"ownerCharacteristicAuthorizationData";
  id v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[49] = v4;
  v55[50] = @"iCloudAltDSID";
  id v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[50] = v5;
  v55[51] = @"firstName";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[51] = v6;
  v55[52] = @"lastName";
  id v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v56[52] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:53];
  BOOL v9 = (void *)properties__properties_1622;
  properties__properties_1622 = v8;
}

@end
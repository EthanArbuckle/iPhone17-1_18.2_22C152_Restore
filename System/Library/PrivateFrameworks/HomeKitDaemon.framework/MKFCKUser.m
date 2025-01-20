@interface MKFCKUser
+ (id)fetchRequest;
- (BOOL)_importOutgoingInvitationRelationshipIntoLocalModel:(void *)a3 context:;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)exportOwnerUserSettingsFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importOwnerUserSettingsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)importSharedUserSettingsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)isOwner;
- (id)_resolveSharedUserDataRootWithContext:(id)a3;
@end

@implementation MKFCKUser

- (id)_resolveSharedUserDataRootWithContext:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[MKFCKSharedUserDataRoot fetchRequest];
  v6 = (void *)MEMORY[0x263F08A98];
  v7 = [(MKFCKUser *)self homeModelID];
  v8 = [v6 predicateWithFormat:@"%K == %@", @"homeModelID", v7];
  [v5 setPredicate:v8];

  id v49 = 0;
  v9 = [v4 executeFetchRequest:v5 error:&v49];
  id v10 = v49;
  if (!v9)
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      v33 = [(MKFCKUser *)v30 homeModelID];
      *(_DWORD *)buf = 138544130;
      v52 = v32;
      __int16 v53 = 2160;
      uint64_t v54 = 1752392040;
      __int16 v55 = 2112;
      v56 = v33;
      __int16 v57 = 2114;
      id v58 = v10;
      v34 = "%{public}@Failed to fetch shared user data roots for home %{mask.hash}@: %{public}@";
      v35 = v31;
      os_log_type_t v36 = OS_LOG_TYPE_ERROR;
      uint32_t v37 = 42;
LABEL_19:
      _os_log_impl(&dword_22F52A000, v35, v36, v34, buf, v37);
    }
LABEL_20:

    id v28 = 0;
    goto LABEL_23;
  }
  if (![v9 count])
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      v33 = [(MKFCKUser *)v30 homeModelID];
      *(_DWORD *)buf = 138543874;
      v52 = v32;
      __int16 v53 = 2160;
      uint64_t v54 = 1752392040;
      __int16 v55 = 2112;
      v56 = v33;
      v34 = "%{public}@No shared user data roots for home %{mask.hash}@";
      v35 = v31;
      os_log_type_t v36 = OS_LOG_TYPE_INFO;
      uint32_t v37 = 32;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v44 = self;
  id v40 = v10;
  v41 = v5;
  id v42 = v4;
  v11 = objc_msgSend(v4, "hmd_coreData");
  v12 = [v11 container];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v39 = v9;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v18 = [v17 objectID];
        v19 = [v12 recordForManagedObjectID:v18];

        if (v19)
        {
          v20 = [(MKFCKUser *)v44 reverseShareID];
          v21 = [v19 share];
          v22 = [v21 recordID];
          char v23 = [v20 isEqual:v22];

          if (v23)
          {
            id v28 = v17;

            goto LABEL_22;
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  v24 = (void *)MEMORY[0x230FBD990]();
  v25 = v44;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v52 = v27;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to find associated shared data root for user", buf, 0xCu);
  }
  id v28 = 0;
LABEL_22:
  v5 = v41;
  id v4 = v42;
  v9 = v39;
  id v10 = v40;

LABEL_23:
  return v28;
}

- (BOOL)importSharedUserSettingsIntoLocalModel:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MKFCKUser *)self isOwner])
  {
    char v8 = 1;
  }
  else
  {
    v9 = [(MKFCKUser *)self _resolveSharedUserDataRootWithContext:v7];
    id v10 = v9;
    if (v9) {
      char v8 = [v9 importIntoLocalModel:v6 context:v7];
    }
    else {
      char v8 = 1;
    }
  }
  return v8;
}

- (BOOL)importOwnerUserSettingsIntoLocalModel:(id)a3 context:(id)a4
{
  id v5 = a3;
  if ([(MKFCKUser *)self isOwner])
  {
    id v6 = [v5 allowExplicitContent];
    int v7 = [v6 BOOLValue];
    int v8 = [(MKFCKUser *)self ownerAllowExplicitContent];

    if (v7 != v8)
    {
      v9 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKUser ownerAllowExplicitContent](self, "ownerAllowExplicitContent"));
      [v5 setAllowExplicitContent:v9];
    }
    id v10 = [v5 allowiTunesAccount];
    int v11 = [v10 BOOLValue];
    int v12 = [(MKFCKUser *)self ownerAllowiTunesAccount];

    if (v11 != v12)
    {
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKUser ownerAllowiTunesAccount](self, "ownerAllowiTunesAccount"));
      [v5 setAllowiTunesAccount:v13];
    }
    uint64_t v14 = [v5 dolbyAtmosEnabled];
    int v15 = [v14 BOOLValue];
    int v16 = [(MKFCKUser *)self ownerDolbyAtmosEnabled];

    if (v15 != v16)
    {
      v17 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKUser ownerDolbyAtmosEnabled](self, "ownerDolbyAtmosEnabled"));
      [v5 setDolbyAtmosEnabled:v17];
    }
    v18 = [v5 losslessMusicEnabled];
    int v19 = [v18 BOOLValue];
    int v20 = [(MKFCKUser *)self ownerLosslessMusicEnabled];

    if (v19 != v20)
    {
      v21 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKUser ownerLosslessMusicEnabled](self, "ownerLosslessMusicEnabled"));
      [v5 setLosslessMusicEnabled:v21];
    }
    v22 = [v5 playbackInfluencesEnabled];
    int v23 = [v22 BOOLValue];
    int v24 = [(MKFCKUser *)self ownerPlaybackInfluencesEnabled];

    if (v23 != v24)
    {
      v25 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKUser ownerPlaybackInfluencesEnabled](self, "ownerPlaybackInfluencesEnabled"));
      [v5 setPlaybackInfluencesEnabled:v25];
    }
    v26 = [v5 siriIdentifyVoiceEnabled];
    int v27 = [v26 BOOLValue];
    int v28 = [(MKFCKUser *)self ownerSiriIdentifyVoiceEnabled];

    if (v27 != v28)
    {
      v29 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKUser ownerSiriIdentifyVoiceEnabled](self, "ownerSiriIdentifyVoiceEnabled"));
      [v5 setSiriIdentifyVoiceEnabled:v29];
    }
    v30 = [v5 activityNotificationsEnabledForPersonalRequests];
    int v31 = [v30 BOOLValue];
    int v32 = [(MKFCKUser *)self ownerActivityNotificationsEnabledForPersonalRequests];

    if (v31 != v32)
    {
      v33 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKUser ownerActivityNotificationsEnabledForPersonalRequests](self, "ownerActivityNotificationsEnabledForPersonalRequests"));
      [v5 setActivityNotificationsEnabledForPersonalRequests:v33];
    }
    v34 = [v5 ownerCharacteristicAuthorizationData];
    v35 = [(MKFCKUser *)self ownerCharacteristicAuthorizationData];
    char v36 = HMFEqualObjects();

    if ((v36 & 1) == 0)
    {
      uint32_t v37 = [(MKFCKUser *)self ownerCharacteristicAuthorizationData];
      [v5 setOwnerCharacteristicAuthorizationData:v37];
    }
    v38 = [v5 sharePhotosFaceClassifications];
    int v39 = [v38 BOOLValue];
    int v40 = [(MKFCKUser *)self sharePhotosFaceClassifications];

    if (v39 != v40)
    {
      v41 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKUser sharePhotosFaceClassifications](self, "sharePhotosFaceClassifications"));
      [v5 setSharePhotosFaceClassifications:v41];
    }
    id v42 = [v5 photosPersonDataZoneUUID];
    v43 = [(MKFCKUser *)self photosPersonDataZoneUUID];
    char v44 = HMFEqualObjects();

    if ((v44 & 1) == 0)
    {
      long long v45 = [(MKFCKUser *)self photosPersonDataZoneUUID];
      [v5 setPhotosPersonDataZoneUUID:v45];
    }
    long long v46 = [v5 matCredIPKExternalRepresentation];
    long long v47 = [(MKFCKUser *)self ownerMatCredIPKExternalRepresentation];
    char v48 = HMFEqualObjects();

    if ((v48 & 1) == 0)
    {
      id v49 = [(MKFCKUser *)self ownerMatCredIPKExternalRepresentation];
      [v5 setMatCredIPKExternalRepresentation:v49];
    }
  }

  return 1;
}

- (BOOL)exportOwnerUserSettingsFromLocalModel:(id)a3 context:(id)a4
{
  id v5 = a3;
  if ([v5 isOwner])
  {
    int v6 = [(MKFCKUser *)self ownerAllowExplicitContent];
    int v7 = [v5 allowExplicitContent];
    int v8 = [v7 BOOLValue];

    if (v6 != v8)
    {
      v9 = [v5 allowExplicitContent];
      -[MKFCKUser setOwnerAllowExplicitContent:](self, "setOwnerAllowExplicitContent:", [v9 BOOLValue]);
    }
    int v10 = [(MKFCKUser *)self ownerAllowiTunesAccount];
    int v11 = [v5 allowiTunesAccount];
    int v12 = [v11 BOOLValue];

    if (v10 != v12)
    {
      uint64_t v13 = [v5 allowiTunesAccount];
      -[MKFCKUser setOwnerAllowiTunesAccount:](self, "setOwnerAllowiTunesAccount:", [v13 BOOLValue]);
    }
    int v14 = [(MKFCKUser *)self ownerDolbyAtmosEnabled];
    int v15 = [v5 dolbyAtmosEnabled];
    int v16 = [v15 BOOLValue];

    if (v14 != v16)
    {
      v17 = [v5 dolbyAtmosEnabled];
      -[MKFCKUser setOwnerDolbyAtmosEnabled:](self, "setOwnerDolbyAtmosEnabled:", [v17 BOOLValue]);
    }
    int v18 = [(MKFCKUser *)self ownerLosslessMusicEnabled];
    int v19 = [v5 losslessMusicEnabled];
    int v20 = [v19 BOOLValue];

    if (v18 != v20)
    {
      v21 = [v5 losslessMusicEnabled];
      -[MKFCKUser setOwnerLosslessMusicEnabled:](self, "setOwnerLosslessMusicEnabled:", [v21 BOOLValue]);
    }
    int v22 = [(MKFCKUser *)self ownerPlaybackInfluencesEnabled];
    int v23 = [v5 playbackInfluencesEnabled];
    int v24 = [v23 BOOLValue];

    if (v22 != v24)
    {
      v25 = [v5 playbackInfluencesEnabled];
      -[MKFCKUser setOwnerPlaybackInfluencesEnabled:](self, "setOwnerPlaybackInfluencesEnabled:", [v25 BOOLValue]);
    }
    int v26 = [(MKFCKUser *)self ownerSiriIdentifyVoiceEnabled];
    int v27 = [v5 siriIdentifyVoiceEnabled];
    int v28 = [v27 BOOLValue];

    if (v26 != v28)
    {
      v29 = [v5 siriIdentifyVoiceEnabled];
      -[MKFCKUser setOwnerSiriIdentifyVoiceEnabled:](self, "setOwnerSiriIdentifyVoiceEnabled:", [v29 BOOLValue]);
    }
    int v30 = [(MKFCKUser *)self ownerActivityNotificationsEnabledForPersonalRequests];
    int v31 = [v5 activityNotificationsEnabledForPersonalRequests];
    int v32 = [v31 BOOLValue];

    if (v30 != v32)
    {
      v33 = [v5 activityNotificationsEnabledForPersonalRequests];
      -[MKFCKUser setOwnerActivityNotificationsEnabledForPersonalRequests:](self, "setOwnerActivityNotificationsEnabledForPersonalRequests:", [v33 BOOLValue]);
    }
    v34 = [(MKFCKUser *)self ownerCharacteristicAuthorizationData];
    v35 = [v5 ownerCharacteristicAuthorizationData];
    char v36 = HMFEqualObjects();

    if ((v36 & 1) == 0)
    {
      uint32_t v37 = [v5 ownerCharacteristicAuthorizationData];
      [(MKFCKUser *)self setOwnerCharacteristicAuthorizationData:v37];
    }
    int v38 = [(MKFCKUser *)self sharePhotosFaceClassifications];
    int v39 = [v5 sharePhotosFaceClassifications];
    int v40 = [v39 BOOLValue];

    if (v38 != v40)
    {
      v41 = [v5 sharePhotosFaceClassifications];
      -[MKFCKUser setSharePhotosFaceClassifications:](self, "setSharePhotosFaceClassifications:", [v41 BOOLValue]);
    }
    id v42 = [(MKFCKUser *)self photosPersonDataZoneUUID];
    v43 = [v5 photosPersonDataZoneUUID];
    char v44 = HMFEqualObjects();

    if ((v44 & 1) == 0)
    {
      long long v45 = [v5 photosPersonDataZoneUUID];
      [(MKFCKUser *)self setPhotosPersonDataZoneUUID:v45];
    }
    long long v46 = [(MKFCKUser *)self ownerMatCredIPKExternalRepresentation];
    long long v47 = [v5 matCredIPKExternalRepresentation];
    char v48 = HMFEqualObjects();

    if ((v48 & 1) == 0)
    {
      id v49 = [v5 matCredIPKExternalRepresentation];
      [(MKFCKUser *)self setOwnerMatCredIPKExternalRepresentation:v49];
    }
  }

  return 1;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((objc_msgSend(v9, "hmf_isEmpty") & 1) == 0)
  {
    *(void *)v64 = 0;
    *(void *)&v64[8] = v64;
    *(void *)&v64[16] = 0x2020000000;
    LOBYTE(v65) = 1;
    int v11 = (void *)MEMORY[0x263EFFA08];
    v63[0] = @"bulletinConditions_";
    v63[1] = @"bulletinRegistrations_";
    v63[2] = @"notificationRegistrations_";
    int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:3];
    uint64_t v13 = [v11 setWithArray:v12];

    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __60__MKFCKUser_exportFromLocalModel_updatedProperties_context___block_invoke;
    v56[3] = &unk_264A2CF80;
    id v14 = v13;
    id v57 = v14;
    id v58 = v64;
    uint64_t v15 = objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v56);
    if (*(unsigned char *)(*(void *)&v64[8] + 24))
    {
      int v16 = (void *)MEMORY[0x230FBD990](v15);
      v17 = self;
      HMFGetOSLogHandle();
      int v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v60 = v19;
        __int16 v61 = 2112;
        id v62 = v8;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Skipping cloud export from MKFUser %@ since all updated properties are non-cloud sync properties", buf, 0x16u);
      }

      _Block_object_dispose(v64, 8);
LABEL_26:
      BOOL v44 = 1;
      goto LABEL_27;
    }

    _Block_object_dispose(v64, 8);
  }
  if ([(MKFCKModel *)self copyPropertiesFromLocalModel:v8 context:v10])
  {
    int v20 = ![(MKFCKUser *)self exportOwnerUserSettingsFromLocalModel:v8 context:v10];
    if (!self) {
      LOBYTE(v20) = 1;
    }
    if ((v20 & 1) == 0)
    {
      id v21 = v10;
      id v22 = v8;
      contextb = [v22 entity];
      v52 = [contextb relationshipsByName];
      int v23 = [v52 objectForKeyedSubscript:@"personsFromPhotos_"];
      v51 = [(MKFCKUser *)self entity];
      v50 = [v51 relationshipsByName];
      int v24 = [v50 objectForKeyedSubscript:@"personsFromPhotos"];
      id v25 = v21;
      id v26 = v24;
      id v27 = v23;
      id v28 = v22;
      v29 = [v26 name];
      int v30 = [(MKFCKUser *)self valueForKey:v29];

      int v31 = [(MKFCKUser *)self home];
      int v49 = [v31 _exportRelationshipsFromLocalModel:v28 localRelationship:v27 cloudRelationship:v26 cloudModels:v30 context:v25];

      if (v49)
      {
        int v32 = [v28 accessCode];
        v33 = v32;
        if (v32)
        {
          v34 = [v32 accessCode];
          [(MKFCKUser *)self setHomeAccessCode:v34];
        }
        id v35 = v28;
        id v36 = v25;
        uint32_t v37 = [v35 invitation];
        if (v37)
        {
          int v38 = +[MKFCKModel fetchWithLocalModel:v37 context:v36];
          if (v38)
          {
            int v39 = [(MKFCKUser *)self invitation];
            BOOL v40 = v39 == v38;

            if (!v40)
            {
              context = (void *)MEMORY[0x230FBD990]();
              v41 = self;
              id v42 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                v43 = HMFGetLogIdentifier();
                *(_DWORD *)v64 = 138543874;
                *(void *)&v64[4] = v43;
                *(_WORD *)&v64[12] = 2112;
                *(void *)&v64[14] = v38;
                *(_WORD *)&v64[22] = 2112;
                v65 = v41;
                _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@Linking invitation [%@] to pendingUser : [%@]", v64, 0x20u);
              }
              [(MKFCKUser *)v41 setInvitation:v38];
            }
          }
          else
          {
            contexta = (void *)MEMORY[0x230FBD990]();
            long long v45 = self;
            long long v46 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              long long v47 = HMFGetLogIdentifier();
              *(_DWORD *)v64 = 138543874;
              *(void *)&v64[4] = v47;
              *(_WORD *)&v64[12] = 2112;
              *(void *)&v64[14] = v35;
              *(_WORD *)&v64[22] = 2112;
              v65 = v37;
              _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship between user and outgoing invitation yet: %@.invitation = %@", v64, 0x20u);
            }
          }
        }
        goto LABEL_26;
      }
    }
  }
  BOOL v44 = 0;
LABEL_27:

  return v44;
}

void __60__MKFCKUser_exportFromLocalModel_updatedProperties_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = *(void **)(a1 + 32);
  int v6 = [a2 name];
  LOBYTE(v5) = [v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (![(MKFCKModel *)self copyPropertiesIntoLocalModel:v7 context:v8]
    || ![(MKFCKUser *)self importOwnerUserSettingsIntoLocalModel:v7 context:v8])
  {
    goto LABEL_18;
  }
  BOOL v9 = [(MKFCKUser *)self importSharedUserSettingsIntoLocalModel:v7 context:v8];
  BOOL v10 = 0;
  if (!self || !v9) {
    goto LABEL_19;
  }
  id v11 = v7;
  int v12 = [v11 accountHandle];
  uint64_t v13 = [v12 remoteDestinationString];
  [v11 setUserID:v13];

  id v14 = v8;
  id v15 = v11;
  uint64_t v59 = [v15 entity];
  id v58 = [v59 relationshipsByName];
  int v16 = [v58 objectForKeyedSubscript:@"personsFromPhotos_"];
  id v57 = [(MKFCKUser *)self entity];
  v56 = [v57 relationshipsByName];
  v17 = [v56 objectForKeyedSubscript:@"personsFromPhotos"];
  id v18 = v15;
  id v19 = v16;
  id v20 = v17;
  id v21 = v14;
  __int16 v55 = v19;
  id v22 = [v19 name];
  int v23 = [v18 valueForKey:v22];

  int v24 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __98__MKFCKHomeObject__importRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke;
  v64[3] = &unk_264A26938;
  id v25 = v24;
  id v65 = v25;
  objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v64);

  uint64_t v60 = 0;
  __int16 v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 1;
  id v26 = [v20 name];
  id v27 = [(MKFCKUser *)self valueForKey:v26];

  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __98__MKFCKHomeObject__importRelationshipsIntoLocalModel_localRelationship_cloudRelationship_context___block_invoke_2;
  v67 = &unk_264A19CE0;
  id v28 = v21;
  id v68 = v28;
  v69 = self;
  id v29 = v25;
  id v70 = v29;
  v71 = &v60;
  objc_msgSend(v27, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
  int v30 = *((unsigned __int8 *)v61 + 24);
  if (*((unsigned char *)v61 + 24))
  {
    int v31 = [(MKFCKUser *)self home];
    [v31 _maybeDeleteStaleLocalModels:v29 context:v28];
  }
  _Block_object_dispose(&v60, 8);

  if (!v30)
  {
LABEL_18:
    BOOL v10 = 0;
    goto LABEL_19;
  }
  id v32 = v18;
  id v33 = v28;
  v34 = [(MKFCKUser *)self homeAccessCode];
  BOOL v35 = [v34 length] == 0;

  id v36 = [v32 accessCode];
  uint32_t v37 = v36;
  if (v35)
  {

    if (v37)
    {
      int v49 = (void *)MEMORY[0x230FBD990]();
      v50 = self;
      v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = HMFGetLogIdentifier();
        __int16 v53 = [v32 accessCode];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2112;
        v67 = v32;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Deleting the MKFUserAccessCode %@ for User %@", buf, 0x20u);
      }
      uint64_t v54 = [v32 accessCode];
      [v33 deleteObject:v54];
    }
  }
  else
  {
    if (!v36)
    {
      uint32_t v37 = [[_MKFUserAccessCode alloc] initWithContext:v33];
      int v38 = [(MKFCKUser *)self modelID];
      int v39 = +[HMDUserAccessCodeModel modelUUIDWithUUID:v38];
      [(_MKFUserAccessCode *)v37 setModelID:v39];
    }
    BOOL v40 = [(_MKFUserAccessCode *)v37 accessCode];
    v41 = [(MKFCKUser *)self homeAccessCode];
    char v42 = HMFEqualObjects();

    if ((v42 & 1) == 0)
    {
      v43 = [(MKFCKUser *)self homeAccessCode];
      [(_MKFUserAccessCode *)v37 setAccessCode:v43];
    }
    BOOL v44 = [(_MKFUserAccessCode *)v37 user];
    char v45 = HMFEqualObjects();

    if ((v45 & 1) == 0) {
      [(_MKFUserAccessCode *)v37 setUser:v32];
    }
    long long v46 = [v32 accessCode];
    char v47 = HMFEqualObjects();

    if ((v47 & 1) == 0) {
      [v32 setAccessCode:v37];
    }
  }
  BOOL v10 = -[MKFCKUser _importOutgoingInvitationRelationshipIntoLocalModel:context:](self, v32, v33);
LABEL_19:

  return v10;
}

- (BOOL)_importOutgoingInvitationRelationshipIntoLocalModel:(void *)a3 context:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [a1 invitation];
    if (v7)
    {
      id v8 = [a1 invitation];
      BOOL v9 = [v8 fetchLocalModelWithContext:v6];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = 0;
      }
      id v11 = v10;

      if (v11)
      {
        id v12 = [v5 invitation];

        if (v12 != v11) {
          [v5 setInvitation:v11];
        }
      }
      else
      {
        uint64_t v13 = (void *)MEMORY[0x230FBD990]();
        id v14 = a1;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v16 = HMFGetLogIdentifier();
          int v18 = 138543874;
          id v19 = v16;
          __int16 v20 = 2112;
          id v21 = v14;
          __int16 v22 = 2112;
          uint64_t v23 = 0;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship between pending user and outgoing invitation yet: %@.invitation = %@", (uint8_t *)&v18, 0x20u);
        }
      }
    }
  }

  return a1 != 0;
}

- (BOOL)isOwner
{
  v2 = [(MKFCKUser *)self ownedHome];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKUser"];
}

@end
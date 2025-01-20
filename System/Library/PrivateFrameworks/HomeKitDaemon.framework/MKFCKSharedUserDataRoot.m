@interface MKFCKSharedUserDataRoot
+ (BOOL)_importInsertOrUpdateWithObjectID:(id)a3 context:(id)a4;
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (id)createWithHomeModelID:(id)a3 persistentStore:(id)a4 context:(id)a5;
+ (id)entityDescriptionFromContext:(id)a3;
+ (id)fetchRequest;
+ (id)rootKeyPath;
- (BOOL)_importSharedUserProfileMetadataIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importSharedUserSettingsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)importAccessorySettingsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)importIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)importIntoLocalModelWithContext:(id)a3;
- (BOOL)importPersonsIntoLocalModel:(id)a3 context:(id)a4;
- (id)fetchEquivalentModels:(id *)a3;
@end

@implementation MKFCKSharedUserDataRoot

- (BOOL)_importSharedUserProfileMetadataIntoLocalModel:(id)a3 context:(id)a4
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = [(MKFCKSharedUserDataRoot *)self iCloudAltDSID];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = [(MKFCKSharedUserDataRoot *)self iCloudAltDSID];
      v9 = [v5 iCloudAltDSID];
      char v10 = [v8 isEqual:v9];

      if ((v10 & 1) == 0)
      {
        v11 = [(MKFCKSharedUserDataRoot *)self iCloudAltDSID];
        [v5 setICloudAltDSID:v11];
      }
    }
    uint64_t v12 = [(MKFCKSharedUserDataRoot *)self firstName];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [(MKFCKSharedUserDataRoot *)self firstName];
      v15 = [v5 firstName];
      char v16 = [v14 isEqual:v15];

      if ((v16 & 1) == 0)
      {
        v17 = [(MKFCKSharedUserDataRoot *)self firstName];
        [v5 setFirstName:v17];
      }
    }
    uint64_t v18 = [(MKFCKSharedUserDataRoot *)self lastName];
    if (v18)
    {
      v19 = (void *)v18;
      v20 = [(MKFCKSharedUserDataRoot *)self lastName];
      v21 = [v5 lastName];
      char v22 = [v20 isEqual:v21];

      if ((v22 & 1) == 0)
      {
        v23 = [(MKFCKSharedUserDataRoot *)self lastName];
        [v5 setLastName:v23];
      }
    }
  }

  return 1;
}

- (BOOL)_importSharedUserSettingsIntoLocalModel:(id)a3 context:(id)a4
{
  id v5 = NSNumber;
  id v6 = a3;
  v7 = objc_msgSend(v5, "numberWithBool:", -[MKFCKSharedUserDataRoot allowExplicitContent](self, "allowExplicitContent"));
  [v6 setAllowExplicitContent:v7];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKSharedUserDataRoot allowiTunesAccount](self, "allowiTunesAccount"));
  [v6 setAllowiTunesAccount:v8];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKSharedUserDataRoot dolbyAtmosEnabled](self, "dolbyAtmosEnabled"));
  [v6 setDolbyAtmosEnabled:v9];

  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKSharedUserDataRoot losslessMusicEnabled](self, "losslessMusicEnabled"));
  [v6 setLosslessMusicEnabled:v10];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKSharedUserDataRoot playbackInfluencesEnabled](self, "playbackInfluencesEnabled"));
  [v6 setPlaybackInfluencesEnabled:v11];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKSharedUserDataRoot siriIdentifyVoiceEnabled](self, "siriIdentifyVoiceEnabled"));
  [v6 setSiriIdentifyVoiceEnabled:v12];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKSharedUserDataRoot activityNotificationsEnabledForPersonalRequests](self, "activityNotificationsEnabledForPersonalRequests"));
  [v6 setActivityNotificationsEnabledForPersonalRequests:v13];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKSharedUserDataRoot sharePhotosFaceClassifications](self, "sharePhotosFaceClassifications"));
  [v6 setSharePhotosFaceClassifications:v14];

  v15 = [(MKFCKSharedUserDataRoot *)self photosPersonDataZoneUUID];
  [v6 setPhotosPersonDataZoneUUID:v15];

  char v16 = [(MKFCKSharedUserDataRoot *)self matCredIPKExternalRepresentation];
  [v6 setMatCredIPKExternalRepresentation:v16];

  return 1;
}

- (BOOL)importIntoLocalModel:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MKFCKSharedUserDataRoot *)self _importSharedUserSettingsIntoLocalModel:v6 context:v7]&& [(MKFCKSharedUserDataRoot *)self _importSharedUserProfileMetadataIntoLocalModel:v6 context:v7]&& [(MKFCKSharedUserDataRoot *)self importPersonsIntoLocalModel:v6 context:v7]&& [(MKFCKSharedUserDataRoot *)self importAccessorySettingsIntoLocalModel:v6 context:v7];

  return v8;
}

- (BOOL)importIntoLocalModelWithContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MKFCKSharedUserData *)self workingStoreHomeMember];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 castIfMemberIsGuest];

    if (!v7)
    {
      v17 = [v6 castIfMemberIsUser];
      BOOL v16 = [(MKFCKSharedUserDataRoot *)self importIntoLocalModel:v17 context:v4];

      goto LABEL_11;
    }
    BOOL v8 = [v6 castIfMemberIsGuest];
    if (v8)
    {
      v9 = [(MKFCKSharedUserDataRoot *)self matCredIPKExternalRepresentation];
      [v8 setMatCredIPKExternalRepresentation:v9];
    }
  }
  else
  {
    char v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [(MKFCKSharedUserDataRoot *)v11 objectID];
      v15 = objc_msgSend(v14, "hmd_debugIdentifier");
      int v19 = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      char v22 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to resolve working store user for shared settings import of %@, skipping import", (uint8_t *)&v19, 0x16u);
    }
  }
  LOBYTE(v16) = 1;
LABEL_11:

  return v16;
}

- (id)fetchEquivalentModels:(id *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)MKFCKSharedUserDataRoot;
  id v5 = -[MKFCKModel fetchEquivalentModels:](&v18, sel_fetchEquivalentModels_);
  if (v5)
  {
    id v6 = [(MKFCKSharedUserDataRoot *)self managedObjectContext];
    id v7 = objc_msgSend(v6, "hmd_coreData");
    BOOL v8 = [v7 container];

    v9 = [v5 valueForKey:@"objectID"];
    char v10 = [v8 fetchSharesMatchingObjectIDs:v9 error:a3];
    if (v10)
    {
      v11 = [(MKFCKSharedUserDataRoot *)self objectID];
      uint64_t v12 = [v10 objectForKeyedSubscript:v11];

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __49__MKFCKSharedUserDataRoot_fetchEquivalentModels___block_invoke;
      v16[3] = &unk_264A1A958;
      v16[4] = v10;
      id v17 = v12;
      id v13 = v12;
      v14 = objc_msgSend(v5, "hmf_objectsPassingTest:", v16);
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __49__MKFCKSharedUserDataRoot_fetchEquivalentModels___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 objectID];
  id v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = HMFEqualObjects();

  return v5;
}

+ (id)entityDescriptionFromContext:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF240];
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [v3 entityForName:v6 inManagedObjectContext:v4];

  return v7;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  return 1;
}

+ (BOOL)_importInsertOrUpdateWithObjectID:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v6, "hmd_cloudPrivateStoreIdentifier");
  BOOL v8 = [v5 persistentStore];
  v9 = [v8 identifier];
  char v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    char v11 = 1;
  }
  else
  {
    uint64_t v12 = +[MKFCKModel modelWithObjectID:v5 context:v6 error:0];
    char v11 = [v12 importIntoLocalModelWithContext:v6];
  }
  return v11;
}

+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return objc_msgSend(a1, "_importInsertOrUpdateWithObjectID:context:", a3, a6, a5);
}

+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  return [a1 _importInsertOrUpdateWithObjectID:a3 context:a5];
}

+ (id)createWithHomeModelID:(id)a3 persistentStore:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = (void *)[objc_alloc((Class)a1) initWithContext:v8];
  [v8 assignObject:v11 toPersistentStore:v9];

  [v11 setModelID:v10];
  [v11 setHomeModelID:v10];

  return v11;
}

+ (id)rootKeyPath
{
  return 0;
}

- (BOOL)importPersonsIntoLocalModel:(id)a3 context:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v34 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [(MKFCKSharedUserDataRoot *)self personsFromPhotos];
  id v9 = objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v8, "count"));

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(MKFCKSharedUserDataRoot *)self personsFromPhotos];
  uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        v14 = v9;
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        BOOL v16 = objc_msgSend(v15, "modelID", v34);
        id v17 = +[_MKFModel modelWithModelID:v16 context:v6];

        if (!v17)
        {
          id v17 = [[_MKFPhotosPerson alloc] initWithContext:v6];
          objc_super v18 = [v15 modelID];
          [(_MKFPhotosPerson *)v17 setModelID:v18];

          int v19 = [v15 writerTimestamp];
          [(_MKFPhotosPerson *)v17 setWriterTimestamp:v19];

          [(_MKFPhotosPerson *)v17 setUser:v34];
        }
        v20 = [(_MKFPhotosPerson *)v17 name];
        __int16 v21 = [v15 name];
        char v22 = HMFEqualObjects();

        if ((v22 & 1) == 0)
        {
          uint64_t v23 = [v15 name];
          [(_MKFPhotosPerson *)v17 setName:v23];
        }
        v24 = [(_MKFPhotosPerson *)v17 photoLibraryPersonUUID];
        v25 = [v15 photoLibraryPersonUUID];
        char v26 = HMFEqualObjects();

        if ((v26 & 1) == 0)
        {
          v27 = [v15 photoLibraryPersonUUID];
          [(_MKFPhotosPerson *)v17 setPhotoLibraryPersonUUID:v27];
        }
        id v9 = v14;
        [v14 addObject:v17];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v11);
  }

  v28 = [v34 personsFromPhotos];
  char v29 = [v28 isEqualToSet:v9];

  if ((v29 & 1) == 0)
  {
    v30 = [v34 personsFromPhotos];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __72__MKFCKSharedUserDataRoot_Persons__importPersonsIntoLocalModel_context___block_invoke;
    v36[3] = &unk_264A23008;
    id v31 = v9;
    id v37 = v31;
    id v38 = v6;
    objc_msgSend(v30, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);

    v32 = (void *)[v31 copy];
    objc_msgSend(v34, "setPersonsFromPhotos_:", v32);
  }
  return 1;
}

void __72__MKFCKSharedUserDataRoot_Persons__importPersonsIntoLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) deleteObject:v3];
  }
}

- (BOOL)importAccessorySettingsIntoLocalModel:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [(MKFCKSharedUserDataRoot *)self accessorySettings];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![*(id *)(*((void *)&v15 + 1) + 8 * i) importIntoLocalUserModel:v6 context:v7])
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKSharedUserDataRoot"];
}

@end
@interface MKFCKHome
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (id)__accessCodeFromDictionaryForUnitTest:(id)a3;
+ (id)__dictionaryFromGuestAccessCodeDictionaryForUnitTest:(id)a3 tombStonedPinCodes:(int)a4;
+ (id)__dictionaryFromGuestAccessCodeForUnitTest:(id)a3 label:(id)a4 userUniqueIDForAccessories:(id)a5;
+ (id)__dictionaryFromHMRemovedUserInfoForUnitTest:(id)a3;
+ (id)__dictionaryFromRemovedUserAccessCodeDictionaryForUnitTest:(id)a3 tombStonedPinCodes:(int)a4;
+ (id)__labelFromDictionaryForUnitTest:(id)a3;
+ (id)__removedUserInfoDictionaryForUnitTest:(id)a3;
+ (id)__removedUserInfoFromDictionaryForUnitTest:(id)a3;
+ (id)__userUniqueIDForAccessoriesFromDictionaryForUnitTest:(id)a3;
+ (id)_balanceFakeHAPAccessoriesForHome:(id)a3 context:(id)a4;
+ (id)_balanceFakeMediaAccessoriesForHome:(id)a3 context:(id)a4;
+ (id)_balanceFakeRoomsForHome:(id)a3 context:(id)a4;
+ (id)_balanceFakeScenesForHome:(id)a3 context:(id)a4;
+ (id)_balanceFakeTriggersForHome:(id)a3 context:(id)a4;
+ (id)_balanceFakeUsersForHome:(id)a3 context:(id)a4;
+ (id)_balanceFakeZonesForHome:(id)a3 context:(id)a4;
+ (id)_createFakeHomeInPersistentStore:(id)a3 context:(id)a4;
+ (id)_createHomeManagerContextFromContext:(id)a3;
+ (id)_encodeNetworkProtectionGroupModelID:(id)a3 manufacturer:(id)a4 category:(id)a5 targetProtectionMode:(id)a6;
+ (id)_encodeRemovedUserInfoWithUserID:(id)a3 removedUserModelID:(id)a4 userName:(id)a5 dateRemoved:(id)a6;
+ (id)_homeManagerContextFromContext:(id)a3;
+ (id)_homeManagerHomeWithModelID:(id)a3 homeManager:(id)a4 context:(id)a5;
+ (id)createWithLocalModel:(id)a3 context:(id)a4;
+ (id)createWithModelID:(id)a3 persistentStore:(id)a4 context:(id)a5;
+ (id)fetchRequest;
+ (id)rootKeyPath;
+ (unint64_t)cloudStoreTypes;
+ (void)_maybeCreateFakeHomes:(id)a3 context:(id)a4;
+ (void)_maybeDeleteFakeHomes:(id)a3 context:(id)a4;
+ (void)_rebalanceFakeHomesWithContext:(id)a3;
+ (void)_setCommonPropertiesOnAccessory:(id)a3;
+ (void)_setPropertiesOnUser:(id)a3 isOwner:(BOOL)a4;
- (BOOL)_exportAccessoriesFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportApplicationDataFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportGuestAccessCodesFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportGuestsFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportHomeManagerWithContext:(id)a3;
- (BOOL)_exportInvitationOutgoingFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportMatterKeyValueStoreFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportNetworkProtectionGroupsFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportPersonsFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportPinCodesFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportRelationshipsFromLocalHome:(id)a3 localRelationship:(id)a4 cloudRelationship:(id)a5 context:(id)a6;
- (BOOL)_exportRelationshipsFromLocalHome:(id)a3 localRelationshipName:(id)a4 context:(id)a5;
- (BOOL)_exportRelationshipsFromLocalModel:(id)a3 localRelationship:(id)a4 cloudRelationship:(id)a5 cloudModels:(id)a6 context:(id)a7;
- (BOOL)_exportRemovedUserAccessCodesFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportResidentsFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportRoomsFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportScenesFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportServiceGroupsFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportSettingsFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportTriggersFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportUsersFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportZonesFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importAccessoriesIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importApplicationDataIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importGuestAccessCodesIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importGuestsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importHomeManagerNewHome:(BOOL)a3 newPrimaryHome:(id)a4 newApplicationData:(id)a5 context:(id)a6;
- (BOOL)_importHomeManagerWithContext:(id)a3;
- (BOOL)_importIntoLocalHomeModel:(void *)a3 cloudModels:(void *)a4 localModelsByModelID:(void *)a5 processedCloudModels:(void *)a6 context:;
- (BOOL)_importInvitationOutgoingIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importMatterKeyValueStoreIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importNetworkProtectionGroupsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importPersonsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importPinCodesIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importRelationshipsIntoLocalModel:(id)a3 localRelationshipName:(id)a4 context:(id)a5;
- (BOOL)_importRemovedUserAccessCodesIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importResidentsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importRoomsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importScenesIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importServiceGroupsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importSettingsIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importTriggersIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importUsersIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importZonesIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)validateOwner:(id *)a3 error:(id *)a4;
- (id)_populateGuestAccessCodeWithDictionary:(id)a3 hh2ModelID:(id)a4 home:(id)a5 groupsByModelID:(id)a6 context:(id)a7;
- (id)_populateRemovedUserAccessCodeFromDictionary:(id)a3 withAccessCode:(id)a4 hh2ModelID:(id)a5 home:(id)a6 groupsByModelID:(id)a7 context:(id)a8;
- (int64_t)ensureCanonicalModel;
- (uint64_t)_importIntoLocalModel:(void *)a3 updatedProperties:(void *)a4 context:;
- (uint64_t)_importWithContext:(void *)a3 updatedProperties:;
- (void)_exportFromLocalModel:(void *)a3 updatedProperties:(void *)a4 context:;
- (void)_maybeDeleteStaleLocalModels:(id)a3 context:(id)a4;
- (void)_maybeDeleteStaleLocalModels:(id)a3 modelIDKey:(id)a4 context:(id)a5;
- (void)_settingModelsForHome:(void *)a3 media:(void *)a4 networkRouter:(void *)a5 personManager:(void *)a6 softwareUpdate:;
- (void)awakeFromInsert;
@end

@implementation MKFCKHome

- (BOOL)_exportHomeManagerWithContext:(id)a3
{
  v47[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v40 = 0;
  v5 = +[_MKFHomeManager fetchWithContext:v4 error:&v40];
  id v6 = v40;
  if (v5)
  {
    v7 = [(id)objc_opt_class() fetchRequest];
    [v7 setFetchBatchSize:10];
    v47[0] = @"primaryHomeCounter";
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:1];
    v9 = +[MKFCKModel appendDefaultPreloadedPropertiesTo:v8];
    [v7 setPropertiesToFetch:v9];

    id v39 = v6;
    v10 = [v4 executeFetchRequest:v7 error:&v39];
    id v11 = v39;

    BOOL v12 = v10 != 0;
    if (!v10)
    {
      v25 = (void *)MEMORY[0x230FBD990]();
      v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v42 = v28;
        __int16 v43 = 2114;
        uint64_t v44 = (uint64_t)v11;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch homes: %{public}@", buf, 0x16u);
      }
      goto LABEL_19;
    }
    id v38 = v11;
    v13 = [v5 primaryHome];
    v14 = [v13 handle];
    v15 = [v14 homeUUID];
    v16 = +[HMDCoreDataCloudTransformHomeManager fixUpPrimaryHomeCounterForPrimaryHome:v10 primaryHomeModelID:v15];

    if (v16)
    {
      id v11 = v38;
      if (![(MKFCKHome *)self isEqual:v16])
      {
LABEL_18:

LABEL_19:
        id v6 = v11;
        goto LABEL_20;
      }
      v17 = [v5 appDataDictionary];
      v18 = [(MKFCKHome *)self homeManagerApplicationData];
      char v19 = isEqualDeepCompare(v17, v18);

      if ((v19 & 1) == 0)
      {
        v20 = (void *)[v17 copy];
        [(MKFCKHome *)self setHomeManagerApplicationData:v20];
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x230FBD990]();
      v30 = self;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier();
        v36 = [v5 primaryHome];
        v35 = [v36 handle];
        [v35 homeUUID];
        v33 = v37 = v29;
        *(_DWORD *)buf = 138543874;
        v42 = v32;
        __int16 v43 = 2160;
        uint64_t v44 = 1752392040;
        __int16 v45 = 2112;
        v46 = v33;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@No primary home yet: %{mask.hash}@", buf, 0x20u);

        v29 = v37;
      }
    }
    id v11 = v38;
    goto LABEL_18;
  }
  v21 = (void *)MEMORY[0x230FBD990]();
  v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v42 = v24;
    __int16 v43 = 2114;
    uint64_t v44 = (uint64_t)v6;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);
  }
  BOOL v12 = 0;
LABEL_20:

  return v12;
}

- (BOOL)_importHomeManagerWithContext:(id)a3
{
  v77[2] = *MEMORY[0x263EF8340];
  uint64_t v70 = 0;
  id v53 = a3;
  id v4 = +[_MKFHomeManager fetchWithContext:error:](_MKFHomeManager, "fetchWithContext:error:");
  id v5 = 0;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x263EFF9C0];
    v7 = [v4 homes];
    v8 = objc_msgSend(v6, "setWithCapacity:", objc_msgSend(v7, "count") + 1);

    v9 = [v4 homes];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke;
    v68[3] = &unk_264A29B78;
    id v10 = v8;
    id v69 = v10;
    objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v68);

    id v11 = [(MKFCKHome *)self modelID];
    char v51 = [v10 containsObject:v11];

    if ((v51 & 1) == 0)
    {
      BOOL v12 = [(MKFCKHome *)self modelID];
      [v10 addObject:v12];

      v13 = (void *)MEMORY[0x230FBD990]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Detected new home manager home", buf, 0xCu);
      }
    }
    v17 = +[MKFCKHome fetchRequest];
    v18 = +[MKFCKModel predicateWithModelIDs:v10];
    [v17 setPredicate:v18];

    [v17 setFetchBatchSize:10];
    v77[0] = @"primaryHomeCounter";
    v77[1] = @"homeManagerApplicationData";
    char v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
    v20 = +[MKFCKModel appendDefaultPreloadedPropertiesTo:v19];
    [v17 setPropertiesToFetch:v20];

    id v67 = v5;
    v21 = [v53 executeFetchRequest:v17 error:&v67];
    id v50 = v67;

    BOOL v52 = v21 != 0;
    if (v21)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v74 = __Block_byref_object_copy_;
      v75 = __Block_byref_object_dispose_;
      id v76 = 0;
      uint64_t v61 = 0;
      v62 = &v61;
      uint64_t v63 = 0x3032000000;
      v64 = __Block_byref_object_copy_;
      v65 = __Block_byref_object_dispose_;
      id v66 = 0;
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x2020000000;
      v60[3] = 0;
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke_13;
      v59[3] = &unk_264A14638;
      v59[4] = buf;
      v59[5] = v60;
      v59[6] = &v61;
      objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v59);
      v22 = [v4 primaryHome];
      v23 = [v22 handle];
      v24 = [v23 homeUUID];
      char v25 = [v24 isEqual:*(void *)(*(void *)&buf[8] + 40)];

      if (v25)
      {
        id v26 = 0;
      }
      else
      {
        id v26 = *(id *)(*(void *)&buf[8] + 40);
        v35 = (void *)MEMORY[0x230FBD990]();
        v36 = self;
        HMFGetOSLogHandle();
        v37 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          id v38 = HMFGetLogIdentifier();
          *(_DWORD *)v71 = 138543362;
          v72 = v38;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEBUG, "%{public}@Detected new primary home", v71, 0xCu);
        }
      }
      id v39 = (void *)v62[5];
      id v40 = [v4 appDataDictionary];
      LOBYTE(v39) = isEqualDeepCompare(v39, v40);

      if (v39)
      {
        id v41 = 0;
      }
      else
      {
        id v41 = (id)v62[5];
        context = (void *)MEMORY[0x230FBD990]();
        v42 = self;
        HMFGetOSLogHandle();
        __int16 v43 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v44 = HMFGetLogIdentifier();
          *(_DWORD *)v71 = 138543362;
          v72 = v44;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_DEBUG, "%{public}@Detected new home manager application data", v71, 0xCu);
        }
      }
      if (v26) {
        char v45 = 1;
      }
      else {
        char v45 = v51 ^ 1;
      }
      if ((v45 & 1) != 0 || v41)
      {
        v46 = [(id)objc_opt_class() _homeManagerContextFromContext:v53];
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke_15;
        v54[3] = &unk_264A25E10;
        v54[4] = self;
        char v58 = v51 ^ 1;
        id v55 = v26;
        id v56 = v41;
        id v47 = v46;
        id v57 = v47;
        [v47 performBlockAndWait:v54];
      }
      _Block_object_dispose(v60, 8);
      _Block_object_dispose(&v61, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v31 = (void *)MEMORY[0x230FBD990]();
      v32 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v50;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch homes: %{public}@", buf, 0x16u);
      }
    }

    id v5 = v50;
  }
  else
  {
    v27 = (void *)MEMORY[0x230FBD990]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);
    }
    BOOL v52 = 0;
  }

  return v52;
}

void __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 handle];
  v3 = [v4 homeUUID];
  [v2 addObject:v3];
}

void __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke_13(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 isFake] & 1) == 0)
  {
    if (!*(void *)(*(void *)(a1[4] + 8) + 40)) {
      goto LABEL_6;
    }
    uint64_t v4 = [v3 primaryHomeCounter];
    uint64_t v5 = *(void *)(*(void *)(a1[5] + 8) + 24);
    if (v4 >= v5)
    {
      if (v4 != v5) {
        goto LABEL_6;
      }
      *(void *)uu1 = 0;
      uint64_t v16 = 0;
      [*(id *)(*(void *)(a1[4] + 8) + 40) getUUIDBytes:uu1];
      *(void *)uu2 = 0;
      uint64_t v14 = 0;
      id v6 = [v3 modelID];
      [v6 getUUIDBytes:uu2];

      if ((uuid_compare(uu1, uu2) & 0x80000000) == 0)
      {
LABEL_6:
        uint64_t v7 = [v3 modelID];
        uint64_t v8 = *(void *)(a1[4] + 8);
        v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        uint64_t v10 = [v3 homeManagerApplicationData];
        uint64_t v11 = *(void *)(a1[6] + 8);
        BOOL v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        *(void *)(*(void *)(a1[5] + 8) + 24) = [v3 primaryHomeCounter];
      }
    }
  }
}

uint64_t __56__MKFCKHome_HomeManager___importHomeManagerWithContext___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) _importHomeManagerNewHome:*(unsigned __int8 *)(a1 + 64) newPrimaryHome:*(void *)(a1 + 40) newApplicationData:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
}

- (BOOL)_importHomeManagerNewHome:(BOOL)a3 newPrimaryHome:(id)a4 newApplicationData:(id)a5 context:(id)a6
{
  BOOL v8 = a3;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v43 = a4;
  id v10 = a5;
  id v11 = a6;
  id v47 = 0;
  BOOL v12 = +[_MKFHomeManager fetchWithContext:v11 error:&v47];
  id v42 = v47;
  if (!v12)
  {
    v35 = (void *)MEMORY[0x230FBD990]();
    id v39 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v40;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);
    }
    goto LABEL_20;
  }
  if (v8)
  {
    v13 = objc_opt_class();
    uint64_t v14 = [(MKFCKHome *)self modelID];
    v15 = [v13 _homeManagerHomeWithModelID:v14 homeManager:v12 context:v11];

    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      char v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during import: %@", buf, 0x16u);
    }
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = v17;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [v15 debugDescription];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
    }
  }
  if (v43)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v55 = __Block_byref_object_copy_;
    id v56 = __Block_byref_object_dispose_;
    id v57 = 0;
    uint64_t v25 = [v12 homes];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __94__MKFCKHome_HomeManager___importHomeManagerNewHome_newPrimaryHome_newApplicationData_context___block_invoke;
    v44[3] = &unk_264A217B0;
    id v45 = v43;
    v46 = buf;
    objc_msgSend((id)v25, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v44);

    id v26 = [v12 primaryHome];
    LOBYTE(v25) = [v26 isEqual:*(void *)(*(void *)&buf[8] + 40)];

    if ((v25 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x230FBD990]([v12 setPrimaryHome:*(void *)(*(void *)&buf[8] + 40)]);
      v28 = self;
      HMFGetOSLogHandle();
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        v31 = [*(id *)(*(void *)&buf[8] + 40) handle];
        v32 = [v31 homeUUID];
        *(_DWORD *)v48 = 138543874;
        id v49 = v30;
        __int16 v50 = 2160;
        uint64_t v51 = 1752392040;
        __int16 v52 = 2112;
        id v53 = v32;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Setting new primary home with modelID %{mask.hash}@", v48, 0x20u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  if (v10)
  {
    v33 = [v12 appDataDictionary];
    char v34 = isEqualDeepCompare(v33, v10);

    if ((v34 & 1) == 0)
    {
      v35 = (void *)MEMORY[0x230FBD990]([v12 setAppDataDictionary:v10]);
      v36 = self;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        id v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Setting new home manager application data: %@", buf, 0x16u);
      }
LABEL_20:
    }
  }

  return v12 != 0;
}

void __94__MKFCKHome_HomeManager___importHomeManagerNewHome_newPrimaryHome_newApplicationData_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v6 = [v9 handle];
  uint64_t v7 = [v6 homeUUID];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

+ (id)_createHomeManagerContextFromContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmd_coreData");
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)[v5 newManagedObjectContext];
    [v7 setName:@"HomeManager"];
    int v8 = [MEMORY[0x263EFF340] currentQueryGenerationToken];
    id v21 = 0;
    char v9 = [v4 setQueryGenerationFromToken:v8 error:&v21];
    id v10 = v21;

    if (v9)
    {
      id v11 = v7;
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = a1;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        char v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v23 = v19;
        __int16 v24 = 2114;
        id v25 = v10;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to pin home manager context to current query generation: %{public}@", buf, 0x16u);
      }
      id v11 = 0;
    }
  }
  else
  {
    BOOL v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = a1;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@HMDCoreData is no longer alive", buf, 0xCu);
    }
    id v11 = 0;
  }

  return v11;
}

+ (id)_homeManagerContextFromContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmd_homeManagerContext");
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = HMFGetLogIdentifier();
      int v16 = 138543362;
      id v17 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Found existing home manager context", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    id v6 = [(id)objc_opt_class() _createHomeManagerContextFromContext:v4];
    if (v6)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = a1;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v16 = 138543362;
        id v17 = v14;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Created home manager context", (uint8_t *)&v16, 0xCu);
      }
      objc_msgSend(v4, "setHmd_homeManagerContext:", v6);
    }
  }

  return v6;
}

+ (id)_homeManagerHomeWithModelID:(id)a3 homeManager:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[_MKFHomeManagerHome alloc] initWithContext:v7];

  id v11 = +[HMDHomeManagerHomeModel deriveUUIDFromHomeUUID:v9];
  [(_MKFHomeManagerHome *)v10 setModelID:v11];

  id v12 = [HMDHomeManagerHomeHandle alloc];
  id v13 = [MEMORY[0x263F08C38] UUID];
  uint64_t v14 = [(HMDHomeManagerHomeHandle *)v12 initWithBackingStoreUUID:v13 homeUUID:v9];

  [(_MKFHomeManagerHome *)v10 setHandle:v14];
  [(_MKFHomeManagerHome *)v10 setHomeManager:v8];
  objc_msgSend(v8, "addHomes_Object:", v10);

  return v10;
}

- (BOOL)_exportPersonsFromLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _exportRelationshipsFromLocalHome:a3 localRelationshipName:@"persons_" context:a4];
}

- (BOOL)_importPersonsIntoLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _importRelationshipsIntoLocalModel:a3 localRelationshipName:@"persons_" context:a4];
}

- (BOOL)_exportUsersFromLocalModel:(id)a3 context:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(MKFCKHome *)self _exportRelationshipsFromLocalHome:v6 localRelationshipName:@"users_" context:v7])
  {
    id v8 = v6;
    id v9 = v7;
    BOOL v10 = self != 0;
    if (self)
    {
      id v11 = [v8 owner];
      id v12 = [(MKFCKHome *)self owner];

      if (!v12)
      {
        BOOL v44 = self != 0;
        id v45 = v7;
        id v46 = v6;
        id v41 = v11;
        uint64_t v13 = +[MKFCKModel fetchWithLocalModel:v11 context:v9];
        uint64_t v14 = (void *)MEMORY[0x230FBD990]();
        v15 = self;
        int v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v58 = v17;
          __int16 v59 = 2112;
          uint64_t v60 = v13;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Setting owner during export: %@", buf, 0x16u);
        }
        id v40 = (void *)v13;
        [(MKFCKHome *)v15 setOwner:v13];
        id v43 = v8;
        id v18 = v8;
        id v42 = v9;
        id v19 = v9;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v39 = v18;
        v20 = [v18 accessories];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v49 objects:buf count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          v23 = v15;
          uint64_t v24 = *(void *)v50;
          id v25 = HMDCoreDataCloudTransformMergePolicy;
          id v47 = v19;
          do
          {
            uint64_t v26 = 0;
            uint64_t v48 = v22;
            do
            {
              if (*(void *)v50 != v24) {
                objc_enumerationMutation(v20);
              }
              v27 = *(void **)(*((void *)&v49 + 1) + 8 * v26);
              v28 = [&v25[94] fetchWithLocalModel:v27 context:v19];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v29 = v28;
              }
              else {
                v29 = 0;
              }
              id v30 = v29;

              if (v30)
              {
                -[MKFCKAccessory _exportOwnerSettingsFromLocalModel:context:](v30, v27, v19);
              }
              else
              {
                v31 = (void *)MEMORY[0x230FBD990]();
                v32 = v23;
                v33 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  uint64_t v34 = v24;
                  v35 = v20;
                  v37 = v36 = v23;
                  *(_DWORD *)id v53 = 138543618;
                  v54 = v37;
                  __int16 v55 = 2112;
                  id v56 = v27;
                  _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to find cloud model for accessory: %@", v53, 0x16u);

                  v23 = v36;
                  v20 = v35;
                  uint64_t v24 = v34;
                  id v19 = v47;
                }

                id v25 = HMDCoreDataCloudTransformMergePolicy;
                uint64_t v22 = v48;
              }

              ++v26;
            }
            while (v22 != v26);
            uint64_t v22 = [v20 countByEnumeratingWithState:&v49 objects:buf count:16];
          }
          while (v22);
        }

        id v7 = v45;
        id v6 = v46;
        BOOL v10 = v44;
        id v9 = v42;
        id v8 = v43;
        id v11 = v41;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_importUsersIntoLocalModel:(id)a3 context:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(MKFCKHome *)self _importRelationshipsIntoLocalModel:v6 localRelationshipName:@"users_" context:v7])
  {
    id v8 = v6;
    id v9 = v7;
    if (self)
    {
      BOOL v10 = [(MKFCKHome *)self owner];
      id v11 = v10;
      BOOL v12 = v10 != 0;
      if (v10)
      {
        id v47 = self;
        id v46 = [v10 fetchLocalModelWithContext:v9];
        uint64_t v13 = [v8 owner];

        if (!v13)
        {
          uint64_t v14 = (void *)MEMORY[0x230FBD990]();
          v15 = self;
          int v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            id v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v59 = v17;
            __int16 v60 = 2112;
            id v61 = v46;
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Setting owner during import: %@", buf, 0x16u);
          }
          [v8 setOwner:v46];
        }
        id v40 = v11;
        id v41 = v9;
        id v42 = v8;
        BOOL v43 = v12;
        id v44 = v7;
        id v45 = v6;
        id v18 = v9;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v19 = v47;
        id obj = [(MKFCKHome *)v47 accessories];
        uint64_t v20 = [obj countByEnumeratingWithState:&v50 objects:buf count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v51;
          p_cache = MKFCKOutgoingInvitation.cache;
          id v48 = v18;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v51 != v22) {
                objc_enumerationMutation(obj);
              }
              id v25 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              uint64_t v26 = [v25 fetchLocalModelWithContext:v18];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v27 = v26;
              }
              else {
                v27 = 0;
              }
              id v28 = v27;

              if (v28)
              {
                -[MKFCKAccessory _importOwnerSettingsIntoLocalModel:context:](v25, v28, v18);
              }
              else
              {
                uint64_t v29 = v22;
                id v30 = p_cache;
                v31 = (void *)MEMORY[0x230FBD990]();
                v32 = v19;
                v33 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v34 = HMFGetLogIdentifier();
                  *(_DWORD *)v54 = 138543618;
                  __int16 v55 = v34;
                  __int16 v56 = 2112;
                  id v57 = v25;
                  _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local model for accessory: %@", v54, 0x16u);

                  id v19 = v47;
                }

                p_cache = v30;
                uint64_t v22 = v29;
                id v18 = v48;
              }
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v50 objects:buf count:16];
          }
          while (v21);
        }

        id v7 = v44;
        id v6 = v45;
        BOOL v12 = v43;
        id v9 = v41;
        id v8 = v42;
        id v11 = v40;
      }
      else
      {
        v35 = (void *)MEMORY[0x230FBD990]();
        v36 = self;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          id v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v59 = v38;
          __int16 v60 = 2112;
          id v61 = v8;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Can't assign owner during import because the record hasn't downloaded yet: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (int64_t)ensureCanonicalModel
{
  v48[1] = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)MKFCKHome;
  int64_t v3 = [(MKFCKModel *)&v41 ensureCanonicalModel];
  if (v3 == 1)
  {
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    id v4 = (void *)MEMORY[0x230FBD990]();
    uint64_t v5 = @"HMD.CFU";
    id v6 = [MEMORY[0x263EFF310] fetchRequest];
    id v28 = [v6 entity];
    id v7 = [v28 propertiesByName];
    v31 = [v7 objectForKeyedSubscript:@"author"];

    id v8 = [(MKFCKHome *)self entity];
    id v9 = +[HMDCoreDataCloudTransform localTransformableEntityFromEntity:v8];

    BOOL v10 = (void *)MEMORY[0x263F08A98];
    id v11 = [v31 name];
    id v30 = [v10 predicateWithFormat:@"(%K == %@)", v11, @"HMD.CFU"];

    [v6 setPredicate:v30];
    BOOL v12 = [(MKFCKHome *)self managedObjectContext];
    uint64_t v13 = [MEMORY[0x263EFF2F8] fetchHistoryWithFetchRequest:v6];
    uint64_t v14 = objc_msgSend(v12, "hmd_coreData");
    uint64_t v29 = [v14 workingStore];

    v48[0] = v29;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:1];
    [v13 setAffectedStores:v15];

    [v13 setFetchBatchSize:20];
    [v13 setResultType:5];
    id v36 = 0;
    int v16 = [v12 executeRequest:v13 error:&v36];
    id v27 = v36;
    id v17 = [v16 result];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __33__MKFCKHome_ensureCanonicalModel__block_invoke;
    v32[3] = &unk_264A17EC8;
    id v18 = v9;
    id v33 = v18;
    uint64_t v34 = self;
    v35 = &v37;
    uint64_t v19 = objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);
    if (*((unsigned char *)v38 + 24))
    {
      context = (void *)MEMORY[0x230FBD990](v19);
      uint64_t v20 = self;
      HMFGetOSLogHandle();
      uint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = v4;
        HMFGetLogIdentifier();
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = [(MKFCKModel *)v20 debugDescription];
        *(_DWORD *)buf = 138543874;
        id v43 = v22;
        __int16 v44 = 2112;
        id v45 = v20;
        __int16 v46 = 2112;
        id v47 = v23;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Re-doing delete of record since it is locally deleted by the user: %@\n%@", buf, 0x20u);

        id v4 = v25;
      }

      [v12 deleteObject:v20];
      int64_t v3 = -2;
    }
    else
    {
      int64_t v3 = 1;
    }

    _Block_object_dispose(&v37, 8);
  }
  return v3;
}

void __33__MKFCKHome_ensureCanonicalModel__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 changes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__MKFCKHome_ensureCanonicalModel__block_invoke_2;
  v7[3] = &unk_264A1B158;
  id v8 = *(id *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

void __33__MKFCKHome_ensureCanonicalModel__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v6 = [v13 changedObjectID];
  id v7 = [v6 entity];
  int v8 = [v7 isKindOfEntity:*(void *)(a1 + 32)];

  if (v8 && [v13 changeType] == 2)
  {
    long long v9 = [v13 tombstone];
    BOOL v10 = [v9 objectForKeyedSubscript:@"modelID"];

    id v11 = [*(id *)(a1 + 40) modelID];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (BOOL)_exportRelationshipsFromLocalModel:(id)a3 localRelationship:(id)a4 cloudRelationship:(id)a5 cloudModels:(id)a6 context:(id)a7
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v39 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = objc_msgSend(v14, "hmd_coreData");
  uint64_t v37 = [v15 cloudPrivateStore];
  int v16 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke;
  v52[3] = &unk_264A19D08;
  id v17 = v16;
  id v53 = v17;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v52);

  id v18 = [v39 name];
  uint64_t v19 = [v11 valueForKey:v18];

  if ([v19 count])
  {
    uint64_t v20 = [v12 destinationEntity];
    uint64_t v21 = objc_msgSend(v37, "hmd_deletedModelIDsForEntity:modelIDKey:duration:context:", v20, @"modelID", v14, 3600.0);

    if (v21) {
      goto LABEL_7;
    }
    context = (void *)MEMORY[0x230FBD990]();
    id v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      v35 = [v12 destinationEntity];
      uint64_t v24 = [v35 name];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to gather modelIDs for recently deleted %{public}@", buf, 0x16u);
    }
  }
  uint64_t v21 = 0;
LABEL_7:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v55 = 1;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke_18;
  v44[3] = &unk_264A17E78;
  id v25 = v17;
  id v45 = v25;
  id v26 = v21;
  id v46 = v26;
  id v47 = self;
  id v27 = v12;
  id v48 = v27;
  id v28 = v14;
  id v49 = v28;
  id v29 = v11;
  id v50 = v29;
  long long v51 = buf;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v44);
  int v30 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    v31 = [v15 workingStore];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke_20;
    v40[3] = &unk_264A17EA0;
    id v32 = v31;
    id v41 = v32;
    id v42 = v28;
    id v43 = self;
    [v25 enumerateKeysAndObjectsUsingBlock:v40];
  }
  _Block_object_dispose(buf, 8);

  return v30 != 0;
}

void __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 modelID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke_18(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 modelID];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (v7)
  {
    [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v6];
    int v8 = (void *)v7;
    goto LABEL_3;
  }
  if (![*(id *)(a1 + 40) containsObject:v6])
  {
    id v32 = [v5 entity];
    id v33 = +[HMDCoreDataCloudTransform exportTransformableClassFromEntity:v32];

    int v8 = [(objc_class *)v33 createWithLocalModel:v5 context:*(void *)(a1 + 64)];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 setHome:*(void *)(a1 + 48)];
    }
LABEL_3:
    long long v9 = [MEMORY[0x263EFFA08] set];
    char v10 = [v8 exportFromLocalModel:v5 updatedProperties:v9 context:*(void *)(a1 + 64)];

    if ((v10 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      *a3 = 1;
LABEL_30:

      goto LABEL_31;
    }
    if (v7)
    {
      int v11 = [v8 hasPersistentChangedValues];
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 48);
      id v14 = HMFGetOSLogHandle();
      v15 = v14;
      if (!v11)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          id v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v48 = v45;
          __int16 v49 = 2112;
          id v50 = v8;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during export: %@", buf, 0x16u);
        }
        goto LABEL_29;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = HMFGetLogIdentifier();
        id v46 = [v8 changedValues];
        id v17 = [v46 allKeys];
        id v18 = [v17 sortedArrayUsingSelector:sel_compare_];
        *(_DWORD *)buf = 138543874;
        id v48 = v16;
        __int16 v49 = 2112;
        id v50 = v8;
        __int16 v51 = 2114;
        uint64_t v52 = (uint64_t)v18;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during export: %@ (%{public}@)", buf, 0x20u);
      }
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 48);
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        v23 = [v8 debugDescription];
        *(_DWORD *)buf = 138543618;
        id v48 = v22;
        __int16 v49 = 2112;
        id v50 = v23;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
      }
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v24 = *(id *)(a1 + 48);
      id v25 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
LABEL_25:

LABEL_29:
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = *(id *)(a1 + 48);
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v48 = v37;
        __int16 v49 = 2112;
        id v50 = v8;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during export: %@", buf, 0x16u);
      }
      id v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = *(id *)(a1 + 48);
      char v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = HMFGetLogIdentifier();
        id v42 = [v8 debugDescription];
        *(_DWORD *)buf = 138543618;
        id v48 = v41;
        __int16 v49 = 2112;
        id v50 = v42;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
      }
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v24 = *(id *)(a1 + 48);
      id v25 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_25;
      }
    }
    id v43 = HMFGetLogIdentifier();
    __int16 v44 = [v5 debugDescription];
    *(_DWORD *)buf = 138543618;
    id v48 = v43;
    __int16 v49 = 2112;
    id v50 = v44;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

    goto LABEL_25;
  }
  id v26 = (void *)MEMORY[0x230FBD990]();
  id v27 = *(id *)(a1 + 48);
  id v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v29 = HMFGetLogIdentifier();
    int v30 = [*(id *)(a1 + 56) entity];
    v31 = [v30 name];
    *(_DWORD *)buf = 138544130;
    id v48 = v29;
    __int16 v49 = 2114;
    id v50 = v31;
    __int16 v51 = 2160;
    uint64_t v52 = 1752392040;
    __int16 v53 = 2112;
    v54 = v6;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Not recreating deleted model <%{public}@: %{mask.hash}@>", buf, 0x2Au);
  }
LABEL_31:
}

void __104__MKFCKHome__exportRelationshipsFromLocalModel_localRelationship_cloudRelationship_cloudModels_context___block_invoke_20(id *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 entity];
  int v8 = +[HMDCoreDataCloudTransform localTransformableEntityFromEntity:v7];

  int v9 = objc_msgSend(a1[4], "hmd_modelWasDeletedWithID:modelIDKey:entity:duration:context:", v5, @"modelID", v8, a1[5], 0.0);
  char v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = a1[6];
  id v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      id v14 = HMFGetLogIdentifier();
      int v22 = 138543618;
      v23 = v14;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Deleting model during export: %@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v15 = [a1[5] deleteObject:v6];
  }
  else
  {
    if (v13)
    {
      int v16 = HMFGetLogIdentifier();
      int v22 = 138543618;
      v23 = v16;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Not deleting model during export - not previously deleted: %@", (uint8_t *)&v22, 0x16u);
    }
  }
  id v17 = (void *)MEMORY[0x230FBD990](v15);
  id v18 = a1[6];
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    uint64_t v21 = [v6 debugDescription];
    int v22 = 138543618;
    v23 = v20;
    __int16 v24 = 2112;
    id v25 = v21;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@%@", (uint8_t *)&v22, 0x16u);
  }
}

- (BOOL)_exportRelationshipsFromLocalHome:(id)a3 localRelationship:(id)a4 cloudRelationship:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v11 name];
  uint64_t v15 = [(MKFCKHome *)self valueForKey:v14];

  LOBYTE(self) = [(MKFCKHome *)self _exportRelationshipsFromLocalModel:v13 localRelationship:v12 cloudRelationship:v11 cloudModels:v15 context:v10];
  return (char)self;
}

- (BOOL)_exportRelationshipsFromLocalHome:(id)a3 localRelationshipName:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 entity];
  id v12 = [v11 relationshipsByName];
  id v13 = [v12 objectForKeyedSubscript:v9];

  id v14 = [(MKFCKModel *)self relationshipForLocalName:v9 localModel:v10];

  LOBYTE(v9) = [(MKFCKHome *)self _exportRelationshipsFromLocalHome:v10 localRelationship:v13 cloudRelationship:v14 context:v8];
  return (char)v9;
}

- (void)_maybeDeleteStaleLocalModels:(id)a3 modelIDKey:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_msgSend(v9, "hmd_coreData");
  id v12 = [v11 cloudPrivateStore];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__MKFCKHome__maybeDeleteStaleLocalModels_modelIDKey_context___block_invoke;
  v16[3] = &unk_264A17E28;
  id v17 = v12;
  id v18 = v8;
  id v19 = v9;
  id v20 = self;
  id v13 = v9;
  id v14 = v8;
  id v15 = v12;
  [v10 enumerateKeysAndObjectsUsingBlock:v16];
}

void __61__MKFCKHome__maybeDeleteStaleLocalModels_modelIDKey_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 entity];
  id v8 = +[HMDCoreDataCloudTransform exportTransformableEntityFromEntity:v7];

  int v9 = objc_msgSend(*(id *)(a1 + 32), "hmd_modelWasDeletedWithID:modelIDKey:entity:duration:context:", v5, *(void *)(a1 + 40), v8, *(void *)(a1 + 48), 0.0);
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 56);
  id v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      id v14 = HMFGetLogIdentifier();
      int v22 = 138543618;
      v23 = v14;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Deleting model during import: %@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v15 = [*(id *)(a1 + 48) deleteObject:v6];
  }
  else
  {
    if (v13)
    {
      int v16 = HMFGetLogIdentifier();
      int v22 = 138543618;
      v23 = v16;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Not deleting model during import - not previously deleted: %@", (uint8_t *)&v22, 0x16u);
    }
  }
  id v17 = (void *)MEMORY[0x230FBD990](v15);
  id v18 = *(id *)(a1 + 56);
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    uint64_t v21 = [v6 debugDescription];
    int v22 = 138543618;
    v23 = v20;
    __int16 v24 = 2112;
    id v25 = v21;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@%@", (uint8_t *)&v22, 0x16u);
  }
}

- (void)_maybeDeleteStaleLocalModels:(id)a3 context:(id)a4
{
}

- (BOOL)_importRelationshipsIntoLocalModel:(id)a3 localRelationshipName:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 entity];
  id v12 = [v11 relationshipsByName];
  BOOL v13 = [v12 objectForKeyedSubscript:v10];

  id v14 = [(MKFCKModel *)self relationshipForLocalName:v10 localModel:v8];

  uint64_t v15 = [v13 name];
  int v16 = [v8 valueForKey:v15];

  id v17 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __78__MKFCKHome__importRelationshipsIntoLocalModel_localRelationshipName_context___block_invoke;
  v32[3] = &unk_264A26938;
  id v18 = v17;
  id v33 = v18;
  objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);

  id v19 = [v14 name];
  id v20 = [(MKFCKHome *)self valueForKey:v19];
  uint64_t v21 = (void *)[v20 mutableCopy];

  int v22 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v21, "count"));
  if (-[MKFCKHome _importIntoLocalHomeModel:cloudModels:localModelsByModelID:processedCloudModels:context:]((BOOL)self, v8, v21, v18, v22, v9)&& ((uint64_t v23 = [v22 count], v23 == objc_msgSend(v21, "count"))|| (objc_msgSend(v21, "minusSet:", v22), -[MKFCKHome _importIntoLocalHomeModel:cloudModels:localModelsByModelID:processedCloudModels:context:]((BOOL)self, v8, v21, v18, v22, v9))))
  {
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    id v29 = __78__MKFCKHome__importRelationshipsIntoLocalModel_localRelationshipName_context___block_invoke_2;
    int v30 = &unk_264A19D08;
    id v24 = v18;
    id v31 = v24;
    objc_msgSend(v22, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v27);
    -[MKFCKHome _maybeDeleteStaleLocalModels:context:](self, "_maybeDeleteStaleLocalModels:context:", v24, v9, v27, v28, v29, v30);

    BOOL v25 = 1;
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

void __78__MKFCKHome__importRelationshipsIntoLocalModel_localRelationshipName_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 modelID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (BOOL)_importIntoLocalHomeModel:(void *)a3 cloudModels:(void *)a4 localModelsByModelID:(void *)a5 processedCloudModels:(void *)a6 context:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = v15;
  if (a1)
  {
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 1;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __101__MKFCKHome__importIntoLocalHomeModel_cloudModels_localModelsByModelID_processedCloudModels_context___block_invoke;
    v18[3] = &unk_264A17E50;
    id v19 = v15;
    BOOL v20 = a1;
    id v21 = v14;
    id v22 = v13;
    id v23 = v11;
    id v24 = &v25;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);
    a1 = *((unsigned char *)v26 + 24) != 0;

    _Block_object_dispose(&v25, 8);
  }

  return a1;
}

void __78__MKFCKHome__importRelationshipsIntoLocalModel_localRelationshipName_context___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 modelID];
  [v2 removeObjectForKey:v3];
}

void __101__MKFCKHome__importIntoLocalHomeModel_cloudModels_localModelsByModelID_processedCloudModels_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ([v5 isReadyToImportIntoLocalModelWithContext:*(void *)(a1 + 32)])
  {
    id v6 = [v5 modelID];
    [*(id *)(a1 + 48) addObject:v5];
    if ([v5 isDeletedLocallyWithContext:*(void *)(a1 + 32)])
    {
      uint64_t v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 40);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v48 = v10;
        __int16 v49 = 2112;
        id v50 = v5;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Skip create/update since model is already deleted locally: %@", buf, 0x16u);
      }
      goto LABEL_33;
    }
    uint64_t v15 = [*(id *)(a1 + 56) objectForKeyedSubscript:v6];
    int v16 = (void *)v15;
    if (!v15)
    {
      int v16 = [v5 createLocalModelWithContext:*(void *)(a1 + 32)];
      [v16 setValue:*(void *)(a1 + 64) forKey:@"home"];
    }
    id v17 = [MEMORY[0x263EFFA08] set];
    char v18 = [v5 importIntoLocalModel:v16 updatedProperties:v17 context:*(void *)(a1 + 32)];

    if ((v18 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      *a3 = 1;
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    if (v15)
    {
      int v19 = [v16 hasPersistentChangedValues];
      BOOL v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = *(id *)(a1 + 40);
      id v22 = HMFGetOSLogHandle();
      id v23 = v22;
      if (!v19)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          id v45 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v48 = v45;
          __int16 v49 = 2112;
          id v50 = v16;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during import: %@", buf, 0x16u);
        }
        goto LABEL_31;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = HMFGetLogIdentifier();
        id v46 = [v16 changedValues];
        uint64_t v25 = [v46 allKeys];
        uint64_t v26 = [v25 sortedArrayUsingSelector:sel_compare_];
        *(_DWORD *)buf = 138543874;
        id v48 = v24;
        __int16 v49 = 2112;
        id v50 = v16;
        __int16 v51 = 2114;
        uint64_t v52 = v26;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during import: %@ (%{public}@)", buf, 0x20u);
      }
      uint64_t v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = *(id *)(a1 + 40);
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        int v30 = HMFGetLogIdentifier();
        id v31 = [v16 debugDescription];
        *(_DWORD *)buf = 138543618;
        id v48 = v30;
        __int16 v49 = 2112;
        id v50 = v31;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
      }
      BOOL v20 = (void *)MEMORY[0x230FBD990]();
      id v32 = *(id *)(a1 + 40);
      id v33 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
LABEL_27:

LABEL_31:
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = *(id *)(a1 + 40);
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v48 = v37;
        __int16 v49 = 2112;
        id v50 = v16;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during import: %@", buf, 0x16u);
      }
      id v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = *(id *)(a1 + 40);
      char v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = HMFGetLogIdentifier();
        id v42 = [v16 debugDescription];
        *(_DWORD *)buf = 138543618;
        id v48 = v41;
        __int16 v49 = 2112;
        id v50 = v42;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
      }
      BOOL v20 = (void *)MEMORY[0x230FBD990]();
      id v32 = *(id *)(a1 + 40);
      id v33 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_27;
      }
    }
    id v43 = HMFGetLogIdentifier();
    __int16 v44 = [v5 debugDescription];
    *(_DWORD *)buf = 138543618;
    id v48 = v43;
    __int16 v49 = 2112;
    id v50 = v44;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

    goto LABEL_27;
  }
  id v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = *(id *)(a1 + 40);
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v48 = v14;
    __int16 v49 = 2112;
    id v50 = v5;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Skipping import into local model because cloud model is not ready: %@", buf, 0x16u);
  }
LABEL_34:
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)MKFCKHome;
  [(MKFCKModel *)&v4 awakeFromInsert];
  uint64_t v3 = MEMORY[0x263EFFA78];
  [(MKFCKHome *)self setPrimitiveValue:MEMORY[0x263EFFA78] forKey:@"guestAccessCodes"];
  [(MKFCKHome *)self setPrimitiveValue:v3 forKey:@"removedUserAccessCodes"];
}

+ (id)createWithLocalModel:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v7, "hmd_coreData");
  id v9 = [v8 cloudPrivateStore];

  id v10 = [v6 modelID];
  id v11 = [a1 createWithModelID:v10 persistentStore:v9 context:v7];

  return v11;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v26 = 0;
    id v14 = +[MKFCKModel modelWithModelID:v11 context:v13 error:&v26];
    id v15 = v26;
    int v16 = v15;
    if (v14)
    {
      [v13 deleteObject:v14];
      [a1 _rebalanceFakeHomesWithContext:v13];
    }
    else if (v15)
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = a1;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v28 = v24;
        __int16 v29 = 2114;
        id v30 = v16;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud model: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = a1;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v20;
      __int16 v29 = 2114;
      id v30 = v10;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Can't process export delete for %{public}@ without a modelID", buf, 0x16u);
    }
  }

  return 1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v13 objectWithID:v10];
  id v15 = MKFPropertyNamesFromDescriptions(v11);
  int v16 = [a1 fetchWithLocalModel:v14 context:v13];
  id v17 = v16;
  if (!v16)
  {
    id v38 = v15;
    int v19 = (void *)MEMORY[0x230FBD990]();
    id v32 = a1;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      char v40 = v33;
      __int16 v41 = 2112;
      id v42 = v14;
      __int16 v43 = 2114;
      __int16 v44 = v38;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Local model updated but no cloud model exists: %@ (%{public}@)", buf, 0x20u);
    }
    goto LABEL_17;
  }
  if (-[MKFCKHome _exportFromLocalModel:updatedProperties:context:](v16, v14, v11, v13))
  {
    id v37 = v12;
    id v38 = v15;
    int v18 = [v17 hasPersistentChangedValues];
    int v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    id v21 = HMFGetOSLogHandle();
    id v22 = v21;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        char v40 = v23;
        __int16 v41 = 2112;
        id v42 = v17;
        __int16 v43 = 2114;
        __int16 v44 = v38;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during export: %@ (%{public}@)", buf, 0x20u);
      }
      id v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = v20;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        uint64_t v27 = v36 = v24;
        id v28 = [v17 debugDescription];
        *(_DWORD *)buf = 138543618;
        char v40 = v27;
        __int16 v41 = 2112;
        id v42 = v28;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

        id v24 = v36;
      }

      int v19 = (void *)MEMORY[0x230FBD990]();
      id v29 = v25;
      id v22 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
      id v30 = HMFGetLogIdentifier();
      uint64_t v31 = [v14 debugDescription];
      *(_DWORD *)buf = 138543618;
      char v40 = v30;
      __int16 v41 = 2112;
      id v42 = v31;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:
        id v12 = v37;
LABEL_17:

        BOOL v34 = 1;
        id v15 = v38;
        goto LABEL_18;
      }
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v40 = v30;
      __int16 v41 = 2112;
      id v42 = v17;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during export: %@", buf, 0x16u);
    }

    goto LABEL_16;
  }
  BOOL v34 = 0;
LABEL_18:

  return v34;
}

- (void)_exportFromLocalModel:(void *)a3 updatedProperties:(void *)a4 context:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if ([a1 copyPropertiesFromLocalModel:v7 context:v9]
      && [a1 _exportResidentsFromLocalModel:v7 context:v9]
      && [a1 _exportRoomsFromLocalModel:v7 context:v9]
      && [a1 _exportZonesFromLocalModel:v7 context:v9]
      && [a1 _exportAccessoriesFromLocalModel:v7 context:v9]
      && [a1 _exportApplicationDataFromLocalModel:v7 context:v9]
      && [a1 _exportMatterKeyValueStoreFromLocalModel:v7 context:v9]
      && [a1 _exportUsersFromLocalModel:v7 context:v9]
      && [a1 _exportGuestsFromLocalModel:v7 context:v9]
      && [a1 _exportScenesFromLocalModel:v7 context:v9]
      && [a1 _exportSettingsFromLocalModel:v7 context:v9]
      && [a1 _exportServiceGroupsFromLocalModel:v7 context:v9]
      && [a1 _exportTriggersFromLocalModel:v7 context:v9]
      && [a1 _exportPersonsFromLocalModel:v7 context:v9]
      && [a1 _exportInvitationOutgoingFromLocalModel:v7 context:v9]
      && [a1 _exportNetworkProtectionGroupsFromLocalModel:v7 context:v9]
      && [a1 _exportPinCodesFromLocalModel:v7 context:v9])
    {
      a1 = (void *)[a1 _exportHomeManagerWithContext:v9];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 objectWithID:v8];
  uint64_t v12 = [a1 fetchWithLocalModel:v11 context:v10];
  if (v12)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v54 = v16;
      __int16 v55 = 2112;
      uint64_t v56 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unexpected existing cloud model during local insert: %@", buf, 0x16u);
    }
    id v17 = (void *)v12;
  }
  else
  {
    id v17 = [a1 createWithLocalModel:v11 context:v10];
  }
  int v18 = [MEMORY[0x263EFFA08] set];
  unsigned int v19 = -[MKFCKHome _exportFromLocalModel:updatedProperties:context:](v17, v11, v18, v10);

  if (v19)
  {
    id v52 = v9;
    if (v12)
    {
      int v20 = [v17 hasPersistentChangedValues];
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = a1;
      id v23 = HMFGetOSLogHandle();
      id v24 = v23;
      if (v20)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          id v25 = v51 = v21;
          id v50 = [v17 changedValues];
          id v26 = [v50 allKeys];
          uint64_t v27 = [v26 sortedArrayUsingSelector:sel_compare_];
          *(_DWORD *)buf = 138543874;
          v54 = v25;
          __int16 v55 = 2112;
          uint64_t v56 = (uint64_t)v17;
          __int16 v57 = 2114;
          uint64_t v58 = v27;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during export: %@ (%{public}@)", buf, 0x20u);

          id v21 = v51;
        }

        id v28 = (void *)MEMORY[0x230FBD990]();
        id v29 = v22;
        id v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = HMFGetLogIdentifier();
          id v32 = [v17 debugDescription];
          *(_DWORD *)buf = 138543618;
          v54 = v31;
          __int16 v55 = 2112;
          uint64_t v56 = (uint64_t)v32;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
        }
        id v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = v29;
        id v24 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_25;
        }
        id v33 = HMFGetLogIdentifier();
        BOOL v34 = [v11 debugDescription];
        *(_DWORD *)buf = 138543618;
        v54 = v33;
        __int16 v55 = 2112;
        uint64_t v56 = (uint64_t)v34;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
      }
      else
      {
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
LABEL_25:

          id v9 = v52;
          goto LABEL_26;
        }
        id v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v54 = v33;
        __int16 v55 = 2112;
        uint64_t v56 = (uint64_t)v17;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during export: %@", buf, 0x16u);
      }

      goto LABEL_25;
    }
    id v35 = (void *)MEMORY[0x230FBD990]();
    id v36 = a1;
    id v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v54 = v38;
      __int16 v55 = 2112;
      uint64_t v56 = (uint64_t)v17;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during export: %@", buf, 0x16u);
    }
    id v39 = (void *)MEMORY[0x230FBD990]();
    id v40 = v36;
    __int16 v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      id v42 = HMFGetLogIdentifier();
      __int16 v43 = [v17 debugDescription];
      *(_DWORD *)buf = 138543618;
      v54 = v42;
      __int16 v55 = 2112;
      uint64_t v56 = (uint64_t)v43;
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

      id v9 = v52;
    }

    __int16 v44 = (void *)MEMORY[0x230FBD990]();
    id v45 = v40;
    id v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      id v47 = HMFGetLogIdentifier();
      id v48 = [v11 debugDescription];
      *(_DWORD *)buf = 138543618;
      v54 = v47;
      __int16 v55 = 2112;
      uint64_t v56 = (uint64_t)v48;
      _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

      id v9 = v52;
    }

    [v45 _rebalanceFakeHomesWithContext:v10];
  }
LABEL_26:

  return v19;
}

+ (BOOL)importDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v33 = 0;
    id v14 = +[_MKFModel modelWithModelID:v11 context:v13 error:&v33];
    id v15 = v33;
    int v16 = v15;
    if (v14)
    {
      [v13 deleteObject:v14];
      id v17 = [(id)objc_opt_class() _homeManagerContextFromContext:v13];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __72__MKFCKHome_importDeleteWithObjectID_modelID_additionalUpdates_context___block_invoke;
      v29[3] = &unk_264A2E458;
      id v30 = v17;
      id v32 = a1;
      id v31 = v11;
      id v18 = v17;
      [v18 performBlockAndWait:v29];
    }
    else if (v15)
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = a1;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v35 = v27;
        __int16 v36 = 2114;
        id v37 = v16;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local model: %{public}@", buf, 0x16u);
      }
      BOOL v19 = 0;
      goto LABEL_12;
    }
    BOOL v19 = 1;
LABEL_12:

    goto LABEL_13;
  }
  int v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = a1;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v35 = v23;
    __int16 v36 = 2114;
    id v37 = v10;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Can't process import delete for %{public}@ without a modelID", buf, 0x16u);
  }
  BOOL v19 = 1;
LABEL_13:

  return v19;
}

void __72__MKFCKHome_importDeleteWithObjectID_modelID_additionalUpdates_context___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = a1[4];
  id v18 = 0;
  uint64_t v3 = +[_MKFHomeManager fetchWithContext:v2 error:&v18];
  id v4 = v18;
  if (v3)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v26 = __Block_byref_object_copy__23516;
    uint64_t v27 = __Block_byref_object_dispose__23517;
    id v28 = 0;
    id v5 = [v3 homes];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__MKFCKHome_importDeleteWithObjectID_modelID_additionalUpdates_context___block_invoke_24;
    v15[3] = &unk_264A217B0;
    id v16 = a1[5];
    id v17 = buf;
    objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      objc_msgSend(v3, "removeHomes_Object:");
      [a1[4] deleteObject:*(void *)(*(void *)&buf[8] + 40)];
    }
    else
    {
      id v10 = (void *)MEMORY[0x230FBD990]();
      id v11 = a1[6];
      HMFGetOSLogHandle();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        id v14 = a1[5];
        *(_DWORD *)BOOL v19 = 138543874;
        int v20 = v13;
        __int16 v21 = 2160;
        uint64_t v22 = 1752392040;
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Couldn't find home manager home to delete with modelID %{mask.hash}@", v19, 0x20u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1[6];
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);
    }
  }
}

void __72__MKFCKHome_importDeleteWithObjectID_modelID_additionalUpdates_context___block_invoke_24(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v6 = [v9 handle];
  id v7 = [v6 homeUUID];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

+ (BOOL)importUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  uint64_t v13 = 0;
  id v8 = a6;
  id v9 = a4;
  id v10 = +[MKFCKModel modelWithObjectID:a3 context:v8 error:&v13];
  char v11 = -[MKFCKHome _importWithContext:updatedProperties:]((uint64_t)v10, v8, v9);

  return v11;
}

- (uint64_t)_importWithContext:(void *)a3 updatedProperties:
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_27;
  }
  if (![(id)a1 isDeletedLocallyWithContext:v5])
  {
    char v11 = [(id)a1 fetchLocalModelWithContext:v5];
    if (v11)
    {
      id v12 = v11;
      if (-[MKFCKHome _importIntoLocalModel:updatedProperties:context:]((void *)a1, v11, v6, v5))
      {
        int v13 = [v12 hasPersistentChangedValues];
        id v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = (id)a1;
        id v16 = HMFGetOSLogHandle();
        id v17 = v16;
        if (!v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v42 = v38;
            __int16 v43 = 2112;
            id v44 = v12;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@No changes to model during import: %@", buf, 0x16u);
          }
          goto LABEL_25;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = HMFGetLogIdentifier();
          id v40 = [v12 changedValues];
          BOOL v19 = [v40 allKeys];
          int v20 = [v19 sortedArrayUsingSelector:sel_compare_];
          *(_DWORD *)buf = 138543874;
          id v42 = v18;
          __int16 v43 = 2112;
          id v44 = v12;
          __int16 v45 = 2114;
          id v46 = v20;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updated model during import: %@ (%{public}@)", buf, 0x20u);
        }
        __int16 v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = v15;
        __int16 v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          id v24 = HMFGetLogIdentifier();
          id v25 = [v12 debugDescription];
          *(_DWORD *)buf = 138543618;
          id v42 = v24;
          __int16 v43 = 2112;
          id v44 = v25;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
        }
        id v14 = (void *)MEMORY[0x230FBD990]();
        id v26 = v22;
        id v17 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
LABEL_25:

          a1 = 1;
          goto LABEL_26;
        }
LABEL_21:
        __int16 v36 = HMFGetLogIdentifier();
        id v37 = [v26 debugDescription];
        *(_DWORD *)buf = 138543618;
        id v42 = v36;
        __int16 v43 = 2112;
        id v44 = v37;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

        goto LABEL_25;
      }
    }
    else
    {
      id v12 = [(id)a1 createLocalModelWithContext:v5];
      [v12 setOwned:MEMORY[0x263EFFA88]];
      if (-[MKFCKHome _importIntoLocalModel:updatedProperties:context:]((void *)a1, v12, v6, v5))
      {
        uint64_t v27 = (void *)MEMORY[0x230FBD990]();
        id v28 = (id)a1;
        uint64_t v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v42 = v30;
          __int16 v43 = 2112;
          id v44 = v12;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Created new model during import: %@", buf, 0x16u);
        }
        id v31 = (void *)MEMORY[0x230FBD990]();
        id v32 = v28;
        id v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          BOOL v34 = HMFGetLogIdentifier();
          id v35 = [v12 debugDescription];
          *(_DWORD *)buf = 138543618;
          id v42 = v34;
          __int16 v43 = 2112;
          id v44 = v35;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);
        }
        id v14 = (void *)MEMORY[0x230FBD990]();
        id v26 = v32;
        id v17 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
    }
    a1 = 0;
LABEL_26:

    goto LABEL_27;
  }
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = (id)a1;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v42 = v10;
    __int16 v43 = 2112;
    id v44 = v8;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Skip import processing since home model is already deleted locally: %@", buf, 0x16u);
  }
  a1 = 1;
LABEL_27:

  return a1;
}

- (uint64_t)_importIntoLocalModel:(void *)a3 updatedProperties:(void *)a4 context:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([a1 copyPropertiesIntoLocalModel:v7 context:v9]
    && [a1 _importResidentsIntoLocalModel:v7 context:v9]
    && [a1 _importRoomsIntoLocalModel:v7 context:v9]
    && [a1 _importZonesIntoLocalModel:v7 context:v9]
    && [a1 _importAccessoriesIntoLocalModel:v7 context:v9]
    && [a1 _importApplicationDataIntoLocalModel:v7 context:v9]
    && [a1 _importMatterKeyValueStoreIntoLocalModel:v7 context:v9]
    && [a1 _importUsersIntoLocalModel:v7 context:v9]
    && [a1 _importGuestsIntoLocalModel:v7 context:v9]
    && [a1 _importScenesIntoLocalModel:v7 context:v9]
    && [a1 _importSettingsIntoLocalModel:v7 context:v9]
    && [a1 _importServiceGroupsIntoLocalModel:v7 context:v9]
    && [a1 _importTriggersIntoLocalModel:v7 context:v9]
    && [a1 _importPersonsIntoLocalModel:v7 context:v9]
    && [a1 _importInvitationOutgoingIntoLocalModel:v7 context:v9]
    && [a1 _importNetworkProtectionGroupsIntoLocalModel:v7 context:v9]
    && [a1 _importPinCodesIntoLocalModel:v7 context:v9])
  {
    uint64_t v10 = [a1 _importHomeManagerWithContext:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)importInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v23 = 0;
  char v11 = +[MKFCKModel modelWithObjectID:v8 context:v10 error:&v23];
  id v12 = v23;
  if (!v11
    || ([v11 owner], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v14 = (void *)v13,
        [v11 defaultRoom],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    id v16 = [MEMORY[0x263EFFA08] set];
    char v17 = -[MKFCKHome _importWithContext:updatedProperties:]((uint64_t)v11, v10, v16);
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = a1;
    int v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v25 = v21;
      __int16 v26 = 2112;
      uint64_t v27 = v11;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Skip import cloud model: %@", buf, 0x16u);
    }
    char v17 = 1;
  }

  return v17;
}

+ (id)createWithModelID:(id)a3 persistentStore:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = (void *)[objc_alloc((Class)a1) initWithContext:v8];
  [v8 assignObject:v11 toPersistentStore:v9];

  [v11 setModelID:v10];
  return v11;
}

+ (id)rootKeyPath
{
  return 0;
}

+ (unint64_t)cloudStoreTypes
{
  return 1;
}

- (BOOL)validateOwner:(id *)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (![(MKFCKModel *)self shouldSkipValidationDuringImport])
  {
    id v8 = *a3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      char v11 = [(MKFCKHome *)self users];
      char v12 = [v11 containsObject:v10];

      if (v12)
      {
        BOOL v7 = 1;
LABEL_15:

        return v7;
      }
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      __int16 v21 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        id v22 = (__CFString *)*a3;
        int v24 = 138543618;
        id v25 = v16;
        __int16 v26 = 2112;
        uint64_t v27 = v22;
        id v18 = "%{public}@Owner missing from users: %@";
        id v19 = v15;
        uint32_t v20 = 22;
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = self;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        id v17 = *a3;
        int v24 = 138543874;
        id v25 = v16;
        __int16 v26 = 2114;
        uint64_t v27 = @"owner";
        __int16 v28 = 2112;
        id v29 = v17;
        id v18 = "%{public}@Invalid value for %{public}@: %@";
        id v19 = v15;
        uint32_t v20 = 32;
LABEL_13:
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v24, v20);
      }
    }

    objc_msgSend((id)objc_opt_class(), "hmd_errorForInvalidValue:key:", *a3, @"owner");
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  return 1;
}

- (BOOL)_exportNetworkProtectionGroupsFromLocalModel:(id)a3 context:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  id v8 = [v6 networkProtectionGroups];
  id v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  id v25 = __91__MKFCKHome_NetworkProtectionGroups___exportNetworkProtectionGroupsFromLocalModel_context___block_invoke;
  __int16 v26 = &unk_264A187C8;
  uint64_t v27 = self;
  id v10 = v7;
  id v28 = v10;
  uint64_t v30 = &v31;
  id v11 = v9;
  id v29 = v11;
  uint64_t v12 = objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v23);
  if (*((unsigned char *)v32 + 24))
  {
    uint64_t v13 = objc_msgSend(v11, "allKeys", v23, v24, v25, v26, v27, v28);
    id v14 = [v13 sortedArrayUsingSelector:sel_compare_];

    id v15 = [v11 objectsForKeys:v14 notFoundMarker:MEMORY[0x263EFFA78]];
    id v16 = [(MKFCKHome *)self networkProtectionGroups];
    char v17 = HMFEqualObjects();

    if ((v17 & 1) == 0) {
      [(MKFCKHome *)self setNetworkProtectionGroups:v15];
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990](v12);
    id v19 = self;
    HMFGetOSLogHandle();
    uint32_t v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to encode network protection groups so leaving unchanged", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v31, 8);
  return 1;
}

void __91__MKFCKHome_NetworkProtectionGroups___exportNetworkProtectionGroupsFromLocalModel_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v13 = [v5 modelID];
  if (*(void *)(a1 + 32))
  {
    id v6 = v5;
    id v7 = objc_opt_class();
    id v8 = [v6 modelID];
    id v9 = [v6 manufacturer];
    id v10 = [v6 category];
    id v11 = [v6 targetProtectionMode];

    uint64_t v12 = [v7 _encodeNetworkProtectionGroupModelID:v8 manufacturer:v9 category:v10 targetProtectionMode:v11];

    if (v12)
    {
      [*(id *)(a1 + 48) setObject:v12 forKeyedSubscript:v13];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v12 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  *a3 = 1;
LABEL_6:
}

- (BOOL)_importNetworkProtectionGroupsIntoLocalModel:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  id v8 = [v6 networkProtectionGroups];
  id v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  id v10 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v8, "count"));
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke;
  v32[3] = &unk_264A18778;
  id v11 = v9;
  id v33 = v11;
  id v12 = v10;
  id v34 = v12;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);

  id v13 = [(MKFCKHome *)self networkProtectionGroups];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke_2;
  v27[3] = &unk_264A187A0;
  v27[4] = self;
  id v28 = v6;
  id v14 = v11;
  id v29 = v14;
  id v15 = v7;
  id v30 = v15;
  id v31 = v12;
  id v16 = v12;
  id v17 = v6;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke_3;
  v24[3] = &unk_264A1CD78;
  id v25 = v14;
  id v26 = v15;
  id v18 = v15;
  id v19 = v14;
  objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);
  uint32_t v20 = (void *)MEMORY[0x263EFFA08];
  __int16 v21 = [v19 allValues];
  id v22 = [v20 setWithArray:v21];
  objc_msgSend(v17, "setNetworkProtectionGroups_:", v22);

  return 1;
}

void __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 modelID];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];

  [*(id *)(a1 + 40) addObject:v4];
}

void __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v7 = a2;
  id v8 = v3;
  id v9 = v5;
  id v10 = v6;
  if (v4)
  {
    id v11 = objc_msgSend(v7, "hmf_UUIDForKey:", @"i");
    if (v11)
    {
      id v12 = objc_msgSend(v7, "hmf_stringForKey:", @"m");
      if (v12)
      {
        id v13 = objc_msgSend(v7, "hmf_numberForKey:", @"c");
        if (v13)
        {
          id v46 = v8;
          id v14 = objc_msgSend(v7, "hmf_numberForKey:", @"p");
          if (v14)
          {
            id v15 = [v9 objectForKeyedSubscript:v11];
            if (!v15)
            {
              contextc = [[_MKFAccessoryNetworkProtectionGroup alloc] initWithContext:v10];
              [(_MKFAccessoryNetworkProtectionGroup *)contextc setModelID:v11];
              [(_MKFAccessoryNetworkProtectionGroup *)contextc setHome:v46];
              id v16 = [v4 writerTimestamp];
              [(_MKFAccessoryNetworkProtectionGroup *)contextc setWriterTimestamp:v16];

              id v15 = contextc;
            }
            context = v15;
            id v17 = [v15 manufacturer];
            char v18 = HMFEqualObjects();

            if ((v18 & 1) == 0) {
              [context setManufacturer:v12];
            }
            id v19 = [context category];
            char v20 = HMFEqualObjects();

            if ((v20 & 1) == 0) {
              [context setCategory:v13];
            }
            __int16 v21 = [context targetProtectionMode];
            char v22 = HMFEqualObjects();

            if ((v22 & 1) == 0) {
              [context setTargetProtectionMode:v14];
            }
          }
          else
          {
            contextb = (void *)MEMORY[0x230FBD990]();
            id v41 = v4;
            id v42 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              __int16 v45 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v54 = v45;
              __int16 v55 = 2112;
              id v56 = v7;
              _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Invalid protection mode for network protection group dictionary: %@", buf, 0x16u);
            }
            context = 0;
          }

          id v8 = v46;
        }
        else
        {
          contexta = (void *)MEMORY[0x230FBD990]();
          id v36 = v4;
          uint64_t v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v48 = v9;
            id v38 = v10;
            v40 = id v39 = v8;
            *(_DWORD *)buf = 138543618;
            v54 = v40;
            __int16 v55 = 2112;
            id v56 = v7;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Invalid category for network protection group dictionary: %@", buf, 0x16u);

            id v8 = v39;
            id v10 = v38;
            id v9 = v48;
          }

          context = 0;
        }
      }
      else
      {
        id v47 = v9;
        id v30 = v10;
        id v31 = v8;
        id v32 = (void *)MEMORY[0x230FBD990]();
        id v33 = v4;
        id v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v54 = v35;
          __int16 v55 = 2112;
          id v56 = v7;
          _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Invalid manufacturer for network protection group dictionary: %@", buf, 0x16u);
        }
        context = 0;
        id v8 = v31;
        id v10 = v30;
        id v9 = v47;
      }
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x230FBD990]();
      id v24 = v4;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v26 = v9;
        id v27 = v10;
        v29 = id v28 = v8;
        *(_DWORD *)buf = 138543618;
        v54 = v29;
        __int16 v55 = 2112;
        id v56 = v7;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Invalid modelID for network protection group dictionary: %@", buf, 0x16u);

        id v8 = v28;
        id v10 = v27;
        id v9 = v26;
      }

      context = 0;
    }
  }
  else
  {
    context = 0;
  }

  __int16 v43 = context;
  if (context)
  {
    id v44 = [context modelID];
    [*(id *)(a1 + 48) setObject:context forKeyedSubscript:v44];
    [*(id *)(a1 + 64) removeObject:v44];

    __int16 v43 = context;
  }
}

void __91__MKFCKHome_NetworkProtectionGroups___importNetworkProtectionGroupsIntoLocalModel_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v3)
  {
    [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v4];
    [*(id *)(a1 + 40) deleteObject:v3];
  }
}

+ (id)_encodeNetworkProtectionGroupModelID:(id)a3 manufacturer:(id)a4 category:(id)a5 targetProtectionMode:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 length])
  {
    [v13 integerValue];
    v21[0] = @"i";
    v21[1] = @"m";
    v22[0] = v10;
    v22[1] = v11;
    v21[2] = @"c";
    v21[3] = @"p";
    id v14 = &unk_26E470C18;
    if (v12) {
      id v14 = v12;
    }
    v22[2] = v14;
    v22[3] = v13;
    id v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    char v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v24 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Not going to export network protection group model with nil manufacturer", buf, 0xCu);
    }
    id v15 = 0;
  }

  return v15;
}

- (BOOL)_exportSettingsFromLocalModel:(id)a3 context:(id)a4
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v82 = 0;
  id v83 = 0;
  id v80 = 0;
  id v81 = 0;
  id v6 = a4;
  id v7 = a3;
  -[MKFCKHome _settingModelsForHome:media:networkRouter:personManager:softwareUpdate:]((uint64_t)self, v7, &v83, &v82, &v81, &v80);
  id v8 = v83;
  id v9 = v82;
  id v77 = v81;
  id v79 = v80;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v12;
  v78 = v11;
  id v76 = v10;
  if (!self)
  {

    id v69 = v10;
    id v70 = v9;
    id v71 = v13;
    goto LABEL_27;
  }
  if (v11)
  {
    id v14 = [v11 mediaPassword];
    id v15 = [v11 mediaPeerToPeerEnabled];
    uint64_t v16 = [v15 BOOLValue];

    id v17 = [v11 minimumMediaUserPrivilege];
    uint64_t v18 = [v17 unsignedIntegerValue];
  }
  else
  {
    id v19 = [(MKFCKHome *)self entity];
    id v17 = [v19 attributesByName];

    char v20 = [v17 objectForKeyedSubscript:@"mediaPeerToPeerEnabled"];
    __int16 v21 = [v20 defaultValue];
    uint64_t v16 = [v21 BOOLValue];

    char v22 = [v17 objectForKeyedSubscript:@"mediaMinimumUserPrivilege"];
    uint64_t v23 = [v22 defaultValue];
    uint64_t v18 = [v23 unsignedIntegerValue];

    id v14 = 0;
  }

  id v24 = [(MKFCKHome *)self mediaPassword];
  char v25 = HMFEqualObjects();

  if ((v25 & 1) == 0) {
    [(MKFCKHome *)self setMediaPassword:v14];
  }
  if (v16 != [(MKFCKHome *)self mediaPeerToPeerEnabled]) {
    [(MKFCKHome *)self setMediaPeerToPeerEnabled:v16];
  }
  if ([(MKFCKHome *)self mediaMinimumUserPrivilege] != v18) {
    [(MKFCKHome *)self setMediaMinimumUserPrivilege:v18];
  }

  id v26 = v10;
  id v27 = v9;
  id v28 = v13;
  if (!v27)
  {
    id v36 = 0;
    id v31 = 0;
    goto LABEL_20;
  }
  id v29 = v28;
  id v30 = [v27 networkAccessory];
  if (!v30) {
    goto LABEL_17;
  }
  id v31 = +[MKFCKHAPAccessory fetchWithLocalModel:v30 context:v29];
  if (!v31)
  {
    id v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = self;
    id v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v35 = v75 = v32;
      *(_DWORD *)buf = 138543618;
      v85 = v35;
      __int16 v86 = 2112;
      v87 = v30;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to find cloud network router matching local: %@", buf, 0x16u);

      id v32 = v75;
    }

LABEL_17:
    id v31 = 0;
  }
  id v36 = [v27 minimumNetworkRouterSupportHomeKitVersion];
  id v27 = [v27 minHomeKitVersionForAccessoryNetworkProtectionChange];

LABEL_20:
  id v37 = v9;
  id v38 = [(MKFCKHome *)self activeNetworkRouter];
  char v39 = HMFEqualObjects();

  if ((v39 & 1) == 0) {
    [(MKFCKHome *)self setActiveNetworkRouter:v31];
  }
  id v40 = [(MKFCKHome *)self minimumHomeKitVersionForNetworkRouterSupport];
  id v41 = [v40 versionString];
  char v42 = HMFEqualObjects();

  if ((v42 & 1) == 0)
  {
    __int16 v43 = [[HMDHomeKitVersion alloc] initWithVersionString:v36];
    [(MKFCKHome *)self setMinimumHomeKitVersionForNetworkRouterSupport:v43];
  }
  id v44 = [(MKFCKHome *)self minimumHomeKitVersionForAccessoryNetworkProtectionChanges];
  __int16 v45 = [v44 versionString];
  char v46 = HMFEqualObjects();

  if ((v46 & 1) == 0)
  {
    id v47 = [[HMDHomeKitVersion alloc] initWithVersionString:v27];
    [(MKFCKHome *)self setMinimumHomeKitVersionForAccessoryNetworkProtectionChanges:v47];
  }
  id v9 = v37;
LABEL_27:

  id v48 = v9;
  id v49 = v76;
  id v50 = v77;
  id v51 = v13;
  id v52 = v51;
  if (self)
  {
    uint64_t v53 = [(MKFCKHome *)self personDataZoneUUID];
    v54 = [v50 zoneUUID];
    char v55 = HMFEqualObjects();

    if ((v55 & 1) == 0)
    {
      id v56 = [v50 zoneUUID];
      [(MKFCKHome *)self setPersonDataZoneUUID:v56];
    }
    id v57 = v49;
    uint64_t v58 = v79;
    id v59 = v79;
    id v60 = v52;
    if (v59)
    {
      id v61 = [v59 automaticSoftwareUpdateEnabled];
      uint64_t v62 = [v61 BOOLValue];

      uint64_t v63 = [v59 automaticThirdPartyAccessorySoftwareUpdateEnabled];
      uint64_t v64 = [v63 BOOLValue];
    }
    else
    {
      v65 = [(MKFCKHome *)self homeModelID];
      uint64_t v63 = +[HMDHomeSettingsModel defaultModelForHomeUUID:v65];

      uint64_t v58 = v79;
      id v66 = [v63 automaticSoftwareUpdateEnabled];
      uint64_t v62 = [v66 BOOLValue];

      id v67 = [v63 automaticThirdPartyAccessorySoftwareUpdateEnabled];
      uint64_t v64 = [v67 BOOLValue];
    }
    if (v62 != [(MKFCKHome *)self automaticSoftwareUpdateEnabled])[(MKFCKHome *)self setAutomaticSoftwareUpdateEnabled:v62]; {
    if (v64 != [(MKFCKHome *)self automaticThirdPartyAccessorySoftwareUpdateEnabled])[(MKFCKHome *)self setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:v64];
    }
  }
  else
  {

    id v72 = v49;
    uint64_t v58 = v79;
    id v73 = v79;
    id v74 = v52;
  }

  return 1;
}

- (void)_settingModelsForHome:(void *)a3 media:(void *)a4 networkRouter:(void *)a5 personManager:(void *)a6 softwareUpdate:
{
  id v10 = a2;
  id v11 = v10;
  if (a1)
  {
    uint64_t v38 = 0;
    char v39 = &v38;
    uint64_t v40 = 0x3032000000;
    id v41 = __Block_byref_object_copy__76209;
    char v42 = __Block_byref_object_dispose__76210;
    id v43 = 0;
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__76209;
    id v36 = __Block_byref_object_dispose__76210;
    id v37 = 0;
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__76209;
    id v30 = __Block_byref_object_dispose__76210;
    id v31 = 0;
    uint64_t v20 = 0;
    __int16 v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__76209;
    id v24 = __Block_byref_object_dispose__76210;
    id v25 = 0;
    id v12 = [v10 settings];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __94__MKFCKHome_Settings___settingModelsForHome_media_networkRouter_personManager_softwareUpdate___block_invoke;
    v14[3] = &unk_264A1C2A8;
    id v17 = &v32;
    uint64_t v18 = &v20;
    id v19 = &v26;
    uint64_t v16 = &v38;
    v14[4] = a1;
    id v15 = v11;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v14);

    *a3 = (id) v39[5];
    *a4 = (id) v33[5];
    *a5 = (id) v21[5];
    *a6 = (id) v27[5];

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }
}

void __94__MKFCKHome_Settings___settingModelsForHome_media_networkRouter_personManager_softwareUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = [v4 entity];
  id v6 = +[_MKFHomeMediaSetting entity];
  int v7 = [v5 isKindOfEntity:v6];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 48);
LABEL_9:
    objc_storeStrong((id *)(*(void *)(v8 + 8) + 40), a2);
    goto LABEL_10;
  }
  id v9 = +[_MKFHomeNetworkRouterSetting entity];
  int v10 = [v5 isKindOfEntity:v9];

  if (v10)
  {
    uint64_t v8 = *(void *)(a1 + 56);
    goto LABEL_9;
  }
  id v11 = +[_MKFHomePersonManagerSetting entity];
  int v12 = [v5 isKindOfEntity:v11];

  if (v12)
  {
    uint64_t v8 = *(void *)(a1 + 64);
    goto LABEL_9;
  }
  id v13 = +[_MKFHomeSoftwareUpdateSetting entity];
  int v14 = [v5 isKindOfEntity:v13];

  if (v14)
  {
    uint64_t v8 = *(void *)(a1 + 72);
    goto LABEL_9;
  }
  id v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = *(id *)(a1 + 32);
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    uint64_t v19 = *(void *)(a1 + 40);
    int v20 = 138543874;
    __int16 v21 = v18;
    __int16 v22 = 2112;
    uint64_t v23 = v19;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Unhandled setting model for home %@: %@", (uint8_t *)&v20, 0x20u);
  }
LABEL_10:
}

- (BOOL)_importSettingsIntoLocalModel:(id)a3 context:(id)a4
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v92 = 0;
  id v93 = 0;
  id v90 = 0;
  id v91 = 0;
  id v6 = a4;
  id v7 = a3;
  -[MKFCKHome _settingModelsForHome:media:networkRouter:personManager:softwareUpdate:]((uint64_t)self, v7, &v93, &v92, &v91, &v90);
  id v8 = v93;
  id v9 = v92;
  id v86 = v91;
  id v87 = v90;
  id v10 = v7;
  id v11 = (_MKFHomeMediaSetting *)v8;
  id v12 = v6;
  id v13 = v12;
  uint64_t v88 = v11;
  v89 = v9;
  if (!self)
  {

    id v82 = v10;
    id v29 = (_MKFHomeNetworkRouterSetting *)v9;
    id v83 = v13;
    goto LABEL_31;
  }
  int v14 = v11;
  if (!v11)
  {
    int v14 = -[_MKFHomeMediaSetting initWithContext:]([_MKFHomeMediaSetting alloc], "initWithContext:", v12, v86);
    id v15 = [v10 modelID];
    id v16 = +[HMDHomeMediaSettingsModel modelIDForHomeUUID:v15];
    [(_MKFHomeMediaSetting *)v14 setModelID:v16];

    id v17 = [(MKFCKHome *)self writerTimestamp];
    [(_MKFHomeMediaSetting *)v14 setWriterTimestamp:v17];

    [(_MKFHomeMediaSetting *)v14 setHome:v10];
  }
  uint64_t v18 = [(_MKFHomeMediaSetting *)v14 mediaPassword];
  uint64_t v19 = [(MKFCKHome *)self mediaPassword];
  char v20 = HMFEqualObjects();

  if ((v20 & 1) == 0)
  {
    __int16 v21 = [(MKFCKHome *)self mediaPassword];
    [(_MKFHomeMediaSetting *)v14 setMediaPassword:v21];
  }
  __int16 v22 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKHome mediaPeerToPeerEnabled](self, "mediaPeerToPeerEnabled"));
  uint64_t v23 = [(_MKFHomeMediaSetting *)v14 mediaPeerToPeerEnabled];
  char v24 = HMFEqualObjects();

  if ((v24 & 1) == 0) {
    [(_MKFHomeMediaSetting *)v14 setMediaPeerToPeerEnabled:v22];
  }
  id v25 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MKFCKHome mediaMinimumUserPrivilege](self, "mediaMinimumUserPrivilege"));
  uint64_t v26 = [(_MKFHomeMediaSetting *)v14 minimumMediaUserPrivilege];
  char v27 = HMFEqualObjects();

  if ((v27 & 1) == 0) {
    [(_MKFHomeMediaSetting *)v14 setMinimumMediaUserPrivilege:v25];
  }

  id v28 = v10;
  id v29 = (_MKFHomeNetworkRouterSetting *)v9;
  id v30 = v13;
  if (!v29)
  {
    id v29 = [[_MKFHomeNetworkRouterSetting alloc] initWithContext:v30];
    id v31 = [v28 modelID];
    uint64_t v32 = +[HMDHomeNetworkRouterSettingsModel modelIDForHomeUUID:v31];
    [(_MKFHomeNetworkRouterSetting *)v29 setModelID:v32];

    id v33 = [(MKFCKHome *)self writerTimestamp];
    [(_MKFHomeNetworkRouterSetting *)v29 setWriterTimestamp:v33];

    [(_MKFHomeNetworkRouterSetting *)v29 setHome:v28];
  }
  uint64_t v34 = [(MKFCKHome *)self activeNetworkRouter];
  id v35 = [(_MKFHomeNetworkRouterSetting *)v29 networkAccessory];
  id v36 = [v35 modelID];
  id v37 = [v34 modelID];
  char v38 = HMFEqualObjects();

  if ((v38 & 1) == 0)
  {
    if (v34)
    {
      uint64_t v39 = [v34 fetchLocalModelWithContext:v30];

      uint64_t v40 = (void *)MEMORY[0x230FBD990]();
      id v41 = self;
      char v42 = HMFGetOSLogHandle();
      id v43 = v42;
      if (v39)
      {
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          id v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v95 = v44;
          __int16 v96 = 2112;
          uint64_t v97 = v39;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Assigning new active network router: %@", buf, 0x16u);
        }
        goto LABEL_25;
      }
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        id v49 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v95 = v49;
        __int16 v96 = 2112;
        uint64_t v97 = (uint64_t)v34;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to find local network router matching cloud: %@", buf, 0x16u);
      }
    }
    else
    {
      __int16 v45 = (void *)MEMORY[0x230FBD990]();
      char v46 = self;
      id v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        id v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v95 = v48;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Removing active network router", buf, 0xCu);
      }
    }
    uint64_t v39 = 0;
LABEL_25:
    [(_MKFHomeNetworkRouterSetting *)v29 setNetworkAccessory:v39];
    id v35 = (void *)v39;
  }
  id v50 = [(MKFCKHome *)self minimumHomeKitVersionForNetworkRouterSupport];
  id v51 = [v50 versionString];

  id v52 = [(_MKFHomeNetworkRouterSetting *)v29 minimumNetworkRouterSupportHomeKitVersion];
  char v53 = HMFEqualObjects();

  if ((v53 & 1) == 0) {
    [(_MKFHomeNetworkRouterSetting *)v29 setMinimumNetworkRouterSupportHomeKitVersion:v51];
  }
  v54 = [(MKFCKHome *)self minimumHomeKitVersionForAccessoryNetworkProtectionChanges];
  char v55 = [v54 versionString];

  id v56 = [(_MKFHomeNetworkRouterSetting *)v29 minHomeKitVersionForAccessoryNetworkProtectionChange];
  char v57 = HMFEqualObjects();

  if ((v57 & 1) == 0) {
    [(_MKFHomeNetworkRouterSetting *)v29 setMinHomeKitVersionForAccessoryNetworkProtectionChange:v55];
  }

LABEL_31:
  id v58 = v10;
  id v59 = (_MKFHomePersonManagerSetting *)v86;
  id v60 = v13;
  id v61 = v60;
  if (self)
  {
    uint64_t v62 = v59;
    if (!v59)
    {
      uint64_t v62 = [[_MKFHomePersonManagerSetting alloc] initWithContext:v60];
      uint64_t v63 = [v58 modelID];
      uint64_t v64 = +[HMDHomePersonManagerSettingsModel modelIDForHomeUUID:v63];
      [(_MKFHomePersonManagerSetting *)v62 setModelID:v64];

      v65 = [(MKFCKHome *)self writerTimestamp];
      [(_MKFHomePersonManagerSetting *)v62 setWriterTimestamp:v65];

      [(_MKFHomePersonManagerSetting *)v62 setHome:v58];
    }
    id v66 = [(MKFCKHome *)self personDataZoneUUID];
    id v67 = [(_MKFHomePersonManagerSetting *)v62 zoneUUID];
    char v68 = HMFEqualObjects();

    if ((v68 & 1) == 0) {
      [(_MKFHomePersonManagerSetting *)v62 setZoneUUID:v66];
    }

    id v69 = v58;
    id v70 = (_MKFHomeSoftwareUpdateSetting *)v87;
    id v71 = v61;
    if (!v70)
    {
      id v70 = [[_MKFHomeSoftwareUpdateSetting alloc] initWithContext:v71];
      id v72 = [v69 modelID];
      id v73 = +[HMDHomeSettingsModel modelIDForHomeUUID:v72];
      [(_MKFHomeSoftwareUpdateSetting *)v70 setModelID:v73];

      id v74 = [(MKFCKHome *)self writerTimestamp];
      [(_MKFHomeSoftwareUpdateSetting *)v70 setWriterTimestamp:v74];

      [(_MKFHomeSoftwareUpdateSetting *)v70 setHome:v69];
    }
    v75 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKHome automaticSoftwareUpdateEnabled](self, "automaticSoftwareUpdateEnabled"));
    id v76 = [(_MKFHomeSoftwareUpdateSetting *)v70 automaticSoftwareUpdateEnabled];
    char v77 = HMFEqualObjects();

    if ((v77 & 1) == 0) {
      [(_MKFHomeSoftwareUpdateSetting *)v70 setAutomaticSoftwareUpdateEnabled:v75];
    }
    v78 = objc_msgSend(NSNumber, "numberWithBool:", -[MKFCKHome automaticThirdPartyAccessorySoftwareUpdateEnabled](self, "automaticThirdPartyAccessorySoftwareUpdateEnabled"));
    id v79 = [(_MKFHomeSoftwareUpdateSetting *)v70 automaticThirdPartyAccessorySoftwareUpdateEnabled];
    char v80 = HMFEqualObjects();

    if ((v80 & 1) == 0) {
      [(_MKFHomeSoftwareUpdateSetting *)v70 setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:v78];
    }
  }
  else
  {

    id v84 = v58;
    id v70 = (_MKFHomeSoftwareUpdateSetting *)v87;
    id v85 = v61;
  }

  return 1;
}

- (BOOL)_exportRoomsFromLocalModel:(id)a3 context:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MKFCKHome *)self _exportRelationshipsFromLocalHome:v6 localRelationshipName:@"rooms_" context:v7];
  if (v8)
  {
    id v9 = [v6 defaultRoom];
    id v10 = [(MKFCKHome *)self defaultRoom];

    if (!v10)
    {
      id v11 = +[MKFCKModel fetchWithLocalModel:v9 context:v7];
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = self;
      int v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = HMFGetLogIdentifier();
        int v17 = 138543618;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        char v20 = v11;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Setting default room during export: %@", (uint8_t *)&v17, 0x16u);
      }
      [(MKFCKHome *)v13 setDefaultRoom:v11];
    }
  }

  return v8;
}

- (BOOL)_importRoomsIntoLocalModel:(id)a3 context:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(MKFCKHome *)self _importRelationshipsIntoLocalModel:v6 localRelationshipName:@"rooms_" context:v7])
  {
    BOOL v8 = [(MKFCKHome *)self defaultRoom];
    id v9 = v8;
    BOOL v10 = v8 != 0;
    if (v8)
    {
      id v11 = [v8 fetchLocalModelWithContext:v7];
      id v12 = [v6 defaultRoom];

      if (!v12)
      {
        id v13 = (void *)MEMORY[0x230FBD990]();
        int v14 = self;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          id v16 = HMFGetLogIdentifier();
          int v22 = 138543618;
          uint64_t v23 = v16;
          __int16 v24 = 2112;
          id v25 = v11;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Setting default room during import: %@", (uint8_t *)&v22, 0x16u);
        }
        [v6 setDefaultRoom:v11];
      }
    }
    else
    {
      int v17 = (void *)MEMORY[0x230FBD990]();
      uint64_t v18 = self;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        char v20 = HMFGetLogIdentifier();
        int v22 = 138543618;
        uint64_t v23 = v20;
        __int16 v24 = 2112;
        id v25 = v6;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Can't assign default room during import because the record hasn't downloaded yet: %@", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_exportApplicationDataFromLocalModel:(id)a3 context:(id)a4
{
  id v5 = +[_MKFApplicationData appDataDictionaryForContainer:](_MKFApplicationData, "appDataDictionaryForContainer:", a3, a4);
  id v6 = [(MKFCKHome *)self applicationData];
  char v7 = HMFEqualObjects();

  if ((v7 & 1) == 0) {
    [(MKFCKHome *)self setApplicationData:v5];
  }

  return 1;
}

- (BOOL)_importApplicationDataIntoLocalModel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = [(MKFCKHome *)self applicationData];
  +[_MKFApplicationData setAppDataDictionary:v6 forContainer:v5];

  return 1;
}

- (BOOL)_exportTriggersFromLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _exportRelationshipsFromLocalHome:a3 localRelationshipName:@"triggers_" context:a4];
}

- (BOOL)_importTriggersIntoLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _importRelationshipsIntoLocalModel:a3 localRelationshipName:@"triggers_" context:a4];
}

- (BOOL)_exportScenesFromLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _exportRelationshipsFromLocalHome:a3 localRelationshipName:@"actionSets_" context:a4];
}

- (BOOL)_importScenesIntoLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _importRelationshipsIntoLocalModel:a3 localRelationshipName:@"actionSets_" context:a4];
}

- (BOOL)_exportResidentsFromLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _exportRelationshipsFromLocalHome:a3 localRelationshipName:@"residents_" context:a4];
}

- (BOOL)_importResidentsIntoLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _importRelationshipsIntoLocalModel:a3 localRelationshipName:@"residents_" context:a4];
}

- (BOOL)_exportMatterKeyValueStoreFromLocalModel:(id)a3 context:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [v4 matterKeyValueStore];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v21 + 1) + 8 * v10);
        self;
        if (([v11 hasPrefix:@"HMDHMMKVS."] & 1) != 0
          || ([v11 hasPrefix:@"CHIPPluginStorageKey_"] & 1) != 0
          || ([v11 hasPrefix:@"DeviceTopologyDict"] & 1) != 0
          || ([v11 hasPrefix:@"f/"] & 1) != 0
          || ([v11 hasPrefix:@"g/"] & 1) != 0
          || [v11 isEqualToString:@"IPK"])
        {

LABEL_13:
          id v12 = [v4 matterKeyValueStore];
          id v13 = [v12 objectForKeyedSubscript:v11];
          [v5 setObject:v13 forKeyedSubscript:v11];

          goto LABEL_14;
        }
        int v14 = [v11 hasPrefix:@"HMD.MTRPlugin"];

        if (v14) {
          goto LABEL_13;
        }
LABEL_14:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v15 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v8 = v15;
    }
    while (v15);
  }

  id v16 = [(MKFCKHome *)self matterKeyValueStore];
  char v17 = HMFEqualObjects();

  if ((v17 & 1) == 0)
  {
    uint64_t v18 = (void *)[v5 copy];
    [(MKFCKHome *)self setMatterKeyValueStore:v18];
  }
  return 1;
}

- (BOOL)_importMatterKeyValueStoreIntoLocalModel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = [v5 matterKeyValueStore];
  uint64_t v7 = [(MKFCKHome *)self matterKeyValueStore];
  char v8 = HMFEqualObjects();

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [(MKFCKHome *)self matterKeyValueStore];
    [v5 setMatterKeyValueStore:v9];
  }
  return 1;
}

- (BOOL)_exportZonesFromLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _exportRelationshipsFromLocalHome:a3 localRelationshipName:@"zones_" context:a4];
}

- (BOOL)_importZonesIntoLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _importRelationshipsIntoLocalModel:a3 localRelationshipName:@"zones_" context:a4];
}

- (BOOL)_exportAccessoriesFromLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _exportRelationshipsFromLocalHome:a3 localRelationshipName:@"accessories_" context:a4];
}

- (BOOL)_importAccessoriesIntoLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _importRelationshipsIntoLocalModel:a3 localRelationshipName:@"accessories_" context:a4];
}

+ (id)_balanceFakeZonesForHome:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  uint32_t v8 = arc4random_uniform(0);
  if (v8)
  {
    uint64_t v9 = v8;
    do
    {
      uint64_t v10 = [[MKFCKZone alloc] initWithContext:v6];
      [v7 addObject:v10];
      id v11 = [MEMORY[0x263F08C38] UUID];
      [(MKFCKZone *)v10 setModelID:v11];

      [(MKFCKZone *)v10 setHome:v5];
      uint32_t v12 = arc4random_uniform(0x14u);
      id v13 = randomStringWithLength(v12);
      [(MKFCKZone *)v10 setName:v13];

      uint64_t v22 = 0;
      long long v23 = &v22;
      uint64_t v24 = 0x2020000000;
      uint64_t v25 = 0;
      int v14 = [v5 rooms];
      uint64_t v15 = arc4random_uniform([v14 count] - 1);

      uint64_t v25 = v15;
      if (v23[3])
      {
        id v16 = [v5 rooms];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __59__MKFCKHome_FakeRecords___balanceFakeZonesForHome_context___block_invoke;
        v19[3] = &unk_264A25A20;
        char v20 = v10;
        long long v21 = &v22;
        objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);
      }
      _Block_object_dispose(&v22, 8);

      --v9;
    }
    while (v9);
  }
  char v17 = (void *)[v7 copy];

  return v17;
}

void __59__MKFCKHome_FakeRecords___balanceFakeZonesForHome_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v5 = [v10 homeDefault];
  if (v5)
  {

    id v6 = v10;
  }
  else
  {
    uint64_t v7 = [v10 zones];

    id v6 = v10;
    if (!v7)
    {
      [*(id *)(a1 + 32) addRoomsObject:v10];
      id v6 = v10;
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void *)(v8 + 24) - 1;
      *(void *)(v8 + 24) = v9;
      if (!v9) {
        *a3 = 1;
      }
    }
  }
}

+ (id)_balanceFakeUsersForHome:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [[MKFCKUser alloc] initWithContext:v7];
  [v8 addObject:v9];
  [(MKFCKUser *)v9 setHome:v6];
  [a1 _setPropertiesOnUser:v9 isOwner:1];

  uint32_t v10 = arc4random_uniform(2u);
  if (v10)
  {
    uint64_t v11 = v10;
    do
    {
      uint32_t v12 = [[MKFCKUser alloc] initWithContext:v7];
      [v8 addObject:v12];
      [(MKFCKUser *)v12 setHome:v6];
      [a1 _setPropertiesOnUser:v12 isOwner:0];

      --v11;
    }
    while (v11);
  }
  id v13 = (void *)[v8 copy];

  return v13;
}

+ (void)_setPropertiesOnUser:(id)a3 isOwner:(BOOL)a4
{
  BOOL v4 = a4;
  id v16 = a3;
  id v5 = [v16 home];
  uint32_t v6 = arc4random_uniform(0x14u);
  id v7 = randomStringWithLength(v6);
  [v16 setAccountHandle:v7];

  [v16 setAnnounceAccessLevel:arc4random_uniform(4u)];
  [v16 setCamerasAccessLevel:arc4random_uniform(4u)];
  uint64_t v8 = [MEMORY[0x263F08C38] UUID];
  [v16 setModelID:v8];

  [v16 setPrivilege:arc4random_uniform(4u)];
  [v16 setRemoteAccessAllowed:arc4random_uniform(1u) != 0];
  uint64_t v9 = [MEMORY[0x263F425E8] pairingIdentity];
  id v10 = objc_alloc(MEMORY[0x263F35A78]);
  uint64_t v11 = [MEMORY[0x263F08C38] UUID];
  uint32_t v12 = [v11 UUIDString];
  id v13 = [v9 publicKey];
  if (v4)
  {
    int v14 = [v9 privateKey];
  }
  else
  {
    int v14 = 0;
  }
  uint64_t v15 = (void *)[v10 initWithIdentifier:v12 publicKey:v13 privateKey:v14 permissions:v4];
  [v16 setPairingIdentity:v15];

  if (v4)
  {

    [v5 setOwner:v16];
    [v16 setOwnedHome:v5];
  }
  else
  {
  }
}

+ (id)_balanceFakeTriggersForHome:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  uint32_t v8 = arc4random_uniform(2u);
  if (v8)
  {
    uint64_t v9 = v8;
    do
    {
      id v10 = [[MKFCKEventTrigger alloc] initWithContext:v6];
      [v7 addObject:v10];
      uint64_t v11 = [MEMORY[0x263F08C38] UUID];
      [(MKFCKEventTrigger *)v10 setModelID:v11];

      [(MKFCKEventTrigger *)v10 setHome:v5];
      [(MKFCKEventTrigger *)v10 setAutoDelete:arc4random_uniform(1u) != 0];
      uint32_t v12 = randomStringWithLength(20);
      [(MKFCKEventTrigger *)v10 setConfiguredName:v12];

      [(MKFCKEventTrigger *)v10 setEnabled:arc4random_uniform(1u) != 0];
      [(MKFCKEventTrigger *)v10 setExecuteOnce:arc4random_uniform(1u) != 0];
      id v13 = randomStringWithLength(20);
      [(MKFCKEventTrigger *)v10 setName:v13];

      int v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"foo = %@", &unk_26E4728F8];
      [(MKFCKEventTrigger *)v10 setCondition:v14];

      [(MKFCKEventTrigger *)v10 setEvents:&unk_26E4743E0];
      uint64_t v43 = 0;
      id v44 = &v43;
      uint64_t v45 = 0x2020000000;
      uint64_t v46 = 0;
      uint64_t v15 = [v5 scenes];
      uint64_t v16 = arc4random_uniform([v15 count]);

      uint64_t v46 = v16;
      if (v44[3])
      {
        char v17 = [v5 scenes];
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke;
        v40[3] = &unk_264A259D0;
        id v41 = v10;
        char v42 = &v43;
        objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v40);
      }
      uint64_t v36 = 0;
      id v37 = &v36;
      uint64_t v38 = 0x2020000000;
      uint64_t v39 = 0;
      uint64_t v18 = [v5 accessories];
      uint64_t v19 = arc4random_uniform([v18 count]);

      uint64_t v39 = v19;
      if (v37[3])
      {
        char v20 = [v5 accessories];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke_2;
        v33[3] = &unk_264A259A8;
        uint64_t v34 = v10;
        id v35 = &v36;
        objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);
      }
      uint64_t v29 = 0;
      id v30 = &v29;
      uint64_t v31 = 0x2020000000;
      uint64_t v32 = 0;
      long long v21 = [v5 users];
      uint64_t v22 = arc4random_uniform([v21 count]);

      uint64_t v32 = v22;
      if (v30[3])
      {
        long long v23 = [v5 users];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke_3;
        v26[3] = &unk_264A259F8;
        char v27 = v10;
        id v28 = &v29;
        objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v26);
      }
      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v43, 8);

      --v9;
    }
    while (v9);
  }
  uint64_t v24 = (void *)[v7 copy];

  return v24;
}

uint64_t __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) addScenesObject:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v6 + 24) - 1;
  *(void *)(v6 + 24) = v7;
  if (!v7) {
    *a3 = 1;
  }
  return result;
}

uint64_t __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) addAccessoriesObject:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v6 + 24) - 1;
  *(void *)(v6 + 24) = v7;
  if (!v7) {
    *a3 = 1;
  }
  return result;
}

uint64_t __62__MKFCKHome_FakeRecords___balanceFakeTriggersForHome_context___block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) addUsersObject:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v6 + 24) - 1;
  *(void *)(v6 + 24) = v7;
  if (!v7) {
    *a3 = 1;
  }
  return result;
}

+ (id)_balanceFakeScenesForHome:(id)a3 context:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  uint32_t v8 = arc4random_uniform(0xAu);
  if (v8 <= 4) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = v8;
  }
  do
  {
    id v10 = [[MKFCKScene alloc] initWithContext:v6];
    [v7 addObject:v10];
    uint64_t v11 = [MEMORY[0x263F08C38] UUID];
    [(MKFCKScene *)v10 setModelID:v11];

    [(MKFCKScene *)v10 setHome:v5];
    id v30 = @"foo";
    uint32_t v12 = [MEMORY[0x263F08C38] UUID];
    uint64_t v31 = v12;
    id v13 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v32[0] = v13;
    int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
    [(MKFCKScene *)v10 setActions:v14];

    [(MKFCKScene *)v10 setApplicationData:MEMORY[0x263EFFA78]];
    uint32_t v15 = arc4random_uniform(0x14u);
    uint64_t v16 = randomStringWithLength(v15);
    [(MKFCKScene *)v10 setName:v16];

    uint32_t v17 = arc4random_uniform(0x14u);
    uint64_t v18 = randomStringWithLength(v17);
    [(MKFCKScene *)v10 setType:v18];

    uint64_t v26 = 0;
    char v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    uint64_t v19 = [v5 accessories];
    LODWORD(v13) = arc4random_uniform([v19 count]);

    uint64_t v29 = v13;
    if (v27[3])
    {
      char v20 = [v5 accessories];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __60__MKFCKHome_FakeRecords___balanceFakeScenesForHome_context___block_invoke;
      v23[3] = &unk_264A259A8;
      uint64_t v24 = v10;
      uint64_t v25 = &v26;
      objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    }
    _Block_object_dispose(&v26, 8);

    --v9;
  }
  while (v9);
  long long v21 = (void *)[v7 copy];

  return v21;
}

uint64_t __60__MKFCKHome_FakeRecords___balanceFakeScenesForHome_context___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) addAccessoriesObject:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v6 + 24) - 1;
  *(void *)(v6 + 24) = v7;
  if (!v7) {
    *a3 = 1;
  }
  return result;
}

+ (id)_balanceFakeRoomsForHome:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  uint32_t v8 = [[MKFCKRoom alloc] initWithContext:v6];
  [v7 addObject:v8];
  uint64_t v9 = [MEMORY[0x263F08C38] UUID];
  [(MKFCKRoom *)v8 setModelID:v9];

  [(MKFCKRoom *)v8 setHome:v5];
  [v5 setDefaultRoom:v8];

  uint32_t v10 = arc4random_uniform(8u);
  if (v10)
  {
    uint64_t v11 = v10;
    do
    {
      uint32_t v12 = [[MKFCKRoom alloc] initWithContext:v6];
      [v7 addObject:v12];
      id v13 = [MEMORY[0x263F08C38] UUID];
      [(MKFCKRoom *)v12 setModelID:v13];

      [(MKFCKRoom *)v12 setHome:v5];
      uint32_t v14 = arc4random_uniform(0x14u);
      uint32_t v15 = randomStringWithLength(v14);
      [(MKFCKRoom *)v12 setName:v15];

      --v11;
    }
    while (v11);
  }
  uint64_t v16 = (void *)[v7 copy];

  return v16;
}

+ (id)_balanceFakeMediaAccessoriesForHome:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint32_t v8 = [MEMORY[0x263EFF980] array];
  uint32_t v9 = arc4random_uniform(2u);
  if (v9)
  {
    uint64_t v10 = v9;
    do
    {
      uint64_t v11 = [[MKFCKAppleMediaAccessory alloc] initWithContext:v7];
      [v8 addObject:v11];
      [(MKFCKAppleMediaAccessory *)v11 setHome:v6];
      [a1 _setCommonPropertiesOnAccessory:v11];
      uint32_t v12 = [MEMORY[0x263F425E8] pairingIdentity];
      [(MKFCKAppleMediaAccessory *)v11 setPairingIdentity:v12];

      --v10;
    }
    while (v10);
  }
  id v13 = (void *)[v8 copy];

  return v13;
}

+ (id)_balanceFakeHAPAccessoriesForHome:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint32_t v8 = [MEMORY[0x263EFF980] array];
  uint32_t v9 = arc4random_uniform(0x14u);
  if (v9)
  {
    uint64_t v10 = v9;
    do
    {
      uint64_t v11 = [[MKFCKHAPAccessory alloc] initWithContext:v7];
      [v8 addObject:v11];
      [(MKFCKHAPAccessory *)v11 setHome:v6];
      [a1 _setCommonPropertiesOnAccessory:v11];
      uint32_t v12 = [NSNumber numberWithUnsignedInteger:arc4random_uniform(6u)];
      [(MKFCKHAPAccessory *)v11 setCertificationStatus:v12];

      [(MKFCKHAPAccessory *)v11 setHasOnboardedForNaturalLighting:arc4random_uniform(1u) != 0];
      id v13 = HMFRandomDataWithLength();
      [(MKFCKHAPAccessory *)v11 setPublicKey:v13];

      uint32_t v14 = NSString;
      uint32_t v15 = [(MKFCKHAPAccessory *)v11 identifier];
      uint64_t v16 = [v14 stringWithFormat:@"%@+1", v15];
      [(MKFCKHAPAccessory *)v11 setUniqueIdentifier:v16];

      --v10;
    }
    while (v10);
  }
  uint32_t v17 = (void *)[v8 copy];

  return v17;
}

+ (void)_setCommonPropertiesOnAccessory:(id)a3
{
  id v19 = a3;
  id v3 = [v19 home];
  [v19 setApplicationData:MEMORY[0x263EFFA78]];
  uint32_t v4 = arc4random_uniform(0x14u);
  id v5 = randomStringWithLength(v4);
  [v19 setConfiguredName:v5];

  id v6 = randomStringWithLength(14);
  [v19 setIdentifier:v6];

  id v7 = [NSNumber numberWithUnsignedInteger:arc4random_uniform(0x40u)];
  [v19 setInitialCategory:v7];

  uint32_t v8 = arc4random_uniform(0x14u);
  uint32_t v9 = randomStringWithLength(v8);
  [v19 setInitialManufacturer:v9];

  uint32_t v10 = arc4random_uniform(0x14u);
  uint64_t v11 = randomStringWithLength(v10);
  [v19 setInitialModel:v11];

  uint32_t v12 = [MEMORY[0x263F08C38] UUID];
  [v19 setModelID:v12];

  id v13 = randomStringWithLength(16);
  [v19 setProductData:v13];

  uint32_t v14 = arc4random_uniform(0x14u);
  uint32_t v15 = randomStringWithLength(v14);
  [v19 setSerialNumber:v15];

  if (arc4random_uniform(1u))
  {
    [v19 setNetworkClientIdentifier:arc4random_uniform(0x20u)];
    [v19 setNetworkClientLAN:arc4random_uniform(0x20u)];
    uint64_t v16 = [MEMORY[0x263F08C38] UUID];
    [v19 setNetworkRouterUUID:v16];
  }
  uint32_t v17 = [v3 rooms];
  uint64_t v18 = [v17 anyObject];
  [v19 setRoom:v18];
}

+ (id)_createFakeHomeInPersistentStore:(id)a3 context:(id)a4
{
  v37[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFF980];
  id v8 = a3;
  uint32_t v9 = [v7 array];
  uint32_t v10 = [MEMORY[0x263F08C38] UUID];
  uint64_t v11 = +[MKFCKHome createWithModelID:v10 persistentStore:v8 context:v6];

  [v9 addObject:v11];
  v36[0] = @"foo";
  uint32_t v12 = randomStringWithLength(32);
  v37[0] = v12;
  v36[1] = @"bar";
  id v13 = [NSNumber numberWithUnsignedInteger:arc4random_uniform(0x400u)];
  v37[1] = v13;
  v36[2] = @"baz";
  uint64_t v34 = &stru_26E2EB898;
  uint32_t v14 = [MEMORY[0x263F08C38] UUID];
  id v35 = v14;
  uint32_t v15 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v37[2] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
  [v11 setApplicationData:v16];

  uint32_t v17 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)(86400 * (unint64_t)arc4random_uniform(0x800u))];
  [v11 setCreationDate:v17];

  [v11 setDoorbellChimeEnabled:arc4random_uniform(1u) != 0];
  uint64_t v18 = [MEMORY[0x263EFF910] now];
  [v11 setFirstHAPAccessoryAddedDate:v18];

  [v11 setHasAnyUserAcknowledgedCameraRecordingOnboarding:arc4random_uniform(1u) != 0];
  [v11 setHasOnboardedForAccessCode:arc4random_uniform(1u) != 0];
  [v11 setHasOnboardedForWalletKey:arc4random_uniform(1u) != 0];
  [v11 setHomeManagerApplicationData:MEMORY[0x263EFFA78]];
  [v11 setMultiUserEnabled:arc4random_uniform(1u) != 0];
  uint32_t v19 = arc4random_uniform(0x14u);
  char v20 = randomStringWithLength(v19);
  [v11 setName:v20];

  long long v21 = +[HMDHomeNFCReaderKey createRandomKey];
  [v11 setNfcReaderKey:v21];

  uint64_t v22 = [MEMORY[0x263F08C38] UUID];
  [v11 setPersonDataZoneUUID:v22];

  [v11 setPrimaryHomeCounter:arc4random_uniform(0x40u)];
  [v11 setAutomaticSoftwareUpdateEnabled:arc4random_uniform(1u) != 0];
  [v11 setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:arc4random_uniform(1u) != 0];
  [v11 setMediaMinimumUserPrivilege:arc4random_uniform(4u)];
  uint32_t v23 = arc4random_uniform(0x14u);
  uint64_t v24 = randomStringWithLength(v23);
  [v11 setMediaPassword:v24];

  [v11 setMediaPeerToPeerEnabled:arc4random_uniform(1u) != 0];
  [v11 setDidOnboardMemory:arc4random_uniform(1u) != 0];
  [v11 setMemoryEnabled:arc4random_uniform(1u) != 0];
  if (arc4random_uniform(1u))
  {
    [v11 setNetworkProtectionGroups:&unk_26E4743C8];
    [v11 setNetworkProtectionMode:arc4random_uniform(4u)];
  }
  uint64_t v25 = [a1 _balanceFakeRoomsForHome:v11 context:v6];
  [v9 addObjectsFromArray:v25];

  uint64_t v26 = [a1 _balanceFakeUsersForHome:v11 context:v6];
  [v9 addObjectsFromArray:v26];

  char v27 = [a1 _balanceFakeZonesForHome:v11 context:v6];
  [v9 addObjectsFromArray:v27];

  uint64_t v28 = [a1 _balanceFakeHAPAccessoriesForHome:v11 context:v6];
  [v9 addObjectsFromArray:v28];

  uint64_t v29 = [a1 _balanceFakeMediaAccessoriesForHome:v11 context:v6];
  [v9 addObjectsFromArray:v29];

  id v30 = [a1 _balanceFakeScenesForHome:v11 context:v6];
  [v9 addObjectsFromArray:v30];

  uint64_t v31 = [a1 _balanceFakeTriggersForHome:v11 context:v6];
  [v9 addObjectsFromArray:v31];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __67__MKFCKHome_FakeRecords___createFakeHomeInPersistentStore_context___block_invoke;
  v33[3] = &__block_descriptor_40_e27_v32__0__MKFCKModel_8Q16_B24l;
  void v33[4] = a1;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);

  return v11;
}

void __67__MKFCKHome_FakeRecords___createFakeHomeInPersistentStore_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint32_t v4 = (void *)MEMORY[0x230FBD990]([v3 convertToFakeModel]);
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint32_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Created fake model: %@", (uint8_t *)&v8, 0x16u);
  }
}

+ (void)_maybeDeleteFakeHomes:(id)a3 context:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 count];
  uint32_t v9 = [MEMORY[0x263EFF980] arrayWithCapacity:v8];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __56__MKFCKHome_FakeRecords___maybeDeleteFakeHomes_context___block_invoke;
  v20[3] = &unk_264A25940;
  id v10 = v9;
  id v21 = v10;
  uint32_t v19 = v6;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);
  [v10 sortUsingComparator:&__block_literal_global_195120];
  if ([v10 count]) {
    BOOL v11 = v8 >= 4;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    unint64_t v12 = v8 - 1;
    do
    {
      id v13 = [v10 lastObject];
      uint32_t v14 = (void *)MEMORY[0x230FBD990]([v10 removeLastObject]);
      id v15 = a1;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint32_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint32_t v23 = v17;
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Pruning fake home: %@", buf, 0x16u);
      }
      [v7 deleteObject:v13];

      if (![v10 count]) {
        break;
      }
    }
    while (v12-- > 3);
  }
}

void __56__MKFCKHome_FakeRecords___maybeDeleteFakeHomes_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFake]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __56__MKFCKHome_FakeRecords___maybeDeleteFakeHomes_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 flags];
  id v6 = [v4 flags];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (void)_maybeCreateFakeHomes:(id)a3 context:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 count];
  unint64_t v9 = v8;
  if ((v8 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    unint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)uint64_t v28 = 138543618;
      *(void *)&v28[4] = v13;
      *(_WORD *)&v28[12] = 2048;
      *(void *)&v28[14] = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Not creating or deleting any fake homes as home count is within normal range: %lu", v28, 0x16u);
    }
LABEL_22:

    goto LABEL_23;
  }
  if (v8 <= 2) {
    unint64_t v14 = 2 - v8;
  }
  else {
    unint64_t v14 = 0;
  }
  uint32_t v15 = arc4random_uniform(3 - v8);
  if (v14 <= v15) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = v14;
  }
  if (!v16)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      char v27 = HMFGetLogIdentifier();
      *(_DWORD *)uint64_t v28 = 138543362;
      *(void *)&v28[4] = v27;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Not creating any fake homes", v28, 0xCu);
    }
    goto LABEL_22;
  }
  uint32_t v17 = objc_msgSend(v7, "hmd_coreData");
  uint64_t v18 = [v17 cloudPrivateStore];

  uint32_t v19 = (void *)MEMORY[0x230FBD990]();
  id v20 = a1;
  id v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = HMFGetLogIdentifier();
    uint32_t v23 = "";
    *(_DWORD *)uint64_t v28 = 138543874;
    *(void *)&v28[4] = v22;
    if (v16 > 1) {
      uint32_t v23 = "s";
    }
    *(_WORD *)&v28[12] = 2048;
    *(void *)&v28[14] = v16;
    __int16 v29 = 2080;
    id v30 = v23;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Creating %lu fake home%s", v28, 0x20u);
  }
  for (unint64_t i = 0; i < v16; ++i)
    id v25 = (id)objc_msgSend(v20, "_createFakeHomeInPersistentStore:context:", v18, v7, *(_OWORD *)v28);

LABEL_23:
}

+ (void)_rebalanceFakeHomesWithContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (isInternalBuild() && (objc_msgSend(v4, "hmd_fakeRecordsEnabled") & 1) == 0)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = a1;
    uint32_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint32_t v19 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Fake record injection disabled, this had better be a unit test!", buf, 0xCu);
    }
  }
  else
  {
    id v5 = [a1 fetchRequest];
    id v6 = +[MKFCKModel defaultPreloadedProperties];
    [v5 setPropertiesToFetch:v6];

    [v5 setFetchBatchSize:3];
    id v17 = 0;
    id v7 = [v4 executeFetchRequest:v5 error:&v17];
    id v8 = v17;
    if (v7)
    {
      if ([v7 count])
      {
        if ((unint64_t)[v7 count] > 3) {
          [a1 _maybeDeleteFakeHomes:v7 context:v4];
        }
        else {
          [a1 _maybeCreateFakeHomes:v7 context:v4];
        }
      }
    }
    else
    {
      unint64_t v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = a1;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        unint64_t v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint32_t v19 = v12;
        __int16 v20 = 2114;
        id v21 = v8;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch other homes when balancing fake homes: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (BOOL)_exportInvitationOutgoingFromLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _exportRelationshipsFromLocalHome:a3 localRelationshipName:@"invitations_" context:a4];
}

- (BOOL)_importInvitationOutgoingIntoLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _importRelationshipsIntoLocalModel:a3 localRelationshipName:@"invitations_" context:a4];
}

- (BOOL)_exportGuestsFromLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _exportRelationshipsFromLocalHome:a3 localRelationshipName:@"guests_" context:a4];
}

- (BOOL)_importGuestsIntoLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _importRelationshipsIntoLocalModel:a3 localRelationshipName:@"guests_" context:a4];
}

- (BOOL)_exportServiceGroupsFromLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _exportRelationshipsFromLocalHome:a3 localRelationshipName:@"serviceGroups_" context:a4];
}

- (BOOL)_importServiceGroupsIntoLocalModel:(id)a3 context:(id)a4
{
  return [(MKFCKHome *)self _importRelationshipsIntoLocalModel:a3 localRelationshipName:@"serviceGroups_" context:a4];
}

- (BOOL)_exportPinCodesFromLocalModel:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  if ([(MKFCKHome *)self _exportGuestAccessCodesFromLocalModel:v6 context:v7])
  {
    BOOL v8 = [(MKFCKHome *)self _exportRemovedUserAccessCodesFromLocalModel:v6 context:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_exportRemovedUserAccessCodesFromLocalModel:(id)a3 context:(id)a4
{
  id v5 = [a3 removedAccessCodes];
  id v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  id v7 = [(MKFCKHome *)self removedUserAccessCodes];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__MKFCKHome_PinCodes___exportRemovedUserAccessCodesFromLocalModel_context___block_invoke;
  v15[3] = &unk_264A2CC68;
  id v8 = v6;
  id v16 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__MKFCKHome_PinCodes___exportRemovedUserAccessCodesFromLocalModel_context___block_invoke_2;
  v13[3] = &unk_264A2CCB8;
  v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
  id v10 = [(MKFCKHome *)self removedUserAccessCodes];
  char v11 = HMFEqualObjects();

  if ((v11 & 1) == 0) {
    [(MKFCKHome *)self setRemovedUserAccessCodes:v9];
  }

  return 1;
}

void __75__MKFCKHome_PinCodes___exportRemovedUserAccessCodesFromLocalModel_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((id)*MEMORY[0x263EFFD08] == v5) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

void __75__MKFCKHome_PinCodes___exportRemovedUserAccessCodesFromLocalModel_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 accessCode];
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [v3 hh2ModelID];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if ((void *)*MEMORY[0x263EFFD08] == v7)
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = *(id *)(a1 + 32);
      uint32_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        __int16 v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v24;
        __int16 v33 = 2112;
        id v34 = v3;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Not exporting %@ as it is marked as tomb stoned record.", buf, 0x16u);
      }
    }
    else
    {
      id v8 = objc_opt_class();
      id v9 = [v3 userID];
      id v10 = [v3 userModelID];
      char v11 = [v3 userName];
      unint64_t v12 = [v3 dateRemoved];
      id v13 = [v8 _encodeRemovedUserInfoWithUserID:v9 removedUserModelID:v10 userName:v11 dateRemoved:v12];

      if (v13)
      {
        v29[0] = @"a";
        v29[1] = @"ru";
        v30[0] = v4;
        v30[1] = v13;
        id v14 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
        uint32_t v15 = *(void **)(a1 + 40);
        id v16 = [v3 hh2ModelID];
        [v15 setObject:v14 forKeyedSubscript:v16];
      }
      else
      {
        id v25 = (void *)MEMORY[0x230FBD990]();
        id v26 = *(id *)(a1 + 32);
        char v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v32 = v28;
          __int16 v33 = 2112;
          id v34 = v3;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Not exporting %@ could not encode removed user info", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = *(id *)(a1 + 32);
    uint32_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v20;
      __int16 v33 = 2112;
      id v34 = v3;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Not exporting %@ as access code is nil", buf, 0x16u);
    }
  }
}

- (BOOL)_exportGuestAccessCodesFromLocalModel:(id)a3 context:(id)a4
{
  id v5 = [a3 guestAccessCodes];
  id v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  id v7 = [(MKFCKHome *)self guestAccessCodes];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__MKFCKHome_PinCodes___exportGuestAccessCodesFromLocalModel_context___block_invoke;
  v15[3] = &unk_264A2CC68;
  id v8 = v6;
  id v16 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v15];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__MKFCKHome_PinCodes___exportGuestAccessCodesFromLocalModel_context___block_invoke_2;
  v13[3] = &unk_264A2CC90;
  v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
  id v10 = [(MKFCKHome *)self guestAccessCodes];
  char v11 = HMFEqualObjects();

  if ((v11 & 1) == 0) {
    [(MKFCKHome *)self setGuestAccessCodes:v9];
  }

  return 1;
}

void __69__MKFCKHome_PinCodes___exportGuestAccessCodesFromLocalModel_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((id)*MEMORY[0x263EFFD08] == v5) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

void __69__MKFCKHome_PinCodes___exportGuestAccessCodesFromLocalModel_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 accessCode];
  if (v4
    && (id v5 = (void *)v4,
        [v3 label],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v3 hh2ModelID];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if ((void *)*MEMORY[0x263EFFD08] == v9)
    {
      id v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = *(id *)(a1 + 32);
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        int v26 = 138543618;
        char v27 = v25;
        __int16 v28 = 2112;
        id v29 = v3;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Not exporting %@ as it is marked as tomb stoned record.", (uint8_t *)&v26, 0x16u);
      }
    }
    else
    {
      id v10 = [MEMORY[0x263EFF9A0] dictionary];
      char v11 = [v3 accessCode];
      [v10 setObject:v11 forKeyedSubscript:@"a"];

      unint64_t v12 = [v3 label];
      [v10 setObject:v12 forKeyedSubscript:@"l"];

      id v13 = [v3 userUniqueIDForAccessories];

      if (v13)
      {
        id v14 = [v3 userUniqueIDForAccessories];
        [v10 setObject:v14 forKeyedSubscript:@"uu"];
      }
      uint32_t v15 = (void *)[v10 copy];
      id v16 = *(void **)(a1 + 40);
      id v17 = [v3 hh2ModelID];
      [v16 setObject:v15 forKeyedSubscript:v17];
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 32);
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      int v26 = 138543618;
      char v27 = v21;
      __int16 v28 = 2112;
      id v29 = v3;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not exporting %@ as access code or label is nil", (uint8_t *)&v26, 0x16u);
    }
  }
}

- (BOOL)_importPinCodesIntoLocalModel:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  if ([(MKFCKHome *)self _importGuestAccessCodesIntoLocalModel:v6 context:v7])
  {
    BOOL v8 = [(MKFCKHome *)self _importRemovedUserAccessCodesIntoLocalModel:v6 context:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_importRemovedUserAccessCodesIntoLocalModel:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  BOOL v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = [v6 removedAccessCodes];
  id v10 = objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));

  char v11 = [v6 removedAccessCodes];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __75__MKFCKHome_PinCodes___importRemovedUserAccessCodesIntoLocalModel_context___block_invoke;
  v27[3] = &unk_264A2CC40;
  id v12 = v10;
  id v28 = v12;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);

  id v13 = [(MKFCKHome *)self removedUserAccessCodes];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __75__MKFCKHome_PinCodes___importRemovedUserAccessCodesIntoLocalModel_context___block_invoke_2;
  v23[3] = &unk_264A2CC18;
  void v23[4] = self;
  id v14 = v12;
  id v24 = v14;
  id v15 = v7;
  id v25 = v15;
  id v16 = v6;
  id v26 = v16;
  [v13 enumerateKeysAndObjectsUsingBlock:v23];

  id v17 = (void *)MEMORY[0x263EFFA08];
  id v18 = [v14 allValues];
  id v19 = [v17 setWithArray:v18];

  __int16 v20 = [v16 removedAccessCodes];
  char v21 = HMFEqualObjects();

  if ((v21 & 1) == 0) {
    objc_msgSend(v16, "setRemovedAccessCodes_:", v19);
  }

  return 1;
}

void __75__MKFCKHome_PinCodes___importRemovedUserAccessCodesIntoLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 hh2ModelID];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
}

void __75__MKFCKHome_PinCodes___importRemovedUserAccessCodesIntoLocalModel_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if ((id)*MEMORY[0x263EFFD08] == v6)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = HMFGetLogIdentifier();
      int v21 = 138543874;
      id v22 = v16;
      __int16 v23 = 2160;
      uint64_t v24 = 1752392040;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Found tomb stoned removed user access code with modelID: %{mask.hash}@", (uint8_t *)&v21, 0x20u);
    }
    BOOL v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    if (v8)
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = *(id *)(a1 + 32);
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v21 = 138543618;
        id v22 = v20;
        __int16 v23 = 2112;
        uint64_t v24 = (uint64_t)v8;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Going to delete the removed user access code from working store: %@", (uint8_t *)&v21, 0x16u);
      }
      [*(id *)(a1 + 48) deleteObject:v8];
    }
  }
  else
  {
    BOOL v8 = [v6 objectForKeyedSubscript:@"ru"];
    id v9 = [v7 objectForKeyedSubscript:@"a"];
    id v10 = [*(id *)(a1 + 32) _populateRemovedUserAccessCodeFromDictionary:v8 withAccessCode:v9 hh2ModelID:v5 home:*(void *)(a1 + 56) groupsByModelID:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
    char v11 = v10;
    if (v10)
    {
      id v12 = [v10 hh2ModelID];
      [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v12];
    }
  }
}

- (id)_populateRemovedUserAccessCodeFromDictionary:(id)a3 withAccessCode:(id)a4 hh2ModelID:(id)a5 home:(id)a6 groupsByModelID:(id)a7 context:(id)a8
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v15 || ![v15 length])
  {
    uint64_t v43 = (void *)MEMORY[0x230FBD990]();
    id v44 = self;
    uint64_t v45 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
LABEL_26:

      uint64_t v31 = 0;
      goto LABEL_45;
    }
    uint64_t v46 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v93 = v46;
    __int16 v94 = 2112;
    id v95 = v14;
    id v47 = "%{public}@Without accessCode cannot import _MKFRemovedUserAccessCode : %@";
    id v48 = v45;
    uint32_t v49 = 22;
LABEL_25:
    _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, v47, buf, v49);

    goto LABEL_26;
  }
  if (!v16)
  {
    uint64_t v43 = (void *)MEMORY[0x230FBD990]();
    id v44 = self;
    uint64_t v45 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    uint64_t v46 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v93 = v46;
    id v47 = "%{public}@Without hh2ModelID cannot import _MKFRemovedUserAccessCode";
    id v48 = v45;
    uint32_t v49 = 12;
    goto LABEL_25;
  }
  __int16 v20 = objc_msgSend(v14, "hmf_stringForKey:", @"ui");
  int v21 = v20;
  if (v20 && [v20 length])
  {
    id v22 = objc_msgSend(v14, "hmf_stringForKey:", @"un");
    __int16 v23 = v22;
    if (v22 && [v22 length])
    {
      uint64_t v24 = objc_msgSend(v14, "hmf_UUIDForKey:", @"i");
      v89 = (void *)v24;
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = objc_msgSend(v14, "hmf_dateForKey:", @"d");
        context = (void *)v26;
        if (v26)
        {
          id v81 = v21;
          uint64_t v27 = [objc_alloc(MEMORY[0x263F0E6A8]) initWithName:v23 userUUID:v25 userID:v21 dateRemoved:v26];
          [v17 modelID];
          v29 = id v28 = v23;
          char v80 = (void *)v27;
          uint64_t v30 = +[HMDRemovedUserAccessCodeModel modelUUIDForHomeUUID:v29 removedUserInfo:v27 accessCode:v15];

          uint64_t v31 = [v18 objectForKeyedSubscript:v16];
          if (!v31)
          {
            uint64_t v31 = [[_MKFRemovedUserAccessCode alloc] initWithContext:v19];
            [(_MKFRemovedUserAccessCode *)v31 setModelID:v30];
            [(_MKFRemovedUserAccessCode *)v31 setHh2ModelID:v16];
          }
          uint64_t v32 = [(_MKFRemovedUserAccessCode *)v31 userName];
          id v85 = v28;
          char v33 = HMFEqualObjects();

          if ((v33 & 1) == 0) {
            [(_MKFRemovedUserAccessCode *)v31 setUserName:v28];
          }
          id v34 = [(_MKFRemovedUserAccessCode *)v31 userModelID];
          uint64_t v35 = v89;
          char v36 = HMFEqualObjects();

          if ((v36 & 1) == 0) {
            [(_MKFRemovedUserAccessCode *)v31 setUserModelID:v89];
          }
          id v37 = [(_MKFRemovedUserAccessCode *)v31 userID];
          char v38 = HMFEqualObjects();

          if ((v38 & 1) == 0) {
            [(_MKFRemovedUserAccessCode *)v31 setUserID:v81];
          }
          uint64_t v39 = [(_MKFRemovedUserAccessCode *)v31 dateRemoved];
          char v40 = HMFEqualObjects();

          if ((v40 & 1) == 0) {
            [(_MKFRemovedUserAccessCode *)v31 setDateRemoved:context];
          }
          id v41 = [(_MKFRemovedUserAccessCode *)v31 accessCode];
          char v42 = HMFEqualObjects();

          if ((v42 & 1) == 0) {
            [(_MKFRemovedUserAccessCode *)v31 setAccessCode:v15];
          }

          int v21 = v81;
          __int16 v23 = v85;
        }
        else
        {
          id v82 = (void *)MEMORY[0x230FBD990]();
          id v71 = self;
          id v72 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v88 = v23;
            id v73 = v19;
            id v74 = v18;
            id v75 = v17;
            v77 = id v76 = v21;
            *(_DWORD *)buf = 138543618;
            id v93 = v77;
            __int16 v94 = 2112;
            id v95 = v14;
            _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_ERROR, "%{public}@No dateRemoved field found for removed user access code: %@. Not importing _MKFRemovedUserAccessCode", buf, 0x16u);

            int v21 = v76;
            id v17 = v75;
            id v18 = v74;
            id v19 = v73;
            __int16 v23 = v88;
          }

          uint64_t v31 = 0;
          uint64_t v35 = v89;
        }
      }
      else
      {
        contexta = (void *)MEMORY[0x230FBD990]();
        uint64_t v64 = self;
        v65 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v87 = v23;
          id v66 = v19;
          id v67 = v18;
          id v68 = v17;
          v70 = id v69 = v21;
          *(_DWORD *)buf = 138543618;
          id v93 = v70;
          __int16 v94 = 2112;
          id v95 = v14;
          _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_ERROR, "%{public}@No modelID field found for removed user access code: %@. Not importing _MKFRemovedUserAccessCode", buf, 0x16u);

          int v21 = v69;
          id v17 = v68;
          id v18 = v67;
          id v19 = v66;
          __int16 v23 = v87;
        }

        uint64_t v31 = 0;
        uint64_t v35 = 0;
      }
    }
    else
    {
      id v86 = v23;
      char v57 = (void *)MEMORY[0x230FBD990]();
      id v58 = self;
      id v59 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v91 = v19;
        id v60 = v18;
        id v61 = v17;
        uint64_t v63 = v62 = v21;
        *(_DWORD *)buf = 138543618;
        id v93 = v63;
        __int16 v94 = 2112;
        id v95 = v14;
        _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@No userName field found for removed user access code: %@. Not importing _MKFRemovedUserAccessCode", buf, 0x16u);

        int v21 = v62;
        id v17 = v61;
        id v18 = v60;
        id v19 = v91;
      }

      uint64_t v31 = 0;
      __int16 v23 = v86;
    }
  }
  else
  {
    id v50 = (void *)MEMORY[0x230FBD990]();
    id v51 = self;
    id v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v90 = v19;
      id v53 = v18;
      id v54 = v17;
      v56 = char v55 = v21;
      *(_DWORD *)buf = 138543618;
      id v93 = v56;
      __int16 v94 = 2112;
      id v95 = v14;
      _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@No userID field found for removed user access code: %@. Not importing _MKFRemovedUserAccessCode", buf, 0x16u);

      int v21 = v55;
      id v17 = v54;
      id v18 = v53;
      id v19 = v90;
    }

    uint64_t v31 = 0;
  }

LABEL_45:
  return v31;
}

- (BOOL)_importGuestAccessCodesIntoLocalModel:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  BOOL v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = [v6 guestAccessCodes];
  id v10 = objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));

  char v11 = [v6 guestAccessCodes];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __69__MKFCKHome_PinCodes___importGuestAccessCodesIntoLocalModel_context___block_invoke;
  v27[3] = &unk_264A2CBF0;
  id v12 = v10;
  id v28 = v12;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);

  id v13 = [(MKFCKHome *)self guestAccessCodes];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __69__MKFCKHome_PinCodes___importGuestAccessCodesIntoLocalModel_context___block_invoke_2;
  v23[3] = &unk_264A2CC18;
  void v23[4] = self;
  id v14 = v12;
  id v24 = v14;
  id v15 = v7;
  id v25 = v15;
  id v16 = v6;
  id v26 = v16;
  [v13 enumerateKeysAndObjectsUsingBlock:v23];

  id v17 = (void *)MEMORY[0x263EFFA08];
  id v18 = [v14 allValues];
  id v19 = [v17 setWithArray:v18];

  __int16 v20 = [v16 guestAccessCodes];
  char v21 = HMFEqualObjects();

  if ((v21 & 1) == 0) {
    objc_msgSend(v16, "setGuestAccessCodes_:", v19);
  }

  return 1;
}

void __69__MKFCKHome_PinCodes___importGuestAccessCodesIntoLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 hh2ModelID];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
}

void __69__MKFCKHome_PinCodes___importGuestAccessCodesIntoLocalModel_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ((id)*MEMORY[0x263EFFD08] == v6)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v18 = 138543874;
      id v19 = v13;
      __int16 v20 = 2160;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Found tomb stoned guest access code with modelID: %{mask.hash}@", (uint8_t *)&v18, 0x20u);
    }
    BOOL v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    if (v8)
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = *(id *)(a1 + 32);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        int v18 = 138543618;
        id v19 = v17;
        __int16 v20 = 2112;
        uint64_t v21 = (uint64_t)v8;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Going to delete the guest access code from working store: %@", (uint8_t *)&v18, 0x16u);
      }
      [*(id *)(a1 + 48) deleteObject:v8];
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) _populateGuestAccessCodeWithDictionary:v6 hh2ModelID:v5 home:*(void *)(a1 + 56) groupsByModelID:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
    BOOL v8 = v7;
    if (v7)
    {
      id v9 = [v7 hh2ModelID];
      [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
    }
  }
}

- (id)_populateGuestAccessCodeWithDictionary:(id)a3 hh2ModelID:(id)a4 home:(id)a5 groupsByModelID:(id)a6 context:(id)a7
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_msgSend(v12, "hmf_stringForKey:", @"a");
  int v18 = objc_msgSend(v12, "hmf_stringForKey:", @"l");
  uint64_t v40 = objc_msgSend(v12, "hmf_numberForKey:", @"uu");
  if (v13 && v17 && v18 && [v17 length])
  {
    id v37 = v14;
    id v19 = [v14 modelID];
    char v38 = +[HMDHomeAccessCodeModel modelUUIDForHomeUUID:v19 accessCodeValue:v17];

    __int16 v20 = [v15 objectForKeyedSubscript:v13];
    if (!v20)
    {
      __int16 v20 = [[_MKFGuestAccessCode alloc] initWithContext:v16];
      [(_MKFGuestAccessCode *)v20 setModelID:v38];
      [(_MKFGuestAccessCode *)v20 setHh2ModelID:v13];
      uint64_t v21 = [(MKFCKHome *)self writerTimestamp];
      [(_MKFGuestAccessCode *)v20 setWriterTimestamp:v21];
    }
    __int16 v22 = [(_MKFGuestAccessCode *)v20 accessCode];
    char v23 = HMFEqualObjects();

    if ((v23 & 1) == 0) {
      [(_MKFGuestAccessCode *)v20 setAccessCode:v17];
    }
    uint64_t v24 = [(_MKFGuestAccessCode *)v20 label];
    char v25 = HMFEqualObjects();

    id v26 = (void *)v40;
    if ((v25 & 1) == 0) {
      [(_MKFGuestAccessCode *)v20 setLabel:v18];
    }
    uint64_t v27 = [(_MKFGuestAccessCode *)v20 userUniqueIDForAccessories];
    char v28 = HMFEqualObjects();

    if ((v28 & 1) == 0) {
      [(_MKFGuestAccessCode *)v20 setUserUniqueIDForAccessories:v40];
    }

    id v14 = v37;
  }
  else
  {
    id v29 = (void *)MEMORY[0x230FBD990]();
    uint64_t v30 = self;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v39 = v13;
      id v32 = v16;
      id v33 = v15;
      v35 = id v34 = v14;
      *(_DWORD *)buf = 138543874;
      char v42 = v35;
      __int16 v43 = 2112;
      id v44 = v17;
      __int16 v45 = 2112;
      uint64_t v46 = v18;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Invalid accessCode [%@] or label [%@] for guest access code. Not importing.", buf, 0x20u);

      id v14 = v34;
      id v15 = v33;
      id v16 = v32;
      id v13 = v39;
    }

    __int16 v20 = 0;
    id v26 = (void *)v40;
  }

  return v20;
}

+ (id)_encodeRemovedUserInfoWithUserID:(id)a3 removedUserModelID:(id)a4 userName:(id)a5 dateRemoved:(id)a6
{
  v17[4] = *MEMORY[0x263EF8340];
  v16[0] = @"ui";
  v16[1] = @"un";
  v17[0] = a3;
  v17[1] = a5;
  v16[2] = @"i";
  v16[3] = @"d";
  v17[2] = a4;
  v17[3] = a6;
  id v9 = NSDictionary;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v9 dictionaryWithObjects:v17 forKeys:v16 count:4];

  return v14;
}

+ (id)__dictionaryFromRemovedUserAccessCodeDictionaryForUnitTest:(id)a3 tombStonedPinCodes:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    BOOL v8 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    int v18 = __108__MKFCKHome_PinCodeUnitTest____dictionaryFromRemovedUserAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke;
    id v19 = &unk_264A2CD08;
    id v9 = v8;
    id v20 = v9;
    id v21 = a1;
    [v7 enumerateKeysAndObjectsUsingBlock:&v16];
    if (a4 >= 1)
    {
      do
      {
        id v10 = objc_msgSend(MEMORY[0x263EFF9D0], "null", v16, v17, v18, v19);
        id v11 = [MEMORY[0x263F08C38] UUID];
        [v9 setObject:v10 forKeyedSubscript:v11];

        --a4;
      }
      while (a4);
    }

    return v9;
  }
  else
  {
    uint64_t v13 = _HMFPreconditionFailure();
    __108__MKFCKHome_PinCodeUnitTest____dictionaryFromRemovedUserAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke(v13, v14, v15);
  }
  return result;
}

void __108__MKFCKHome_PinCodeUnitTest____dictionaryFromRemovedUserAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"a";
  v11[1] = @"ru";
  v12[0] = a2;
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_msgSend((id)objc_opt_class(), "__dictionaryFromHMRemovedUserInfoForUnitTest:", v5);

  v12[1] = v7;
  BOOL v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = *(void **)(a1 + 32);
  id v10 = [MEMORY[0x263F08C38] UUID];
  [v9 setObject:v8 forKeyedSubscript:v10];
}

+ (id)__removedUserInfoDictionaryForUnitTest:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"ru"];
}

+ (id)__dictionaryFromGuestAccessCodeForUnitTest:(id)a3 label:(id)a4 userUniqueIDForAccessories:(id)a5
{
  v16[3] = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263EFF9A0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 dictionary];
  v15[0] = @"a";
  v15[1] = @"l";
  v16[0] = v10;
  v16[1] = v9;
  v15[2] = @"uu";
  v16[2] = v8;
  id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  uint64_t v13 = [MEMORY[0x263F08C38] UUID];

  [v11 setObject:v12 forKeyedSubscript:v13];
  return v11;
}

+ (id)__userUniqueIDForAccessoriesFromDictionaryForUnitTest:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"uu"];
}

+ (id)__labelFromDictionaryForUnitTest:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"l"];
}

+ (id)__accessCodeFromDictionaryForUnitTest:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"a"];
}

+ (id)__dictionaryFromGuestAccessCodeDictionaryForUnitTest:(id)a3 tombStonedPinCodes:(int)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __102__MKFCKHome_PinCodeUnitTest____dictionaryFromGuestAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke;
    void v15[3] = &unk_264A2CCE0;
    id v8 = v7;
    id v16 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v15];
    if (a4 >= 1)
    {
      do
      {
        id v9 = [MEMORY[0x263EFF9D0] null];
        id v10 = [MEMORY[0x263F08C38] UUID];
        [v8 setObject:v9 forKeyedSubscript:v10];

        --a4;
      }
      while (a4);
    }

    return v8;
  }
  else
  {
    uint64_t v12 = _HMFPreconditionFailure();
    __102__MKFCKHome_PinCodeUnitTest____dictionaryFromGuestAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke(v12, v13, v14);
  }
  return result;
}

void __102__MKFCKHome_PinCodeUnitTest____dictionaryFromGuestAccessCodeDictionaryForUnitTest_tombStonedPinCodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"a";
  v11[1] = @"l";
  v12[0] = a2;
  v12[1] = a3;
  id v5 = NSDictionary;
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = *(void **)(a1 + 32);
  id v10 = [MEMORY[0x263F08C38] UUID];
  [v9 setObject:v8 forKeyedSubscript:v10];
}

+ (id)__dictionaryFromHMRemovedUserInfoForUnitTest:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_opt_class();
    id v6 = [v4 userID];
    id v7 = [v4 userUUID];
    id v8 = [v4 name];
    id v9 = [v4 dateRemoved];
    id v10 = [v5 _encodeRemovedUserInfoWithUserID:v6 removedUserModelID:v7 userName:v8 dateRemoved:v9];

    return v10;
  }
  else
  {
    uint64_t v12 = (void *)_HMFPreconditionFailure();
    return +[MKFCKHome __removedUserInfoFromDictionaryForUnitTest:v14];
  }
}

+ (id)__removedUserInfoFromDictionaryForUnitTest:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F0E6A8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = objc_msgSend(v4, "hmf_stringForKey:", @"un");
  id v7 = objc_msgSend(v4, "hmf_UUIDForKey:", @"i");
  id v8 = objc_msgSend(v4, "hmf_stringForKey:", @"ui");
  id v9 = objc_msgSend(v4, "hmf_dateForKey:", @"d");

  id v10 = (void *)[v5 initWithName:v6 userUUID:v7 userID:v8 dateRemoved:v9];
  return v10;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKHome"];
}

@end
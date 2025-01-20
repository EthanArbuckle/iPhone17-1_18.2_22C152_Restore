@interface HMDAppleAccessoryPairingController
+ (id)logCategory;
- (BOOL)handleMessage:(id)a3 from:(id)a4;
- (BOOL)pairAccessory:(id)a3;
- (HMBLocalZone)blobZone;
- (HMBLocalZone)homeManagerZone;
- (HMDAppleAccessoryPairingController)initWithHomeManager:(id)a3 dataSource:(id)a4;
- (HMDAppleAccessoryPairingControllerDataSource)dataSource;
- (HMDHomeManager)homeManager;
- (HMDLegacyCloudDatabase)legacyCloudDatabase;
- (HMDMutableHomeData)homeData;
- (NSMutableDictionary)pairingHomes;
- (id)cleanUpBadHomeManagerRecordsForHomeManager:(id)a3;
- (void)generateModelChangesForHomeManager:(id)a3 homeName:(id)a4 pairingHomeUUID:(id)a5 defaultRoomUUID:(id)a6 homeZoneUUID:(id)a7 accessory:(id)a8 outBlobChanges:(id *)a9 outLegacyChanges:(id *)a10 outHomeManagerChanges:(id *)a11;
- (void)removeControllerForZone:(id)a3;
- (void)setBlobZone:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHomeData:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHomeManagerZone:(id)a3;
- (void)setLegacyCloudDatabase:(id)a3;
- (void)setPairingHomes:(id)a3;
- (void)start;
@end

@implementation HMDAppleAccessoryPairingController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeData, 0);
  objc_storeStrong((id *)&self->_pairingHomes, 0);
  objc_storeStrong((id *)&self->_blobZone, 0);
  objc_storeStrong((id *)&self->_homeManagerZone, 0);
  objc_storeStrong((id *)&self->_legacyCloudDatabase, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setHomeData:(id)a3
{
}

- (HMDMutableHomeData)homeData
{
  return (HMDMutableHomeData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPairingHomes:(id)a3
{
}

- (NSMutableDictionary)pairingHomes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBlobZone:(id)a3
{
}

- (HMBLocalZone)blobZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHomeManagerZone:(id)a3
{
}

- (HMBLocalZone)homeManagerZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLegacyCloudDatabase:(id)a3
{
}

- (HMDLegacyCloudDatabase)legacyCloudDatabase
{
  return (HMDLegacyCloudDatabase *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDAppleAccessoryPairingControllerDataSource)dataSource
{
  return (HMDAppleAccessoryPairingControllerDataSource *)objc_getProperty(self, a2, 16, 1);
}

- (void)removeControllerForZone:(id)a3
{
  id v12 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HMDAppleAccessoryPairingController *)self pairingHomes];
  v6 = [v5 objectForKey:v12];

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    v7 = [(HMDAppleAccessoryPairingController *)self dataSource];
    v8 = [v6 state];
    v9 = [v8 accessory];
    v10 = [v9 uuid];
    [v7 deletePairingAccessoryState:v10];

    os_unfair_lock_lock_with_options();
    v11 = [(HMDAppleAccessoryPairingController *)self pairingHomes];
    [v11 removeObjectForKey:v12];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)generateModelChangesForHomeManager:(id)a3 homeName:(id)a4 pairingHomeUUID:(id)a5 defaultRoomUUID:(id)a6 homeZoneUUID:(id)a7 accessory:(id)a8 outBlobChanges:(id *)a9 outLegacyChanges:(id *)a10 outHomeManagerChanges:(id *)a11
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v91 = a4;
  id v18 = a5;
  id v90 = a6;
  id v89 = a7;
  id v88 = a8;
  v19 = [(HMDAppleAccessoryPairingController *)self homeManagerZone];
  v20 = [v17 uuid];
  id v92 = 0;
  v21 = objc_msgSend(v19, "fetchModelWithModelID:ofType:error:", v20, +[HMDLegacyV4Model hmbModelClassForHMDModelClass:](HMDLegacyV4Model, "hmbModelClassForHMDModelClass:", objc_opt_class()), &v92);
  id v87 = v92;

  if (!v21)
  {
    v22 = (void *)MEMORY[0x230FBD990]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v96 = v25;
      __int16 v97 = 2112;
      id v98 = v87;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Error fetching home manager model: %@", buf, 0x16u);
    }
  }
  v84 = v21;
  v26 = [v21 convertToHMDModelObject];
  if (!v26)
  {
    v27 = [HMDHomeManagerModel alloc];
    v28 = [v17 uuid];
    v29 = objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
    v26 = [(HMDBackingStoreModelObject *)v27 initWithUUID:v28 parentUUID:v29];

    v30 = [(HMDAppleAccessoryPairingController *)self dataSource];
    v31 = [v30 hh1ControllerIdentity];
    v32 = [v31 identifier];
    [(HMDHomeManagerModel *)v26 setControllerKeyIdentifier:v32];

    v33 = [v18 UUIDString];
    [(HMDHomeManagerModel *)v26 setPrimaryHomeUUID:v33];
  }
  v34 = [HMDUser alloc];
  v35 = +[HMDAppleAccountManager sharedManager];
  v36 = [v35 account];
  v37 = [v36 primaryHandle];
  v38 = [(HMDAppleAccessoryPairingController *)self dataSource];
  v39 = [v38 hh1ControllerIdentity];
  uint64_t v40 = [(HMDUser *)v34 initWithAccountHandle:v37 homeUUID:v18 pairingIdentity:v39 privilege:3];
  id v41 = v18;
  v42 = (void *)v40;

  v85 = v41;
  v86 = v17;
  v43 = [[HMDHome alloc] initWithName:v91 uuid:v41 defaultRoomUUID:v90 owner:v42 homeManager:v17 presenceAuth:0];
  v44 = [HMDCloudZoneInformation alloc];
  v45 = [v42 pairingUsername];
  v46 = [(HMDCloudZoneInformation *)v44 initWithOwnerName:v45 uuid:v89];

  [(HMDCloudZoneInformation *)v46 setFetchFailed:0];
  [(HMDCloudZoneInformation *)v46 setFirstFetch:0];
  [(HMDCloudZoneInformation *)v46 setZoneCreated:1];
  v47 = [(HMDHomeManagerModel *)v26 cloudZoneInformation];
  v48 = +[HMDCloudZoneInformation cloudZonesWithDictionary:v47];

  v80 = v46;
  [v48 addObject:v46];
  v49 = v48;
  v50 = +[HMDCloudZoneInformation cloudZoneInformationWithCloudZones:v48];
  [(HMDHomeManagerModel *)v26 setCloudZoneInformation:v50];

  v51 = [HMDCloudZoneInformationModel alloc];
  v83 = v26;
  v52 = [(HMDBackingStoreModelObject *)v26 uuid];
  v53 = [(HMDBackingStoreModelObject *)v51 initWithUUID:v89 parentUUID:v52];

  v82 = v42;
  v54 = [v42 pairingUsername];
  v81 = v53;
  [(HMDCloudZoneInformationModel *)v53 setOwnerName:v54];

  v55 = [(HMDAppleAccessoryPairingController *)self homeData];
  v56 = [v55 homes];
  v57 = (void *)[v56 mutableCopy];
  v58 = v57;
  if (v57)
  {
    id v59 = v57;
  }
  else
  {
    id v59 = [MEMORY[0x263EFF980] array];
  }
  v60 = v59;

  [v60 addObject:v43];
  v61 = [(HMDAppleAccessoryPairingController *)self homeData];
  [v61 setHomes:v60];

  v62 = [(HMDAppleAccessoryPairingController *)self homeData];
  v79 = v49;
  [v62 setCloudZones:v49];

  v63 = [(HMDHome *)v43 backingStoreObjects:4];
  v64 = (void *)[v63 mutableCopy];

  v65 = [v88 addTransactionForHome:v43];
  [v64 addObject:v65];

  v66 = [(HMDAppleAccessoryPairingController *)self homeData];
  v67 = +[HMDPersistentStore serializeHomeData:v66 localStorage:0 remoteDeviceOnSameAccount:1];

  v68 = objc_alloc_init(HMDLegacyV3Model);
  [(HMDLegacyV3Model *)v68 setCloudBlob:v67];
  v69 = objc_alloc_init(HMDLegacyV0Model);
  [(HMDLegacyV0Model *)v69 setCloudBlob:v67];
  [(HMDLegacyV0Model *)v69 setCloudBlobV2:v67];
  [(HMDLegacyV0Model *)v69 setCloudBlobsReadOnly:MEMORY[0x263EFFA88]];
  v78 = v43;
  v70 = (void *)MEMORY[0x263EFFA08];
  v94[0] = v69;
  v94[1] = v68;
  v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:2];
  *a9 = [v70 setWithArray:v71];

  v72 = (void *)MEMORY[0x263EFFA08];
  v73 = objc_msgSend(v64, "na_map:", &__block_literal_global_47);
  *a10 = [v72 setWithArray:v73];

  v74 = (void *)MEMORY[0x263EFFA08];
  v75 = [(HMDBackingStoreModelObject *)v83 convertToLegacyV4];
  v93[0] = v75;
  v76 = [(HMDBackingStoreModelObject *)v81 convertToLegacyV4];
  v93[1] = v76;
  v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];
  *a11 = [v74 setWithArray:v77];
}

uint64_t __191__HMDAppleAccessoryPairingController_generateModelChangesForHomeManager_homeName_pairingHomeUUID_defaultRoomUUID_homeZoneUUID_accessory_outBlobChanges_outLegacyChanges_outHomeManagerChanges___block_invoke(uint64_t a1, void *a2)
{
  return [a2 convertToLegacyV4];
}

- (id)cleanUpBadHomeManagerRecordsForHomeManager:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAppleAccessoryPairingController *)self homeManagerZone];
  v6 = [v4 uuid];
  id v22 = 0;
  v7 = objc_msgSend(v5, "fetchModelWithModelID:ofType:error:", v6, +[HMDLegacyV4Model hmbModelClassForHMDModelClass:](HMDLegacyV4Model, "hmbModelClassForHMDModelClass:", objc_opt_class()), &v22);
  id v8 = v22;

  if (v7)
  {
    v9 = [v7 hmbParentModelID];
    v10 = objc_msgSend(MEMORY[0x263F08C38], "hmf_zeroUUID");
    int v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

    if (!v11)
    {
      id v12 = [(HMDAppleAccessoryPairingController *)self homeManagerZone];
      v13 = [v7 hmbParentModelID];
      v14 = [MEMORY[0x263F49318] optionsWithLabel:@"Legacy Pairing Home Manager Record Cleanup"];
      v15 = [v12 removeModelsWithParentModelID:v13 options:v14];

      v16 = [v15 flatMap:&__block_literal_global_46028];

      goto LABEL_8;
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error fetching existing home manager model for cleanup: %@", buf, 0x16u);
    }
  }
  v16 = [MEMORY[0x263F58190] futureWithNoResult];
LABEL_8:

  return v16;
}

id __81__HMDAppleAccessoryPairingController_cleanUpBadHomeManagerRecordsForHomeManager___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 mirrorOutputResult];

  if (v3)
  {
    id v4 = [v2 mirrorOutputResult];
    v5 = [v4 flatMap:&__block_literal_global_35];
  }
  else
  {
    v5 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v5;
}

uint64_t __81__HMDAppleAccessoryPairingController_cleanUpBadHomeManagerRecordsForHomeManager___block_invoke_2()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (BOOL)pairAccessory:(id)a3
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v89 = a3;
  id v4 = (void *)MEMORY[0x230FBD990]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v89;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Starting legacy pairing for accessory: %@", buf, 0x16u);
  }
  id v90 = [(HMDAppleAccessoryPairingController *)v5 legacyCloudDatabase];
  if (v90)
  {
    id v8 = [(HMDAppleAccessoryPairingController *)v5 homeManagerZone];
    BOOL v9 = v8 == 0;

    if (v9)
    {
      v16 = [(HMDAppleAccessoryPairingController *)v5 dataSource];
      id v17 = [v16 hh1ControllerIdentity];
      id v104 = 0;
      id v18 = [v90 createLegacyZone:@"1411CE6C-B4DE-4622-A49D-F66FE296D6B5" controllerIdentity:v17 delegate:0 error:&v104];
      v10 = (uint64_t (*)(uint64_t, uint64_t))v104;
      [(HMDAppleAccessoryPairingController *)v5 setHomeManagerZone:v18];

      v19 = [(HMDAppleAccessoryPairingController *)v5 homeManagerZone];
      LODWORD(v17) = v19 == 0;

      if (v17)
      {
        v71 = (void *)MEMORY[0x230FBD990]();
        v72 = v5;
        v73 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v74 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v74;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = @"1411CE6C-B4DE-4622-A49D-F66FE296D6B5";
          *(_WORD *)&buf[22] = 2112;
          v112 = v10;
          _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_ERROR, "%{public}@Unable to create legacy zone %@: %@", buf, 0x20u);
        }
        BOOL v15 = 0;
        goto LABEL_45;
      }
      v20 = [(HMDAppleAccessoryPairingController *)v5 homeManagerZone];
      [v20 startUp];
    }
    else
    {
      v10 = 0;
    }
    v21 = [(HMDAppleAccessoryPairingController *)v5 blobZone];
    BOOL v22 = v21 == 0;

    if (v22)
    {
      v24 = [(HMDAppleAccessoryPairingController *)v5 dataSource];
      __int16 v25 = [v24 hh1ControllerIdentity];
      v103 = v10;
      id v26 = [v90 createLegacyZone:@"HomeDataBlobZone" controllerIdentity:v25 delegate:0 error:&v103];
      v23 = v103;

      [(HMDAppleAccessoryPairingController *)v5 setBlobZone:v26];
      uint64_t v27 = [(HMDAppleAccessoryPairingController *)v5 blobZone];
      LODWORD(v26) = v27 == 0;

      if (v26)
      {
        v75 = (void *)MEMORY[0x230FBD990]();
        v76 = v5;
        v77 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v78 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v78;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = @"1411CE6C-B4DE-4622-A49D-F66FE296D6B5";
          *(_WORD *)&buf[22] = 2112;
          v112 = v23;
          _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_ERROR, "%{public}@Unable to create legacy zone %@: %@", buf, 0x20u);
        }
        BOOL v15 = 0;
        goto LABEL_44;
      }
      v28 = [(HMDAppleAccessoryPairingController *)v5 blobZone];
      [v28 startUp];
    }
    else
    {
      v23 = v10;
    }
    v84 = [MEMORY[0x263F08C38] UUID];
    v81 = [MEMORY[0x263F08C38] UUID];
    v83 = +[HMDHome zoneIDFromHomeUUID:v84];
    v86 = [v83 UUIDString];
    v82 = +[HMDLegacyCloudDatabase recordZoneIDForLegacyName:v86];
    id v29 = objc_alloc(MEMORY[0x263F49278]);
    v30 = [v90 containerID];
    v85 = (void *)[v29 initWithContainerID:v30 scope:2 zoneID:v82];

    id v88 = [[HMDAppleAccessoryPairingHomeState alloc] initWithCloudZoneID:v85 accessory:v89];
    id v87 = [(HMDAppleAccessoryPairingController *)v5 homeManager];
    v31 = [(HMDAppleAccessoryPairingController *)v5 dataSource];
    [v31 updatePairingAccessoryState:v88];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v112 = __Block_byref_object_copy__46041;
    v113 = __Block_byref_object_dispose__46042;
    v32 = [HMDAppleAccessoryPairingHomeController alloc];
    v33 = [(HMDAppleAccessoryPairingController *)v5 dataSource];
    v114 = [(HMDAppleAccessoryPairingHomeController *)v32 initWithState:v88 homeManager:v87 dataSource:v33];

    os_unfair_lock_lock_with_options();
    v34 = [(HMDAppleAccessoryPairingController *)v5 pairingHomes];
    v35 = [v34 allValues];
    v36 = (void *)[v35 copy];

    v100[0] = MEMORY[0x263EF8330];
    v100[1] = 3221225472;
    v100[2] = __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke;
    v100[3] = &unk_264A19C20;
    id v80 = v89;
    id v101 = v80;
    v102 = buf;
    uint64_t v37 = objc_msgSend(v36, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v100);
    uint64_t v38 = *(void *)(*(void *)&buf[8] + 40);
    if (v38)
    {
      v39 = [(HMDAppleAccessoryPairingController *)v5 pairingHomes];
      [v39 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:v85];
    }
    else
    {
      uint64_t v40 = (void *)MEMORY[0x230FBD990](v37);
      id v41 = v5;
      HMFGetOSLogHandle();
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v43 = (id)objc_claimAutoreleasedReturnValue();
        v44 = [v80 uuid];
        *(_DWORD *)v105 = 138543618;
        id v106 = v43;
        __int16 v107 = 2112;
        v108 = v44;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@A pairing controller for accessory %@ already exists.", v105, 0x16u);
      }
    }

    os_unfair_lock_unlock(&v5->_lock);
    if (v38)
    {
      v45 = [(HMDAppleAccessoryPairingController *)v5 dataSource];
      v46 = [v45 hh1ControllerIdentity];
      uint64_t v99 = v23;
      v47 = [v90 createLegacyZone:v86 controllerIdentity:v46 delegate:0 error:&v99];
      v79 = v99;

      BOOL v15 = v47 != 0;
      if (v47)
      {
        [*(id *)(*(void *)&buf[8] + 40) startWithLocalZone:v47];
        v48 = [MEMORY[0x263EFF980] array];
        v49 = [(HMDAppleAccessoryPairingController *)v5 blobZone];
        v50 = [v49 mirror];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v51 = v50;
        }
        else {
          v51 = 0;
        }
        id v52 = v51;

        v53 = [v52 startUp];

        if (v53) {
          [v48 addObject:v53];
        }
        v54 = [(HMDAppleAccessoryPairingController *)v5 homeManagerZone];
        v55 = [v54 mirror];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v56 = v55;
        }
        else {
          v56 = 0;
        }
        id v57 = v56;

        v58 = [v57 startUp];

        if (v58) {
          [v48 addObject:v58];
        }
        id v59 = [v47 mirror];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v60 = v59;
        }
        else {
          v60 = 0;
        }
        id v61 = v60;

        v62 = [v61 startUp];

        if (v62) {
          [v48 addObject:v62];
        }
        v63 = [(HMDAppleAccessoryPairingController *)v5 cleanUpBadHomeManagerRecordsForHomeManager:v87];
        [v48 addObject:v63];

        v64 = [MEMORY[0x263F58190] chainFutures:v48];
        v91[0] = MEMORY[0x263EF8330];
        v91[1] = 3221225472;
        v91[2] = __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_17;
        v91[3] = &unk_264A19C48;
        id v92 = v80;
        v93 = v5;
        id v94 = v87;
        id v95 = v84;
        id v96 = v81;
        id v97 = v83;
        id v98 = v47;
        id v65 = (id)[v64 addSuccessBlock:v91];
      }
      else
      {
        v66 = (void *)MEMORY[0x230FBD990]();
        v67 = v5;
        HMFGetOSLogHandle();
        v68 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v69 = HMFGetLogIdentifier();
          *(_DWORD *)v105 = 138543874;
          id v106 = v69;
          __int16 v107 = 2112;
          v108 = @"1411CE6C-B4DE-4622-A49D-F66FE296D6B5";
          __int16 v109 = 2112;
          v110 = v79;
          _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, "%{public}@Unable to create legacy zone %@: %@", v105, 0x20u);
        }
      }

      v23 = v79;
    }
    else
    {
      BOOL v15 = 0;
    }
    _Block_object_dispose(buf, 8);

LABEL_44:
    v10 = v23;
LABEL_45:

    goto LABEL_46;
  }
  int v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = v5;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@HMDAppleAccessoryPairingController has not been started.", buf, 0xCu);
  }
  BOOL v15 = 0;
LABEL_46:

  return v15;
}

void __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = [a2 state];
  v7 = [v6 accessory];
  id v8 = [v7 uuid];
  BOOL v9 = [*(id *)(a1 + 32) uuid];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    *a4 = 1;
  }
}

void __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_17(uint64_t a1)
{
  id v2 = NSString;
  v3 = [*(id *)(a1 + 32) uuid];
  id v4 = [v2 stringWithFormat:@"PairingHomeFor-%@", v3];

  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 32);
  BOOL v9 = *(void **)(a1 + 40);
  id v27 = 0;
  id v28 = 0;
  id v26 = 0;
  [v9 generateModelChangesForHomeManager:v5 homeName:v4 pairingHomeUUID:v6 defaultRoomUUID:v7 homeZoneUUID:v8 accessory:v10 outBlobChanges:&v28 outLegacyChanges:&v27 outHomeManagerChanges:&v26];
  id v11 = v28;
  id v12 = v27;
  id v13 = v26;
  v14 = [MEMORY[0x263EFF980] array];
  BOOL v15 = [MEMORY[0x263F49318] optionsWithLabel:v4];
  v16 = [*(id *)(a1 + 40) blobZone];
  id v17 = [v16 addModels:v11 options:v15];
  [v14 addObject:v17];

  id v18 = [*(id *)(a1 + 80) addModels:v12 options:v15];
  [v14 addObject:v18];

  v19 = [*(id *)(a1 + 40) homeManagerZone];
  v20 = [v19 addModels:v13 options:v15];
  [v14 addObject:v20];

  v21 = (void *)MEMORY[0x263F58190];
  BOOL v22 = [MEMORY[0x263F581B8] globalAsyncScheduler];
  v23 = [v21 combineAllFutures:v14 ignoringErrors:0 scheduler:v22];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_2;
  v25[3] = &unk_264A28890;
  v25[4] = *(void *)(a1 + 40);
  id v24 = (id)[v23 addSuccessBlock:v25];
}

void __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a2;
  uint64_t v5 = [v3 array];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_3;
  v12[3] = &unk_264A2ACB8;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v6 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

  uint64_t v7 = (void *)MEMORY[0x263F58190];
  uint64_t v8 = [MEMORY[0x263F581B8] globalAsyncScheduler];
  BOOL v9 = [v7 combineAllFutures:v6 ignoringErrors:0 scheduler:v8];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_25;
  v11[3] = &unk_264A28890;
  v11[4] = *(void *)(a1 + 32);
  id v10 = (id)[v9 addSuccessBlock:v11];
}

void __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
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
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v20 = 138543618;
      v21 = v9;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to process models: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    id v10 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    id v13 = [v12 mirrorOutputResult];

    if (v13)
    {
      v14 = *(void **)(a1 + 40);
      BOOL v15 = [v12 mirrorOutputResult];
      [v14 addObject:v15];
    }
    else
    {
      v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        int v20 = 138543618;
        v21 = v19;
        __int16 v22 = 2112;
        id v23 = v12;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Model update did not create mirror output result: %@", (uint8_t *)&v20, 0x16u);
      }
    }
  }
}

void __52__HMDAppleAccessoryPairingController_pairAccessory___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
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
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to push models: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (BOOL)handleMessage:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL v9 = [(HMDAppleAccessoryPairingController *)self pairingHomes];
  int v10 = [v9 allValues];
  id v11 = (void *)[v10 copy];

  os_unfair_lock_unlock(p_lock);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__HMDAppleAccessoryPairingController_handleMessage_from___block_invoke;
  v15[3] = &unk_264A19BF8;
  id v12 = v6;
  id v16 = v12;
  id v13 = v7;
  id v17 = v13;
  id v18 = &v19;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);
  LOBYTE(p_lock) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)p_lock;
}

uint64_t __57__HMDAppleAccessoryPairingController_handleMessage_from___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 handleMessage:a1[4] from:a1[5]];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)start
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAppleAccessoryPairingController *)self legacyCloudDatabase];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v28 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Legacy Pairing Controller has already started up.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = +[HMDDeviceCapabilities deviceCapabilities];
    char v9 = [v8 supportsKeychainSync];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x263EFD620]);
      id v11 = (void *)[v10 initWithContainerIdentifier:@"com.apple.willow.config" environment:cloudKitContainerEnvironment];
      id v12 = (void *)[objc_alloc(MEMORY[0x263F492F0]) initWithContainerID:v11];
      [v12 setSubscriptionPushRegistrationAction:1];
      id v13 = [HMDLegacyCloudDatabase alloc];
      uint64_t v14 = +[HMDDatabase defaultDatabase];
      BOOL v15 = [v14 localDatabase];
      id v16 = [(HMDLegacyCloudDatabase *)v13 initWithLocalDatabase:v15 configuration:v12];
      [(HMDAppleAccessoryPairingController *)self setLegacyCloudDatabase:v16];

      id v17 = [(HMDAppleAccessoryPairingController *)self legacyCloudDatabase];
      id v18 = (id)[v17 registerPrivateSubscriptionForExternalRecordType:0];

      uint64_t v19 = [(HMDAppleAccessoryPairingController *)self legacyCloudDatabase];
      id v20 = (id)[v19 registerSharedSubscriptionForExternalRecordType:0];

      objc_initWeak((id *)buf, self);
      uint64_t v21 = [(HMDAppleAccessoryPairingController *)self legacyCloudDatabase];
      char v22 = [v21 performInitialCloudSync];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __43__HMDAppleAccessoryPairingController_start__block_invoke;
      v25[3] = &unk_264A29C10;
      objc_copyWeak(&v26, (id *)buf);
      id v23 = (id)[v22 addSuccessBlock:v25];

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);

      return;
    }
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v28 = v24;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Device cannot support keychain sync, no way we could pair an Apple accessory.", buf, 0xCu);
    }
  }
}

void __43__HMDAppleAccessoryPairingController_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained dataSource];
  id v7 = [v6 inProgressPairingAccessories];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__HMDAppleAccessoryPairingController_start__block_invoke_2;
  v8[3] = &unk_264A19BD0;
  objc_copyWeak(&v9, v4);
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);
  objc_destroyWeak(&v9);
}

void __43__HMDAppleAccessoryPairingController_start__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [v3 cloudZoneID];
  id v6 = [v5 zoneID];

  id v7 = [(os_unfair_lock_s *)WeakRetained legacyCloudDatabase];
  uint64_t v8 = [v6 zoneName];
  id v9 = [(os_unfair_lock_s *)WeakRetained dataSource];
  id v10 = [v9 hh1ControllerIdentity];
  id v27 = 0;
  id v11 = [v7 mirrorLegacyZone:v8 controllerIdentity:v10 delegate:0 error:&v27];
  id v12 = v27;

  if (v11)
  {
    id v13 = [HMDAppleAccessoryPairingHomeController alloc];
    uint64_t v14 = [(os_unfair_lock_s *)WeakRetained homeManager];
    BOOL v15 = [(os_unfair_lock_s *)WeakRetained dataSource];
    id v16 = [(HMDAppleAccessoryPairingHomeController *)v13 initWithState:v3 homeManager:v14 dataSource:v15];

    os_unfair_lock_lock_with_options();
    id v17 = [(os_unfair_lock_s *)WeakRetained pairingHomes];
    id v18 = [v3 cloudZoneID];
    [v17 setObject:v16 forKey:v18];

    os_unfair_lock_unlock(WeakRetained + 2);
    uint64_t v19 = (void *)MEMORY[0x230FBD990]([(HMDAppleAccessoryPairingHomeController *)v16 startWithLocalZone:v11]);
    id v20 = WeakRetained;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      char v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@LEGACY CLOUD ZONE OPEN: %@", buf, 0x16u);
    }
  }
  else
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    uint64_t v24 = WeakRetained;
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v26;
      __int16 v30 = 2112;
      v31 = v6;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@LEGACY CLOUD ZONE OPEN %@ FAILED: %@", buf, 0x20u);
    }
  }
}

- (HMDAppleAccessoryPairingController)initWithHomeManager:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDAppleAccessoryPairingController;
  uint64_t v8 = [(HMDAppleAccessoryPairingController *)&v15 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_homeManager, v6);
    objc_storeStrong((id *)&v9->_dataSource, a4);
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    pairingHomes = v9->_pairingHomes;
    v9->_pairingHomes = (NSMutableDictionary *)v10;

    id v12 = objc_alloc_init(HMDMutableHomeData);
    homeData = v9->_homeData;
    v9->_homeData = v12;
  }
  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26_46076 != -1) {
    dispatch_once(&logCategory__hmf_once_t26_46076, &__block_literal_global_50);
  }
  id v2 = (void *)logCategory__hmf_once_v27_46077;
  return v2;
}

void __49__HMDAppleAccessoryPairingController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v27_46077;
  logCategory__hmf_once_v27_46077 = v0;
}

@end
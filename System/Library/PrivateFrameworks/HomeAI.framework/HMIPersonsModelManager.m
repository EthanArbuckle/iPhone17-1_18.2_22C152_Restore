@interface HMIPersonsModelManager
+ (BOOL)persistModel:(id)a3 toPath:(id)a4 error:(id *)a5;
+ (BOOL)persistTorsoToFaceCrop:(id)a3 forHomeUUID:(id)a4 error:(id *)a5;
+ (BOOL)persistTorsoprinterVersionForHomeUUID:(id)a3 error:(id *)a4;
+ (BOOL)persistUserDefinedPersonLinks:(id)a3 forHomeUUID:(id)a4 error:(id *)a5;
+ (HMIPersonsModelManager)sharedInstance;
+ (id)faceObservationFromTorsoprint:(id)a3;
+ (id)getModelStoragePathForHome:(id)a3 error:(id *)a4;
+ (id)getModelStoragePathForModel:(id)a3 error:(id *)a4;
+ (id)getRootModelStoragePathWithError:(id *)a3;
+ (id)getTorsoModelStoragePathForHomeUUID:(id)a3 error:(id *)a4;
+ (id)getTorsoSubdirectoryPathForHomeUUID:(id)a3 error:(id *)a4;
+ (id)getTorsoToFaceCropStoragePathForHomeUUID:(id)a3 error:(id *)a4;
+ (id)getTorsoprinterVersionStoragePathForHomeUUID:(id)a3 error:(id *)a4;
+ (id)getUserDefinedPersonLinksStoragePathForHomeUUID:(id)a3 error:(id *)a4;
+ (id)loadModelAtPath:(id)a3 error:(id *)a4;
+ (id)loadTorsoToFaceCrop:(id)a3 error:(id *)a4;
+ (id)loadTorsoprinterVersion:(id)a3 error:(id *)a4;
+ (id)loadUserDefinedPersonLinksForHomeUUID:(id)a3 error:(id *)a4;
+ (id)minimumUUIDInEquivalencyCell:(id)a3;
+ (id)personsModelWithFaceObservationsByID:(id)a3 error:(id *)a4;
- (BOOL)_hasTorsoprinterVersionChangedForHome:(id)a3;
- (BOOL)_isTorsoFaceCropMapStale:(id)a3;
- (BOOL)_resetStaleTorsoStateForHome:(id)a3 torsoToFaceCropMap:(id)a4;
- (BOOL)buildPersonsModelForHomeUUID:(id)a3 sourceUUID:(id)a4 externalLibrary:(BOOL)a5 faceObservationsByPerson:(id)a6 error:(id *)a7;
- (BOOL)loadModelsWithError:(id *)a3;
- (BOOL)removePersonsModelForHomeUUID:(id)a3 sourceUUID:(id)a4 error:(id *)a5;
- (BOOL)updateTorsoModelForHome:(id)a3 torsoAnnotations:(id)a4 error:(id *)a5;
- (HMFOSTransaction)transaction;
- (HMFTimer)watchdogTimer;
- (HMIPersonsModelManager)init;
- (NSDictionary)equivalencyTablesByHome;
- (NSDictionary)personsModelsByHome;
- (NSDictionary)torsoModelsByHome;
- (NSDictionary)torsoToFaceCropByHome;
- (NSDictionary)userDefinedPersonLinksByHome;
- (id)buildEquivalencyMapForPersonsModels:(id)a3 userDefinedPersonLinks:(id)a4 error:(id *)a5;
- (id)equivalencyCellForPerson:(id)a3 homeUUID:(id)a4 error:(id *)a5;
- (id)faceCropFromTorsoModelForHomeUUID:(id)a3 personUUID:(id)a4 sourceUUID:(id)a5;
- (id)homePersonsModelForHomeWithUUID:(id)a3;
- (id)linkedPredictionsForPrediction:(id)a3 homeUUID:(id)a4 error:(id *)a5;
- (id)loadPersonsModelFromURL:(id)a3 externalLibrary:(BOOL)a4 homeUUID:(id)a5 error:(id *)a6;
- (id)modelURLsFromPath:(id)a3 error:(id *)a4;
- (id)personsModelWithFaceObservations:(id)a3 error:(id *)a4;
- (id)predictHomePersonFromFaceObservation:(id)a3 homeUUID:(id)a4 error:(id *)a5;
- (id)predictPersonFromFaceObservation:(id)a3 homeUUID:(id)a4 error:(id *)a5;
- (id)predictPersonFromTorsoObservation:(id)a3 homeUUID:(id)a4 error:(id *)a5;
- (id)summaryForHomeUUID:(id)a3 error:(id *)a4;
- (void)_loadTorsoDataForHomeUUID:(id)a3 intoTorsoModelsByHome:(id)a4 torsoToFaceCropByHome:(id)a5;
- (void)_reset;
- (void)reset;
- (void)setTransaction:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMIPersonsModelManager

- (HMIPersonsModelManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)HMIPersonsModelManager;
  v2 = [(HMIPersonsModelManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:12 options:30.0];
    watchdogTimer = v3->_watchdogTimer;
    v3->_watchdogTimer = (HMFTimer *)v4;

    [(HMFTimer *)v3->_watchdogTimer setDelegate:v3];
    personsModelsByHome = v3->_personsModelsByHome;
    v3->_personsModelsByHome = 0;

    equivalencyTablesByHome = v3->_equivalencyTablesByHome;
    v3->_equivalencyTablesByHome = 0;

    torsoModelsByHome = v3->_torsoModelsByHome;
    v3->_torsoModelsByHome = 0;

    torsoToFaceCropByHome = v3->_torsoToFaceCropByHome;
    v3->_torsoToFaceCropByHome = 0;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    userDefinedPersonLinksByHome = v3->_userDefinedPersonLinksByHome;
    v3->_userDefinedPersonLinksByHome = (NSDictionary *)v10;
  }
  return v3;
}

+ (HMIPersonsModelManager)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_25);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return (HMIPersonsModelManager *)v2;
}

uint64_t __40__HMIPersonsModelManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(HMIPersonsModelManager);
  return MEMORY[0x270F9A758]();
}

- (id)buildEquivalencyMapForPersonsModels:(id)a3 userDefinedPersonLinks:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[HMIPersonsModelEquivalencyTable alloc] initWithPersonsModels:v8 userDefinedPersonLinks:v7 error:a5];

  return v9;
}

- (id)homePersonsModelForHomeWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(HMIPersonsModelManager *)self personsModelsByHome];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    objc_super v13 = __Block_byref_object_copy__6;
    v14 = __Block_byref_object_dispose__6;
    id v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__HMIPersonsModelManager_homePersonsModelForHomeWithUUID___block_invoke;
    v9[3] = &unk_26477DB30;
    v9[4] = &v10;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __58__HMIPersonsModelManager_homePersonsModelForHomeWithUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if (([v7 isExternalLibrary] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)personsModelWithFaceObservations:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  id v7 = [v5 dictionary];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__HMIPersonsModelManager_personsModelWithFaceObservations_error___block_invoke;
  v11[3] = &unk_26477DB58;
  id v12 = v7;
  id v8 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v11];

  v9 = +[HMIPersonsModelManager personsModelWithFaceObservationsByID:v8 error:a4];

  return v9;
}

void __65__HMIPersonsModelManager_personsModelWithFaceObservations_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = [a3 allObjects];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v5 UUID];

  id v8 = [v7 UUIDString];
  [v6 setObject:v9 forKeyedSubscript:v8];
}

+ (id)personsModelWithFaceObservationsByID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  id v6 = objc_alloc_init(MEMORY[0x263F1EF68]);
  [v6 setMaximumIdentities:80];
  [v6 setMaximumTrainingFaceprintsPerIdentity:20];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F1EF50]) initWithConfiguration:v6];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__HMIPersonsModelManager_personsModelWithFaceObservationsByID_error___block_invoke;
  v14[3] = &unk_26477DB80;
  id v8 = v7;
  id v15 = v8;
  v16 = &v17;
  [v5 enumerateKeysAndObjectsUsingBlock:v14];
  id v9 = (void *)v18[5];
  if (v9)
  {
    id v10 = v9;
    v11 = v10;
    if (a4) {
      *a4 = v10;
    }
    HMIErrorLogC(v11);

    id v12 = 0;
  }
  else
  {
    id v12 = v8;
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __69__HMIPersonsModelManager_personsModelWithFaceObservationsByID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  id v15 = 0;
  char v9 = [v8 addFaceObservations:a3 toPersonWithUniqueIdentifier:v7 error:&v15];
  id v10 = v15;
  if ((v9 & 1) == 0)
  {
    *a4 = 1;
    v11 = [NSString stringWithFormat:@"Error adding faceprints to model for personUUID: %@", v7];
    uint64_t v12 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1033 description:v11 underlyingError:v10];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (BOOL)buildPersonsModelForHomeUUID:(id)a3 sourceUUID:(id)a4 externalLibrary:(BOOL)a5 faceObservationsByPerson:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v108 = a4;
  id v107 = a6;
  if (v9)
  {
    id v13 = 0;
  }
  else
  {
    v14 = [MEMORY[0x263EFF9A0] dictionary];
    id v15 = [v107 allKeys];
    v118[0] = MEMORY[0x263EF8330];
    v118[1] = 3221225472;
    v118[2] = __113__HMIPersonsModelManager_buildPersonsModelForHomeUUID_sourceUUID_externalLibrary_faceObservationsByPerson_error___block_invoke;
    v118[3] = &unk_26477D0B8;
    id v119 = v108;
    id v16 = v14;
    id v120 = v16;
    objc_msgSend(v15, "na_each:", v118);

    uint64_t v17 = [(HMIPersonsModelManager *)self userDefinedPersonLinksByHome];
    v18 = [v17 objectForKeyedSubscript:v12];

    if ([v18 isEqualToDictionary:v16])
    {
      id v13 = 0;
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x22A641C70]();
      v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v122 = v22;
        __int16 v123 = 2112;
        id v124 = v12;
        _os_log_impl(&dword_225DC6000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Writing updated userDefinedPersonLinksByHome[%@] to disk", buf, 0x16u);
      }
      v23 = [(HMIPersonsModelManager *)v20 userDefinedPersonLinksByHome];
      v24 = (NSDictionary *)[v23 mutableCopy];

      v25 = (void *)[v16 copy];
      [(NSDictionary *)v24 setObject:v25 forKeyedSubscript:v12];

      userDefinedPersonLinksByHome = v20->_userDefinedPersonLinksByHome;
      v20->_userDefinedPersonLinksByHome = v24;
      v27 = v24;

      id v117 = 0;
      +[HMIPersonsModelManager persistUserDefinedPersonLinks:v16 forHomeUUID:v12 error:&v117];
      id v13 = v117;
    }
  }
  id v116 = v13;
  v28 = [(HMIPersonsModelManager *)self personsModelWithFaceObservations:v107 error:&v116];
  id v29 = v116;

  if (v28)
  {
    v106 = [[HMIPersonsModel alloc] initWithPersonsModel:v28 homeUUID:v12 sourceUUID:v108 externalLibrary:v9];
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v115 = v29;
    BOOL v30 = [(HMIPersonsModelManager *)self loadModelsWithError:&v115];
    id v31 = v115;

    if (!v30)
    {
      id v57 = v31;
      v58 = v57;
      if (a7) {
        *a7 = v57;
      }
      HMIErrorLog(self, v58);
      BOOL v56 = 0;
      id v29 = v58;
      goto LABEL_51;
    }
    v104 = [(HMIPersonsModelManager *)self homePersonsModelForHomeWithUUID:v12];
    if (v9
      || !v104
      || ([v104 sourceUUID],
          v32 = objc_claimAutoreleasedReturnValue(),
          char v33 = [v32 isEqual:v108],
          v32,
          (v33 & 1) != 0))
    {
      id v34 = v31;
    }
    else
    {
      v65 = (void *)MEMORY[0x22A641C70]();
      v101 = self;
      HMFGetOSLogHandle();
      v66 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v67 = (id)objc_claimAutoreleasedReturnValue();
        v68 = [v104 sourceUUID];
        *(_DWORD *)buf = 138543874;
        id v122 = v67;
        __int16 v123 = 2112;
        id v124 = v12;
        __int16 v125 = 2112;
        id v126 = v68;
        _os_log_impl(&dword_225DC6000, v66, OS_LOG_TYPE_INFO, "%{public}@Stale Home VNPersonsModel with homeUUID: %@ sourceUUID: %@ detected, attempting to remove...", buf, 0x20u);
      }
      id v114 = 0;
      uint64_t v69 = +[HMIPersonsModelManager getModelStoragePathForModel:v104 error:&v114];
      id v36 = v114;
      v103 = (void *)v69;
      if (!v69)
      {
        v81 = NSString;
        v82 = [v104 sourceUUID];
        v102 = [v81 stringWithFormat:@"Failed to remove stale Home VNPersonsModel with homeUUID: %@ sourceUUID: %@, error getting model storage path", v12, v82];

        v83 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1033 description:v102 underlyingError:v36];

        id v84 = v83;
        v41 = v84;
        if (a7) {
          *a7 = v84;
        }
        HMIErrorLog(v101, v41);
        goto LABEL_47;
      }
      v70 = [MEMORY[0x263F08850] defaultManager];
      char v71 = [v70 fileExistsAtPath:v69];

      if (v71)
      {
        v72 = [MEMORY[0x263F08850] defaultManager];
        id v113 = v36;
        char v73 = [v72 removeItemAtPath:v103 error:&v113];
        id v74 = v113;

        if ((v73 & 1) == 0)
        {
          v94 = NSString;
          v95 = [v104 sourceUUID];
          v102 = [v94 stringWithFormat:@"Failed to remove stale Home VNPersonsModel with homeUUID: %@ sourceUUID: %@", v12, v95];

          v96 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1033 description:v102 underlyingError:v74];

          id v97 = v96;
          v41 = v97;
          if (a7) {
            *a7 = v97;
          }
          HMIErrorLog(v101, v41);
          BOOL v56 = 0;
          id v36 = v74;
          goto LABEL_48;
        }
        id v36 = v74;
      }
      else
      {
        v86 = (void *)MEMORY[0x22A641C70]();
        v87 = v101;
        HMFGetOSLogHandle();
        v88 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
        {
          v89 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v122 = v89;
          _os_log_impl(&dword_225DC6000, v88, OS_LOG_TYPE_INFO, "%{public}@Stale model path no longer on disk, proceeding with building persons model...", buf, 0xCu);
        }
      }
      personsModelsByHome = v101->_personsModelsByHome;
      v101->_personsModelsByHome = 0;

      equivalencyTablesByHome = v101->_equivalencyTablesByHome;
      v101->_equivalencyTablesByHome = 0;

      id v112 = v31;
      BOOL v92 = [(HMIPersonsModelManager *)v101 loadModelsWithError:&v112];
      id v34 = v112;

      if (!v92)
      {
        id v93 = v34;
        id v29 = v93;
        if (a7) {
          *a7 = v93;
        }
        HMIErrorLog(v101, v29);
        BOOL v56 = 0;

        goto LABEL_50;
      }
    }
    id v111 = 0;
    uint64_t v35 = +[HMIPersonsModelManager getModelStoragePathForModel:v106 error:&v111];
    id v36 = v111;
    v103 = (void *)v35;
    if (v35)
    {
      id v110 = v36;
      BOOL v37 = +[HMIPersonsModelManager persistModel:v28 toPath:v35 error:&v110];
      id v100 = v110;

      if (v37)
      {
        v38 = [(HMIPersonsModelManager *)self personsModelsByHome];
        uint64_t v39 = [v38 objectForKeyedSubscript:v12];

        if (v39) {
          v40 = (void *)v39;
        }
        else {
          v40 = (void *)MEMORY[0x263EFFA78];
        }
        v41 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v40];
        [v41 setObject:v106 forKeyedSubscript:v108];
        v102 = v40;
        id v42 = objc_alloc(MEMORY[0x263EFF9A0]);
        v43 = [(HMIPersonsModelManager *)self personsModelsByHome];
        v99 = (void *)[v42 initWithDictionary:v43];

        v44 = (void *)[v41 copy];
        [v99 setObject:v44 forKeyedSubscript:v12];

        v45 = (NSDictionary *)[v99 copy];
        v46 = self->_personsModelsByHome;
        self->_personsModelsByHome = v45;

        v47 = [(HMIPersonsModelManager *)self personsModelsByHome];
        v48 = [v47 objectForKeyedSubscript:v12];
        v49 = [(HMIPersonsModelManager *)self userDefinedPersonLinksByHome];
        v50 = [v49 objectForKeyedSubscript:v12];
        id v109 = v34;
        v98 = [(HMIPersonsModelManager *)self buildEquivalencyMapForPersonsModels:v48 userDefinedPersonLinks:v50 error:&v109];
        id v51 = v109;
        v52 = v34;
        id v29 = v51;

        id v53 = objc_alloc(MEMORY[0x263EFF9A0]);
        v54 = [(HMIPersonsModelManager *)self equivalencyTablesByHome];
        v55 = (void *)[v53 initWithDictionary:v54];

        if (v98) {
          [v55 setObject:v98 forKeyedSubscript:v12];
        }
        else {
          [v55 removeObjectForKey:v12];
        }
        v75 = (NSDictionary *)[v55 copy];
        v76 = self->_equivalencyTablesByHome;
        self->_equivalencyTablesByHome = v75;

        v77 = (void *)MEMORY[0x22A641C70]();
        v78 = self;
        HMFGetOSLogHandle();
        v79 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          v80 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v122 = v80;
          __int16 v123 = 2112;
          id v124 = v12;
          __int16 v125 = 2112;
          id v126 = v108;
          _os_log_impl(&dword_225DC6000, v79, OS_LOG_TYPE_INFO, "%{public}@Persisted VNPersonsModel for homeUUID: %@ sourceUUID: %@", buf, 0x20u);
        }

        BOOL v56 = 1;
        id v36 = v100;
        goto LABEL_49;
      }
      uint64_t v62 = [NSString stringWithFormat:@"Failed to persist VNPersonsModel for homeUUID: %@ sourceUUID: %@, path: %@", v12, v108, v35];
      v63 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1033 description:v62 underlyingError:v100];
      v102 = (void *)v62;

      id v64 = v63;
      v41 = v64;
      if (a7) {
        *a7 = v64;
      }
      HMIErrorLog(self, v41);
      BOOL v56 = 0;
      id v36 = v100;
LABEL_48:
      id v29 = v41;
LABEL_49:

LABEL_50:
      v58 = v104;
LABEL_51:

      os_unfair_lock_unlock(lock);
      goto LABEL_52;
    }
    uint64_t v59 = [NSString stringWithFormat:@"Failed to persist VNPersonsModel for homeUUID: %@ sourceUUID: %@, error getting model storage path", v12, v108];
    v60 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1033 description:v59 underlyingError:v36];
    v102 = (void *)v59;

    id v61 = v60;
    v41 = v61;
    if (a7) {
      *a7 = v61;
    }
    HMIErrorLog(self, v41);
LABEL_47:
    BOOL v56 = 0;
    goto LABEL_48;
  }
  if (a7) {
    *a7 = v29;
  }
  HMIErrorLog(self, v29);
  BOOL v56 = 0;
LABEL_52:

  return v56;
}

void __113__HMIPersonsModelManager_buildPersonsModelForHomeUUID_sourceUUID_externalLibrary_faceObservationsByPerson_error___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [v9 personLinks];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [HMIPersonSourceUUIDPair alloc];
    id v6 = [v9 UUID];
    id v7 = [(HMIPersonSourceUUIDPair *)v5 initWithPersonUUID:v6 sourceUUID:*(void *)(a1 + 32)];

    id v8 = [v9 personLinks];
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
  }
}

- (BOOL)removePersonsModelForHomeUUID:(id)a3 sourceUUID:(id)a4 error:(id *)a5
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v78 = 0;
  BOOL v11 = [(HMIPersonsModelManager *)self loadModelsWithError:&v78];
  id v12 = v78;
  id v13 = v12;
  if (v11)
  {
    v14 = [(HMIPersonsModelManager *)self personsModelsByHome];
    id v15 = [v14 objectForKeyedSubscript:v8];

    if (v15)
    {
      uint64_t v16 = [v15 objectForKeyedSubscript:v9];
      if (v16)
      {
        id v77 = 0;
        uint64_t v69 = (void *)v16;
        v70 = +[HMIPersonsModelManager getModelStoragePathForModel:v16 error:&v77];
        id v71 = v77;
        if (v70)
        {
          if (([v69 isExternalLibrary] & 1) == 0)
          {
            id v76 = 0;
            id v67 = +[HMIPersonsModelManager getUserDefinedPersonLinksStoragePathForHomeUUID:v8 error:&v76];
            id v17 = v76;
            v18 = [MEMORY[0x263F08850] defaultManager];
            id v75 = v17;
            char v19 = [v18 removeItemAtPath:v67 error:&v75];
            id v65 = v75;

            context = (void *)MEMORY[0x22A641C70]();
            v20 = self;
            if (v19)
            {
              HMFGetOSLogHandle();
              v21 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                id v22 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v80 = v22;
                __int16 v81 = 2112;
                id v82 = v8;
                _os_log_impl(&dword_225DC6000, v21, OS_LOG_TYPE_INFO, "%{public}@Removed userDefinedPersonLinksByHome for homeUUID: %@", buf, 0x16u);
              }
            }
            else
            {
              HMFGetOSLogHandle();
              v21 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                char v33 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v80 = v33;
                __int16 v81 = 2112;
                id v82 = v65;
                _os_log_impl(&dword_225DC6000, v21, OS_LOG_TYPE_ERROR, "%{public}@Error removing user defined person links file: %@", buf, 0x16u);
              }
            }

            id v34 = [(HMIPersonsModelManager *)v20 userDefinedPersonLinksByHome];
            uint64_t v35 = (void *)[v34 mutableCopy];

            [v35 removeObjectForKey:v8];
            uint64_t v36 = [v35 copy];
            userDefinedPersonLinksByHome = v20->_userDefinedPersonLinksByHome;
            v20->_userDefinedPersonLinksByHome = (NSDictionary *)v36;
          }
          v38 = [MEMORY[0x263F08850] defaultManager];
          id v74 = v71;
          char v39 = [v38 removeItemAtPath:v70 error:&v74];
          id v66 = v74;

          if (v39)
          {
            v40 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v15];
            [v40 removeObjectForKey:v9];
            v68 = v40;
            id v41 = objc_alloc(MEMORY[0x263EFF9A0]);
            id v42 = [(HMIPersonsModelManager *)self personsModelsByHome];
            v32 = (void *)[v41 initWithDictionary:v42];

            v43 = (void *)[v68 copy];
            [v32 setObject:v43 forKeyedSubscript:v8];

            v44 = (NSDictionary *)[v32 copy];
            personsModelsByHome = self->_personsModelsByHome;
            self->_personsModelsByHome = v44;

            v72 = [(HMIPersonsModelManager *)self personsModelsByHome];
            v46 = [v72 objectForKeyedSubscript:v8];
            v47 = [(HMIPersonsModelManager *)self userDefinedPersonLinksByHome];
            v48 = [v47 objectForKeyedSubscript:v8];
            id v73 = v13;
            contexta = [(HMIPersonsModelManager *)self buildEquivalencyMapForPersonsModels:v46 userDefinedPersonLinks:v48 error:&v73];
            id v62 = v73;

            id v49 = objc_alloc(MEMORY[0x263EFF9A0]);
            v50 = [(HMIPersonsModelManager *)self equivalencyTablesByHome];
            id v51 = (void *)[v49 initWithDictionary:v50];

            if (contexta) {
              [v51 setObject:contexta forKeyedSubscript:v8];
            }
            else {
              [v51 removeObjectForKey:v8];
            }
            v55 = (NSDictionary *)[v51 copy];
            equivalencyTablesByHome = self->_equivalencyTablesByHome;
            self->_equivalencyTablesByHome = v55;

            id v57 = (void *)MEMORY[0x22A641C70]();
            v58 = self;
            HMFGetOSLogHandle();
            uint64_t v59 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              v60 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v80 = v60;
              __int16 v81 = 2112;
              id v82 = v8;
              __int16 v83 = 2112;
              id v84 = v9;
              _os_log_impl(&dword_225DC6000, v59, OS_LOG_TYPE_INFO, "%{public}@Removed VNPersonsModel for homeUUID: %@ sourceUUID:%@", buf, 0x20u);
            }

            BOOL v24 = 1;
            id v71 = v66;
            id v13 = v62;
            goto LABEL_32;
          }
          uint64_t v52 = [NSString stringWithFormat:@"Failed to remove VNPersonsModel for homeUUID: %@ sourceUUID: %@, path: %@", v8, v9, v70];
          id v53 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1034 description:v52 underlyingError:v66];
          v68 = (void *)v52;

          id v54 = v53;
          v32 = v54;
          if (a5) {
            *a5 = v54;
          }
          HMIErrorLog(self, v32);
          BOOL v24 = 0;
          id v71 = v66;
        }
        else
        {
          uint64_t v29 = [NSString stringWithFormat:@"Failed to remove VNPersonsModel for homeUUID: %@ sourceUUID: %@, error getting model storage path", v8, v9];
          BOOL v30 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1034 description:v29 underlyingError:v71];
          v68 = (void *)v29;

          id v31 = v30;
          v32 = v31;
          if (a5) {
            *a5 = v31;
          }
          HMIErrorLog(self, v32);
          BOOL v24 = 0;
        }
        id v13 = v32;
LABEL_32:

        goto LABEL_33;
      }
    }
    v25 = (void *)MEMORY[0x22A641C70]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v80 = v28;
      __int16 v81 = 2112;
      id v82 = v8;
      __int16 v83 = 2112;
      id v84 = v9;
      _os_log_impl(&dword_225DC6000, v27, OS_LOG_TYPE_INFO, "%{public}@Did not remove VNPersonsModel for homeUUID: %@ sourceUUID: %@, no model found", buf, 0x20u);
    }
    BOOL v24 = 1;
  }
  else
  {
    id v23 = v12;
    id v15 = v23;
    if (a5) {
      *a5 = v23;
    }
    HMIErrorLog(self, v15);
    BOOL v24 = 0;
    id v13 = v15;
  }
LABEL_33:

  os_unfair_lock_unlock(p_lock);
  return v24;
}

- (id)predictHomePersonFromFaceObservation:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v36 = 0;
  BOOL v11 = [(HMIPersonsModelManager *)self loadModelsWithError:&v36];
  id v12 = v36;
  id v13 = v12;
  if (v11)
  {
    v14 = [(HMIPersonsModelManager *)self homePersonsModelForHomeWithUUID:v9];
    id v15 = v14;
    id v34 = v8;
    if (v14)
    {
      uint64_t v16 = [v14 visionPersonsModel];
      id v35 = v13;
      id v17 = [v16 predictPersonFromFaceObservation:v8 limit:10 canceller:0 error:&v35];
      id v18 = v35;

      if (v17)
      {
        char v19 = [v17 firstObject];
        id v20 = objc_alloc(MEMORY[0x263F08C38]);
        v21 = [v19 predictedPersonUniqueIdentifier];
        id v22 = (void *)[v20 initWithUUIDString:v21];

        id v23 = NSNumber;
        [v19 confidence];
        BOOL v24 = objc_msgSend(v23, "numberWithFloat:");
        v25 = [HMIPersonsModelPrediction alloc];
        v26 = [v15 sourceUUID];
        v27 = [(HMIPersonsModelPrediction *)v25 initWithSourceUUID:v26 personUUID:v22 confidence:v24 linkedEntityUUID:0];
      }
      else
      {
        char v19 = [NSString stringWithFormat:@"Failed to predict using VNPersonsModel for home persons model"];
        id v31 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1035 description:v19 underlyingError:v18];

        id v32 = v31;
        id v22 = v32;
        if (a5) {
          *a5 = v32;
        }
        HMIErrorLog(self, v22);
        v27 = 0;
        id v18 = v22;
      }
    }
    else
    {
      id v17 = [NSString stringWithFormat:@"Home persons model not found for homeUUID: %@", v9];
      uint64_t v29 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1037 description:v17];

      id v30 = v29;
      char v19 = v30;
      if (a5) {
        *a5 = v30;
      }
      HMIErrorLog(self, v19);
      v27 = 0;
      id v18 = v19;
    }

    id v8 = v34;
  }
  else
  {
    id v28 = v12;
    id v15 = v28;
    if (a5) {
      *a5 = v28;
    }
    HMIErrorLog(self, v15);
    v27 = 0;
    id v18 = v15;
  }

  os_unfair_lock_unlock(p_lock);
  return v27;
}

- (id)equivalencyCellForPerson:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v8 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v35 = 0;
  BOOL v10 = [(HMIPersonsModelManager *)self loadModelsWithError:&v35];
  id v11 = v35;
  id v12 = v11;
  if (v10)
  {
    id v13 = [(HMIPersonsModelManager *)self equivalencyTablesByHome];
    v14 = [v13 objectForKeyedSubscript:v8];

    if (v14)
    {
      id v15 = v12;
LABEL_9:
      v27 = [v14 equivalencyCellForPerson:v33];
      id v18 = (void *)[v27 copy];

      id v17 = v14;
      goto LABEL_10;
    }
    char v19 = [(HMIPersonsModelManager *)self personsModelsByHome];
    id v20 = [v19 objectForKeyedSubscript:v8];
    v21 = [(HMIPersonsModelManager *)self userDefinedPersonLinksByHome];
    id v22 = [v21 objectForKeyedSubscript:v8];
    id v34 = v12;
    v14 = [(HMIPersonsModelManager *)self buildEquivalencyMapForPersonsModels:v20 userDefinedPersonLinks:v22 error:&v34];
    id v15 = v34;

    id v23 = objc_alloc(MEMORY[0x263EFF9A0]);
    BOOL v24 = [(HMIPersonsModelManager *)self equivalencyTablesByHome];
    id v17 = (void *)[v23 initWithDictionary:v24];

    if (v14)
    {
      [v17 setObject:v14 forKeyedSubscript:v8];
      v25 = (NSDictionary *)[v17 copy];
      equivalencyTablesByHome = self->_equivalencyTablesByHome;
      self->_equivalencyTablesByHome = v25;

      goto LABEL_9;
    }
    uint64_t v29 = (void *)MEMORY[0x22A641C70]();
    id v30 = self;
    HMFGetOSLogHandle();
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      BOOL v37 = v32;
      __int16 v38 = 2112;
      id v39 = v8;
      __int16 v40 = 2112;
      id v41 = v15;
      _os_log_impl(&dword_225DC6000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to build equivalency map for homeUUID: %@, error: %@", buf, 0x20u);
    }
    id v18 = 0;
  }
  else
  {
    id v16 = v11;
    id v17 = v16;
    if (a5) {
      *a5 = v16;
    }
    HMIErrorLog(self, v17);
    id v18 = 0;
    id v15 = v17;
  }
LABEL_10:

  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (id)predictPersonFromFaceObservation:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v82 = 0;
  __int16 v83 = (id *)&v82;
  uint64_t v84 = 0x3032000000;
  uint64_t v85 = __Block_byref_object_copy__6;
  v86 = __Block_byref_object_dispose__6;
  id v87 = 0;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 1;
  uint64_t v72 = 0;
  id v73 = &v72;
  uint64_t v74 = 0x3032000000;
  id v75 = __Block_byref_object_copy__6;
  id v76 = __Block_byref_object_dispose__6;
  id v77 = 0;
  uint64_t v66 = 0;
  id v67 = &v66;
  uint64_t v68 = 0x3032000000;
  uint64_t v69 = __Block_byref_object_copy__6;
  v70 = __Block_byref_object_dispose__6;
  id v71 = 0;
  os_unfair_lock_lock_with_options();
  BOOL v10 = v83;
  id obj = v83[5];
  BOOL v11 = [(HMIPersonsModelManager *)self loadModelsWithError:&obj];
  objc_storeStrong(v10 + 5, obj);
  if (!v11)
  {
    id v25 = v83[5];
    v26 = v25;
    if (a5) {
      *a5 = v25;
    }
    HMIErrorLog(self, v26);

    goto LABEL_16;
  }
  id v12 = [(HMIPersonsModelManager *)self personsModelsByHome];
  id v13 = [v12 objectForKeyedSubscript:v9];

  if (!v13)
  {
    v27 = NSString;
    id v28 = [(HMIPersonsModelManager *)self personsModelsByHome];
    uint64_t v29 = @"not";
    if (!v28) {
      uint64_t v29 = &stru_26D98B6C8;
    }
    id v30 = [v27 stringWithFormat:@"Unable to get person model for homeUUID: %@ (self.personsModelsByHome is %@ nil)", v9, v29];

    uint64_t v31 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1035 description:v30];
    id v32 = v83[5];
    v83[5] = (id)v31;

    id v33 = v83[5];
    id v34 = v33;
    if (a5) {
      *a5 = v33;
    }
    HMIErrorLog(self, v34);

LABEL_16:
    os_unfair_lock_unlock(&self->_lock);
LABEL_17:
    id v35 = 0;
    goto LABEL_18;
  }
  v14 = [(HMIPersonsModelManager *)self equivalencyTablesByHome];
  id v15 = [v14 objectForKeyedSubscript:v9];

  unint64_t v16 = 0x263EFF000;
  if (!v15)
  {
    id v17 = [(HMIPersonsModelManager *)self userDefinedPersonLinksByHome];
    id v18 = [v17 objectForKeyedSubscript:v9];

    if (!v18) {
      id v18 = (void *)MEMORY[0x263EFFA78];
    }
    char v19 = v83;
    id v64 = v83[5];
    id v15 = [(HMIPersonsModelManager *)self buildEquivalencyMapForPersonsModels:v13 userDefinedPersonLinks:v18 error:&v64];
    objc_storeStrong(v19 + 5, v64);
    id v20 = objc_alloc(MEMORY[0x263EFF9A0]);
    v21 = [(HMIPersonsModelManager *)self equivalencyTablesByHome];
    id v22 = (void *)[v20 initWithDictionary:v21];

    if (v15)
    {
      [v22 setObject:v15 forKeyedSubscript:v9];
      id v23 = (NSDictionary *)[v22 copy];
      equivalencyTablesByHome = self->_equivalencyTablesByHome;
      self->_equivalencyTablesByHome = v23;
    }
    else
    {
      context = (void *)MEMORY[0x22A641C70]();
      uint64_t v52 = self;
      HMFGetOSLogHandle();
      BOOL v37 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = HMFGetLogIdentifier();
        id v39 = v83[5];
        *(_DWORD *)buf = 138543874;
        uint64_t v89 = v38;
        __int16 v90 = 2112;
        id v91 = v9;
        __int16 v92 = 2112;
        id v93 = v39;
        v50 = (void *)v38;
        _os_log_impl(&dword_225DC6000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to build equivalency map for homeUUID: %@, error: %@", buf, 0x20u);
      }
    }

    unint64_t v16 = 0x263EFF000uLL;
  }
  uint64_t v40 = [*(id *)(v16 + 2464) dictionary];
  id v41 = (void *)v73[5];
  v73[5] = v40;

  uint64_t v42 = [MEMORY[0x263EFF9C0] set];
  v43 = (void *)v67[5];
  v67[5] = v42;

  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke;
  v55[3] = &unk_26477DBA8;
  id v56 = v8;
  id v57 = v9;
  v60 = &v82;
  id v61 = &v78;
  id v62 = &v66;
  id v44 = v15;
  id v58 = v44;
  uint64_t v59 = self;
  v63 = &v72;
  [v13 enumerateKeysAndObjectsUsingBlock:v55];

  os_unfair_lock_unlock(&self->_lock);
  if (!*((unsigned char *)v79 + 24))
  {
    id v48 = v83[5];
    id v49 = v48;
    if (a5) {
      *a5 = v48;
    }
    HMIErrorLog(self, v49);

    goto LABEL_17;
  }
  v45 = [MEMORY[0x263EFF9C0] set];
  v46 = (void *)v73[5];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke_166;
  v53[3] = &unk_26477DBF8;
  id v47 = v45;
  id v54 = v47;
  [v46 enumerateKeysAndObjectsUsingBlock:v53];
  [v47 unionSet:v67[5]];
  id v35 = (void *)[v47 copy];

LABEL_18:
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);

  return v35;
}

void __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = [v8 visionPersonsModel];
  uint64_t v10 = *(void *)(a1 + 32);
  id v48 = 0;
  BOOL v11 = [v9 predictPersonFromFaceObservation:v10 limit:10 canceller:0 error:&v48];
  id v12 = v48;

  if (v11)
  {
    id v13 = [v11 firstObject];
    if (v13)
    {
      id v46 = v12;
      id v47 = v8;
      id v14 = objc_alloc(MEMORY[0x263F08C38]);
      id v15 = [v13 predictedPersonUniqueIdentifier];
      uint64_t v16 = [v14 initWithUUIDString:v15];

      v45 = (HMIPersonsModelPrediction *)v16;
      id v17 = [[HMIPersonSourceUUIDPair alloc] initWithPersonUUID:v16 sourceUUID:v7];
      id v18 = [*(id *)(a1 + 48) equivalencyCellForPerson:v17];
      if (!v18)
      {
        char v19 = (void *)MEMORY[0x22A641C70]();
        id v20 = *(id *)(a1 + 56);
        v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v22 = HMFGetLogIdentifier();
          uint64_t v23 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          v50 = v22;
          if (v23) {
            BOOL v24 = @" not";
          }
          else {
            BOOL v24 = &stru_26D98B6C8;
          }
          __int16 v51 = 2112;
          uint64_t v52 = v17;
          __int16 v53 = 2112;
          id v54 = v24;
          _os_log_impl(&dword_225DC6000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failure to lookup equivalency cell for %@ (equivalencyCellForHome is%@ nil)", buf, 0x20u);
        }
        id v18 = [MEMORY[0x263EFFA08] setWithObject:v17];
      }
      id v44 = v17;
      id v25 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) objectForKeyedSubscript:v18];
      v26 = v25;
      if (!v25
        || ([v25 confidence],
            v27 = objc_claimAutoreleasedReturnValue(),
            [v27 floatValue],
            float v29 = v28,
            [v13 confidence],
            float v31 = v30,
            v27,
            v29 < v31))
      {
        id v32 = objc_alloc(MEMORY[0x263F08C38]);
        id v33 = [v13 predictedPersonUniqueIdentifier];
        id v34 = (void *)[v32 initWithUUIDString:v33];

        id v35 = NSNumber;
        [v13 confidence];
        id v36 = objc_msgSend(v35, "numberWithFloat:");
        if (v26) {
          [v26 linkedEntityUUID];
        }
        else {
        uint64_t v42 = +[HMIPersonsModelManager minimumUUIDInEquivalencyCell:v18];
        }
        v43 = [[HMIPersonsModelPrediction alloc] initWithSourceUUID:v7 personUUID:v34 confidence:v36 linkedEntityUUID:v42];
        [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setObject:v43 forKeyedSubscript:v18];
      }
      id v12 = v46;
      id v8 = v47;
      id v41 = v45;
    }
    else
    {
      uint64_t v40 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      id v41 = [[HMIPersonsModelPrediction alloc] initWithSourceUUID:v7 personUUID:0 confidence:0 linkedEntityUUID:0];
      [v40 addObject:v41];
    }
  }
  else
  {
    id v13 = [NSString stringWithFormat:@"Failed to predict using VNPersonsModel for homeUUID: %@ sourceUUID: %@", *(void *)(a1 + 40), v7];
    uint64_t v37 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1035 description:v13 underlyingError:v12];
    uint64_t v38 = *(void *)(*(void *)(a1 + 64) + 8);
    id v39 = *(void **)(v38 + 40);
    *(void *)(v38 + 40) = v37;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke_166(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke_2;
  v7[3] = &unk_26477DBD0;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  [a2 enumerateObjectsUsingBlock:v7];
}

void __74__HMIPersonsModelManager_predictPersonFromFaceObservation_homeUUID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  v3 = [v13 personUUID];
  uint64_t v4 = [*(id *)(a1 + 32) personUUID];
  char v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [HMIPersonsModelPrediction alloc];
    id v8 = [v13 sourceUUID];
    id v9 = [v13 personUUID];
    uint64_t v10 = [*(id *)(a1 + 32) confidence];
    BOOL v11 = [*(id *)(a1 + 32) linkedEntityUUID];
    id v12 = [(HMIPersonsModelPrediction *)v7 initWithSourceUUID:v8 personUUID:v9 confidence:v10 linkedEntityUUID:v11];
    [v6 addObject:v12];
  }
  [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
}

+ (id)faceObservationFromTorsoprint:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F1EEE0];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 data];

  id v7 = v6;
  uint64_t v8 = [v7 bytes];
  LODWORD(v9) = 1.0;
  uint64_t v10 = (void *)[v5 initWithData:v8 elementCount:128 elementType:1 lengthInBytes:512 confidence:3 requestRevision:v9];

  BOOL v11 = objc_msgSend(MEMORY[0x263F1EED0], "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", 3, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
  [v11 setFaceprint:v10];

  return v11;
}

- (BOOL)updateTorsoModelForHome:(id)a3 torsoAnnotations:(id)a4 error:(id *)a5
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v69 = a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v87 = 0;
  BOOL v9 = [(HMIPersonsModelManager *)self loadModelsWithError:&v87];
  id v10 = v87;
  id v11 = v10;
  if (v9)
  {
    id v12 = [MEMORY[0x263EFF9A0] dictionary];
    id v13 = [MEMORY[0x263EFF9A0] dictionary];
    id v14 = [(HMIPersonsModelManager *)self torsoModelsByHome];
    id v15 = [v14 objectForKeyedSubscript:v8];

    if (!v15)
    {
      id v67 = v13;
LABEL_9:
      uint64_t v23 = (void *)[v12 mutableCopy];
      BOOL v24 = (void *)[v67 mutableCopy];
      v80[0] = MEMORY[0x263EF8330];
      v80[1] = 3221225472;
      v80[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_176;
      v80[3] = &unk_26477DCE0;
      v80[4] = self;
      id v25 = v23;
      id v81 = v25;
      id v65 = v24;
      id v82 = v65;
      objc_msgSend(v69, "na_each:", v80);
      id v79 = v11;
      uint64_t v66 = +[HMIPersonsModelManager personsModelWithFaceObservationsByID:v25 error:&v79];
      id v26 = v79;

      if (!v66)
      {
        id v55 = v26;
        id v11 = v55;
        if (a5) {
          *a5 = v55;
        }
        HMIErrorLog(self, v11);

        BOOL v22 = 0;
        goto LABEL_35;
      }
      uint64_t v75 = 0;
      id v76 = &v75;
      uint64_t v77 = 0x2020000000;
      int v78 = 0;
      v27 = [v25 allValues];
      v74[0] = MEMORY[0x263EF8330];
      v74[1] = 3221225472;
      v74[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_2_183;
      v74[3] = &unk_26477DD08;
      v74[4] = &v75;
      objc_msgSend(v27, "na_each:", v74);

      float v28 = (void *)MEMORY[0x22A641C70]();
      float v29 = self;
      HMFGetOSLogHandle();
      float v30 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v32 = [v25 count];
        int v33 = *((_DWORD *)v76 + 6);
        *(_DWORD *)buf = 138544130;
        id v89 = v31;
        __int16 v90 = 2048;
        uint64_t v91 = v32;
        __int16 v92 = 1024;
        int v93 = v33;
        __int16 v94 = 2112;
        id v95 = v8;
        _os_log_impl(&dword_225DC6000, v30, OS_LOG_TYPE_INFO, "%{public}@Created new torso model with %lu persons and %d total torsoprints for home: %@", buf, 0x26u);
      }
      id v73 = v26;
      id v64 = +[HMIPersonsModelManager getTorsoModelStoragePathForHomeUUID:v8 error:&v73];
      id v34 = v73;

      id v72 = v34;
      BOOL v35 = +[HMIPersonsModelManager persistModel:v66 toPath:v64 error:&v72];
      id v36 = v72;

      if (v35)
      {
        id v71 = v36;
        BOOL v37 = +[HMIPersonsModelManager persistTorsoToFaceCrop:v65 forHomeUUID:v8 error:&v71];
        id v38 = v71;

        if (v37)
        {
          id v70 = v38;
          BOOL v39 = +[HMIPersonsModelManager persistTorsoprinterVersionForHomeUUID:v8 error:&v70];
          id v11 = v70;

          if (v39)
          {
            uint64_t v40 = (void *)MEMORY[0x22A641C70]();
            id v41 = v29;
            HMFGetOSLogHandle();
            uint64_t v42 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              v43 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              id v89 = v43;
              __int16 v90 = 2112;
              uint64_t v91 = (uint64_t)v8;
              _os_log_impl(&dword_225DC6000, v42, OS_LOG_TYPE_INFO, "%{public}@Successfully updated torso model and face crop map for home: %@", buf, 0x16u);
            }
            id v44 = (void *)MEMORY[0x263EFF9A0];
            v45 = [(HMIPersonsModelManager *)v41 torsoModelsByHome];
            id v46 = [v44 dictionaryWithDictionary:v45];

            id v47 = (void *)MEMORY[0x263EFF9A0];
            id v48 = [(HMIPersonsModelManager *)v41 torsoToFaceCropByHome];
            id v49 = [v47 dictionaryWithDictionary:v48];

            [v46 setObject:v66 forKeyedSubscript:v8];
            v50 = (void *)[v65 copy];
            [v49 setObject:v50 forKeyedSubscript:v8];

            uint64_t v51 = [v46 copy];
            torsoModelsByHome = v41->_torsoModelsByHome;
            v41->_torsoModelsByHome = (NSDictionary *)v51;

            uint64_t v53 = [v49 copy];
            torsoToFaceCropByHome = v41->_torsoToFaceCropByHome;
            v41->_torsoToFaceCropByHome = (NSDictionary *)v53;

            BOOL v22 = 1;
            goto LABEL_34;
          }
          id v62 = v11;
          id v46 = v62;
          if (a5) {
            *a5 = v62;
          }
          HMIErrorLog(v29, v46);
        }
        else
        {
          id v61 = v38;
          id v46 = v61;
          if (a5) {
            *a5 = v61;
          }
          HMIErrorLog(v29, v46);
        }
      }
      else
      {
        id v56 = v36;
        id v46 = v56;
        if (a5) {
          *a5 = v56;
        }
        HMIErrorLog(v29, v46);
      }
      BOOL v22 = 0;
      id v11 = v46;
LABEL_34:

      _Block_object_dispose(&v75, 8);
LABEL_35:

      goto LABEL_36;
    }
    uint64_t v16 = [(HMIPersonsModelManager *)self torsoToFaceCropByHome];
    id v67 = [v16 objectForKeyedSubscript:v8];

    if (v67)
    {
      id v17 = [(HMIPersonsModelManager *)self torsoModelsByHome];
      id v18 = [v17 objectForKeyedSubscript:v8];

      char v19 = [v18 personUniqueIdentifiers];
      v83[0] = MEMORY[0x263EF8330];
      v83[1] = 3221225472;
      v83[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke;
      v83[3] = &unk_26477DC40;
      id v20 = v18;
      id v84 = v20;
      uint64_t v85 = self;
      id v86 = v12;
      objc_msgSend(v19, "na_each:", v83);

      goto LABEL_9;
    }
    id v57 = (void *)MEMORY[0x22A641C70]();
    id v58 = self;
    HMFGetOSLogHandle();
    uint64_t v59 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v89 = v60;
      __int16 v90 = 2112;
      uint64_t v91 = (uint64_t)v8;
      _os_log_impl(&dword_225DC6000, v59, OS_LOG_TYPE_ERROR, "%{public}@Found nil torsoToFaceCrop for home %@ with non-nil model!", buf, 0x16u);
    }
    BOOL v22 = 0;
  }
  else
  {
    id v21 = v10;
    id v12 = v21;
    if (a5) {
      *a5 = v21;
    }
    HMIErrorLog(self, v12);
    BOOL v22 = 0;
    id v11 = v12;
  }
LABEL_36:

  os_unfair_lock_unlock(lock);
  return v22;
}

void __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v20 = 0;
  id v5 = [v4 trainingFaceObservationsForPersonWithUniqueIdentifier:v3 canceller:0 error:&v20];
  id v6 = v20;
  if (v5)
  {
    id v7 = [v5 sortedArrayUsingComparator:&__block_literal_global_174];

    id v8 = (void *)MEMORY[0x22A641C70]();
    id v9 = *(id *)(a1 + 40);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = [v7 count];
      *(_DWORD *)buf = 138543874;
      BOOL v22 = v11;
      __int16 v23 = 2112;
      id v24 = v3;
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Person %@ has %lu torsoprints", buf, 0x20u);
    }
    id v13 = [[HMIPersonSourceUUIDPair alloc] initWithUUIDPairString:v3];
    id v14 = *(void **)(a1 + 48);
    id v15 = [(HMIPersonSourceUUIDPair *)v13 UUIDPairString];
    [v14 setObject:v7 forKeyedSubscript:v15];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x22A641C70]();
    id v17 = *(id *)(a1 + 40);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      char v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      BOOL v22 = v19;
      __int16 v23 = 2112;
      id v24 = v3;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v6;
      _os_log_impl(&dword_225DC6000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve torsoprints for person: %@, %@", buf, 0x20u);
    }
  }
}

uint64_t __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 faceId];
  if (v6 >= [v5 faceId])
  {
    unint64_t v8 = [v4 faceId];
    uint64_t v7 = v8 > [v5 faceId];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_176(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 faceRecognition];
  v43 = [v3 torsoprints];
  id v5 = [v4 predictedLinkedEntityUUIDs];
  if (v5
    && ([v4 predictedLinkedEntityUUIDs],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = objc_msgSend(v6, "hmf_isEmpty"),
        v6,
        v5,
        !v7))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v56 = __Block_byref_object_copy__6;
    id v57 = __Block_byref_object_dispose__6;
    id v58 = 0;
    uint64_t v12 = [v4 predictedLinkedEntityUUIDs];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_177;
    v52[3] = &unk_26477DC68;
    v52[4] = buf;
    objc_msgSend(v12, "na_each:", v52);

    uint64_t v46 = 0;
    id v47 = &v46;
    uint64_t v48 = 0x3032000000;
    id v49 = __Block_byref_object_copy__6;
    v50 = __Block_byref_object_dispose__6;
    id v51 = 0;
    id v13 = [v4 classifications];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_2;
    v45[3] = &unk_26477DC90;
    v45[4] = buf;
    v45[5] = &v46;
    [v13 enumerateObjectsUsingBlock:v45];

    if (v47[5])
    {
      id v14 = [HMIPersonSourceUUIDPair alloc];
      id v15 = [(id)v47[5] personUUID];
      uint64_t v16 = [(id)v47[5] sourceUUID];
      id v17 = [(HMIPersonSourceUUIDPair *)v14 initWithPersonUUID:v15 sourceUUID:v16];

      *(void *)uint64_t v53 = 0;
      *(void *)&v53[8] = v53;
      *(void *)&v53[16] = 0x2020000000;
      uint64_t v54 = 0;
      id v18 = *(void **)(a1 + 40);
      char v19 = [(HMIPersonSourceUUIDPair *)v17 UUIDPairString];
      id v20 = [v18 objectForKeyedSubscript:v19];
      if (objc_msgSend(v20, "hmf_isEmpty"))
      {
        uint64_t v21 = 0;
      }
      else
      {
        uint64_t v26 = *(void **)(a1 + 40);
        uint64_t v27 = [(HMIPersonSourceUUIDPair *)v17 UUIDPairString];
        float v28 = [v26 objectForKeyedSubscript:v27];
        float v29 = [v28 lastObject];
        uint64_t v21 = [v29 faceId];
      }
      uint64_t v54 = v21;
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_180;
      v44[3] = &unk_26477DCB8;
      v44[4] = v53;
      float v30 = objc_msgSend(v43, "na_map:", v44);
      id v31 = *(void **)(a1 + 40);
      uint64_t v32 = [(HMIPersonSourceUUIDPair *)v17 UUIDPairString];
      int v33 = [v31 objectForKeyedSubscript:v32];

      id v34 = *(void **)(a1 + 40);
      BOOL v35 = [(HMIPersonSourceUUIDPair *)v17 UUIDPairString];
      if (v33)
      {
        id v36 = [v34 objectForKeyedSubscript:v35];
        BOOL v37 = [v36 arrayByAddingObjectsFromArray:v30];
        id v38 = *(void **)(a1 + 40);
        BOOL v39 = [(HMIPersonSourceUUIDPair *)v17 UUIDPairString];
        [v38 setObject:v37 forKeyedSubscript:v39];
      }
      else
      {
        [v34 setObject:v30 forKeyedSubscript:v35];
      }

      uint64_t v40 = [*(id *)(a1 + 48) objectForKeyedSubscript:v17];
      BOOL v41 = v40 == 0;

      if (v41)
      {
        uint64_t v42 = [v4 faceCrop];
        [*(id *)(a1 + 48) setObject:v42 forKeyedSubscript:v17];
      }
      _Block_object_dispose(v53, 8);
    }
    else
    {
      BOOL v22 = (void *)MEMORY[0x22A641C70]();
      id v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v53 = 138543618;
        *(void *)&void v53[4] = v25;
        *(_WORD *)&v53[12] = 2112;
        *(void *)&v53[14] = v4;
        _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received torso annotation with no classification corresponding to the linkedEntityUUID: %@", v53, 0x16u);
      }
    }
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    unint64_t v8 = (void *)MEMORY[0x22A641C70]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_ERROR, "%{public}@Received torso annotation with no identifier: %@", buf, 0x16u);
    }
  }
}

void __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_177(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v6 = *(void **)(v5 + 40);
  id v10 = v4;
  if (v6)
  {
    int v7 = [v6 UUIDString];
    unint64_t v8 = [v10 UUIDString];
    uint64_t v9 = [v7 compare:v8];

    if (v9 != -1) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v5 + 40), a2);
LABEL_5:
}

void __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  unint64_t v6 = [v8 personUUID];
  int v7 = [v6 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

id __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_180(uint64_t a1, uint64_t a2)
{
  id v3 = +[HMIPersonsModelManager faceObservationFromTorsoprint:a2];
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  objc_msgSend(v3, "setFaceId:");
  return v3;
}

uint64_t __73__HMIPersonsModelManager_updateTorsoModelForHome_torsoAnnotations_error___block_invoke_2_183(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)faceCropFromTorsoModelForHomeUUID:(id)a3 personUUID:(id)a4 sourceUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v12 = [[HMIPersonSourceUUIDPair alloc] initWithPersonUUID:v9 sourceUUID:v10];
  id v13 = [(HMIPersonsModelManager *)self torsoToFaceCropByHome];
  id v14 = [v13 objectForKeyedSubscript:v8];
  id v15 = [v14 objectForKeyedSubscript:v12];

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (BOOL)_resetStaleTorsoStateForHome:(id)a3 torsoToFaceCropMap:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![(HMIPersonsModelManager *)self _isTorsoFaceCropMapStale:v7]
    && ![(HMIPersonsModelManager *)self _hasTorsoprinterVersionChangedForHome:v6])
  {
    BOOL v26 = 0;
    goto LABEL_13;
  }
  id v8 = (void *)MEMORY[0x22A641C70]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v31 = v11;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Resetting torso model and wiping data", buf, 0xCu);
  }
  id v29 = 0;
  uint64_t v12 = +[HMIPersonsModelManager getTorsoModelStoragePathForHomeUUID:v6 error:&v29];
  id v13 = v29;
  id v14 = [MEMORY[0x263F08850] defaultManager];
  id v28 = v13;
  int v15 = [v14 removeItemAtPath:v12 error:&v28];
  id v16 = v28;

  id v17 = (void *)MEMORY[0x22A641C70]();
  id v18 = v9;
  char v19 = HMFGetOSLogHandle();
  id v20 = v19;
  if (v15)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v31 = v21;
      __int16 v32 = 2112;
      int v33 = v12;
      BOOL v22 = "%{public}@Successfully deleted torso data at path: %@";
      id v23 = v20;
      os_log_type_t v24 = OS_LOG_TYPE_INFO;
      uint32_t v25 = 22;
LABEL_10:
      _os_log_impl(&dword_225DC6000, v23, v24, v22, buf, v25);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v31 = v21;
    __int16 v32 = 2112;
    int v33 = v12;
    __int16 v34 = 2112;
    id v35 = v16;
    BOOL v22 = "%{public}@Failed to delete torso directory at path: %@, error: %@";
    id v23 = v20;
    os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    uint32_t v25 = 32;
    goto LABEL_10;
  }

  BOOL v26 = 1;
LABEL_13:

  return v26;
}

- (BOOL)_hasTorsoprinterVersionChangedForHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v15 = 0;
  uint64_t v5 = +[HMIPersonsModelManager loadTorsoprinterVersion:v4 error:&v15];
  id v6 = v15;
  if (v5
    && (+[HMITorsoprinter currentModelUUID],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = objc_msgSend(v5, "hmf_isEqualToUUID:", v7),
        v7,
        (v8 & 1) != 0))
  {
    BOOL v9 = 0;
  }
  else
  {
    id v10 = (void *)MEMORY[0x22A641C70]();
    id v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v17 = v13;
      _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_INFO, "%{public}@Torso model version on disk doesn't match current version", buf, 0xCu);
    }
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_isTorsoFaceCropMapStale:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 allValues];
    if ([v6 count])
    {
      [MEMORY[0x263EFF910] date];
      uint64_t v17 = 0;
      uint64_t v18 = &v17;
      uint64_t v19 = 0x3032000000;
      id v20 = __Block_byref_object_copy__6;
      uint64_t v21 = __Block_byref_object_dispose__6;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = v7;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __51__HMIPersonsModelManager__isTorsoFaceCropMapStale___block_invoke;
      v16[3] = &unk_26477DD30;
      v16[4] = &v17;
      objc_msgSend(v6, "na_each:", v16);
      char v8 = [MEMORY[0x263EFF8F0] currentCalendar];
      char v9 = [v8 isDate:v18[5] inSameDayAsDate:v7];

      if ((v9 & 1) == 0)
      {
        id v10 = (void *)MEMORY[0x22A641C70]();
        id v11 = self;
        HMFGetOSLogHandle();
        uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          os_log_type_t v24 = v13;
          _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_INFO, "%{public}@Found stale torso_to_facecrop file", buf, 0xCu);
        }
      }
      _Block_object_dispose(&v17, 8);

      char v14 = v9 ^ 1;
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

void __51__HMIPersonsModelManager__isTorsoFaceCropMapStale___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 dateCreated];
  uint64_t v3 = [v6 earlierDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)predictPersonFromTorsoObservation:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v8 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v45 = 0;
  BOOL v10 = [(HMIPersonsModelManager *)self loadModelsWithError:&v45];
  id v11 = v45;
  uint64_t v12 = v11;
  if (v10)
  {
    id v13 = [(HMIPersonsModelManager *)self torsoModelsByHome];
    char v14 = [v13 objectForKeyedSubscript:v8];

    if (v14)
    {
      BOOL v39 = +[HMIPersonsModelManager faceObservationFromTorsoprint:v44];
      id v15 = objc_msgSend(v14, "predictPersonFromFaceObservation:limit:canceller:error:");
      id v42 = 0;
      uint64_t v40 = v15;
      if (v15)
      {
        v43 = [v15 firstObject];
        uint64_t v41 = [v43 predictedPersonUniqueIdentifier];
        id v16 = (void *)MEMORY[0x22A641C70]();
        uint64_t v17 = self;
        HMFGetOSLogHandle();
        uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          [v43 confidence];
          *(_DWORD *)buf = 138543874;
          id v47 = v19;
          __int16 v48 = 2112;
          uint64_t v49 = v41;
          __int16 v50 = 2048;
          double v51 = v20;
          _os_log_impl(&dword_225DC6000, v18, OS_LOG_TYPE_INFO, "%{public}@Torso model predicted person %@ with confidence %f", buf, 0x20u);
        }
        uint64_t v21 = [[HMIPersonSourceUUIDPair alloc] initWithUUIDPairString:v41];
        id v22 = [HMIPersonsModelPrediction alloc];
        id v23 = [(HMIPersonSourceUUIDPair *)v21 sourceUUID];
        os_log_type_t v24 = [(HMIPersonSourceUUIDPair *)v21 personUUID];
        uint64_t v25 = NSNumber;
        [v43 confidence];
        BOOL v26 = objc_msgSend(v25, "numberWithFloat:");
        uint64_t v27 = [(HMIPersonSourceUUIDPair *)v21 personUUID];
        id v28 = [(HMIPersonsModelPrediction *)v22 initWithSourceUUID:v23 personUUID:v24 confidence:v26 linkedEntityUUID:v27];

        id v29 = (void *)v41;
      }
      else
      {
        uint64_t v35 = [NSString stringWithFormat:@"Failed to predict using torso model for homeUUID: %@", v8];
        uint64_t v36 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1035 description:v35 underlyingError:v42];
        v43 = (void *)v35;

        id v37 = v36;
        id v29 = v37;
        if (a5) {
          *a5 = v37;
        }
        HMIErrorLog(self, v29);
        id v28 = 0;
        uint64_t v12 = v29;
      }
    }
    else
    {
      id v31 = (void *)MEMORY[0x22A641C70]();
      __int16 v32 = self;
      HMFGetOSLogHandle();
      int v33 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        __int16 v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v47 = v34;
        __int16 v48 = 2112;
        uint64_t v49 = (uint64_t)v8;
        _os_log_impl(&dword_225DC6000, v33, OS_LOG_TYPE_DEBUG, "%{public}@There is no current torso model for home: %@", buf, 0x16u);
      }
      id v28 = 0;
    }
  }
  else
  {
    id v30 = v11;
    char v14 = v30;
    if (a5) {
      *a5 = v30;
    }
    HMIErrorLog(self, v14);
    id v28 = 0;
    uint64_t v12 = v14;
  }

  os_unfair_lock_unlock(p_lock);
  return v28;
}

- (id)linkedPredictionsForPrediction:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [HMIPersonSourceUUIDPair alloc];
  id v11 = [v8 personUUID];
  uint64_t v12 = [v8 sourceUUID];
  id v13 = [(HMIPersonSourceUUIDPair *)v10 initWithPersonUUID:v11 sourceUUID:v12];

  char v14 = [(HMIPersonsModelManager *)self equivalencyCellForPerson:v13 homeUUID:v9 error:a5];

  if (v14)
  {
    id v15 = +[HMIPersonsModelManager minimumUUIDInEquivalencyCell:v14];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __72__HMIPersonsModelManager_linkedPredictionsForPrediction_homeUUID_error___block_invoke;
    v19[3] = &unk_26477DD58;
    id v20 = v8;
    id v21 = v15;
    id v16 = v15;
    uint64_t v17 = objc_msgSend(v14, "na_map:", v19);
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

HMIPersonsModelPrediction *__72__HMIPersonsModelManager_linkedPredictionsForPrediction_homeUUID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [HMIPersonsModelPrediction alloc];
  uint64_t v5 = [v3 sourceUUID];
  id v6 = [v3 personUUID];

  id v7 = [*(id *)(a1 + 32) confidence];
  id v8 = [(HMIPersonsModelPrediction *)v4 initWithSourceUUID:v5 personUUID:v6 confidence:v7 linkedEntityUUID:*(void *)(a1 + 40)];

  return v8;
}

- (void)timerDidFire:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void *)MEMORY[0x22A641C70]();
  os_unfair_lock_lock_with_options();
  [(HMIPersonsModelManager *)self _reset];
  uint64_t v5 = [(HMIPersonsModelManager *)self watchdogTimer];
  [v5 suspend];

  [(HMIPersonsModelManager *)self setTransaction:0];
  os_unfair_lock_unlock(&self->_lock);
}

+ (id)loadModelAtPath:(id)a3 error:(id *)a4
{
  uint64_t v5 = [NSURL fileURLWithPath:a3];
  id v6 = objc_opt_new();
  id v7 = [MEMORY[0x263F1EF60] modelFromURL:v5 options:v6 error:a4];

  return v7;
}

+ (BOOL)persistModel:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSURL fileURLWithPath:v8];
  BOOL v10 = [v9 URLByDeletingLastPathComponent];

  id v11 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v12 = [v10 path];
  int v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:a5];

  if (v13)
  {
    char v14 = [NSURL fileURLWithPath:v8];
    id v15 = objc_alloc_init(MEMORY[0x263F1EF78]);
    [v15 setReadOnly:0];
    char v16 = [v7 writeToURL:v14 options:v15 error:a5];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

+ (id)getModelStoragePathForHome:(id)a3 error:(id *)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = +[HMIPersonsModelManager getRootModelStoragePathWithError:a4];
  id v7 = (void *)v6;
  if (v6)
  {
    id v8 = NSString;
    v13[0] = v6;
    id v9 = [v5 UUIDString];
    v13[1] = v9;
    BOOL v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    id v11 = [v8 pathWithComponents:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)getModelStoragePathForModel:(id)a3 error:(id *)a4
{
  v17[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 homeUUID];
  id v7 = +[HMIPersonsModelManager getModelStoragePathForHome:v6 error:a4];

  if (v7)
  {
    id v8 = NSString;
    v17[0] = v7;
    int v9 = [v5 isExternalLibrary];
    BOOL v10 = @"home";
    if (v9) {
      BOOL v10 = @"external";
    }
    v17[1] = v10;
    id v11 = NSString;
    uint64_t v12 = [v5 sourceUUID];
    int v13 = [v11 stringWithFormat:@"%@.bin", v12];
    v17[2] = v13;
    char v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
    id v15 = [v8 pathWithComponents:v14];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)getRootModelStoragePathWithError:(id *)a3
{
  id v3 = HMIURLForCacheDirectory(a3);
  if (v3)
  {
    uint64_t v4 = +[HMIPreference sharedInstance];
    id v5 = [v3 path];
    uint64_t v6 = [v4 stringPreferenceForKey:@"personsModelStoragePath" defaultValue:v5];

    id v7 = [NSURL fileURLWithPath:v6];
    id v8 = [v7 URLByAppendingPathComponent:@"personsmodels" isDirectory:1];

    int v9 = [v8 absoluteURL];
    BOOL v10 = [v9 path];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)getUserDefinedPersonLinksStoragePathForHomeUUID:(id)a3 error:(id *)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = +[HMIPersonsModelManager getModelStoragePathForHome:a3 error:a4];
  id v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = NSString;
    v10[0] = v4;
    v10[1] = @"user_defined_person_links.bin";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    id v8 = [v6 pathWithComponents:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)persistUserDefinedPersonLinks:(id)a3 forHomeUUID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = +[HMIPersonsModelManager getUserDefinedPersonLinksStoragePathForHomeUUID:a4 error:a5];
  if (v8)
  {
    int v9 = [NSURL fileURLWithPath:v8];
    BOOL v10 = [v9 URLByDeletingLastPathComponent];

    id v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v12 = [v10 path];
    int v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:a5];

    if (v13)
    {
      char v14 = [NSURL fileURLWithPath:v8];
      id v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:a5];
      char v16 = v15;
      if (v15) {
        char v17 = [v15 writeToURL:v14 atomically:1];
      }
      else {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

+ (id)loadUserDefinedPersonLinksForHomeUUID:(id)a3 error:(id *)a4
{
  v15[4] = *MEMORY[0x263EF8340];
  id v5 = +[HMIPersonsModelManager getUserDefinedPersonLinksStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getUserDefinedPersonLinksStoragePathForHomeUUID:error:", a3);
  if (v5)
  {
    uint64_t v6 = [NSURL fileURLWithPath:v5];
    id v7 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v6 error:a4];
    if (v7)
    {
      id v8 = (void *)MEMORY[0x263EFFA08];
      v15[0] = objc_opt_class();
      v15[1] = objc_opt_class();
      v15[2] = objc_opt_class();
      v15[3] = objc_opt_class();
      int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];
      BOOL v10 = [v8 setWithArray:v9];

      id v11 = (void *)MEMORY[0x263F08928];
      uint64_t v12 = [v7 readDataToEndOfFile];
      int v13 = [v11 unarchivedObjectOfClasses:v10 fromData:v12 error:a4];
    }
    else
    {
      int v13 = 0;
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

+ (id)getTorsoSubdirectoryPathForHomeUUID:(id)a3 error:(id *)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = +[HMIPersonsModelManager getModelStoragePathForHome:a3 error:a4];
  id v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = NSString;
    v10[0] = v4;
    v10[1] = @"torso";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    id v8 = [v6 pathWithComponents:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)getTorsoModelStoragePathForHomeUUID:(id)a3 error:(id *)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = +[HMIPersonsModelManager getTorsoSubdirectoryPathForHomeUUID:a3 error:a4];
  id v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = NSString;
    v10[0] = v4;
    v10[1] = @"torso.bin";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    id v8 = [v6 pathWithComponents:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)getTorsoToFaceCropStoragePathForHomeUUID:(id)a3 error:(id *)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = +[HMIPersonsModelManager getTorsoSubdirectoryPathForHomeUUID:a3 error:a4];
  id v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = NSString;
    v10[0] = v4;
    v10[1] = @"torso_to_facecrop.bin";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    id v8 = [v6 pathWithComponents:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)getTorsoprinterVersionStoragePathForHomeUUID:(id)a3 error:(id *)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = +[HMIPersonsModelManager getTorsoSubdirectoryPathForHomeUUID:a3 error:a4];
  id v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = NSURL;
    v10[0] = v4;
    v10[1] = @"torsoprinter_version.bin";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    id v8 = [v6 fileURLWithPathComponents:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)persistTorsoToFaceCrop:(id)a3 forHomeUUID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = +[HMIPersonsModelManager getTorsoToFaceCropStoragePathForHomeUUID:a4 error:a5];
  if (v8)
  {
    int v9 = [NSURL fileURLWithPath:v8];
    BOOL v10 = [v9 URLByDeletingLastPathComponent];

    id v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v12 = [v10 path];
    int v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:a5];

    if (v13)
    {
      char v14 = [NSURL fileURLWithPath:v8];
      id v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:a5];
      char v16 = v15;
      if (v15) {
        char v17 = [v15 writeToURL:v14 atomically:1];
      }
      else {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

+ (BOOL)persistTorsoprinterVersionForHomeUUID:(id)a3 error:(id *)a4
{
  id v5 = +[HMIPersonsModelManager getTorsoprinterVersionStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoprinterVersionStoragePathForHomeUUID:error:", a3);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 URLByDeletingLastPathComponent];
    id v8 = [MEMORY[0x263F08850] defaultManager];
    int v9 = [v7 path];
    int v10 = [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:a4];

    if (v10)
    {
      id v11 = +[HMITorsoprinter currentModelUUID];
      uint64_t v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:a4];
      int v13 = v12;
      if (v12) {
        char v14 = [v12 writeToURL:v6 atomically:1];
      }
      else {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (id)loadTorsoToFaceCrop:(id)a3 error:(id *)a4
{
  v15[6] = *MEMORY[0x263EF8340];
  id v5 = +[HMIPersonsModelManager getTorsoToFaceCropStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoToFaceCropStoragePathForHomeUUID:error:", a3);
  if (v5)
  {
    uint64_t v6 = [NSURL fileURLWithPath:v5];
    id v7 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v6 error:a4];
    if (v7)
    {
      id v8 = (void *)MEMORY[0x263EFFA08];
      v15[0] = objc_opt_class();
      v15[1] = objc_opt_class();
      v15[2] = objc_opt_class();
      v15[3] = objc_opt_class();
      v15[4] = objc_opt_class();
      void v15[5] = objc_opt_class();
      int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:6];
      int v10 = [v8 setWithArray:v9];

      id v11 = (void *)MEMORY[0x263F08928];
      uint64_t v12 = [v7 readDataToEndOfFile];
      int v13 = [v11 unarchivedObjectOfClasses:v10 fromData:v12 error:a4];
    }
    else
    {
      int v13 = 0;
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

+ (id)loadTorsoprinterVersion:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = +[HMIPersonsModelManager getTorsoprinterVersionStoragePathForHomeUUID:error:](HMIPersonsModelManager, "getTorsoprinterVersionStoragePathForHomeUUID:error:", a3);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v5 error:a4];
    if (v6)
    {
      id v7 = (void *)MEMORY[0x263EFFA08];
      v14[0] = objc_opt_class();
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      int v9 = [v7 setWithArray:v8];

      int v10 = (void *)MEMORY[0x263F08928];
      id v11 = [v6 readDataToEndOfFile];
      uint64_t v12 = [v10 unarchivedObjectOfClasses:v9 fromData:v11 error:a4];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)modelURLsFromPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v25 = 0;
  char v8 = [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v9 = v25;
  if (v8)
  {
    int v10 = [NSURL URLWithString:v6];
    id v24 = v9;
    id v11 = [v7 contentsOfDirectoryAtURL:v10 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:4 error:&v24];
    id v12 = v24;

    if (v11)
    {
      id v23 = v12;
      int v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\A[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}\\.bin\\Z" options:0 error:&v23];
      id v14 = v23;

      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __50__HMIPersonsModelManager_modelURLsFromPath_error___block_invoke;
      v21[3] = &unk_26477DD80;
      id v22 = v13;
      id v15 = v13;
      char v16 = objc_msgSend(v11, "na_filter:", v21);
      char v17 = v22;
      id v12 = v14;
    }
    else
    {
      id v15 = [NSString stringWithFormat:@"Failed to enumerate persons models at path (%@)", v6];
      id v19 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1032 description:v15 underlyingError:v12];
      char v17 = v19;
      if (a4) {
        *a4 = v19;
      }
      HMIErrorLog(self, v17);
      char v16 = 0;
    }

    id v9 = v12;
  }
  else
  {
    int v10 = [NSString stringWithFormat:@"Directory to load/store persons models (%@) does not exist", v6];
    uint64_t v18 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1032 description:v10 underlyingError:v9];
    id v11 = v18;
    if (a4) {
      *a4 = v18;
    }
    HMIErrorLog(self, v11);
    char v16 = 0;
  }

  return v16;
}

BOOL __50__HMIPersonsModelManager_modelURLsFromPath_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 lastPathComponent];
  BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) == 1;

  return v4;
}

- (BOOL)loadModelsWithError:(id *)a3
{
  uint64_t v157 = *MEMORY[0x263EF8340];
  id v5 = +[HMIPreference sharedInstance];
  int v6 = [v5 shouldEnableTorsoRecognition];

  if (v6)
  {
    id v7 = [(HMIPersonsModelManager *)self torsoModelsByHome];
    if (v7)
    {
      char v8 = [(HMIPersonsModelManager *)self torsoToFaceCropByHome];
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
  int v10 = [(HMIPersonsModelManager *)self personsModelsByHome];

  if (v10 && v9)
  {
    id v11 = [(HMIPersonsModelManager *)self watchdogTimer];
    [v11 kick];

    return 1;
  }
  else
  {
    id v119 = a3;
    int v13 = [MEMORY[0x263EFF9A0] dictionary];
    id v14 = [MEMORY[0x263EFF9A0] dictionary];
    id v15 = [MEMORY[0x263EFF9A0] dictionary];
    v128 = [MEMORY[0x263EFF9A0] dictionary];
    id v148 = 0;
    char v16 = +[HMIPersonsModelManager getRootModelStoragePathWithError:&v148];
    id v17 = v148;
    uint64_t v18 = v17;
    if (v16)
    {
      int v118 = v6;
      id v19 = (void *)MEMORY[0x22A641C70]();
      id v20 = self;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v150 = v22;
        __int16 v151 = 2112;
        uint64_t v152 = (uint64_t)v16;
        _os_log_impl(&dword_225DC6000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Persons Model Storage Path:%@", buf, 0x16u);
      }
      v129 = v20;

      id v114 = v16;
      id v23 = [NSURL URLWithString:v16];
      id v24 = [MEMORY[0x263F08850] defaultManager];
      id v25 = [v23 path];
      id v147 = v18;
      char v26 = [v24 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v147];
      id v27 = v147;

      id v113 = v23;
      if (v26)
      {
        id v28 = [MEMORY[0x263F08850] defaultManager];
        id v146 = v27;
        id v29 = [v28 contentsOfDirectoryAtURL:v23 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:4 error:&v146];
        id v30 = v146;

        if (v29)
        {
          long long v144 = 0u;
          long long v145 = 0u;
          long long v142 = 0u;
          long long v143 = 0u;
          id obj = v29;
          uint64_t v121 = [obj countByEnumeratingWithState:&v142 objects:v156 count:16];
          if (v121)
          {
            uint64_t v120 = *(void *)v143;
            id v116 = v13;
            id v117 = v14;
            id v115 = v15;
            while (2)
            {
              for (uint64_t i = 0; i != v121; ++i)
              {
                if (*(void *)v143 != v120) {
                  objc_enumerationMutation(obj);
                }
                __int16 v32 = *(void **)(*((void *)&v142 + 1) + 8 * i);
                id v33 = objc_alloc(MEMORY[0x263F08C38]);
                __int16 v34 = [v32 lastPathComponent];
                uint64_t v35 = (void *)[v33 initWithUUIDString:v34];

                if (v35)
                {
                  id v131 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                  __int16 v125 = v32;
                  uint64_t v36 = [v32 URLByAppendingPathComponent:@"external"];
                  uint64_t v37 = [v36 path];

                  id v141 = v30;
                  uint64_t v127 = (void *)v37;
                  id v38 = [(HMIPersonsModelManager *)v129 modelURLsFromPath:v37 error:&v141];
                  id v27 = v141;

                  if (!v38)
                  {
                    if (v119) {
                      *id v119 = v27;
                    }
                    HMIErrorLog(v129, v27);
                    goto LABEL_88;
                  }
                  uint64_t v123 = i;
                  v132 = v35;
                  long long v139 = 0u;
                  long long v140 = 0u;
                  long long v137 = 0u;
                  long long v138 = 0u;
                  id v130 = v38;
                  uint64_t v39 = [v130 countByEnumeratingWithState:&v137 objects:v155 count:16];
                  if (v39)
                  {
                    uint64_t v40 = v39;
                    uint64_t v41 = *(void *)v138;
                    id v42 = v129;
                    do
                    {
                      uint64_t v43 = 0;
                      id v44 = v27;
                      do
                      {
                        if (*(void *)v138 != v41) {
                          objc_enumerationMutation(v130);
                        }
                        id v45 = *(void **)(*((void *)&v137 + 1) + 8 * v43);
                        id v136 = v44;
                        uint64_t v46 = [(HMIPersonsModelManager *)v42 loadPersonsModelFromURL:v45 externalLibrary:1 homeUUID:v132 error:&v136];
                        id v27 = v136;

                        id v47 = (void *)MEMORY[0x22A641C70]();
                        __int16 v48 = v42;
                        uint64_t v49 = HMFGetOSLogHandle();
                        __int16 v50 = v49;
                        if (v46)
                        {
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                          {
                            double v51 = HMFGetLogIdentifier();
                            uint64_t v52 = [v46 sourceUUID];
                            *(_DWORD *)buf = 138543874;
                            v150 = v51;
                            __int16 v151 = 2112;
                            uint64_t v152 = (uint64_t)v132;
                            __int16 v153 = 2112;
                            id v154 = v52;
                            _os_log_impl(&dword_225DC6000, v50, OS_LOG_TYPE_INFO, "%{public}@Loaded External HMIPersonsModel for homeUUID: %@ sourceUUID: %@", buf, 0x20u);

                            id v42 = v129;
                          }

                          uint64_t v53 = [v46 sourceUUID];
                          [v131 setObject:v46 forKeyedSubscript:v53];
                        }
                        else
                        {
                          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v54 = HMFGetLogIdentifier();
                            *(_DWORD *)buf = 138543874;
                            v150 = v54;
                            __int16 v151 = 2112;
                            uint64_t v152 = (uint64_t)v45;
                            __int16 v153 = 2112;
                            id v154 = v27;
                            _os_log_impl(&dword_225DC6000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to load External HMIPersonsModel at path: %@, error: %@", buf, 0x20u);

                            id v42 = v129;
                          }
                        }

                        ++v43;
                        id v44 = v27;
                      }
                      while (v40 != v43);
                      uint64_t v40 = [v130 countByEnumeratingWithState:&v137 objects:v155 count:16];
                    }
                    while (v40);
                  }
                  else
                  {
                    id v42 = v129;
                  }

                  v60 = [v125 URLByAppendingPathComponent:@"home"];
                  id v61 = [v60 path];

                  id v135 = v27;
                  id v62 = [(HMIPersonsModelManager *)v42 modelURLsFromPath:v61 error:&v135];
                  id v63 = v135;

                  uint64_t v35 = v132;
                  if (!v62)
                  {
                    int v13 = v116;
                    id v14 = v117;
                    if (v119) {
                      *id v119 = v63;
                    }
                    HMIErrorLog(v129, v63);
LABEL_87:

                    id v27 = v63;
                    id v15 = v115;
LABEL_88:

                    BOOL v12 = 0;
                    v102 = obj;
                    goto LABEL_89;
                  }
                  int v13 = v116;
                  id v14 = v117;
                  if ((unint64_t)[v62 count] >= 2)
                  {
                    id v109 = [NSString stringWithFormat:@"Directory to load/store home persons model (%@) contains multiples files: %@ there can only be one", v61, v62];
                    id v110 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1032 description:v109 underlyingError:v63];
                    id v111 = v110;
                    if (v119) {
                      *id v119 = v110;
                    }
                    HMIErrorLog(v129, v111);

                    uint64_t v35 = v132;
                    goto LABEL_87;
                  }
                  id v126 = v61;
                  id v122 = v62;
                  if ([v62 count])
                  {
                    id v64 = [v62 firstObject];
                    id v134 = v63;
                    id v65 = [(HMIPersonsModelManager *)v129 loadPersonsModelFromURL:v64 externalLibrary:0 homeUUID:v132 error:&v134];
                    id v66 = v134;

                    id v67 = (void *)MEMORY[0x22A641C70]();
                    uint64_t v68 = v129;
                    id v69 = HMFGetOSLogHandle();
                    id v70 = v69;
                    if (v65)
                    {
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v72 = id v71 = v66;
                        [v65 sourceUUID];
                        v74 = id v73 = v64;
                        *(_DWORD *)buf = 138543874;
                        v150 = v72;
                        __int16 v151 = 2112;
                        uint64_t v152 = (uint64_t)v132;
                        __int16 v153 = 2112;
                        id v154 = v74;
                        _os_log_impl(&dword_225DC6000, v70, OS_LOG_TYPE_INFO, "%{public}@Loaded Home HMIPersonsModel for homeUUID: %@ sourceUUID: %@", buf, 0x20u);

                        id v64 = v73;
                        id v66 = v71;
                        int v13 = v116;
                        id v14 = v117;
                      }

                      uint64_t v75 = [v65 sourceUUID];
                      [v131 setObject:v65 forKeyedSubscript:v75];
                    }
                    else
                    {
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        id v81 = v80 = v66;
                        *(_DWORD *)buf = 138543874;
                        v150 = v81;
                        __int16 v151 = 2112;
                        uint64_t v152 = (uint64_t)v64;
                        __int16 v153 = 2112;
                        id v154 = v80;
                        _os_log_impl(&dword_225DC6000, v70, OS_LOG_TYPE_ERROR, "%{public}@Failed to load Home HMIPersonsModel at path: %@, error: %@", buf, 0x20u);

                        id v66 = v80;
                        int v13 = v116;
                        id v14 = v117;
                      }
                    }

                    id v63 = v66;
                  }
                  else
                  {
                    id v76 = (void *)MEMORY[0x22A641C70]();
                    uint64_t v77 = v129;
                    int v78 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                    {
                      id v79 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543618;
                      v150 = v79;
                      __int16 v151 = 2112;
                      uint64_t v152 = (uint64_t)v132;
                      _os_log_impl(&dword_225DC6000, v78, OS_LOG_TYPE_INFO, "%{public}@No home model found for homeUUID: %@", buf, 0x16u);
                    }
                  }
                  id v82 = (void *)[v131 copy];
                  [v13 setObject:v82 forKeyedSubscript:v132];

                  id v133 = v63;
                  __int16 v83 = +[HMIPersonsModelManager loadUserDefinedPersonLinksForHomeUUID:v132 error:&v133];
                  id v30 = v133;

                  id v84 = (void *)MEMORY[0x22A641C70]();
                  uint64_t v85 = v129;
                  id v86 = HMFGetOSLogHandle();
                  BOOL v87 = os_log_type_enabled(v86, OS_LOG_TYPE_INFO);
                  if (v83)
                  {
                    id v15 = v115;
                    if (v87)
                    {
                      v88 = HMFGetLogIdentifier();
                      uint64_t v89 = [v83 count];
                      *(_DWORD *)buf = 138543874;
                      v150 = v88;
                      __int16 v151 = 2048;
                      uint64_t v152 = v89;
                      __int16 v153 = 2112;
                      id v154 = v132;
                      _os_log_impl(&dword_225DC6000, v86, OS_LOG_TYPE_INFO, "%{public}@Loaded %lu user defined equivalencies found for home: %@", buf, 0x20u);
                    }
                  }
                  else
                  {
                    id v15 = v115;
                    if (v87)
                    {
                      __int16 v90 = HMFGetLogIdentifier();
                      [v30 shortDescription];
                      __int16 v92 = v91 = v30;
                      *(_DWORD *)buf = 138543874;
                      v150 = v90;
                      __int16 v151 = 2112;
                      uint64_t v152 = (uint64_t)v132;
                      __int16 v153 = 2112;
                      id v154 = v92;
                      _os_log_impl(&dword_225DC6000, v86, OS_LOG_TYPE_INFO, "%{public}@No user defined equivalencies found for home: %@ (reason: %@)", buf, 0x20u);

                      id v30 = v91;
                    }

                    __int16 v83 = [NSDictionary dictionary];
                  }
                  [v14 setObject:v83 forKeyedSubscript:v132];
                  if (v118) {
                    [(HMIPersonsModelManager *)v85 _loadTorsoDataForHomeUUID:v132 intoTorsoModelsByHome:v15 torsoToFaceCropByHome:v128];
                  }

                  uint64_t i = v123;
                }
                else
                {
                  id v55 = (void *)MEMORY[0x22A641C70]();
                  id v56 = v129;
                  id v57 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    uint64_t v59 = v58 = v30;
                    *(_DWORD *)buf = 138543618;
                    v150 = v59;
                    __int16 v151 = 2112;
                    uint64_t v152 = (uint64_t)v32;
                    _os_log_impl(&dword_225DC6000, v57, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Home UUID from path: %@", buf, 0x16u);

                    id v30 = v58;
                  }
                }
              }
              uint64_t v121 = [obj countByEnumeratingWithState:&v142 objects:v156 count:16];
              if (v121) {
                continue;
              }
              break;
            }
          }

          uint64_t v93 = [v13 copy];
          personsModelsByHome = v129->_personsModelsByHome;
          v129->_personsModelsByHome = (NSDictionary *)v93;

          uint64_t v95 = [v14 copy];
          userDefinedPersonLinksByHome = v129->_userDefinedPersonLinksByHome;
          v129->_userDefinedPersonLinksByHome = (NSDictionary *)v95;

          uint64_t v97 = [v15 copy];
          torsoModelsByHome = v129->_torsoModelsByHome;
          v129->_torsoModelsByHome = (NSDictionary *)v97;

          uint64_t v99 = [v128 copy];
          torsoToFaceCropByHome = v129->_torsoToFaceCropByHome;
          v129->_torsoToFaceCropByHome = (NSDictionary *)v99;

          v101 = (void *)[objc_alloc(MEMORY[0x263F425C0]) initWithName:@"HMIPersonsModelManager"];
          [(HMIPersonsModelManager *)v129 setTransaction:v101];

          v102 = [(HMIPersonsModelManager *)v129 watchdogTimer];
          [v102 resume];
          BOOL v12 = 1;
        }
        else
        {
          id obj = 0;
          v102 = [NSString stringWithFormat:@"Failed to enumerate homes at path: %@", v23];
          id v107 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1032 description:v102 underlyingError:v30];
          id v108 = v107;
          if (v119) {
            *id v119 = v107;
          }
          HMIErrorLog(v129, v108);

          BOOL v12 = 0;
        }
        id v27 = v30;
      }
      else
      {
        v103 = NSString;
        v104 = [v23 path];
        uint64_t v105 = [v103 stringWithFormat:@"Directory to load/store persons models (%@) does not exist", v104];

        id obj = (id)v105;
        v106 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1032 description:v105 underlyingError:v27];
        v102 = v106;
        if (v119) {
          *id v119 = v106;
        }
        HMIErrorLog(v129, v102);
        BOOL v12 = 0;
      }
LABEL_89:

      uint64_t v18 = v27;
      char v16 = v114;
    }
    else
    {
      if (a3) {
        *a3 = v17;
      }
      HMIErrorLog(self, v18);
      BOOL v12 = 0;
    }
  }
  return v12;
}

- (void)_loadTorsoDataForHomeUUID:(id)a3 intoTorsoModelsByHome:(id)a4 torsoToFaceCropByHome:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v40 = 0;
  id v11 = +[HMIPersonsModelManager getTorsoModelStoragePathForHomeUUID:v8 error:&v40];
  id v12 = v40;
  if (!v11)
  {
    id v24 = (void *)MEMORY[0x22A641C70]();
    id v25 = self;
    char v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v42 = v27;
      __int16 v43 = 2112;
      id v44 = v12;
      id v28 = "%{public}@Got nil for torso model file path, error: %@";
      id v29 = v26;
      os_log_type_t v30 = OS_LOG_TYPE_ERROR;
      uint32_t v31 = 22;
LABEL_13:
      _os_log_impl(&dword_225DC6000, v29, v30, v28, buf, v31);
    }
LABEL_14:

    goto LABEL_23;
  }
  int v13 = [MEMORY[0x263F08850] defaultManager];
  char v14 = [v13 fileExistsAtPath:v11];

  if ((v14 & 1) == 0)
  {
    id v24 = (void *)MEMORY[0x22A641C70]();
    id v25 = self;
    char v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v42 = v27;
      __int16 v43 = 2112;
      id v44 = v8;
      __int16 v45 = 2112;
      id v46 = v11;
      id v28 = "%{public}@No torso model found for home %@ at path: %@";
      id v29 = v26;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
      uint32_t v31 = 32;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v39 = v12;
  id v15 = +[HMIPersonsModelManager loadTorsoToFaceCrop:v8 error:&v39];
  id v16 = v39;

  if (v15)
  {
    if (![(HMIPersonsModelManager *)self _resetStaleTorsoStateForHome:v8 torsoToFaceCropMap:v15])
    {
      id v38 = v16;
      id v17 = +[HMIPersonsModelManager loadModelAtPath:v11 error:&v38];
      id v18 = v38;

      id v19 = (void *)MEMORY[0x22A641C70]();
      id v20 = self;
      id v21 = HMFGetOSLogHandle();
      id v22 = v21;
      if (v17)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = id v36 = v18;
          *(_DWORD *)buf = 138543618;
          id v42 = v23;
          __int16 v43 = 2112;
          id v44 = v8;
          _os_log_impl(&dword_225DC6000, v22, OS_LOG_TYPE_INFO, "%{public}@Successfully loaded torso model and face crop map for home: %@", buf, 0x16u);

          id v18 = v36;
        }

        [v9 setObject:v17 forKeyedSubscript:v8];
        [v10 setObject:v15 forKeyedSubscript:v8];
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v42 = v37;
          __int16 v43 = 2112;
          id v44 = v11;
          __int16 v45 = 2112;
          id v46 = v18;
          _os_log_impl(&dword_225DC6000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to load torso model at path: %@, error: %@", buf, 0x20u);
        }
      }

      id v16 = v18;
    }
  }
  else
  {
    __int16 v32 = (void *)MEMORY[0x22A641C70]();
    id v33 = self;
    __int16 v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v42 = v35;
      __int16 v43 = 2112;
      id v44 = v16;
      _os_log_impl(&dword_225DC6000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to load torsoToFaceCrop map, error: %@", buf, 0x16u);
    }
  }

  id v12 = v16;
LABEL_23:
}

- (id)loadPersonsModelFromURL:(id)a3 externalLibrary:(BOOL)a4 homeUUID:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = [v10 URLByDeletingPathExtension];
  int v13 = [v12 lastPathComponent];

  char v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
  if (v14)
  {
    id v15 = [v10 pathExtension];
    char v16 = [v15 isEqualToString:@"bin"];

    if (v16)
    {
      BOOL v42 = v8;
      id v43 = v11;
      id v17 = [MEMORY[0x263F08850] defaultManager];
      id v18 = [v10 path];
      id v45 = 0;
      id v19 = [v17 attributesOfItemAtPath:v18 error:&v45];
      id v20 = v45;
      unint64_t v21 = [v19 fileSize];

      if (v21 < 0x2800001)
      {
        __int16 v34 = [v10 path];
        id v44 = v20;
        id v25 = +[HMIPersonsModelManager loadModelAtPath:v34 error:&v44];
        id v35 = v44;

        if (v25)
        {
          id v11 = v43;
          id v28 = [[HMIPersonsModel alloc] initWithPersonsModel:v25 homeUUID:v43 sourceUUID:v14 externalLibrary:v42];
          id v20 = v35;
LABEL_16:

          goto LABEL_17;
        }
        id v36 = NSString;
        uint64_t v37 = [v10 path];
        id v38 = [v36 stringWithFormat:@"Failed to load VNPersonsModel at path: %@", v37];

        id v39 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1032 description:v38 underlyingError:v35];
        id v40 = v39;
        if (a6) {
          *a6 = v39;
        }
        HMIErrorLog(self, v40);

        id v28 = 0;
        id v20 = v35;
      }
      else
      {
        id v22 = NSString;
        id v23 = NSLocalizedFileSizeDescription();
        id v24 = [v10 path];
        id v25 = [v22 stringWithFormat:@"Refusing to load %@ VNPersonsModel at path: %@", v23, v24];

        char v26 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1032 description:v25 underlyingError:v20];
        id v27 = v26;
        if (a6) {
          *a6 = v26;
        }
        HMIErrorLog(self, v27);

        id v28 = 0;
      }
      id v11 = v43;
      goto LABEL_16;
    }
  }
  id v29 = NSString;
  os_log_type_t v30 = [v10 path];
  uint32_t v31 = [v29 stringWithFormat:@"Invalid file path in load model attempt: %@", v30];

  __int16 v32 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1032 description:v31];
  id v33 = v32;
  if (a6) {
    *a6 = v32;
  }
  HMIErrorLog(self, v33);

  id v28 = 0;
LABEL_17:

  return v28;
}

- (id)summaryForHomeUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v41 = 0;
  BOOL v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v40 = 0;
  BOOL v8 = [(HMIPersonsModelManager *)self loadModelsWithError:&v40];
  id v9 = v40;
  id v10 = v9;
  if (v8)
  {
    id v11 = [(HMIPersonsModelManager *)self personsModelsByHome];
    id v12 = [v11 objectForKeyedSubscript:v6];

    if (v12)
    {
      int v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_243);
      char v14 = [(HMIPersonsModelManager *)self equivalencyTablesByHome];
      id v15 = [v14 objectForKeyedSubscript:v6];

      if (v15)
      {
LABEL_6:
        id v18 = -[HMIPersonsModelManager homePersonsModelForHomeWithUUID:](self, "homePersonsModelForHomeWithUUID:", v6, v29);
        v37[0] = 0;
        v37[1] = v37;
        v37[2] = 0x3032000000;
        v37[3] = __Block_byref_object_copy__6;
        v37[4] = __Block_byref_object_dispose__6;
        id v38 = [MEMORY[0x263EFF9C0] set];
        id v19 = [v15 personToEquivalencyCell];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __51__HMIPersonsModelManager_summaryForHomeUUID_error___block_invoke_2;
        v32[3] = &unk_26477DDF0;
        id v20 = v18;
        id v33 = v20;
        __int16 v34 = &v45;
        id v35 = &v41;
        id v36 = v37;
        [v19 enumerateKeysAndObjectsUsingBlock:v32];

        _Block_object_dispose(v37, 8);
        int v21 = 0;
LABEL_14:

        goto LABEL_15;
      }
      uint32_t v31 = [(HMIPersonsModelManager *)self personsModelsByHome];
      os_log_type_t v30 = [v31 objectForKeyedSubscript:v6];
      char v16 = [(HMIPersonsModelManager *)self userDefinedPersonLinksByHome];
      id v17 = [v16 objectForKeyedSubscript:v6];
      id v39 = v10;
      id v15 = [(HMIPersonsModelManager *)self buildEquivalencyMapForPersonsModels:v30 userDefinedPersonLinks:v17 error:&v39];
      id v29 = v39;

      if (v15)
      {
        id v10 = v29;
        goto LABEL_6;
      }
      id v28 = v29;
      id v15 = v28;
      if (a4) {
        *a4 = v28;
      }
      HMIErrorLog(self, v15);
    }
    else
    {
      id v23 = v10;
      id v15 = v23;
      if (a4) {
        *a4 = v23;
      }
      HMIErrorLog(self, v15);
      int v13 = (void *)MEMORY[0x263EFFA68];
    }
    int v21 = 1;
    id v10 = v15;
    goto LABEL_14;
  }
  id v22 = v9;
  id v12 = v22;
  if (a4) {
    *a4 = v22;
  }
  HMIErrorLog(self, v12);
  int v13 = (void *)MEMORY[0x263EFFA68];
  int v21 = 1;
  id v10 = v12;
LABEL_15:

  os_unfair_lock_unlock(p_lock);
  if (v21)
  {
    id v24 = 0;
  }
  else
  {
    id v25 = [HMIPersonsModelsSummary alloc];
    char v26 = [MEMORY[0x263EFFA08] setWithArray:v13];
    id v24 = [(HMIPersonsModelsSummary *)v25 initWithModelSummaries:v26 homeToExternalEquivalencies:v46[3] externalToExternalEquivalencies:v42[3]];
  }
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v24;
}

uint64_t __51__HMIPersonsModelManager_summaryForHomeUUID_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 summary];
}

void __51__HMIPersonsModelManager_summaryForHomeUUID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((unint64_t)[v6 count] >= 2)
  {
    id v7 = [v5 sourceUUID];
    BOOL v8 = [*(id *)(a1 + 32) sourceUUID];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 count]
                                                                  + *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24)
                                                                  - 1;
      uint64_t v10 = [v6 count] - 1;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += (unint64_t)(([v6 count] - 2)
                                                                                      * v10) >> 1;
    }
    else
    {
      uint64_t v22 = 0;
      id v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x3032000000;
      id v19 = __Block_byref_object_copy__6;
      id v20 = __Block_byref_object_dispose__6;
      id v21 = 0;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __51__HMIPersonsModelManager_summaryForHomeUUID_error___block_invoke_3;
      v12[3] = &unk_26477DDC8;
      char v14 = &v22;
      id v13 = *(id *)(a1 + 32);
      id v15 = &v16;
      [v6 enumerateObjectsUsingBlock:v12];
      if (!*((unsigned char *)v23 + 24)
        && ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsObject:v17[5]] & 1) == 0)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v17[5]];
        uint64_t v11 = [v6 count];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += (unint64_t)(([v6 count] - 1)
                                                                                        * v11) >> 1;
      }

      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&v22, 8);
    }
  }
}

void __51__HMIPersonsModelManager_summaryForHomeUUID_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 sourceUUID];
  id v5 = [*(id *)(a1 + 32) sourceUUID];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 isEqual:v5];

  id obj = [v3 personUUID];

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  if (v7)
  {
    BOOL v8 = [v7 UUIDString];
    int v9 = [obj UUIDString];
    uint64_t v10 = [v8 compare:v9];

    if (v10 != -1) {
      goto LABEL_6;
    }
    uint64_t v11 = obj;
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  else
  {
    uint64_t v11 = obj;
  }
  objc_storeStrong((id *)(v6 + 40), v11);
LABEL_6:
}

+ (id)minimumUUIDInEquivalencyCell:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6;
  uint64_t v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__HMIPersonsModelManager_minimumUUIDInEquivalencyCell___block_invoke;
  v6[3] = &unk_26477DE18;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __55__HMIPersonsModelManager_minimumUUIDInEquivalencyCell___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 personUUID];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  id obj = (id)v3;
  if (v5)
  {
    uint64_t v6 = [v5 UUIDString];
    uint64_t v7 = [obj UUIDString];
    uint64_t v8 = [v6 compare:v7];

    if (v8 != -1) {
      goto LABEL_5;
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v4 + 40), obj);
LABEL_5:
  return MEMORY[0x270F9A758]();
}

- (void)reset
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  [(HMIPersonsModelManager *)self _reset];
  os_unfair_lock_unlock(p_lock);
}

- (void)_reset
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x22A641C70](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v13 = 138543362;
    char v14 = v6;
    _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting HMIPersonsModelManager", (uint8_t *)&v13, 0xCu);
  }
  personsModelsByHome = v4->_personsModelsByHome;
  v4->_personsModelsByHome = 0;

  equivalencyTablesByHome = v4->_equivalencyTablesByHome;
  v4->_equivalencyTablesByHome = 0;

  uint64_t v9 = [NSDictionary dictionary];
  userDefinedPersonLinksByHome = v4->_userDefinedPersonLinksByHome;
  v4->_userDefinedPersonLinksByHome = (NSDictionary *)v9;

  torsoModelsByHome = v4->_torsoModelsByHome;
  v4->_torsoModelsByHome = 0;

  torsoToFaceCropByHome = v4->_torsoToFaceCropByHome;
  v4->_torsoToFaceCropByHome = 0;
}

- (NSDictionary)userDefinedPersonLinksByHome
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (HMFOSTransaction)transaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransaction:(id)a3
{
}

- (NSDictionary)personsModelsByHome
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)torsoModelsByHome
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)torsoToFaceCropByHome
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)equivalencyTablesByHome
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equivalencyTablesByHome, 0);
  objc_storeStrong((id *)&self->_torsoToFaceCropByHome, 0);
  objc_storeStrong((id *)&self->_torsoModelsByHome, 0);
  objc_storeStrong((id *)&self->_personsModelsByHome, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_userDefinedPersonLinksByHome, 0);
}

@end
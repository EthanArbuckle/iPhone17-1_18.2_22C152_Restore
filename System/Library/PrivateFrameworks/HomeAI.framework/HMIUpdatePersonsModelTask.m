@interface HMIUpdatePersonsModelTask
- (BOOL)isExternalLibrary;
- (BOOL)shouldRemoveExcessFaceCrops;
- (HMIPersonManagerDataSource)dataSource;
- (HMIUpdatePersonsModelTask)initWithTaskID:(int)a3 homeUUID:(id)a4 sourceUUID:(id)a5 dataSource:(id)a6 externalLibrary:(BOOL)a7 removeExcessFaceCrops:(BOOL)a8;
- (NSUUID)sourceUUID;
- (id)limitEnforcedSubsetFromPersons:(id)a3;
- (id)logIdentifier;
- (void)mainInsideAutoreleasePool;
- (void)subsampleFacesForPersons:(id)a3 withFaceObservationsMap:(id)a4 dataSource:(id)a5 vnUUIDToFaceCropUUIDMap:(id)a6;
@end

@implementation HMIUpdatePersonsModelTask

- (HMIUpdatePersonsModelTask)initWithTaskID:(int)a3 homeUUID:(id)a4 sourceUUID:(id)a5 dataSource:(id)a6 externalLibrary:(BOOL)a7 removeExcessFaceCrops:(BOOL)a8
{
  uint64_t v13 = *(void *)&a3;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMIUpdatePersonsModelTask;
  v17 = [(HMIHomeTask *)&v20 initWithTaskID:v13 homeUUID:a4 timeout:500.0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sourceUUID, a5);
    objc_storeStrong((id *)&v18->_dataSource, a6);
    v18->_externalLibrary = a7;
    v18->_removeExcessFaceCrops = a8;
  }

  return v18;
}

- (void)mainInsideAutoreleasePool
{
  uint64_t v159 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v153 = v6;
    _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching persons", buf, 0xCu);
  }
  v7 = [HMIFetchPersonsOperation alloc];
  v8 = [(HMIUpdatePersonsModelTask *)v4 dataSource];
  v9 = [(HMIFetchPersonsOperation *)v7 initWithDataSource:v8];

  [(HMFOperation *)v9 start];
  [(HMIFetchPersonsOperation *)v9 waitUntilFinished];
  v10 = [(HMFOperation *)v9 error];

  if (v10)
  {
    v11 = (void *)MEMORY[0x22A641C70]();
    v12 = v4;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      id v15 = [(HMFOperation *)v9 error];
      *(_DWORD *)buf = 138543618;
      v153 = v14;
      __int16 v154 = 2112;
      uint64_t v155 = (uint64_t)v15;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_ERROR, "%{public}@Error fetching persons, error:%@", buf, 0x16u);
    }
    id v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = [(HMFOperation *)v9 error];
    v18 = v16;
    v19 = (void *)v17;
    id v20 = [v18 hmiPrivateErrorWithCode:1026 underlyingError:v17];
    [(HMFOperation *)v12 cancelWithError:v20];
  }
  else
  {
    v130 = v9;
    v21 = [(HMIFetchPersonsOperation *)v9 persons];
    v22 = (void *)MEMORY[0x22A641C70]();
    v23 = v4;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      uint64_t v26 = [v21 count];
      *(_DWORD *)buf = 138543618;
      v153 = v25;
      __int16 v154 = 2048;
      uint64_t v155 = v26;
      _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_INFO, "%{public}@Fetched %lu persons", buf, 0x16u);
    }
    v129 = v21;
    v27 = [(HMIUpdatePersonsModelTask *)v23 limitEnforcedSubsetFromPersons:v21];
    v133 = [MEMORY[0x263EFF9A0] dictionary];
    v140 = objc_alloc_init(HMIFaceprinter);
    v131 = [MEMORY[0x263EFF9C0] set];
    v132 = [MEMORY[0x263EFF9A0] dictionary];
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    id v20 = v27;
    uint64_t v136 = [v20 countByEnumeratingWithState:&v148 objects:v158 count:16];
    if (v136)
    {
      uint64_t v137 = *(void *)v149;
      v134 = v23;
      id v135 = v20;
LABEL_11:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v149 != v137) {
          objc_enumerationMutation(v20);
        }
        v29 = *(void **)(*((void *)&v148 + 1) + 8 * v28);
        v30 = [(HMITask *)v23 progressBlock];

        if (v30)
        {
          v31 = [(HMITask *)v23 progressBlock];
          v31[2](0.0);
        }
        int v32 = [(HMIUpdatePersonsModelTask *)v23 isCancelled];
        v33 = (void *)MEMORY[0x22A641C70]();
        v34 = v23;
        v35 = HMFGetOSLogHandle();
        BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
        if (v32) {
          break;
        }
        if (v36)
        {
          v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v153 = v37;
          __int16 v154 = 2112;
          uint64_t v155 = (uint64_t)v29;
          _os_log_impl(&dword_225DC6000, v35, OS_LOG_TYPE_INFO, "%{public}@Fetching face crops for person: %@", buf, 0x16u);
        }
        v38 = [HMIFetchPersonFaceCropsOperation alloc];
        v39 = [(HMIUpdatePersonsModelTask *)v34 dataSource];
        v40 = [(HMIFetchPersonFaceCropsOperation *)v38 initWithDataSource:v39 person:v29];

        [(HMFOperation *)v40 start];
        [(HMIFetchPersonFaceCropsOperation *)v40 waitUntilFinished];
        v41 = [(HMFOperation *)v40 error];

        if (v41)
        {
          v100 = (void *)MEMORY[0x22A641C70]();
          v101 = v34;
          v102 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            v103 = HMFGetLogIdentifier();
            v104 = [(HMFOperation *)v40 error];
            *(_DWORD *)buf = 138543874;
            v153 = v103;
            __int16 v154 = 2112;
            uint64_t v155 = (uint64_t)v29;
            __int16 v156 = 2112;
            v157 = v104;
            _os_log_impl(&dword_225DC6000, v102, OS_LOG_TYPE_ERROR, "%{public}@Error fetching facecrops for person:%@, error:%@", buf, 0x20u);
          }
          v105 = (void *)MEMORY[0x263F087E8];
          v106 = [(HMFOperation *)v40 error];
          v107 = [v105 hmiPrivateErrorWithCode:1026 underlyingError:v106];
          [(HMFOperation *)v101 cancelWithError:v107];

LABEL_54:
          goto LABEL_71;
        }
        uint64_t v142 = v28;
        v42 = [(HMIFetchPersonFaceCropsOperation *)v40 personFaceCrops];
        v43 = (void *)MEMORY[0x22A641C70]();
        v44 = v34;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = HMFGetLogIdentifier();
          uint64_t v47 = [v42 count];
          *(_DWORD *)buf = 138543874;
          v153 = v46;
          __int16 v154 = 2048;
          uint64_t v155 = v47;
          __int16 v156 = 2112;
          v157 = v29;
          _os_log_impl(&dword_225DC6000, v45, OS_LOG_TYPE_INFO, "%{public}@Fetched %lu face crops for person: %@", buf, 0x20u);
        }
        if ((unint64_t)[v42 count] >= 0x1F) {
          [v131 addObject:v29];
        }
        uint64_t v48 = objc_msgSend(v42, "na_map:", &__block_literal_global_35);
        v49 = [HMIFetchFaceprintsForFaceCropsOperation alloc];
        v50 = [(HMIUpdatePersonsModelTask *)v44 dataSource];
        v141 = (void *)v48;
        v51 = [(HMIFetchFaceprintsForFaceCropsOperation *)v49 initWithDataSource:v50 faceCropUUIDs:v48];

        [(HMFOperation *)v51 start];
        [(HMIFetchFaceprintsForFaceCropsOperation *)v51 waitUntilFinished];
        v52 = [(HMFOperation *)v51 error];

        if (v52)
        {
          v53 = (void *)MEMORY[0x22A641C70]();
          v54 = v44;
          v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v56 = HMFGetLogIdentifier();
            v57 = [(HMFOperation *)v51 error];
            *(_DWORD *)buf = 138543874;
            v153 = v56;
            __int16 v154 = 2112;
            uint64_t v155 = (uint64_t)v29;
            __int16 v156 = 2112;
            v157 = v57;
            _os_log_impl(&dword_225DC6000, v55, OS_LOG_TYPE_ERROR, "%{public}@Ignoring error fetching faceprints for person:%@, error:%@", buf, 0x20u);
          }
        }
        v58 = [(HMIFetchFaceprintsForFaceCropsOperation *)v51 faceprints];
        id v147 = 0;
        v59 = [(HMIFaceprinter *)v140 updatedFaceprintsForFaceCrops:v42 withExistingFaceprints:v58 error:&v147];
        id v60 = v147;

        if (v59)
        {
          id v138 = v60;
          v61 = [v59 allAtCurrentVersion];
          v145[0] = MEMORY[0x263EF8330];
          v145[1] = 3221225472;
          v145[2] = __54__HMIUpdatePersonsModelTask_mainInsideAutoreleasePool__block_invoke_41;
          v145[3] = &unk_26477E710;
          id v146 = v132;
          v62 = objc_msgSend(v61, "na_map:", v145);

          v63 = (void *)MEMORY[0x22A641C70]([v133 setObject:v62 forKeyedSubscript:v29]);
          v64 = v44;
          v65 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            v66 = HMFGetLogIdentifier();
            v67 = [v59 createdAtCurrentVersion];
            *(_DWORD *)buf = 138543618;
            v153 = v66;
            __int16 v154 = 2112;
            uint64_t v155 = (uint64_t)v67;
            _os_log_impl(&dword_225DC6000, v65, OS_LOG_TYPE_INFO, "%{public}@Storing newly created faceprints: %@", buf, 0x16u);
          }
          v68 = [v59 createdAtCurrentVersion];
          uint64_t v69 = [v68 count];

          if (v69)
          {
            v70 = [HMIStoreFaceprintsOperation alloc];
            v71 = [(HMIUpdatePersonsModelTask *)v64 dataSource];
            v72 = [v59 createdAtCurrentVersion];
            v73 = [(HMIStoreFaceprintsOperation *)v70 initWithDataSource:v71 faceprints:v72];

            [(HMFOperation *)v73 start];
            [(HMIStoreFaceprintsOperation *)v73 waitUntilFinished];
          }
          v74 = (void *)MEMORY[0x22A641C70]();
          v75 = v64;
          v76 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            v77 = HMFGetLogIdentifier();
            v78 = [v59 existingAtOtherVersions];
            *(_DWORD *)buf = 138543618;
            v153 = v77;
            __int16 v154 = 2112;
            uint64_t v155 = (uint64_t)v78;
            _os_log_impl(&dword_225DC6000, v76, OS_LOG_TYPE_INFO, "%{public}@Removing existing faceprints at other versions: %@", buf, 0x16u);
          }
          v79 = [v59 existingAtOtherVersions];
          uint64_t v80 = [v79 count];

          if (v80)
          {
            v81 = [v59 existingAtOtherVersions];
            v82 = objc_msgSend(v81, "na_map:", &__block_literal_global_47);

            v83 = [HMIRemoveFaceprintsOperation alloc];
            v84 = [(HMIUpdatePersonsModelTask *)v75 dataSource];
            v85 = [(HMIRemoveFaceprintsOperation *)v83 initWithDataSource:v84 faceprintUUIDs:v82];

            [(HMFOperation *)v85 start];
            [(HMIRemoveFaceprintsOperation *)v85 waitUntilFinished];
          }
          v86 = v146;
          v23 = v134;
          id v20 = v135;
          v87 = v141;
          uint64_t v88 = v142;
          v89 = v138;
        }
        else
        {
          v90 = (void *)MEMORY[0x22A641C70]();
          v91 = v44;
          v92 = HMFGetOSLogHandle();
          v87 = v141;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v139 = v42;
            v94 = id v93 = v60;
            *(_DWORD *)buf = 138543874;
            v153 = v94;
            __int16 v154 = 2112;
            uint64_t v155 = (uint64_t)v29;
            __int16 v156 = 2112;
            v157 = v93;
            _os_log_impl(&dword_225DC6000, v92, OS_LOG_TYPE_ERROR, "%{public}@Error faceprinting face crops for person:%@, error:%@", buf, 0x20u);

            id v60 = v93;
            v42 = v139;
          }

          v86 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1026 underlyingError:v60];
          [(HMFOperation *)v91 cancelWithError:v86];
          v89 = v60;
          v23 = v134;
          id v20 = v135;
          uint64_t v88 = v142;
        }

        if (!v59) {
          goto LABEL_54;
        }
        uint64_t v28 = v88 + 1;
        if (v136 == v28)
        {
          uint64_t v136 = [v20 countByEnumeratingWithState:&v148 objects:v158 count:16];
          if (v136) {
            goto LABEL_11;
          }
          goto LABEL_44;
        }
      }
      if (v36)
      {
        v99 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v153 = v99;
        _os_log_impl(&dword_225DC6000, v35, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);
      }
      goto LABEL_54;
    }
LABEL_44:

    if ([(HMIUpdatePersonsModelTask *)v23 isCancelled])
    {
      v95 = (void *)MEMORY[0x22A641C70]();
      v96 = v23;
      v97 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        v98 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v153 = v98;
        _os_log_impl(&dword_225DC6000, v97, OS_LOG_TYPE_INFO, "%{public}@Exiting early because task was canceled.", buf, 0xCu);
      }
    }
    else
    {
      v108 = +[HMIPersonsModelManager sharedInstance];
      v109 = [(HMIHomeTask *)v23 homeUUID];
      v110 = [(HMIUpdatePersonsModelTask *)v23 sourceUUID];
      id v144 = 0;
      char v111 = objc_msgSend(v108, "buildPersonsModelForHomeUUID:sourceUUID:externalLibrary:faceObservationsByPerson:error:", v109, v110, -[HMIUpdatePersonsModelTask isExternalLibrary](v23, "isExternalLibrary"), v133, &v144);
      id v112 = v144;

      if (v111)
      {
        if (![(HMIUpdatePersonsModelTask *)v23 isExternalLibrary]
          && [(HMIUpdatePersonsModelTask *)v23 shouldRemoveExcessFaceCrops]
          && [v131 count])
        {
          v113 = [(HMIUpdatePersonsModelTask *)v23 dataSource];
          int v114 = [v113 conformsToProtocol:&unk_26D9B3768];

          if (v114)
          {
            v115 = [(HMIUpdatePersonsModelTask *)v23 dataSource];
            [(HMIUpdatePersonsModelTask *)v23 subsampleFacesForPersons:v131 withFaceObservationsMap:v133 dataSource:v115 vnUUIDToFaceCropUUIDMap:v132];
          }
          else
          {
            v121 = (void *)MEMORY[0x22A641C70]();
            v122 = v23;
            v123 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
            {
              v124 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v153 = v124;
              _os_log_impl(&dword_225DC6000, v123, OS_LOG_TYPE_ERROR, "%{public}@Invalid configuration: isExternalLibrary is NO but self.dataSource does not conform to HMIHomePersonManagerDataSource protocol!", buf, 0xCu);
            }
          }
        }
        v125 = (void *)MEMORY[0x22A641C70]();
        v126 = v23;
        v127 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
        {
          v128 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v153 = v128;
          _os_log_impl(&dword_225DC6000, v127, OS_LOG_TYPE_INFO, "%{public}@Successfully updated persons model", buf, 0xCu);
        }
        v143.receiver = v126;
        v143.super_class = (Class)HMIUpdatePersonsModelTask;
        [(HMFOperation *)&v143 finish];
      }
      else
      {
        v116 = (void *)MEMORY[0x22A641C70]();
        v117 = v23;
        v118 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          v119 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v153 = v119;
          __int16 v154 = 2112;
          uint64_t v155 = (uint64_t)v112;
          _os_log_impl(&dword_225DC6000, v118, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate persons model, error:%@", buf, 0x16u);
        }
        v120 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1026 underlyingError:v112];
        [(HMFOperation *)v117 cancelWithError:v120];
      }
    }
LABEL_71:
    v19 = v129;
    v9 = v130;
  }
}

uint64_t __54__HMIUpdatePersonsModelTask_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

id __54__HMIUpdatePersonsModelTask_mainInsideAutoreleasePool__block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[HMIFaceUtilities faceObservationFromFaceprint:v3];
  v5 = [v3 faceCropUUID];

  v6 = *(void **)(a1 + 32);
  v7 = [v4 uuid];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return v4;
}

uint64_t __54__HMIUpdatePersonsModelTask_mainInsideAutoreleasePool__block_invoke_45(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (id)limitEnforcedSubsetFromPersons:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((unint64_t)[v4 count] > 0x50)
  {
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = objc_msgSend(v4, "na_filter:", &__block_literal_global_122);
    if ((unint64_t)[v7 count] > 0x50)
    {
      v8 = (void *)MEMORY[0x22A641C70]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = HMFGetLogIdentifier();
        int v19 = 138543874;
        id v20 = v11;
        __int16 v21 = 2048;
        uint64_t v22 = [v7 count];
        __int16 v23 = 1024;
        int v24 = 80;
        _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_ERROR, "%{public}@WARNING: Model has %lu named persons -- limit supported is %d", (uint8_t *)&v19, 0x1Cu);
      }
      v12 = [v7 allObjects];
      uint64_t v13 = objc_msgSend(v12, "subarrayWithRange:", 0, 80);
      [v6 addObjectsFromArray:v13];
    }
    else
    {
      [v6 unionSet:v7];
    }
    if ((unint64_t)[v6 count] <= 0x4F)
    {
      uint64_t v14 = 80 - [v6 count];
      id v15 = objc_msgSend(v4, "na_filter:", &__block_literal_global_125);
      id v16 = [v15 allObjects];
      uint64_t v17 = objc_msgSend(v16, "subarrayWithRange:", 0, v14);
      [v6 addObjectsFromArray:v17];
    }
    id v5 = (id)[v6 copy];
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

BOOL __60__HMIUpdatePersonsModelTask_limitEnforcedSubsetFromPersons___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __60__HMIUpdatePersonsModelTask_limitEnforcedSubsetFromPersons___block_invoke_123(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)subsampleFacesForPersons:(id)a3 withFaceObservationsMap:(id)a4 dataSource:(id)a5 vnUUIDToFaceCropUUIDMap:(id)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [MEMORY[0x263EFF9C0] set];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  v30 = __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke;
  v31 = &unk_26477E7A0;
  id v15 = v11;
  id v32 = v15;
  v33 = self;
  id v16 = v13;
  id v34 = v16;
  id v17 = v14;
  id v35 = v17;
  objc_msgSend(v10, "na_each:", &v28);
  uint64_t v18 = objc_msgSend(v17, "count", v28, v29, v30, v31);
  int v19 = (void *)MEMORY[0x22A641C70]();
  id v20 = self;
  __int16 v21 = HMFGetOSLogHandle();
  uint64_t v22 = v21;
  if (v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = HMFGetLogIdentifier();
      uint64_t v24 = [v17 count];
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      __int16 v38 = 2048;
      uint64_t v39 = v24;
      _os_log_impl(&dword_225DC6000, v22, OS_LOG_TYPE_INFO, "%{public}@Deleting a total of %lu face crops after subsampling", buf, 0x16u);
    }
    uint64_t v25 = [[HMIRemoveFaceCropsOperation alloc] initWithDataSource:v12 faceCropUUIDs:v17];
    [(HMFOperation *)v25 start];
    [(HMIRemoveFaceCropsOperation *)v25 waitUntilFinished];
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      uint64_t v27 = [v10 count];
      *(_DWORD *)buf = 138543618;
      v37 = v26;
      __int16 v38 = 2048;
      uint64_t v39 = v27;
      _os_log_impl(&dword_225DC6000, v22, OS_LOG_TYPE_ERROR, "%{public}@Selected %lu persons for subsampling faces but did not choose any face crops to delete!", buf, 0x16u);
    }
  }
}

void __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke(id *a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] objectForKeyedSubscript:v3];
  id v5 = +[HMIPersonsModelManager sharedInstance];
  v6 = [v5 personsModelsByHome];
  v7 = [a1[5] homeUUID];
  v8 = [v6 objectForKeyedSubscript:v7];
  v9 = [a1[5] sourceUUID];
  id v10 = [v8 objectForKeyedSubscript:v9];

  id v11 = [v10 visionPersonsModel];
  id v12 = [v3 UUID];
  id v13 = [v12 UUIDString];
  id v47 = 0;
  uint64_t v14 = [v11 trainingFaceObservationsForPersonWithUniqueIdentifier:v13 canceller:0 error:&v47];
  id v15 = v47;

  if (v14)
  {
    if ([v14 count])
    {
      v44 = v4;
      if ((unint64_t)[v14 count] >= 0x15)
      {
        id v16 = (void *)MEMORY[0x22A641C70]();
        id v17 = a1[5];
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v19 = HMFGetLogIdentifier();
          uint64_t v20 = [v14 count];
          *(_DWORD *)buf = 138543874;
          v49 = v19;
          __int16 v50 = 1024;
          *(_DWORD *)v51 = 20;
          *(_WORD *)&v51[4] = 2048;
          *(void *)&v51[6] = v20;
          _os_log_impl(&dword_225DC6000, v18, OS_LOG_TYPE_ERROR, "%{public}@Expected subsampling to leave no more than %d, but got %lu faces selected. Enforcing limit.", buf, 0x1Cu);
        }
        uint64_t v21 = objc_msgSend(v14, "subarrayWithRange:", 0, 20);

        uint64_t v14 = (void *)v21;
      }
      id v43 = v15;
      uint64_t v22 = (void *)MEMORY[0x22A641C70]();
      id v23 = a1[5];
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        uint64_t v26 = [v14 count];
        uint64_t v27 = [v44 count];
        *(_DWORD *)buf = 138544130;
        v49 = v25;
        __int16 v50 = 2048;
        *(void *)v51 = v26;
        *(_WORD *)&v51[8] = 2048;
        *(void *)&v51[10] = v27;
        __int16 v52 = 2112;
        id v53 = v3;
        _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_INFO, "%{public}@Subsampling will retain %lu from a total of %lu faces for %@", buf, 0x2Au);
      }
      uint64_t v28 = (void *)MEMORY[0x263EFFA08];
      uint64_t v29 = objc_msgSend(v14, "na_map:", &__block_literal_global_130_0);
      v30 = [v28 setWithArray:v29];

      id v4 = v44;
      v31 = objc_msgSend(v44, "na_map:", &__block_literal_global_132);
      id v32 = objc_msgSend(v31, "na_setByRemovingObjectsFromSet:", v30);
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke_3;
      v45[3] = &unk_26477E778;
      id v46 = a1[6];
      v33 = objc_msgSend(v32, "na_map:", v45);

      [a1[7] unionSet:v33];
      id v15 = v43;
    }
    else
    {
      __int16 v38 = (void *)MEMORY[0x22A641C70]();
      id v39 = a1[5];
      uint64_t v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = v41 = v4;
        *(_DWORD *)buf = 138543618;
        v49 = v42;
        __int16 v50 = 2112;
        *(void *)v51 = v3;
        _os_log_impl(&dword_225DC6000, v40, OS_LOG_TYPE_ERROR, "%{public}@Fetched 0 training faces for %@, this would remove all face crops! Skipping face crop removal.", buf, 0x16u);

        id v4 = v41;
      }
    }
  }
  else
  {
    id v34 = (void *)MEMORY[0x22A641C70]();
    id v35 = a1[5];
    BOOL v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v49 = v37;
      __int16 v50 = 2112;
      *(void *)v51 = v3;
      *(_WORD *)&v51[8] = 2112;
      *(void *)&v51[10] = v15;
      _os_log_impl(&dword_225DC6000, v36, OS_LOG_TYPE_ERROR, "%{public}@Error fetching faces to subsample for %@: %@", buf, 0x20u);
    }
  }
}

uint64_t __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke_127(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __113__HMIUpdatePersonsModelTask_subsampleFacesForPersons_withFaceObservationsMap_dataSource_vnUUIDToFaceCropUUIDMap___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

- (id)logIdentifier
{
  id v3 = NSString;
  id v4 = [(HMIUpdatePersonsModelTask *)self sourceUUID];
  BOOL v5 = [(HMIUpdatePersonsModelTask *)self isExternalLibrary];
  v6 = @"home";
  if (v5) {
    v6 = @"external";
  }
  v7 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

  return v7;
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 344, 1);
}

- (HMIPersonManagerDataSource)dataSource
{
  return (HMIPersonManagerDataSource *)objc_getProperty(self, a2, 352, 1);
}

- (BOOL)isExternalLibrary
{
  return self->_externalLibrary;
}

- (BOOL)shouldRemoveExcessFaceCrops
{
  return self->_removeExcessFaceCrops;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end
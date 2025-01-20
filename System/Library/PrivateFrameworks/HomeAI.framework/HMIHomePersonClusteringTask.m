@interface HMIHomePersonClusteringTask
- (BOOL)doImpurePersonCleanup;
- (HMIClusteringTaskSummary)summary;
- (HMIHomePersonClusteringTask)initWithTaskID:(int)a3 homeUUID:(id)a4 dataSource:(id)a5 sourceUUID:(id)a6 personsModelManager:(id)a7 doImpurePersonCleanup:(BOOL)a8 error:(id *)a9;
- (HMIHomePersonManagerDataSource)dataSource;
- (HMIPersonsModelManager)personsModelManager;
- (NSDate)startTime;
- (NSUUID)sourceUUID;
- (id)personCreatedDateFromFaceCrops:(id)a3;
- (void)_stageFive_associateFaceCropsWithClusterMapping:(id)a3 faceprints:(id)a4;
- (void)_stageFour_clusterFaceprints:(id)a3;
- (void)_stageOne_fetchFaceCrops;
- (void)_stageThree_generateFaceprintsForFaceCrops:(id)a3 existingFaceprints:(id)a4;
- (void)_stageTwo_fetchFaceprints:(id)a3;
- (void)_stageZero_expireUnnamedPersons;
- (void)finish;
- (void)mainInsideAutoreleasePool;
- (void)removePerson:(id)a3;
@end

@implementation HMIHomePersonClusteringTask

- (HMIHomePersonClusteringTask)initWithTaskID:(int)a3 homeUUID:(id)a4 dataSource:(id)a5 sourceUUID:(id)a6 personsModelManager:(id)a7 doImpurePersonCleanup:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  uint64_t v14 = *(void *)&a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  double v19 = 500.0;
  if (v9) {
    double v19 = 1000.0;
  }
  v33.receiver = self;
  v33.super_class = (Class)HMIHomePersonClusteringTask;
  v20 = [(HMIHomeTask *)&v33 initWithTaskID:v14 homeUUID:a4 timeout:v19];
  v21 = v20;
  if (!v20) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v20->_dataSource, a5);
  objc_storeStrong((id *)&v21->_sourceUUID, a6);
  objc_storeStrong((id *)&v21->_personsModelManager, a7);
  v21->_doImpurePersonCleanup = v9;
  v22 = [[HMIGreedyClustering alloc] initWithError:0];
  clusterer = v21->_clusterer;
  v21->_clusterer = v22;

  id v32 = 0;
  v24 = [[HMIFaceClassifierVIP alloc] initWithError:&v32];
  id v25 = v32;
  faceClassifier = v21->_faceClassifier;
  v21->_faceClassifier = (HMIFaceClassifier *)v24;

  if (v21->_faceClassifier)
  {
    v27 = objc_alloc_init(HMIClusteringTaskSummary);
    summary = v21->_summary;
    v21->_summary = v27;

    v21->_lock._os_unfair_lock_opaque = 0;
LABEL_6:
    v29 = v21;
    goto LABEL_10;
  }
  if (a9) {
    *a9 = v25;
  }
  HMIErrorLogC(v25);
  id v30 = v25;
  *a9 = v30;

  v29 = 0;
LABEL_10:

  return v29;
}

- (void)mainInsideAutoreleasePool
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] date];
  startTime = self->_startTime;
  self->_startTime = v3;

  if ([(HMIHomePersonClusteringTask *)self doImpurePersonCleanup])
  {
    v5 = (void *)MEMORY[0x22A641C70]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      BOOL v9 = [(HMIHomeTask *)v6 homeUUID];
      v10 = [v9 UUIDString];
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@Spawning CleanupImpureHomePersonsOperation for %@ before home person clustering", buf, 0x16u);
    }
    v11 = [HMICleanupImpureHomePersonsOperation alloc];
    v12 = [(HMIHomeTask *)v6 homeUUID];
    v13 = [(HMIHomePersonClusteringTask *)v6 dataSource];
    uint64_t v14 = [(HMICleanupImpureHomePersonsOperation *)v11 initWithHomeUUID:v12 dataSource:v13];

    [(HMFOperation *)v14 start];
    [(HMICleanupImpureHomePersonsOperation *)v14 waitUntilFinished];
    v15 = [(HMFOperation *)v14 error];

    BOOL v16 = v15 == 0;
    id v17 = (void *)MEMORY[0x22A641C70]();
    id v18 = v6;
    double v19 = HMFGetOSLogHandle();
    v20 = v19;
    if (v16)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v28 = v23;
        _os_log_impl(&dword_225DC6000, v20, OS_LOG_TYPE_INFO, "%{public}@CleanupImpureHomePersonOperation finished successfully", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      v22 = [(HMFOperation *)v14 error];
      *(_DWORD *)buf = 138543618;
      v28 = v21;
      __int16 v29 = 2112;
      id v30 = v22;
      _os_log_impl(&dword_225DC6000, v20, OS_LOG_TYPE_ERROR, "%{public}@CleanupImpureHomePersonOperation finished with error:%@", buf, 0x16u);
    }
  }
  objc_initWeak((id *)buf, self);
  v24 = [(HMIHomePersonClusteringTask *)self dataSource];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __56__HMIHomePersonClusteringTask_mainInsideAutoreleasePool__block_invoke;
  v25[3] = &unk_26477B850;
  objc_copyWeak(&v26, (id *)buf);
  [v24 performCloudPullWithCompletion:v25];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

void __56__HMIHomePersonClusteringTask_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = (void *)MEMORY[0x22A641C70]();
      id v6 = WeakRetained;
      v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = HMFGetLogIdentifier();
        int v9 = 138543618;
        v10 = v8;
        __int16 v11 = 2112;
        id v12 = v3;
        _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error performing cloud pull:%@", (uint8_t *)&v9, 0x16u);
      }
    }
    objc_msgSend(WeakRetained, "_stageZero_expireUnnamedPersons");
  }
}

- (void)_stageZero_expireUnnamedPersons
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x22A641C70](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v11 = v6;
    _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching persons", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v4);
  v7 = [(HMIHomePersonClusteringTask *)v4 dataSource];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke;
  v8[3] = &unk_26477CC80;
  objc_copyWeak(&v9, (id *)buf);
  [v7 fetchAllPersonsWithCompletion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v50 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  v51 = v5;
  if (WeakRetained)
  {
    if (v5)
    {
      v49 = WeakRetained;
      v52 = objc_msgSend(v5, "na_map:", &__block_literal_global_34);
      v8 = (void *)MEMORY[0x22A641C70]();
      id v9 = v49;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = HMFGetLogIdentifier();
        uint64_t v12 = [v51 count];
        uint64_t v13 = [v51 count];
        *(_DWORD *)buf = 138543874;
        v67 = v11;
        __int16 v68 = 2048;
        uint64_t v69 = v12;
        __int16 v70 = 2048;
        uint64_t v71 = v13 - [v52 count];
        _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetched %lu persons (%lu unnamed)", buf, 0x20u);
      }
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id obj = v51;
      uint64_t v55 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v55)
      {
        uint64_t v54 = *(void *)v62;
        while (2)
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v62 != v54) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            BOOL v16 = [v9 progressBlock];

            if (v16)
            {
              id v17 = [v9 progressBlock];
              v17[2](0.0);
            }
            if ([v9 isCancelled])
            {
              v40 = (void *)MEMORY[0x22A641C70]();
              id v41 = v9;
              v42 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                v43 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v67 = v43;
                _os_log_impl(&dword_225DC6000, v42, OS_LOG_TYPE_INFO, "%{public}@Exiting stage 0 early because task was canceled", buf, 0xCu);
              }

              goto LABEL_28;
            }
            id v18 = [v15 name];

            if (v18)
            {
              double v19 = (void *)MEMORY[0x22A641C70]();
              id v20 = v9;
              v21 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                v22 = HMFGetLogIdentifier();
                v23 = [v15 UUID];
                *(_DWORD *)buf = 138543618;
                v67 = v22;
                __int16 v68 = 2112;
                uint64_t v69 = (uint64_t)v23;
                _os_log_impl(&dword_225DC6000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Skipping named person with UUID: %@", buf, 0x16u);
              }
            }
            else
            {
              v24 = [HMIPersonSourceUUIDPair alloc];
              id v25 = [v15 UUID];
              id v26 = [v9 sourceUUID];
              v27 = [(HMIPersonSourceUUIDPair *)v24 initWithPersonUUID:v25 sourceUUID:v26];

              v28 = [v9 personsModelManager];
              __int16 v29 = [v9 homeUUID];
              id v60 = 0;
              id v30 = [v28 equivalencyCellForPerson:v27 homeUUID:v29 error:&v60];
              id v31 = v60;

              v58[0] = MEMORY[0x263EF8330];
              v58[1] = 3221225472;
              v58[2] = __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke_123;
              v58[3] = &unk_26477E648;
              v58[4] = v9;
              id v59 = v52;
              if ((objc_msgSend(v30, "na_any:", v58) & 1) == 0)
              {
                id v32 = (void *)MEMORY[0x22A641C70]();
                id v33 = v9;
                v34 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  v35 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v67 = v35;
                  __int16 v68 = 2112;
                  uint64_t v69 = (uint64_t)v15;
                  _os_log_impl(&dword_225DC6000, v34, OS_LOG_TYPE_INFO, "%{public}@Fetching face crops for person: %@", buf, 0x16u);
                }
                objc_initWeak((id *)buf, v33);
                v36 = [v33 dataSource];
                v37 = (void *)MEMORY[0x263EFFA08];
                v38 = [v15 UUID];
                v39 = [v37 setWithObject:v38];
                v56[0] = MEMORY[0x263EF8330];
                v56[1] = 3221225472;
                v56[2] = __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke_126;
                v56[3] = &unk_26477D1C8;
                objc_copyWeak(&v57, (id *)buf);
                v56[4] = v15;
                [v36 fetchFaceCropsForPersonsWithUUIDs:v39 completion:v56];

                objc_destroyWeak(&v57);
                objc_destroyWeak((id *)buf);
              }
            }
          }
          uint64_t v55 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
          if (v55) {
            continue;
          }
          break;
        }
      }

      objc_msgSend(v9, "_stageOne_fetchFaceCrops");
LABEL_28:

      v7 = v49;
    }
    else
    {
      v44 = (void *)MEMORY[0x22A641C70]();
      v45 = v7;
      id v46 = v7;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v67 = v48;
        __int16 v68 = 2112;
        uint64_t v69 = (uint64_t)v50;
        _os_log_impl(&dword_225DC6000, v47, OS_LOG_TYPE_ERROR, "%{public}@Error fetching persons:%@", buf, 0x16u);
      }
      [v46 cancelWithError:v50];
      v7 = v45;
    }
  }
}

id __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke_120(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 name];

  if (v3)
  {
    id v3 = [v2 UUID];
  }

  return v3;
}

uint64_t __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke_123(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 sourceUUID];
  id v5 = [*(id *)(a1 + 32) sourceUUID];
  int v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    v8 = [v3 personUUID];
    unsigned int v9 = [v7 containsObject:v8];
  }
  else
  {
    unsigned int v9 = 0;
  }

  return v6 ^ 1 | v9;
}

void __62__HMIHomePersonClusteringTask__stageZero_expireUnnamedPersons__block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      if ([v5 count])
      {
        v8 = [WeakRetained personCreatedDateFromFaceCrops:v5];
        uint64_t v9 = [v8 timeIntervalSinceNow];
        double v11 = v10;
        if (v10 < -864000.0)
        {
          uint64_t v12 = (void *)MEMORY[0x22A641C70](v9);
          id v13 = WeakRetained;
          uint64_t v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v15 = HMFGetLogIdentifier();
            BOOL v16 = [*(id *)(a1 + 32) UUID];
            int v27 = 138543874;
            v28 = v15;
            __int16 v29 = 2112;
            id v30 = v16;
            __int16 v31 = 2048;
            double v32 = -v11;
            _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_INFO, "%{public}@Deleting unnamed person %@ (age = %f seconds)", (uint8_t *)&v27, 0x20u);
          }
          [v13 removePerson:*(void *)(a1 + 32)];
        }
      }
      else
      {
        v22 = (void *)MEMORY[0x22A641C70]();
        id v23 = WeakRetained;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = HMFGetLogIdentifier();
          id v26 = [*(id *)(a1 + 32) UUID];
          int v27 = 138543618;
          v28 = v25;
          __int16 v29 = 2112;
          id v30 = v26;
          _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_INFO, "%{public}@Deleting unnamed person %@ (0 face crops)", (uint8_t *)&v27, 0x16u);
        }
        [v23 removePerson:*(void *)(a1 + 32)];
      }
    }
    else
    {
      id v17 = (void *)MEMORY[0x22A641C70]();
      id v18 = WeakRetained;
      double v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        v21 = *(void **)(a1 + 32);
        int v27 = 138543874;
        v28 = v20;
        __int16 v29 = 2112;
        id v30 = v21;
        __int16 v31 = 2112;
        double v32 = *(double *)&v6;
        _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error fetching face crops for person:%@, error:%@", (uint8_t *)&v27, 0x20u);
      }
    }
  }
}

- (void)_stageOne_fetchFaceCrops
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(HMIHomePersonClusteringTask *)self isCancelled])
  {
    id v3 = (void *)MEMORY[0x22A641C70]();
    v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      double v11 = v6;
      _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_INFO, "%{public}@Exiting stage 1 early because task was canceled", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v7 = [(HMIHomePersonClusteringTask *)self dataSource];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__HMIHomePersonClusteringTask__stageOne_fetchFaceCrops__block_invoke;
    v8[3] = &unk_26477CC80;
    objc_copyWeak(&v9, (id *)buf);
    [v7 fetchAllUnassociatedFaceCropsWithCompletion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __55__HMIHomePersonClusteringTask__stageOne_fetchFaceCrops__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "_stageTwo_fetchFaceprints:", v5);
    }
    else
    {
      id v9 = (void *)MEMORY[0x22A641C70]();
      id v10 = v8;
      double v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v13 = 138543618;
        uint64_t v14 = v12;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error fetching face crops:%@", (uint8_t *)&v13, 0x16u);
      }
      [v10 cancelWithError:v6];
    }
  }
}

- (void)_stageTwo_fetchFaceprints:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMIHomePersonClusteringTask *)self isCancelled])
  {
    id v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v15 = v8;
      _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@Exiting stage 2 early because task was canceled", buf, 0xCu);
    }
  }
  else
  {
    id v9 = objc_msgSend(v4, "na_map:", &__block_literal_global_130);
    objc_initWeak((id *)buf, self);
    id v10 = [(HMIHomePersonClusteringTask *)self dataSource];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__HMIHomePersonClusteringTask__stageTwo_fetchFaceprints___block_invoke_2;
    v11[3] = &unk_26477D1C8;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v4;
    [v10 fetchFaceprintsForFaceCropsWithUUIDs:v9 completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __57__HMIHomePersonClusteringTask__stageTwo_fetchFaceprints___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

void __57__HMIHomePersonClusteringTask__stageTwo_fetchFaceprints___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "_stageThree_generateFaceprintsForFaceCrops:existingFaceprints:", *(void *)(a1 + 32), v5);
    }
    else
    {
      id v9 = (void *)MEMORY[0x22A641C70]();
      id v10 = v8;
      double v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        int v13 = 138543618;
        uint64_t v14 = v12;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error fetching faceprints:%@", (uint8_t *)&v13, 0x16u);
      }
      [v10 cancelWithError:v6];
    }
  }
}

- (void)_stageThree_generateFaceprintsForFaceCrops:(id)a3 existingFaceprints:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v47 = a3;
  id v51 = a4;
  if ([(HMIHomePersonClusteringTask *)self isCancelled])
  {
    id v6 = (void *)MEMORY[0x22A641C70]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v62 = v9;
      _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_INFO, "%{public}@Exiting stage 3 early because task was canceled", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v54 = self;
    id v46 = [MEMORY[0x263EFF910] date];
    v49 = objc_alloc_init(HMIFaceprinter);
    id v50 = [MEMORY[0x263EFF9C0] set];
    unint64_t v10 = [v47 count];
    v53 = [v47 allObjects];
    uint64_t v48 = vcvtpd_s64_f64((double)v10 / 100.0) | 0x4059000000000000;
    if ((int)v48 < 1)
    {
      id v32 = 0;
LABEL_20:
      id v12 = v32;
      uint64_t v33 = [MEMORY[0x263EFF910] date];
      [v33 timeIntervalSinceDate:v46];
      double v35 = v34;
      v36 = [(HMIHomePersonClusteringTask *)v54 summary];
      [v36 setFaceprintingDuration:v35];

      v37 = [v50 allObjects];
      [(HMIHomePersonClusteringTask *)v54 _stageFour_clusterFaceprints:v37];
    }
    else
    {
      uint64_t v11 = 0;
      id v12 = 0;
      while (![(HMIHomePersonClusteringTask *)v54 isCancelled])
      {
        [v53 count];
        int v13 = (void *)MEMORY[0x263EFFA08];
        uint64_t v14 = objc_msgSend(v53, "subarrayWithRange:");
        uint64_t v55 = [v13 setWithArray:v14];

        id v60 = v12;
        __int16 v15 = [(HMIFaceprinter *)v49 updatedFaceprintsForFaceCrops:v55 withExistingFaceprints:v51 error:&v60];
        id v52 = v60;

        if (!v15)
        {
          v42 = (void *)MEMORY[0x22A641C70]();
          v43 = v54;
          v44 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v62 = v45;
            __int16 v63 = 2112;
            uint64_t v64 = (uint64_t)v52;
            _os_log_impl(&dword_225DC6000, v44, OS_LOG_TYPE_ERROR, "%{public}@Error faceprinting face crops:%@", buf, 0x16u);
          }
          [(HMFOperation *)v43 cancelWithError:v52];

          id v12 = v52;
          goto LABEL_27;
        }
        id v16 = [v15 allAtCurrentVersion];
        [v50 unionSet:v16];
        uint64_t v17 = [v15 createdAtCurrentVersion];
        if ([v17 count])
        {
          id v18 = (void *)MEMORY[0x22A641C70]();
          double v19 = v54;
          id v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = HMFGetLogIdentifier();
            uint64_t v22 = [v17 count];
            *(_DWORD *)buf = 138543618;
            long long v62 = v21;
            __int16 v63 = 2048;
            uint64_t v64 = v22;
            _os_log_impl(&dword_225DC6000, v20, OS_LOG_TYPE_INFO, "%{public}@Storing %lu newly created faceprints", buf, 0x16u);
          }
          objc_initWeak((id *)buf, v19);
          id v23 = [(HMIHomePersonClusteringTask *)v19 dataSource];
          v58[0] = MEMORY[0x263EF8330];
          v58[1] = 3221225472;
          v58[2] = __93__HMIHomePersonClusteringTask__stageThree_generateFaceprintsForFaceCrops_existingFaceprints___block_invoke;
          v58[3] = &unk_26477B850;
          objc_copyWeak(&v59, (id *)buf);
          [v23 addFaceprints:v17 completion:v58];

          objc_destroyWeak(&v59);
          objc_destroyWeak((id *)buf);
        }
        v24 = [v15 existingAtOtherVersions];
        if ([v24 count])
        {
          id v25 = objc_msgSend(v24, "na_map:", &__block_literal_global_136);
          id v26 = (void *)MEMORY[0x22A641C70]();
          int v27 = v54;
          v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            __int16 v29 = HMFGetLogIdentifier();
            uint64_t v30 = [v24 count];
            *(_DWORD *)buf = 138543618;
            long long v62 = v29;
            __int16 v63 = 2048;
            uint64_t v64 = v30;
            _os_log_impl(&dword_225DC6000, v28, OS_LOG_TYPE_INFO, "%{public}@Removing %lu faceprints from old versions", buf, 0x16u);
          }
          objc_initWeak((id *)buf, v27);
          __int16 v31 = [(HMIHomePersonClusteringTask *)v27 dataSource];
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __93__HMIHomePersonClusteringTask__stageThree_generateFaceprintsForFaceCrops_existingFaceprints___block_invoke_137;
          v56[3] = &unk_26477B850;
          objc_copyWeak(&v57, (id *)buf);
          [v31 removeFaceprintsWithUUIDs:v25 completion:v56];

          objc_destroyWeak(&v57);
          objc_destroyWeak((id *)buf);
        }
        ++v11;
        id v32 = v52;
        id v12 = v52;
        if (v11 == v48) {
          goto LABEL_20;
        }
      }
      v38 = (void *)MEMORY[0x22A641C70]();
      v39 = v54;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v62 = v41;
        _os_log_impl(&dword_225DC6000, v40, OS_LOG_TYPE_INFO, "%{public}@Exiting stage 3 loop early because task was canceled", buf, 0xCu);
      }
    }
LABEL_27:
  }
}

void __93__HMIHomePersonClusteringTask__stageThree_generateFaceprintsForFaceCrops_existingFaceprints___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    id v6 = (void *)MEMORY[0x22A641C70]();
    id v7 = v5;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error saving new faceprints:%@", (uint8_t *)&v10, 0x16u);
    }
  }
}

uint64_t __93__HMIHomePersonClusteringTask__stageThree_generateFaceprintsForFaceCrops_existingFaceprints___block_invoke_133(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

void __93__HMIHomePersonClusteringTask__stageThree_generateFaceprintsForFaceCrops_existingFaceprints___block_invoke_137(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    id v6 = (void *)MEMORY[0x22A641C70]();
    id v7 = v5;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error removing faceprints from old versions:%@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_stageFour_clusterFaceprints:(id)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMIHomePersonClusteringTask *)self isCancelled])
  {
    id v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v84 = v8;
      _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@Exiting stage 4 early because task was canceled", buf, 0xCu);
    }
    goto LABEL_39;
  }
  v76 = +[HMIFaceUtilities faceObservationsFromFaceprintsForClustering:v4];
  id v9 = (void *)MEMORY[0x22A641C70]();
  int v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v84 = v12;
    __int16 v85 = 2048;
    uint64_t v86 = [v76 count];
    _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_INFO, "%{public}@Number of faceprints to cluster: %lu", buf, 0x16u);
  }
  uint64_t v13 = [v76 count];
  uint64_t v14 = [(HMIHomePersonClusteringTask *)v10 summary];
  [v14 setNumberOfFaceprintsClustered:v13];

  uint64_t v15 = [MEMORY[0x263EFF910] date];
  clusterer = v10->_clusterer;
  id v82 = 0;
  uint64_t v17 = [(HMIGreedyClustering *)clusterer getClustersWithFaces:v76 error:&v82];
  id v18 = v82;
  double v19 = [MEMORY[0x263EFF910] date];
  uint64_t v69 = (void *)v15;
  [v19 timeIntervalSinceDate:v15];
  double v21 = v20;
  uint64_t v22 = [(HMIHomePersonClusteringTask *)v10 summary];
  [v22 setClusteringDuration:v21];

  __int16 v70 = v17;
  if (!v17)
  {
    id v60 = (void *)MEMORY[0x22A641C70]();
    long long v61 = v10;
    long long v62 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      __int16 v63 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v84 = v63;
      __int16 v85 = 2112;
      uint64_t v86 = (uint64_t)v18;
      _os_log_impl(&dword_225DC6000, v62, OS_LOG_TYPE_ERROR, "%{public}@Clustering error:%@", buf, 0x16u);
    }
    [(HMFOperation *)v61 cancelWithError:v18];
    goto LABEL_38;
  }
  id v68 = v4;
  v73 = [MEMORY[0x263EFF9A0] dictionary];
  id v23 = (void *)MEMORY[0x22A641C70]();
  v24 = v10;
  id v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    id v26 = HMFGetLogIdentifier();
    uint64_t v27 = [v17 count];
    *(_DWORD *)buf = 138543618;
    v84 = v26;
    __int16 v85 = 2048;
    uint64_t v86 = v27;
    _os_log_impl(&dword_225DC6000, v25, OS_LOG_TYPE_INFO, "%{public}@Number of clusters: %lu", buf, 0x16u);
  }
  uint64_t v28 = [v17 count];
  __int16 v29 = [(HMIHomePersonClusteringTask *)v24 summary];
  [v29 setNumberOfClusters:v28];

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v17;
  uint64_t v30 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
  if (!v30)
  {
LABEL_33:

    id v4 = v68;
    [(HMIHomePersonClusteringTask *)v24 _stageFive_associateFaceCropsWithClusterMapping:v73 faceprints:v68];
    goto LABEL_37;
  }
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)v79;
LABEL_12:
  uint64_t v33 = 0;
  while (1)
  {
    if (*(void *)v79 != v32) {
      objc_enumerationMutation(obj);
    }
    double v34 = *(void **)(*((void *)&v78 + 1) + 8 * v33);
    double v35 = [v34 objects];
    unint64_t v36 = [v35 count];

    if (v36 > 9) {
      break;
    }
    v37 = (void *)MEMORY[0x22A641C70]();
    v38 = v24;
    v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v40 = HMFGetLogIdentifier();
      id v41 = [v34 objects];
      uint64_t v42 = [v41 count];
      *(_DWORD *)buf = 138543874;
      v84 = v40;
      __int16 v85 = 2048;
      uint64_t v86 = v42;
      __int16 v87 = 1024;
      int v88 = 10;
      _os_log_impl(&dword_225DC6000, v39, OS_LOG_TYPE_DEBUG, "%{public}@Cluster of size %lu beneath threshold of %d", buf, 0x1Cu);
    }
LABEL_25:
    if (v31 == ++v33)
    {
      uint64_t v31 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
      if (v31) {
        goto LABEL_12;
      }
      goto LABEL_33;
    }
  }
  uint64_t v43 = v31;
  uint64_t v44 = v32;
  v45 = +[HMIGreedyClustering centermostFaceprintInCluster:v34 faceObservations:v76];
  id v46 = [(HMIHomePersonClusteringTask *)v24 personsModelManager];
  id v47 = v24;
  uint64_t v48 = [(HMIHomeTask *)v24 homeUUID];
  id v77 = v18;
  v49 = [v46 predictHomePersonFromFaceObservation:v45 homeUUID:v48 error:&v77];
  id v50 = v77;
  id v51 = v18;
  id v18 = v50;

  if (v49)
  {
    id v52 = [v49 confidence];
    [v52 floatValue];
    double v54 = v53;

    if (v54 > 0.83)
    {
      context = (void *)MEMORY[0x22A641C70]();
      uint64_t v55 = v47;
      v56 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        uint64_t v71 = HMFGetLogIdentifier();
        uint64_t v72 = v45;
        uint64_t v57 = [v49 personUUID];
        *(_DWORD *)buf = 138543618;
        v84 = v71;
        __int16 v85 = 2112;
        uint64_t v86 = v57;
        v58 = (void *)v57;
        _os_log_impl(&dword_225DC6000, v56, OS_LOG_TYPE_INFO, "%{public}@Assigning cluster to existing person with UUID: %@", buf, 0x16u);

        v45 = v72;
      }

      id v59 = [v49 personUUID];
      [v73 setObject:v59 forKeyedSubscript:v34];
    }
    v24 = v47;
    uint64_t v32 = v44;
    uint64_t v31 = v43;
    goto LABEL_25;
  }
  if ([v18 code] == 1037)
  {

    v24 = v47;
    goto LABEL_33;
  }
  uint64_t v64 = (void *)MEMORY[0x22A641C70]();
  uint64_t v65 = v47;
  v66 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    v67 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v84 = v67;
    __int16 v85 = 2112;
    uint64_t v86 = (uint64_t)v18;
    _os_log_impl(&dword_225DC6000, v66, OS_LOG_TYPE_ERROR, "%{public}@Face prediction error:%@", buf, 0x16u);
  }
  [(HMFOperation *)v65 cancelWithError:v18];

  id v4 = v68;
LABEL_37:

LABEL_38:
LABEL_39:
}

- (void)_stageFive_associateFaceCropsWithClusterMapping:(id)a3 faceprints:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  id v9 = [MEMORY[0x263EFF9C0] set];
  uint64_t v33 = MEMORY[0x263EF8330];
  uint64_t v34 = 3221225472;
  double v35 = __90__HMIHomePersonClusteringTask__stageFive_associateFaceCropsWithClusterMapping_faceprints___block_invoke;
  unint64_t v36 = &unk_26477E698;
  id v10 = v7;
  id v37 = v10;
  v38 = self;
  uint64_t v11 = v8;
  v39 = v11;
  id v12 = v9;
  id v40 = v12;
  [v6 enumerateKeysAndObjectsUsingBlock:&v33];
  dispatch_time_t v13 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v11, v13))
  {
    uint64_t v14 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1048 description:@"Error on dispatch_group_wait (associateFaceCrops)"];
    [(HMFOperation *)self cancelWithError:v14];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x22A641C70]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v18;
      _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_INFO, "%{public}@Finished calls to associateFaceCropsWithUUIDs", buf, 0xCu);
    }
    os_unfair_lock_lock_with_options();
    double v19 = (void *)MEMORY[0x263EFF8C0];
    double v20 = [v12 allObjects];
    uint64_t v14 = [v19 arrayWithArray:v20];

    os_unfair_lock_unlock(&v16->_lock);
    if ((objc_msgSend(v14, "hmf_isEmpty") & 1) == 0)
    {
      double v21 = [MEMORY[0x263F089D8] string];
      objc_msgSend(v21, "appendFormat:", @"Error associating face crops for %lu person(s): ("), objc_msgSend(v14, "count");
      uint64_t v22 = NSString;
      unint64_t v23 = [v14 count];
      if (v23 >= 3) {
        uint64_t v24 = 3;
      }
      else {
        uint64_t v24 = v23;
      }
      id v25 = objc_msgSend(v14, "subarrayWithRange:", 0, v24);
      id v26 = [v25 componentsJoinedByString:@", "];
      unint64_t v27 = [v14 count];
      uint64_t v28 = &stru_26D98B6C8;
      if (v27 > 3) {
        uint64_t v28 = @" ...";
      }
      __int16 v29 = [v22 stringWithFormat:@"%@%@", v26, v28, v33, v34, v35, v36, v37, v38, v39];

      [v21 appendString:v29];
      [v21 appendString:@""]);
      uint64_t v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = (void *)[v21 copy];
      uint64_t v32 = [v30 hmiPrivateErrorWithCode:1048 description:v31];

      [(HMFOperation *)v16 cancelWithError:v32];
    }
    [(HMIHomePersonClusteringTask *)v16 finish];
  }
}

void __90__HMIHomePersonClusteringTask__stageFive_associateFaceCropsWithClusterMapping_faceprints___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFFA08];
  dispatch_group_t v8 = [v5 objects];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __90__HMIHomePersonClusteringTask__stageFive_associateFaceCropsWithClusterMapping_faceprints___block_invoke_2;
  v23[3] = &unk_26477C6F0;
  id v24 = *(id *)(a1 + 32);
  id v9 = objc_msgSend(v8, "na_map:", v23);
  id v10 = [v7 setWithArray:v9];

  uint64_t v11 = [*(id *)(a1 + 40) summary];
  uint64_t v12 = [v11 numberOfUnknownFaceprintsAssociated];
  uint64_t v13 = [v10 count] + v12;
  uint64_t v14 = [*(id *)(a1 + 40) summary];
  [v14 setNumberOfUnknownFaceprintsAssociated:v13];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  objc_initWeak(&location, *(id *)(a1 + 40));
  uint64_t v15 = [*(id *)(a1 + 40) dataSource];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90__HMIHomePersonClusteringTask__stageFive_associateFaceCropsWithClusterMapping_faceprints___block_invoke_3;
  v17[3] = &unk_26477E670;
  objc_copyWeak(&v21, &location);
  id v16 = v6;
  id v18 = v16;
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 48);
  [v15 associateFaceCropsWithUUIDs:v10 toPersonWithUUID:v16 forSource:3 completion:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

id __90__HMIHomePersonClusteringTask__stageFive_associateFaceCropsWithClusterMapping_faceprints___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", (int)objc_msgSend(a2, "intValue"));
  id v3 = [v2 faceCropUUID];

  return v3;
}

void __90__HMIHomePersonClusteringTask__stageFive_associateFaceCropsWithClusterMapping_faceprints___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = (void *)MEMORY[0x22A641C70]();
      id v6 = (os_unfair_lock_s *)WeakRetained;
      id v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        dispatch_group_t v8 = HMFGetLogIdentifier();
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = 138543874;
        uint64_t v11 = v8;
        __int16 v12 = 2112;
        uint64_t v13 = v9;
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error associating face crops with person (%@): %@", (uint8_t *)&v10, 0x20u);
      }
      os_unfair_lock_lock_with_options();
      [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
      os_unfair_lock_unlock(v6 + 88);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

- (void)finish
{
  id v3 = [MEMORY[0x263EFF910] date];
  id v4 = [(HMIHomePersonClusteringTask *)self startTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;
  id v7 = [(HMIHomePersonClusteringTask *)self summary];
  [v7 setTotalDuration:v6];

  dispatch_group_t v8 = [(HMFOperation *)self error];
  uint64_t v9 = [(HMIHomePersonClusteringTask *)self summary];
  [v9 setError:v8];

  int v10 = [(HMIHomePersonClusteringTask *)self summary];
  +[HMIAnalytics sendEventForClusteringTask:v10];

  v11.receiver = self;
  v11.super_class = (Class)HMIHomePersonClusteringTask;
  [(HMFOperation *)&v11 finish];
}

- (id)personCreatedDateFromFaceCrops:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  dispatch_group_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__9;
  objc_super v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__HMIHomePersonClusteringTask_personCreatedDateFromFaceCrops___block_invoke;
  v6[3] = &unk_26477E6C0;
  v6[4] = &v7;
  objc_msgSend(v3, "na_each:", v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __62__HMIHomePersonClusteringTask_personCreatedDateFromFaceCrops___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v11 = v3;
  if (!v4
    || ([v3 dateCreated],
        double v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v4 compare:v5],
        v5,
        uint64_t v7 = v11,
        v6 == -1))
  {
    uint64_t v8 = [v11 dateCreated];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v7 = v11;
  }
}

- (void)removePerson:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = [v4 UUID];
  uint64_t v7 = [v5 setWithObject:v6];

  objc_initWeak(&location, self);
  uint64_t v8 = [(HMIHomePersonClusteringTask *)self dataSource];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__HMIHomePersonClusteringTask_removePerson___block_invoke;
  v11[3] = &unk_26477E6E8;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v12 = v9;
  id v10 = v4;
  id v13 = v10;
  [v8 removePersonsWithUUIDs:v9 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __44__HMIHomePersonClusteringTask_removePerson___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v5 = (void *)MEMORY[0x22A641C70]();
    id v6 = WeakRetained;
    uint64_t v7 = HMFGetOSLogHandle();
    uint64_t v8 = v7;
    if (v3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        id v10 = *(void **)(a1 + 32);
        int v12 = 138543874;
        id v13 = v9;
        __int16 v14 = 2112;
        id v15 = v10;
        __int16 v16 = 2112;
        id v17 = v3;
        _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error removing person with UUID:%@, error:%@", (uint8_t *)&v12, 0x20u);
LABEL_7:
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v11 = [*(id *)(a1 + 40) UUID];
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_INFO, "%{public}@Successfully removed person %@", (uint8_t *)&v12, 0x16u);

      goto LABEL_7;
    }
  }
}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_getProperty(self, a2, 360, 1);
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 368, 1);
}

- (HMIPersonsModelManager)personsModelManager
{
  return (HMIPersonsModelManager *)objc_getProperty(self, a2, 376, 1);
}

- (HMIClusteringTaskSummary)summary
{
  return (HMIClusteringTaskSummary *)objc_getProperty(self, a2, 384, 1);
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 392, 1);
}

- (BOOL)doImpurePersonCleanup
{
  return self->_doImpurePersonCleanup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_personsModelManager, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_faceClassifier, 0);
  objc_storeStrong((id *)&self->_clusterer, 0);
}

@end
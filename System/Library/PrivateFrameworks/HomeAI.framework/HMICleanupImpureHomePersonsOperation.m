@interface HMICleanupImpureHomePersonsOperation
+ (id)shortDescription;
- (BOOL)isAffectedDate:(id)a3;
- (BOOL)isIdentityPureWithFaceprints:(id)a3 person:(id)a4;
- (HMICleanupImpureHomePersonsOperation)initWithHomeUUID:(id)a3 dataSource:(id)a4;
- (HMIFaceprinter)faceprinter;
- (HMIGreedyClustering)clusterer;
- (HMIHomePersonManagerDataSource)dataSource;
- (NSDate)targetDate;
- (NSString)shortDescription;
- (NSUUID)homeUUID;
- (id)fetchFaceCropsForPerson:(id)a3;
- (id)fetchOrCreateFaceprintsForCrops:(id)a3 person:(id)a4;
- (id)fetchPersons;
- (id)ffArchiveRootURLWithError:(id *)a3;
- (int)numFailures;
- (void)dumpFFDataToCacheForPerson:(id)a3 personFaceCrops:(id)a4;
- (void)handleCleanupForPerson:(id)a3;
- (void)main;
- (void)mainInsideAutoreleasePool;
- (void)purgeURLIfNeeded:(id)a3;
- (void)reassociateFaceCropsWithUnknownSource:(id)a3 toPersonUUID:(id)a4;
- (void)removeFaceCropsWithUUIDs:(id)a3;
- (void)removePerson:(id)a3;
- (void)setNumFailures:(int)a3;
@end

@implementation HMICleanupImpureHomePersonsOperation

- (HMICleanupImpureHomePersonsOperation)initWithHomeUUID:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HMICleanupImpureHomePersonsOperation;
  v9 = [(HMFOperation *)&v19 initWithTimeout:500.0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeUUID, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    v11 = [[HMIGreedyClustering alloc] initWithError:0];
    clusterer = v10->_clusterer;
    v10->_clusterer = v11;

    v13 = objc_alloc_init(HMIFaceprinter);
    faceprinter = v10->_faceprinter;
    v10->_faceprinter = v13;

    v10->_numFailures = 0;
    id v15 = objc_alloc_init(MEMORY[0x263F08790]);
    [v15 setDateFormat:@"yyyy-MM-dd"];
    uint64_t v16 = [v15 dateFromString:@"2021-05-15"];
    targetDate = v10->_targetDate;
    v10->_targetDate = (NSDate *)v16;
  }
  return v10;
}

- (id)fetchPersons
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x22A641C70](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v24 = 138543362;
    v25 = v6;
    _os_log_impl(&dword_225DC6000, v5, OS_LOG_TYPE_INFO, "%{public}@Fetching persons for HMICleanupImpureHomePersonsOperation", (uint8_t *)&v24, 0xCu);
  }
  id v7 = [HMIFetchPersonsOperation alloc];
  id v8 = [(HMICleanupImpureHomePersonsOperation *)v4 dataSource];
  v9 = [(HMIFetchPersonsOperation *)v7 initWithDataSource:v8];

  [(HMFOperation *)v9 start];
  [(HMIFetchPersonsOperation *)v9 waitUntilFinished];
  v10 = [(HMFOperation *)v9 error];
  if (v10)
  {

LABEL_5:
    v11 = (void *)MEMORY[0x22A641C70]();
    v12 = v4;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      id v15 = [(HMFOperation *)v9 error];
      int v24 = 138543618;
      v25 = v14;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v15;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_ERROR, "%{public}@Error fetching persons, error:%@", (uint8_t *)&v24, 0x16u);
    }
    [(HMICleanupImpureHomePersonsOperation *)v12 setNumFailures:[(HMICleanupImpureHomePersonsOperation *)v12 numFailures] + 1];
    uint64_t v16 = 0;
    goto LABEL_12;
  }
  v17 = [(HMIFetchPersonsOperation *)v9 persons];

  if (!v17) {
    goto LABEL_5;
  }
  uint64_t v16 = [(HMIFetchPersonsOperation *)v9 persons];
  v18 = (void *)MEMORY[0x22A641C70]();
  objc_super v19 = v4;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = HMFGetLogIdentifier();
    uint64_t v22 = [v16 count];
    int v24 = 138543618;
    v25 = v21;
    __int16 v26 = 2048;
    uint64_t v27 = v22;
    _os_log_impl(&dword_225DC6000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetched %lu persons", (uint8_t *)&v24, 0x16u);
  }
LABEL_12:

  return v16;
}

- (id)fetchFaceCropsForPerson:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x22A641C70]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v26 = 138543618;
    uint64_t v27 = v8;
    __int16 v28 = 2112;
    uint64_t v29 = (uint64_t)v4;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching face crops for person: %@", (uint8_t *)&v26, 0x16u);
  }
  v9 = [HMIFetchPersonFaceCropsOperation alloc];
  v10 = [(HMICleanupImpureHomePersonsOperation *)v6 dataSource];
  v11 = [(HMIFetchPersonFaceCropsOperation *)v9 initWithDataSource:v10 person:v4];

  [(HMFOperation *)v11 start];
  [(HMIFetchPersonFaceCropsOperation *)v11 waitUntilFinished];
  v12 = [(HMFOperation *)v11 error];
  if (v12)
  {

LABEL_5:
    v13 = (void *)MEMORY[0x22A641C70]();
    v14 = v6;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      v17 = [(HMFOperation *)v11 error];
      int v26 = 138543874;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v4;
      __int16 v30 = 2112;
      id v31 = v17;
      _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_ERROR, "%{public}@Error fetching facecrops for person:%@, error:%@", (uint8_t *)&v26, 0x20u);
    }
    [(HMICleanupImpureHomePersonsOperation *)v14 setNumFailures:[(HMICleanupImpureHomePersonsOperation *)v14 numFailures] + 1];
    v18 = 0;
    goto LABEL_12;
  }
  objc_super v19 = [(HMIFetchPersonFaceCropsOperation *)v11 personFaceCrops];

  if (!v19) {
    goto LABEL_5;
  }
  v18 = [(HMIFetchPersonFaceCropsOperation *)v11 personFaceCrops];
  v20 = (void *)MEMORY[0x22A641C70]();
  v21 = v6;
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = HMFGetLogIdentifier();
    uint64_t v24 = [v18 count];
    int v26 = 138543874;
    uint64_t v27 = v23;
    __int16 v28 = 2048;
    uint64_t v29 = v24;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl(&dword_225DC6000, v22, OS_LOG_TYPE_INFO, "%{public}@Fetched %lu face crops for person: %@", (uint8_t *)&v26, 0x20u);
  }
LABEL_12:

  return v18;
}

- (id)fetchOrCreateFaceprintsForCrops:(id)a3 person:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "na_map:", &__block_literal_global_33);
  v9 = [HMIFetchFaceprintsForFaceCropsOperation alloc];
  v10 = [(HMICleanupImpureHomePersonsOperation *)self dataSource];
  v11 = [(HMIFetchFaceprintsForFaceCropsOperation *)v9 initWithDataSource:v10 faceCropUUIDs:v8];

  [(HMFOperation *)v11 start];
  [(HMIFetchFaceprintsForFaceCropsOperation *)v11 waitUntilFinished];
  v12 = [(HMFOperation *)v11 error];

  if (v12)
  {
    v13 = (void *)MEMORY[0x22A641C70]([(HMICleanupImpureHomePersonsOperation *)self setNumFailures:[(HMICleanupImpureHomePersonsOperation *)self numFailures] + 1]);
    v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      v17 = [(HMFOperation *)v11 error];
      *(_DWORD *)buf = 138543874;
      id v31 = v16;
      __int16 v32 = 2112;
      id v33 = v7;
      __int16 v34 = 2112;
      id v35 = v17;
      _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_ERROR, "%{public}@Ignoring error fetching faceprints for person:%@, error:%@", buf, 0x20u);
    }
  }
  v18 = [(HMICleanupImpureHomePersonsOperation *)self faceprinter];
  objc_super v19 = [(HMIFetchFaceprintsForFaceCropsOperation *)v11 faceprints];
  id v29 = 0;
  v20 = [v18 updatedFaceprintsForFaceCrops:v6 withExistingFaceprints:v19 error:&v29];
  id v21 = v29;

  if (v20)
  {
    uint64_t v22 = [v20 allAtCurrentVersion];
    v23 = [v22 allObjects];
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x22A641C70]();
    v25 = self;
    int v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v31 = v27;
      __int16 v32 = 2112;
      id v33 = v7;
      __int16 v34 = 2112;
      id v35 = v21;
      _os_log_impl(&dword_225DC6000, v26, OS_LOG_TYPE_ERROR, "%{public}@Error faceprinting face crops for person:%@, error:%@", buf, 0x20u);
    }
    [(HMICleanupImpureHomePersonsOperation *)v25 setNumFailures:[(HMICleanupImpureHomePersonsOperation *)v25 numFailures] + 1];
    v23 = 0;
  }

  return v23;
}

uint64_t __79__HMICleanupImpureHomePersonsOperation_fetchOrCreateFaceprintsForCrops_person___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (BOOL)isIdentityPureWithFaceprints:(id)a3 person:(id)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HMIFaceUtilities faceObservationsFromFaceprintsForClustering:v6];
  v9 = (void *)MEMORY[0x22A641C70]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v75 = v12;
    __int16 v76 = 2048;
    uint64_t v77 = [v8 count];
    _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_INFO, "%{public}@Number of faceprints to cluster: %lu", buf, 0x16u);
  }
  clusterer = v10->_clusterer;
  id v71 = 0;
  v14 = [(HMIGreedyClustering *)clusterer getClustersWithFaces:v8 error:&v71];
  id v15 = v71;
  if (!v14)
  {
    uint64_t v22 = (void *)MEMORY[0x22A641C70]([(HMICleanupImpureHomePersonsOperation *)v10 setNumFailures:[(HMICleanupImpureHomePersonsOperation *)v10 numFailures] + 1]);
    v23 = v10;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      int v26 = [v7 UUID];
      *(_DWORD *)buf = 138543874;
      v75 = v25;
      __int16 v76 = 2112;
      uint64_t v77 = (uint64_t)v26;
      __int16 v78 = 2112;
      uint64_t v79 = (uint64_t)v15;
      _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_ERROR, "%{public}@Clustering error:%@ treating identity: %@ as impure", buf, 0x20u);
    }
    goto LABEL_24;
  }
  if ((unint64_t)[v14 count] <= 1)
  {
    uint64_t v16 = (void *)MEMORY[0x22A641C70]();
    v17 = v10;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_super v19 = HMFGetLogIdentifier();
      v20 = [v7 UUID];
      *(_DWORD *)buf = 138543618;
      v75 = v19;
      __int16 v76 = 2112;
      uint64_t v77 = (uint64_t)v20;
      _os_log_impl(&dword_225DC6000, v18, OS_LOG_TYPE_INFO, "%{public}@0 or 1 cluster exists, treating identity: %@ as pure", buf, 0x16u);
    }

    char v21 = 1;
    goto LABEL_25;
  }
  uint64_t v27 = [v7 name];

  if (!v27)
  {
    __int16 v32 = (void *)MEMORY[0x22A641C70]();
    id v33 = v10;
    __int16 v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      id v35 = HMFGetLogIdentifier();
      uint64_t v53 = [v14 count];
      *(_DWORD *)buf = 138543874;
      v75 = v35;
      __int16 v76 = 2112;
      uint64_t v77 = (uint64_t)v7;
      __int16 v78 = 2048;
      uint64_t v79 = v53;
      v37 = "%{public}@Unnamed person %@ has %lu clusters, treating as impure";
      goto LABEL_22;
    }
LABEL_23:

LABEL_24:
    char v21 = 0;
    goto LABEL_25;
  }
  uint64_t v28 = [v7 name];
  if (v28)
  {
    id v29 = (void *)v28;
    __int16 v30 = [v7 personLinks];
    uint64_t v31 = [v30 count];

    if (v31)
    {
      __int16 v32 = (void *)MEMORY[0x22A641C70]();
      id v33 = v10;
      __int16 v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = HMFGetLogIdentifier();
        uint64_t v36 = [v14 count];
        *(_DWORD *)buf = 138543874;
        v75 = v35;
        __int16 v76 = 2112;
        uint64_t v77 = (uint64_t)v7;
        __int16 v78 = 2048;
        uint64_t v79 = v36;
        v37 = "%{public}@Named person %@ with atleast 1 personLink has %lu clusters, treating as impure";
LABEL_22:
        _os_log_impl(&dword_225DC6000, v34, OS_LOG_TYPE_INFO, v37, buf, 0x20u);

        goto LABEL_23;
      }
      goto LABEL_23;
    }
  }
  v38 = (void *)MEMORY[0x22A641C70]();
  v39 = v10;
  v40 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = HMFGetLogIdentifier();
    uint64_t v42 = [v14 count];
    [v7 UUID];
    v43 = v61 = v38;
    *(_DWORD *)buf = 138543874;
    v75 = v41;
    __int16 v76 = 2048;
    uint64_t v77 = v42;
    __int16 v78 = 2112;
    uint64_t v79 = (uint64_t)v43;
    _os_log_impl(&dword_225DC6000, v40, OS_LOG_TYPE_INFO, "%{public}@%lu clusters exists, for person %@ trying to club clusters using vip model", buf, 0x20u);

    v38 = v61;
  }

  v44 = [v14 sortedArrayUsingComparator:&__block_literal_global_52_0];

  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_2;
  v70[3] = &unk_26477E518;
  v70[4] = v39;
  objc_msgSend(v44, "na_each:", v70);
  v45 = [v44 objectAtIndexedSubscript:0];
  v46 = [v45 objects];
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_54;
  v68[3] = &unk_26477E540;
  id v47 = v8;
  id v69 = v47;
  uint64_t v48 = objc_msgSend(v46, "na_map:", v68);

  v49 = [MEMORY[0x263F08C38] UUID];
  v72 = v49;
  v60 = (void *)v48;
  uint64_t v73 = v48;
  v50 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  id v67 = 0;
  v51 = +[HMIPersonsModelManager personsModelWithFaceObservationsByID:v50 error:&v67];
  id v62 = v67;

  if (v51)
  {
    v52 = objc_msgSend(v44, "subarrayWithRange:", 1, objc_msgSend(v44, "count") - 1);
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_59;
    v63[3] = &unk_26477E568;
    id v64 = v47;
    id v65 = v51;
    v66 = v39;
    char v21 = objc_msgSend(v52, "na_all:", v63);
  }
  else
  {
    v55 = (void *)MEMORY[0x22A641C70]();
    v56 = v39;
    v57 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v58 = v59 = v55;
      *(_DWORD *)buf = 138543618;
      v75 = v58;
      __int16 v76 = 2112;
      uint64_t v77 = (uint64_t)v62;
      _os_log_impl(&dword_225DC6000, v57, OS_LOG_TYPE_ERROR, "%{public}@Error while creating vnpersonsmodel: %@, treating identity as impure", buf, 0x16u);

      v55 = v59;
    }

    char v21 = 0;
  }

LABEL_25:
  return v21;
}

uint64_t __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 objects];
  unint64_t v7 = [v6 count];
  id v8 = [v5 objects];
  unint64_t v9 = [v8 count];

  if (v7 <= v9)
  {
    v11 = [v4 objects];
    unint64_t v12 = [v11 count];
    v13 = [v5 objects];
    uint64_t v10 = v12 < [v13 count];
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

void __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x22A641C70]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = HMFGetLogIdentifier();
    id v8 = [v3 objects];
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = [v8 count];
    _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_INFO, "%{public}@Cluster size: %lu", (uint8_t *)&v9, 0x16u);
  }
}

uint64_t __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_54(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (int)[a2 intValue];
  return [v2 objectAtIndexedSubscript:v3];
}

BOOL __76__HMICleanupImpureHomePersonsOperation_isIdentityPureWithFaceprints_person___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[HMIGreedyClustering centermostFaceprintInCluster:v3 faceObservations:*(void *)(a1 + 32)];
  id v5 = *(void **)(a1 + 40);
  id v16 = 0;
  id v6 = [v5 predictPersonFromFaceObservation:v4 limit:1 canceller:0 error:&v16];
  id v7 = v16;
  if (v6 && [v6 count])
  {
    id v8 = [v6 firstObject];
    [v8 confidence];
    BOOL v10 = v9 > 0.6;
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x22A641C70]();
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to predict using VNPersonsModel, error: %@, treating identity as impure", buf, 0x16u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (void)removeFaceCropsWithUUIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [HMIRemoveFaceCropsOperation alloc];
  id v6 = [(HMICleanupImpureHomePersonsOperation *)self dataSource];
  id v7 = [(HMIRemoveFaceCropsOperation *)v5 initWithDataSource:v6 faceCropUUIDs:v4];

  [(HMFOperation *)v7 start];
  [(HMIRemoveFaceCropsOperation *)v7 waitUntilFinished];
  id v8 = [(HMFOperation *)v7 error];

  if (v8)
  {
    float v9 = (void *)MEMORY[0x22A641C70]([(HMICleanupImpureHomePersonsOperation *)self setNumFailures:[(HMICleanupImpureHomePersonsOperation *)self numFailures] + 1]);
    BOOL v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = [(HMFOperation *)v7 error];
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error while removing facecrops %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)reassociateFaceCropsWithUnknownSource:(id)a3 toPersonUUID:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "na_map:", &__block_literal_global_64_0);
  if ([v8 count])
  {
    float v9 = (void *)MEMORY[0x22A641C70]();
    BOOL v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v22 = 138543874;
      v23 = v12;
      __int16 v24 = 2048;
      uint64_t v25 = [v8 count];
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_INFO, "%{public}@Reassociating %lu face crops to person UUID: %@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v13 = [HMIAssociateFaceCropsOperation alloc];
    int v14 = [(HMICleanupImpureHomePersonsOperation *)v10 dataSource];
    id v15 = [(HMIAssociateFaceCropsOperation *)v13 initWithDataSource:v14 faceCropUUIDs:v8 personUUID:v7 source:4];

    [(HMFOperation *)v15 start];
    [(HMIAssociateFaceCropsOperation *)v15 waitUntilFinished];
    __int16 v16 = [(HMFOperation *)v15 error];

    if (v16)
    {
      v17 = (void *)MEMORY[0x22A641C70]([(HMICleanupImpureHomePersonsOperation *)v10 setNumFailures:[(HMICleanupImpureHomePersonsOperation *)v10 numFailures] + 1]);
      uint64_t v18 = v10;
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        uint64_t v21 = [(HMFOperation *)v15 error];
        int v22 = 138543618;
        v23 = v20;
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v21;
        _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error while reassociating facecrops %@", (uint8_t *)&v22, 0x16u);
      }
    }
  }
}

id __91__HMICleanupImpureHomePersonsOperation_reassociateFaceCropsWithUnknownSource_toPersonUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 source])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [v2 UUID];
  }

  return v3;
}

- (id)ffArchiveRootURLWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = HMIURLForCacheDirectory(a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 URLByAppendingPathComponent:@"FFArchive" isDirectory:1];
    id v8 = [(HMICleanupImpureHomePersonsOperation *)self homeUUID];
    float v9 = [v8 UUIDString];
    BOOL v10 = [v7 URLByAppendingPathComponent:v9 isDirectory:1];

    __int16 v11 = [MEMORY[0x263F08850] defaultManager];
    id v12 = [v10 path];
    char v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:a3];

    if (v13)
    {
      id v14 = v10;
    }
    else
    {
      id v15 = (void *)MEMORY[0x22A641C70]();
      __int16 v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        __int16 v19 = [v10 path];
        int v21 = 138543618;
        int v22 = v18;
        __int16 v23 = 2112;
        __int16 v24 = v19;
        _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_ERROR, "%{public}@Error creating directory %@", (uint8_t *)&v21, 0x16u);
      }
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)purgeURLIfNeeded:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v39 = a3;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v39 path];
  v38 = [v4 enumeratorAtPath:v5];

  v37 = [MEMORY[0x263EFF980] array];
  uint64_t v36 = [MEMORY[0x263EFF9A0] dictionary];
  id v35 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = 0;
  uint64_t v34 = *MEMORY[0x263F08048];
  *(void *)&long long v7 = 138543874;
  long long v33 = v7;
  while (1)
  {
    uint64_t v8 = objc_msgSend(v38, "nextObject", v33);

    if (!v8) {
      break;
    }
    float v9 = [v39 path];
    BOOL v10 = [v9 stringByAppendingPathComponent:v8];

    __int16 v11 = [MEMORY[0x263F08850] defaultManager];
    id v48 = 0;
    id v12 = [v11 attributesOfItemAtPath:v10 error:&v48];
    id v13 = v48;

    if (v12)
    {
      [v37 addObject:v8];
      uint64_t v14 = [v12 fileSize];
      v50[3] += v14;
      id v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "fileSize"));
      [v36 setObject:v15 forKeyedSubscript:v8];

      __int16 v16 = [v12 objectForKey:v34];
      if (!v16)
      {
        __int16 v16 = [MEMORY[0x263EFF910] now];
      }
      [v35 setObject:v16 forKeyedSubscript:v8];
    }
    else
    {
      v17 = (void *)MEMORY[0x22A641C70]();
      uint64_t v18 = self;
      HMFGetOSLogHandle();
      __int16 v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = self;
        HMFGetLogIdentifier();
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        int v22 = [v39 path];
        *(_DWORD *)buf = v33;
        id v54 = v21;
        __int16 v55 = 2112;
        uint64_t v56 = v8;
        __int16 v57 = 2112;
        v58 = v22;
        _os_log_impl(&dword_225DC6000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error fetching attributes of the file: %@ at: %@. Attempting to delete it", buf, 0x20u);

        self = v20;
      }

      __int16 v16 = [MEMORY[0x263F08850] defaultManager];
      id v47 = v13;
      [v16 removeItemAtPath:v10 error:&v47];
      id v23 = v47;

      id v13 = v23;
    }

    id v6 = (void *)v8;
  }
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __57__HMICleanupImpureHomePersonsOperation_purgeURLIfNeeded___block_invoke;
  v45[3] = &unk_26477E590;
  id v24 = v35;
  id v46 = v24;
  [v37 sortUsingComparator:v45];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __57__HMICleanupImpureHomePersonsOperation_purgeURLIfNeeded___block_invoke_2;
  v40[3] = &unk_26477E5B8;
  v44 = &v49;
  id v25 = v39;
  id v41 = v25;
  uint64_t v42 = self;
  id v26 = v36;
  id v43 = v26;
  id v27 = (void *)MEMORY[0x22A641C70]([v37 enumerateObjectsUsingBlock:v40]);
  uint64_t v28 = self;
  HMFGetOSLogHandle();
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = [v25 path];
    __int16 v32 = (void *)((unint64_t)v50[3] >> 10);
    *(_DWORD *)buf = v33;
    id v54 = v30;
    __int16 v55 = 2112;
    uint64_t v56 = (uint64_t)v31;
    __int16 v57 = 2048;
    v58 = v32;
    _os_log_impl(&dword_225DC6000, v29, OS_LOG_TYPE_INFO, "%{public}@Disk buffer size of %@: %ld KB", buf, 0x20u);
  }

  _Block_object_dispose(&v49, 8);
}

uint64_t __57__HMICleanupImpureHomePersonsOperation_purgeURLIfNeeded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  long long v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

void __57__HMICleanupImpureHomePersonsOperation_purgeURLIfNeeded___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >> 22 > 0x18uLL)
  {
    long long v7 = [*(id *)(a1 + 32) path];
    uint64_t v8 = [v7 stringByAppendingPathComponent:v6];

    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    id v19 = 0;
    int v10 = [v9 removeItemAtPath:v8 error:&v19];
    id v11 = v19;

    id v12 = (void *)MEMORY[0x22A641C70]();
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = HMFGetOSLogHandle();
    id v15 = v14;
    if (v10)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v21 = v16;
        __int16 v22 = 2112;
        id v23 = v8;
        __int16 v24 = 2112;
        id v25 = v11;
        _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_INFO, "%{public}@Deleted %@ to free up some space, error: %@", buf, 0x20u);
      }
      v17 = [*(id *)(a1 + 48) objectForKeyedSubscript:v6];
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) -= [v17 integerValue];
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v21 = v18;
        __int16 v22 = 2112;
        id v23 = v8;
        __int16 v24 = 2112;
        id v25 = v11;
        _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_ERROR, "%{public}@Error while deleting %@ to free up some space, error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    *a4 = 1;
  }
}

- (void)dumpFFDataToCacheForPerson:(id)a3 personFaceCrops:(id)a4
{
  v79[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x22A641C70]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [(HMICleanupImpureHomePersonsOperation *)v9 homeUUID];
    *(_DWORD *)buf = 138543874;
    v68 = v11;
    __int16 v69 = 2112;
    id v70 = v12;
    __int16 v71 = 2112;
    id v72 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Archive familiar face data for home: %@ person: %@", buf, 0x20u);
  }
  id v13 = [v7 allObjects];
  uint64_t v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_75];

  v78[0] = @"home";
  id v15 = [(HMICleanupImpureHomePersonsOperation *)v9 homeUUID];
  __int16 v16 = [v15 UUIDString];
  v78[1] = @"homePersonsAndFaceCrops";
  v79[0] = v16;
  v75[0] = @"person";
  v75[1] = @"faceCrops";
  v76[0] = v6;
  v76[1] = v14;
  v17 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
  uint64_t v77 = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
  v79[1] = v18;
  id v19 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];

  id v66 = 0;
  id v20 = [MEMORY[0x263F08910] archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v66];
  id v21 = v66;
  __int16 v22 = v21;
  if (v20)
  {
    id v65 = v21;
    id v23 = [(HMICleanupImpureHomePersonsOperation *)v9 ffArchiveRootURLWithError:&v65];
    id v63 = v65;

    if (v23)
    {
      v61 = v14;
      id v62 = v7;
      [(HMICleanupImpureHomePersonsOperation *)v9 purgeURLIfNeeded:v23];
      id v24 = objc_alloc_init(MEMORY[0x263F08790]);
      [v24 setDateFormat:@"yyyy-MM-dd'T'HH-mm-ss"];
      id v25 = [MEMORY[0x263EFF910] now];
      v60 = v24;
      uint64_t v26 = [v24 stringFromDate:v25];

      id v27 = NSString;
      uint64_t v28 = [v6 UUID];
      id v29 = [v28 UUIDString];
      uint64_t v59 = (void *)v26;
      id v30 = [v27 stringWithFormat:@"%@_%@.plist", v29, v26];
      uint64_t v31 = [v23 URLByAppendingPathComponent:v30];
      __int16 v32 = [v31 path];

      long long v33 = (void *)MEMORY[0x22A641C70]();
      uint64_t v34 = v9;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        v37 = [(HMICleanupImpureHomePersonsOperation *)v34 homeUUID];
        *(_DWORD *)buf = 138544130;
        v68 = v36;
        __int16 v69 = 2112;
        id v70 = v37;
        __int16 v71 = 2112;
        id v72 = v6;
        __int16 v73 = 2112;
        v74 = v32;
        _os_log_impl(&dword_225DC6000, v35, OS_LOG_TYPE_INFO, "%{public}@Saving archived familiar face data for home: %@ person: %@ to: %@", buf, 0x2Au);
      }
      uint64_t v14 = v61;
      if (([v20 writeToFile:v32 atomically:1] & 1) == 0)
      {
        v38 = (void *)MEMORY[0x22A641C70]();
        id v39 = v34;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v41 = v58 = v38;
          *(_DWORD *)buf = 138543362;
          v68 = v41;
          _os_log_impl(&dword_225DC6000, v40, OS_LOG_TYPE_ERROR, "%{public}@Couldn't save FF archive", buf, 0xCu);

          v38 = v58;
        }
      }
      uint64_t v42 = (void *)MEMORY[0x22A641C70]();
      id v43 = v34;
      v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v68 = v45;
        _os_log_impl(&dword_225DC6000, v44, OS_LOG_TYPE_INFO, "%{public}@Saved FF archive", buf, 0xCu);
      }

      id v7 = v62;
    }
    else
    {
      uint64_t v53 = (void *)MEMORY[0x22A641C70]();
      id v54 = v9;
      __int16 v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v57 = uint64_t v56 = v14;
        *(_DWORD *)buf = 138543618;
        v68 = v57;
        __int16 v69 = 2112;
        id v70 = v63;
        _os_log_impl(&dword_225DC6000, v55, OS_LOG_TYPE_ERROR, "%{public}@Couldn't get URL for home archives, error: %@", buf, 0x16u);

        uint64_t v14 = v56;
      }
    }

    __int16 v22 = v63;
  }
  else
  {
    id v46 = (void *)MEMORY[0x22A641C70]();
    id v47 = v9;
    id v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v64 = v19;
      v50 = uint64_t v49 = v14;
      [v6 UUID];
      v52 = id v51 = v7;
      *(_DWORD *)buf = 138543874;
      v68 = v50;
      __int16 v69 = 2112;
      id v70 = v52;
      __int16 v71 = 2112;
      id v72 = v22;
      _os_log_impl(&dword_225DC6000, v48, OS_LOG_TYPE_ERROR, "%{public}@Cannot archive familiar face data for person %@, error: %@", buf, 0x20u);

      id v7 = v51;
      uint64_t v14 = v49;
      id v19 = v64;
    }
  }
}

uint64_t __83__HMICleanupImpureHomePersonsOperation_dumpFFDataToCacheForPerson_personFaceCrops___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dateCreated];
  id v6 = [v4 dateCreated];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)main
{
  id v3 = (void *)MEMORY[0x22A641C70](self, a2);
  [(HMICleanupImpureHomePersonsOperation *)self mainInsideAutoreleasePool];
}

- (void)handleCleanupForPerson:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMICleanupImpureHomePersonsOperation *)self fetchFaceCropsForPerson:v4];
  id v6 = v5;
  if (!v5 || ![v5 count])
  {
    id v30 = (void *)MEMORY[0x22A641C70]();
    uint64_t v31 = self;
    __int16 v32 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
LABEL_27:

      goto LABEL_28;
    }
    long long v33 = HMFGetLogIdentifier();
    uint64_t v34 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v59 = v33;
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v34;
    id v35 = "%{public}@Skipping person %@ due to nil or 0 face crops";
LABEL_26:
    _os_log_impl(&dword_225DC6000, v32, OS_LOG_TYPE_INFO, v35, buf, 0x16u);

    goto LABEL_27;
  }
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke;
  v57[3] = &unk_26477D068;
  v57[4] = self;
  if ((objc_msgSend(v6, "na_any:", v57) & 1) == 0)
  {
    if (objc_msgSend(v6, "na_any:", &__block_literal_global_99_0))
    {
      uint64_t v36 = (void *)MEMORY[0x22A641C70]();
      v37 = self;
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        id v39 = HMFGetLogIdentifier();
        v40 = [v4 UUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v59 = v39;
        __int16 v60 = 2112;
        uint64_t v61 = (uint64_t)v40;
        _os_log_impl(&dword_225DC6000, v38, OS_LOG_TYPE_INFO, "%{public}@Person %@ has crops with unknown source, reassociating them", buf, 0x16u);
      }
      if (+[HMIPreference isInternalInstall]) {
        [(HMICleanupImpureHomePersonsOperation *)v37 dumpFFDataToCacheForPerson:v4 personFaceCrops:v6];
      }
      id v41 = [v4 UUID];
      [(HMICleanupImpureHomePersonsOperation *)v37 reassociateFaceCropsWithUnknownSource:v6 toPersonUUID:v41];
    }
    id v30 = (void *)MEMORY[0x22A641C70]();
    uint64_t v31 = self;
    __int16 v32 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    long long v33 = HMFGetLogIdentifier();
    uint64_t v34 = [v4 UUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v59 = v33;
    __int16 v60 = 2112;
    uint64_t v61 = (uint64_t)v34;
    id v35 = "%{public}@Skipping person %@ as all crops are either old or have a non-unknown source";
    goto LABEL_26;
  }
  if (+[HMIPreference isInternalInstall]) {
    [(HMICleanupImpureHomePersonsOperation *)self dumpFFDataToCacheForPerson:v4 personFaceCrops:v6];
  }
  uint64_t v7 = [(HMICleanupImpureHomePersonsOperation *)self fetchOrCreateFaceprintsForCrops:v6 person:v4];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(v6, "na_map:", &__block_literal_global_103);
    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    int v10 = objc_msgSend(v7, "na_map:", &__block_literal_global_108);
    uint64_t v11 = [v9 setWithArray:v10];

    id v12 = (void *)v11;
    id v13 = objc_msgSend(v8, "na_setByRemovingObjectsFromSet:", v11);
    if ([v13 count])
    {
      id v51 = v8;
      uint64_t v14 = (void *)MEMORY[0x22A641C70]();
      id v15 = self;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = uint64_t v49 = v14;
        uint64_t v18 = v13;
        uint64_t v19 = [v13 count];
        [v4 UUID];
        id v20 = v50 = v12;
        *(_DWORD *)buf = 138543874;
        uint64_t v59 = v17;
        __int16 v60 = 2048;
        uint64_t v61 = v19;
        id v13 = v18;
        __int16 v62 = 2112;
        id v63 = v20;
        _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing %lu sentinel facecrops for person %@", buf, 0x20u);

        id v12 = v50;
        uint64_t v14 = v49;
      }

      [(HMICleanupImpureHomePersonsOperation *)v15 removeFaceCropsWithUUIDs:v13];
      uint64_t v8 = v51;
    }
    if ([v7 count])
    {
      BOOL v21 = [(HMICleanupImpureHomePersonsOperation *)self isIdentityPureWithFaceprints:v7 person:v4];
      __int16 v22 = (void *)MEMORY[0x22A641C70]();
      id v23 = self;
      id v24 = HMFGetOSLogHandle();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v21)
      {
        uint64_t v52 = v13;
        if (v25)
        {
          uint64_t v26 = HMFGetLogIdentifier();
          id v27 = [v4 UUID];
          *(_DWORD *)buf = 138543618;
          uint64_t v59 = v26;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v27;
          _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_INFO, "%{public}@Found pure identity, skipping person %@", buf, 0x16u);
        }
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke_109;
        v55[3] = &unk_26477D068;
        id v56 = v12;
        uint64_t v28 = objc_msgSend(v6, "na_filter:", v55);
        id v29 = [v4 UUID];
        [(HMICleanupImpureHomePersonsOperation *)v23 reassociateFaceCropsWithUnknownSource:v28 toPersonUUID:v29];

        id v13 = v52;
      }
      else
      {
        if (v25)
        {
          id v47 = HMFGetLogIdentifier();
          [v4 UUID];
          id v48 = v54 = v13;
          *(_DWORD *)buf = 138543618;
          uint64_t v59 = v47;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v48;
          _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_INFO, "%{public}@Removing person %@ and associated crops", buf, 0x16u);

          id v13 = v54;
        }

        [(HMICleanupImpureHomePersonsOperation *)v23 removeFaceCropsWithUUIDs:v12];
        [(HMICleanupImpureHomePersonsOperation *)v23 removePerson:v4];
      }
    }
    else
    {
      uint64_t v42 = (void *)MEMORY[0x22A641C70]();
      id v43 = self;
      v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = HMFGetLogIdentifier();
        [v4 UUID];
        v46 = uint64_t v53 = v13;
        *(_DWORD *)buf = 138543618;
        uint64_t v59 = v45;
        __int16 v60 = 2112;
        uint64_t v61 = (uint64_t)v46;
        _os_log_impl(&dword_225DC6000, v44, OS_LOG_TYPE_INFO, "%{public}@0 faceprints for person: %@, skipping", buf, 0x16u);

        id v13 = v53;
      }
    }
  }
LABEL_28:
}

BOOL __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 dateCreated];
  if ([v4 isAffectedDate:v5]) {
    BOOL v6 = [v3 source] == 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

BOOL __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 source] == 0;
}

uint64_t __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke_101(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

uint64_t __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke_2_105(uint64_t a1, void *a2)
{
  return [a2 faceCropUUID];
}

uint64_t __63__HMICleanupImpureHomePersonsOperation_handleCleanupForPerson___block_invoke_109(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)mainInsideAutoreleasePool
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = [(HMICleanupImpureHomePersonsOperation *)self fetchPersons];
  uint64_t v4 = v3;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          int v11 = [(HMICleanupImpureHomePersonsOperation *)self isCancelled];
          id v12 = (void *)MEMORY[0x22A641C70]();
          if (v11)
          {
            BOOL v21 = self;
            __int16 v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              id v23 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              uint64_t v31 = v23;
              _os_log_impl(&dword_225DC6000, v22, OS_LOG_TYPE_INFO, "%{public}@HMICleanupImpureHomePersonsOperation exiting early because operation was canceled.", buf, 0xCu);
            }
            goto LABEL_18;
          }
          [(HMICleanupImpureHomePersonsOperation *)self handleCleanupForPerson:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    int v13 = [(HMICleanupImpureHomePersonsOperation *)self numFailures];
    uint64_t v14 = (void *)MEMORY[0x22A641C70]();
    id v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v17)
      {
        uint64_t v18 = HMFGetLogIdentifier();
        int v19 = [(HMICleanupImpureHomePersonsOperation *)v15 numFailures];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v18;
        __int16 v32 = 1024;
        int v33 = v19;
        _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_INFO, "%{public}@CleanImpureHomePersonsOperation encountered %d failures", buf, 0x12u);
      }
      id v20 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1040 description:@"CleanImpureHomePersonsOperation encountered failures"];
      [(HMFOperation *)v15 cancelWithError:v20];
    }
    else
    {
      if (v17)
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v31 = v24;
        _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_INFO, "%{public}@Completed CleanImpureHomePersonsOperation", buf, 0xCu);
      }
      v25.receiver = v15;
      v25.super_class = (Class)HMICleanupImpureHomePersonsOperation;
      [(HMFOperation *)&v25 finish];
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1040 description:@"Fetch persons failed"];
    [(HMFOperation *)self cancelWithError:v5];
LABEL_18:
  }
}

- (BOOL)isAffectedDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMICleanupImpureHomePersonsOperation *)self targetDate];
  uint64_t v6 = [v4 compare:v5];

  return v6 == 1;
}

- (void)removePerson:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [HMIRemovePersonsOperation alloc];
  uint64_t v6 = [(HMICleanupImpureHomePersonsOperation *)self dataSource];
  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = [v4 UUID];
  uint64_t v9 = [v7 setWithObject:v8];
  uint64_t v10 = [(HMIRemovePersonsOperation *)v5 initWithDataSource:v6 personUUIDs:v9];

  [(HMFOperation *)v10 start];
  [(HMIRemovePersonsOperation *)v10 waitUntilFinished];
  int v11 = [(HMFOperation *)v10 error];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x22A641C70]([(HMICleanupImpureHomePersonsOperation *)self setNumFailures:[(HMICleanupImpureHomePersonsOperation *)self numFailures] + 1]);
    int v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      __int16 v16 = [(HMFOperation *)v10 error];
      int v17 = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      id v20 = v16;
      _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_ERROR, "%{public}@Error while removing persons %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)shortDescription
{
  id v2 = objc_opt_class();
  return (NSString *)[v2 shortDescription];
}

- (HMIGreedyClustering)clusterer
{
  return (HMIGreedyClustering *)objc_getProperty(self, a2, 320, 1);
}

- (HMIFaceprinter)faceprinter
{
  return (HMIFaceprinter *)objc_getProperty(self, a2, 328, 1);
}

- (int)numFailures
{
  return self->_numFailures;
}

- (void)setNumFailures:(int)a3
{
  self->_numFailures = a3;
}

- (NSDate)targetDate
{
  return (NSDate *)objc_getProperty(self, a2, 336, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 344, 1);
}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_getProperty(self, a2, 352, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_targetDate, 0);
  objc_storeStrong((id *)&self->_faceprinter, 0);
  objc_storeStrong((id *)&self->_clusterer, 0);
}

@end
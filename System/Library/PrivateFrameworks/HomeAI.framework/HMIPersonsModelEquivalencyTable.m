@interface HMIPersonsModelEquivalencyTable
- (BOOL)facesAreSamePersonFromSet:(id)a3 andSet:(id)a4;
- (BOOL)facesAreSamePersonFromSet:(id)a3 andSet:(id)a4 distanceThreshold:(double)a5 percentMatchingThreshold:(double)a6;
- (HMIPersonsModelEquivalencyTable)initWith;
- (HMIPersonsModelEquivalencyTable)initWithPersonsModels:(id)a3 userDefinedPersonLinks:(id)a4 error:(id *)a5;
- (NSDictionary)personToEquivalencyCell;
- (id)equivalencyCellForPerson:(id)a3;
@end

@implementation HMIPersonsModelEquivalencyTable

- (HMIPersonsModelEquivalencyTable)initWithPersonsModels:(id)a3 userDefinedPersonLinks:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__10;
  v46 = __Block_byref_object_dispose__10;
  id v47 = 0;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke;
  v39[3] = &unk_26477E9F0;
  v41 = &v42;
  v10 = self;
  v40 = v10;
  v11 = objc_msgSend(v8, "na_dictionaryByMappingValues:", v39);
  v12 = (void *)v43[5];
  if (v12)
  {
    id v13 = v12;
    v14 = v13;
    if (a5) {
      *a5 = v13;
    }
    HMIErrorLog(v10, v14);

    v15 = 0;
  }
  else
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__10;
    v37[4] = __Block_byref_object_dispose__10;
    id v38 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__10;
    v35 = __Block_byref_object_dispose__10;
    id v36 = [MEMORY[0x263EFF9A0] dictionary];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_38;
    v26[3] = &unk_26477EA68;
    id v16 = v11;
    id v27 = v16;
    v17 = v10;
    v28 = v17;
    v29 = v37;
    v30 = &v31;
    [v9 enumerateKeysAndObjectsUsingBlock:v26];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_3;
    v22[3] = &unk_26477EB08;
    v24 = &v31;
    v18 = v17;
    v23 = v18;
    v25 = v37;
    [v16 enumerateKeysAndObjectsUsingBlock:v22];
    uint64_t v19 = [(id)v32[5] copy];
    personToEquivalencyCell = v18->_personToEquivalencyCell;
    v18->_personToEquivalencyCell = (NSDictionary *)v19;

    v15 = v18;
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(v37, 8);
  }

  _Block_object_dispose(&v42, 8);
  return v15;
}

id __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [v4 visionPersonsModel];
  v6 = [v5 personUniqueIdentifiers];

  v7 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_2;
  v17 = &unk_26477E9C8;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v18 = v4;
  uint64_t v21 = v8;
  id v19 = v9;
  id v20 = v7;
  id v10 = v7;
  id v11 = v4;
  [v6 enumerateObjectsUsingBlock:&v14];
  v12 = objc_msgSend(v10, "copy", v14, v15, v16, v17);

  return v12;
}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v6];
  uint64_t v8 = [*(id *)(a1 + 32) visionPersonsModel];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v9 + 40);
  id v10 = [v8 faceObservationsForPersonWithUniqueIdentifier:v6 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);

  if (v10)
  {
    id v11 = (void *)MEMORY[0x22A641C70]();
    id v12 = *(id *)(a1 + 40);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v10 count];
      *(_DWORD *)buf = 138543618;
      id v19 = v14;
      __int16 v20 = 2048;
      uint64_t v21 = v15;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Number of all face observations: %ld", buf, 0x16u);
    }
    id v16 = [MEMORY[0x263EFFA08] setWithArray:v10];
    [*(id *)(a1 + 48) setObject:v16 forKeyedSubscript:v7];
  }
  else
  {
    *a4 = 1;
  }
}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v5 sourceUUID];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = *(void **)(a1 + 32);
    id v12 = [v5 sourceUUID];
    id v13 = [v11 objectForKeyedSubscript:v12];
    uint64_t v14 = [v5 personUUID];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    if (v15)
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_39;
      v41[3] = &unk_26477E648;
      id v42 = *(id *)(a1 + 32);
      id v43 = *(id *)(a1 + 40);
      id v16 = objc_msgSend(v6, "na_filter:", v41);
      if ([v16 count])
      {
        v17 = [MEMORY[0x263EFF9C0] set];
        id v18 = *(void **)(a1 + 32);
        id v19 = [v5 sourceUUID];
        __int16 v20 = [v18 objectForKeyedSubscript:v19];
        uint64_t v21 = [v5 personUUID];
        uint64_t v22 = [v20 objectForKeyedSubscript:v21];
        [v17 unionSet:v22];

        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_42;
        v38[3] = &unk_26477EA18;
        id v39 = v17;
        id v40 = *(id *)(a1 + 32);
        id v23 = v17;
        objc_msgSend(v6, "na_each:", v38);
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v23 forKeyedSubscript:v5];
        v24 = [v6 setByAddingObject:v5];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_2_44;
        v35[3] = &unk_26477EA40;
        uint64_t v25 = *(void *)(a1 + 56);
        id v36 = v24;
        uint64_t v37 = v25;
        id v26 = v24;
        objc_msgSend(v26, "na_each:", v35);
      }
      else
      {
        uint64_t v31 = (void *)MEMORY[0x22A641C70]();
        id v32 = *(id *)(a1 + 40);
        uint64_t v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v45 = v34;
          __int16 v46 = 2112;
          id v47 = v5;
          _os_log_impl(&dword_225DC6000, v33, OS_LOG_TYPE_ERROR, "%{public}@All links for %@ in userDefinedPersonLinks are invalid", buf, 0x16u);
        }
      }

      goto LABEL_13;
    }
  }
  else
  {
  }
  id v27 = (void *)MEMORY[0x22A641C70]();
  id v28 = *(id *)(a1 + 40);
  v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v45 = v30;
    __int16 v46 = 2112;
    id v47 = v5;
    _os_log_impl(&dword_225DC6000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid entry in userDefinedPersonLinks: %@", buf, 0x16u);
  }
LABEL_13:
}

uint64_t __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 sourceUUID];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v3 sourceUUID];
    id v10 = [v8 objectForKeyedSubscript:v9];
    id v11 = [v3 personUUID];
    id v12 = [v10 objectForKeyedSubscript:v11];

    if (v12)
    {
      uint64_t v13 = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v14 = (void *)MEMORY[0x22A641C70]();
  id v15 = *(id *)(a1 + 40);
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = HMFGetLogIdentifier();
    int v19 = 138543618;
    __int16 v20 = v17;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_ERROR, "%{public}@Invalid entry in userDefinedPersonLinks: %@", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v13 = 0;
LABEL_8:

  return v13;
}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_42(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v8 = [v4 sourceUUID];
  id v5 = [v3 objectForKeyedSubscript:v8];
  uint64_t v6 = [v4 personUUID];

  v7 = [v5 objectForKeyedSubscript:v6];
  [v2 unionSet:v7];
}

uint64_t __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_2_44(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:*(void *)(a1 + 32) forKeyedSubscript:a2];
}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_4;
  v9[3] = &unk_26477EAE0;
  id v10 = v5;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  uint64_t v12 = *(void *)(a1 + 48);
  id v7 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v9];
}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [[HMIPersonSourceUUIDPair alloc] initWithPersonUUID:v5 sourceUUID:*(void *)(a1 + 32)];
  long long v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x22A641C70]();
    id v10 = *(id *)(a1 + 40);
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Skipping person who belongs to user defined equivalency cell: %@", buf, 0x16u);
    }
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__10;
    v34 = __Block_byref_object_dispose__10;
    id v35 = 0;
    uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_47;
    v26[3] = &unk_26477EAB8;
    id v27 = *(id *)(a1 + 40);
    uint64_t v14 = v7;
    id v28 = v14;
    id v15 = v6;
    uint64_t v16 = *(void *)(a1 + 48);
    id v29 = v15;
    uint64_t v30 = v16;
    uint64_t v31 = buf;
    [v13 enumerateKeysAndObjectsUsingBlock:v26];
    v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      id v18 = objc_msgSend(v17, "objectForKeyedSubscript:");
      int v19 = [v15 setByAddingObjectsFromSet:v18];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v19 forKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];

      __int16 v20 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
      __int16 v21 = [v20 setByAddingObject:v14];

      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_49;
      v23[3] = &unk_26477EA40;
      uint64_t v25 = *(void *)(a1 + 48);
      id v22 = v21;
      id v24 = v22;
      objc_msgSend(v22, "na_each:", v23);
    }
    else
    {
      [v17 setObject:v15 forKeyedSubscript:v14];
      id v18 = [MEMORY[0x263EFFA08] setWithObject:v14];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v18 forKeyedSubscript:v14];
    }

    _Block_object_dispose(buf, 8);
  }
}

void __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_47(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = (void *)MEMORY[0x22A641C70]();
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v29 = v13;
    __int16 v30 = 2112;
    uint64_t v31 = v14;
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Comparing persons (%@, %@)", buf, 0x20u);
  }
  if ([*(id *)(a1 + 32) facesAreSamePersonFromSet:*(void *)(a1 + 48) andSet:v9])
  {
    id v15 = (void *)MEMORY[0x22A641C70]();
    id v16 = *(id *)(a1 + 32);
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = HMFGetLogIdentifier();
      int v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v29 = v18;
      __int16 v30 = 2112;
      uint64_t v31 = v19;
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Equivalency determined between pair: (%@, %@)!", buf, 0x20u);
    }
    __int16 v20 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v8];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_48;
    v26[3] = &unk_26477EA90;
    id v27 = *(id *)(a1 + 40);
    __int16 v21 = objc_msgSend(v20, "na_firstObjectPassingTest:", v26);
    if (v21)
    {
      id v22 = (void *)MEMORY[0x22A641C70]();
      id v23 = *(id *)(a1 + 32);
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v29 = v25;
        __int16 v30 = 2112;
        uint64_t v31 = v21;
        _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Cannot add to matching equivalency cell because it already has entry from this source: %@", buf, 0x16u);
      }
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

uint64_t __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_48(uint64_t a1, void *a2)
{
  id v3 = [a2 sourceUUID];
  id v4 = [*(id *)(a1 + 32) sourceUUID];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __86__HMIPersonsModelEquivalencyTable_initWithPersonsModels_userDefinedPersonLinks_error___block_invoke_49(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:*(void *)(a1 + 32) forKeyedSubscript:a2];
}

- (BOOL)facesAreSamePersonFromSet:(id)a3 andSet:(id)a4
{
  return [(HMIPersonsModelEquivalencyTable *)self facesAreSamePersonFromSet:a3 andSet:a4 distanceThreshold:0.2 percentMatchingThreshold:0.1];
}

- (BOOL)facesAreSamePersonFromSet:(id)a3 andSet:(id)a4 distanceThreshold:(double)a5 percentMatchingThreshold:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 count];
  uint64_t v12 = [v10 count] * v11;
  double v13 = (double)v12 * a6;
  if ((uint64_t)v13 <= 2) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = (uint64_t)v13;
  }
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = v12;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __111__HMIPersonsModelEquivalencyTable_facesAreSamePersonFromSet_andSet_distanceThreshold_percentMatchingThreshold___block_invoke;
  v18[3] = &unk_26477EB58;
  id v15 = v10;
  double v22 = a5;
  id v19 = v15;
  __int16 v20 = &v25;
  uint64_t v23 = v14;
  __int16 v21 = v24;
  [v9 enumerateObjectsUsingBlock:v18];
  BOOL v16 = v26[3] >= v14;

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __111__HMIPersonsModelEquivalencyTable_facesAreSamePersonFromSet_andSet_distanceThreshold_percentMatchingThreshold___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __111__HMIPersonsModelEquivalencyTable_facesAreSamePersonFromSet_andSet_distanceThreshold_percentMatchingThreshold___block_invoke_2;
  v8[3] = &unk_26477EB30;
  id v9 = v5;
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = a3;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __111__HMIPersonsModelEquivalencyTable_facesAreSamePersonFromSet_andSet_distanceThreshold_percentMatchingThreshold___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 faceprint];
  id v8 = [v7 descriptorData];
  id v9 = [v6 faceprint];

  long long v10 = [v9 descriptorData];
  +[HMIGreedyClustering faceDistanceFromDescriptor:v8 toDescriptor:v10];
  float v12 = v11;

  if (*(double *)(a1 + 56) > v12
    && (++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24),
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= *(void *)(a1 + 64))
    || (--*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24),
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
      + *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < *(void *)(a1 + 64)))
  {
    *a3 = 1;
    **(unsigned char **)(a1 + 72) = 1;
  }
}

- (id)equivalencyCellForPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(HMIPersonsModelEquivalencyTable *)self personToEquivalencyCell];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (HMIPersonsModelEquivalencyTable)initWith
{
  v3.receiver = self;
  v3.super_class = (Class)HMIPersonsModelEquivalencyTable;
  return [(HMIPersonsModelEquivalencyTable *)&v3 init];
}

- (NSDictionary)personToEquivalencyCell
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end
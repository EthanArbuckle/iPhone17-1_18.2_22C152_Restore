@interface HMDCoreDataCloudTransformHomeManager
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (id)fixUpPrimaryHomeCounterForPrimaryHome:(id)a3 primaryHomeModelID:(id)a4;
+ (uint64_t)_exportUpdateWithObjectID:(int)a3 updateApplicationData:(void *)a4 context:;
@end

@implementation HMDCoreDataCloudTransformHomeManager

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x263EFF940];
  uint64_t v15 = *MEMORY[0x263EFF498];
  v16 = NSString;
  v17 = NSStringFromSelector(a2);
  v18 = [v16 stringWithFormat:@"%@ is unavailable", v17];
  id v19 = [v14 exceptionWithName:v15 reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if ([v11 count])
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __109__HMDCoreDataCloudTransformHomeManager_exportUpdateWithObjectID_updatedProperties_additionalUpdates_context___block_invoke;
    v17[3] = &unk_264A2CF80;
    v18 = @"appDataDictionary";
    id v19 = &v20;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);

    BOOL v14 = *((unsigned char *)v21 + 24) != 0;
  }
  else
  {
    BOOL v14 = 1;
    *((unsigned char *)v21 + 24) = 1;
  }
  char v15 = +[HMDCoreDataCloudTransformHomeManager _exportUpdateWithObjectID:updateApplicationData:context:]((uint64_t)a1, v10, v14, v13);
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __109__HMDCoreDataCloudTransformHomeManager_exportUpdateWithObjectID_updatedProperties_additionalUpdates_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = [a2 name];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

+ (uint64_t)_exportUpdateWithObjectID:(int)a3 updateApplicationData:(void *)a4 context:
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a4;
  v7 = self;
  v47 = v5;
  v8 = [v6 objectWithID:v5];
  v9 = (void *)MEMORY[0x263EFF9C0];
  id v10 = [v8 homes];
  id v11 = objc_msgSend(v9, "setWithCapacity:", objc_msgSend(v10, "count"));

  id v12 = [v8 homes];
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __96__HMDCoreDataCloudTransformHomeManager__exportUpdateWithObjectID_updateApplicationData_context___block_invoke;
  v61[3] = &unk_264A29B78;
  id v48 = v11;
  id v62 = v48;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v61);

  id v13 = +[MKFCKHome fetchRequest];
  [v13 setFetchBatchSize:2];
  id v60 = 0;
  BOOL v14 = [v6 executeFetchRequest:v13 error:&v60];
  id v15 = v60;
  if (v14)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v69 = 1;
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __96__HMDCoreDataCloudTransformHomeManager__exportUpdateWithObjectID_updateApplicationData_context___block_invoke_3;
    v50[3] = &unk_264A29BA0;
    id v51 = v48;
    v55 = v7;
    id v16 = v6;
    id v52 = v16;
    v53 = buf;
    v54 = &v56;
    objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v50);
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      if (*((unsigned char *)v57 + 24))
      {
        v17 = +[MKFCKModel defaultPreloadedProperties];
        v67 = @"primaryHomeCounter";
        v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v67 count:1];
        id v19 = [v17 arrayByAddingObjectsFromArray:v18];
        [v13 setPropertiesToFetch:v19];

        id v49 = v15;
        uint64_t v20 = [v16 executeFetchRequest:v13 error:&v49];
        id v21 = v49;

        if (!v20)
        {
          v41 = (void *)MEMORY[0x230FBD990]();
          id v42 = v7;
          HMFGetOSLogHandle();
          v43 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v44 = HMFGetLogIdentifier();
            *(_DWORD *)v63 = 138543618;
            v64 = v44;
            __int16 v65 = 2114;
            id v66 = v21;
            _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch homes: %{public}@", v63, 0x16u);
          }
          BOOL v14 = 0;
          uint64_t v36 = 0;
          id v15 = v21;
          goto LABEL_21;
        }
        BOOL v14 = (void *)v20;
        id v15 = v21;
      }
      uint64_t v22 = objc_opt_class();
      char v23 = [v8 primaryHome];
      v24 = [v23 handle];
      v25 = [v24 homeUUID];
      v26 = [v22 fixUpPrimaryHomeCounterForPrimaryHome:v14 primaryHomeModelID:v25];

      if (v26)
      {
        if (a3)
        {
          v27 = [v8 appDataDictionary];
          v28 = [v26 homeManagerApplicationData];
          char v29 = isEqualDeepCompare(v27, v28);

          if ((v29 & 1) == 0)
          {
            v30 = [v8 appDataDictionary];
            v31 = (void *)[v30 copy];
            [v26 setHomeManagerApplicationData:v31];
          }
        }
      }
      else
      {
        v37 = (void *)MEMORY[0x230FBD990]();
        id v38 = v7;
        HMFGetOSLogHandle();
        v39 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v40 = HMFGetLogIdentifier();
          *(_DWORD *)v63 = 138543362;
          v64 = v40;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@No primary home", v63, 0xCu);
        }
      }

      uint64_t v36 = 1;
    }
    else
    {
      uint64_t v36 = 0;
    }
LABEL_21:

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_22;
  }
  v32 = (void *)MEMORY[0x230FBD990]();
  id v33 = v7;
  v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v35 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch homes: %{public}@", buf, 0x16u);
  }
  uint64_t v36 = 0;
LABEL_22:

  return v36;
}

void __96__HMDCoreDataCloudTransformHomeManager__exportUpdateWithObjectID_updateApplicationData_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 handle];
  v3 = [v4 homeUUID];
  [v2 addObject:v3];
}

void __96__HMDCoreDataCloudTransformHomeManager__exportUpdateWithObjectID_updateApplicationData_context___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (([v6 isFake] & 1) == 0 && (objc_msgSend(v6, "isDeleted") & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    v8 = [v6 modelID];
    LOBYTE(v7) = [v7 containsObject:v8];

    if ((v7 & 1) == 0)
    {
      v9 = [v6 objectID];
      id v10 = [v9 entity];
      id v11 = +[HMDCoreDataCloudTransform importTransformableClassFromEntity:v10];

      if (v11)
      {
        id v12 = [MEMORY[0x263EFF9A0] dictionary];
        if ([(objc_class *)v11 importInsertWithObjectID:v9 additionalUpdates:v12 context:*(void *)(a1 + 40)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
      else
      {
        id v13 = (void *)MEMORY[0x230FBD990]();
        id v14 = *(id *)(a1 + 64);
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          id v16 = HMFGetLogIdentifier();
          v17 = objc_msgSend(v9, "hmd_debugIdentifier");
          int v18 = 138543618;
          id v19 = v16;
          __int16 v20 = 2112;
          id v21 = v17;
          _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_FAULT, "%{public}@No transformable for object: <%@>", (uint8_t *)&v18, 0x16u);
        }
      }
    }
  }
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  return +[HMDCoreDataCloudTransformHomeManager _exportUpdateWithObjectID:updateApplicationData:context:]((uint64_t)a1, a3, 1, a5);
}

+ (id)fixUpPrimaryHomeCounterForPrimaryHome:(id)a3 primaryHomeModelID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  char v23 = __Block_byref_object_copy__233618;
  v24 = __Block_byref_object_dispose__233619;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __97__HMDCoreDataCloudTransformHomeManager_fixUpPrimaryHomeCounterForPrimaryHome_primaryHomeModelID___block_invoke;
  v12[3] = &unk_264A29B50;
  id v7 = v6;
  id v13 = v7;
  id v14 = &v20;
  id v15 = &v16;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);
  v8 = (void *)v21[5];
  if (v8)
  {
    uint64_t v9 = v17[3];
    if (v9 != [v8 primaryHomeCounter]) {
      [(id)v21[5] setPrimaryHomeCounter:v17[3]];
    }
    id v10 = (id)v21[5];
  }
  else
  {
    id v10 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __97__HMDCoreDataCloudTransformHomeManager_fixUpPrimaryHomeCounterForPrimaryHome_primaryHomeModelID___block_invoke(void *a1, void *a2)
{
  id v13 = a2;
  id v4 = [v13 modelID];
  int v5 = [v4 isEqual:a1[4]];

  if (!v5)
  {
    BOOL v10 = [v13 primaryHomeCounter] < *(void *)(*(void *)(a1[6] + 8) + 24);
    id v11 = v13;
    if (v10) {
      goto LABEL_12;
    }
    uint64_t v12 = *(void *)(*(void *)(a1[5] + 8) + 40);
    uint64_t v9 = [v13 primaryHomeCounter];
    if (v12)
    {
      *(void *)(*(void *)(a1[6] + 8) + 24) = v9 + 1;
LABEL_9:
      id v11 = v13;
      goto LABEL_12;
    }
LABEL_8:
    *(void *)(*(void *)(a1[6] + 8) + 24) = v9;
    goto LABEL_9;
  }
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  if ([v13 primaryHomeCounter])
  {
    uint64_t v6 = [v13 primaryHomeCounter];
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void *)(v7 + 24);
    if (v6 > v8)
    {
      uint64_t v9 = [v13 primaryHomeCounter];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void *)(v7 + 24);
  }
  id v11 = v13;
  *(void *)(v7 + 24) = v8 + 1;
LABEL_12:
}

@end
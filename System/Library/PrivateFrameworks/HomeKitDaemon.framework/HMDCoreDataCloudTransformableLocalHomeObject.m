@interface HMDCoreDataCloudTransformableLocalHomeObject
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (void)_addHomeForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:;
@end

@implementation HMDCoreDataCloudTransformableLocalHomeObject

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (void)_addHomeForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:
{
  v84[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  v10 = [v6 entity];
  v11 = +[_MKFHomeSetting entity];
  int v12 = [v10 isKindOfEntity:v11];

  p_cache = MKFCKOutgoingInvitation.cache;
  v68 = v7;
  v71 = v10;
  if (v12)
  {
    v14 = +[_MKFHome entity];
    v15 = [v14 propertiesByName];
    v16 = [v15 objectForKeyedSubscript:@"settings_"];
    v77 = v16;
    v17 = &v77;
  }
  else
  {
    v18 = +[_MKFGuestAccessCode entity];
    int v19 = [v10 isKindOfEntity:v18];

    if (v19)
    {
      v14 = +[_MKFHome entity];
      v15 = [v14 propertiesByName];
      v16 = [v15 objectForKeyedSubscript:@"guestAccessCodes_"];
      v76 = v16;
      v17 = &v76;
    }
    else
    {
      v20 = +[_MKFRemovedUserAccessCode entity];
      int v21 = [v10 isKindOfEntity:v20];

      if (!v21)
      {
        uint64_t v70 = MEMORY[0x263EFFA68];
        goto LABEL_8;
      }
      v14 = +[_MKFHome entity];
      v15 = [v14 propertiesByName];
      v16 = [v15 objectForKeyedSubscript:@"removedAccessCodes_"];
      v75 = v16;
      v17 = &v75;
    }
  }
  uint64_t v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];

LABEL_8:
  id v22 = v6;
  id v73 = v8;
  v67 = (void *)v9;
  v72 = self;
  id v23 = v22;
  v69 = v23;
  while (1)
  {
    v24 = objc_msgSend(v23, "entity", v66);
    v25 = [p_cache + 288 entity];
    char v26 = [v24 isKindOfEntity:v25];

    if (v26) {
      break;
    }
    uint64_t v27 = [v23 entity];
    if (v27)
    {
      v28 = (void *)v27;
      do
      {
        v29 = [v28 userInfo];
        v30 = [v29 objectForKeyedSubscript:@"parent"];

        if (v30) {
          break;
        }
        v30 = [v28 superentity];

        v28 = v30;
      }
      while (v30);
    }
    else
    {
      v30 = 0;
    }
    v84[0] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:1];
    id v74 = 0;
    v32 = objc_msgSend(v73, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v23, v31, &v74);
    id v33 = v74;

    if (v33)
    {
      v34 = (void *)MEMORY[0x230FBD990]();
      id v35 = v72;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v79 = v37;
        __int16 v80 = 2114;
        id v81 = v23;
        __int16 v82 = 2114;
        id v83 = v33;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (v32)
      {
        v39 = [v32 valueForKey:v30];
        v40 = v39;
        if (v39)
        {
          id v41 = v39;
          objc_opt_class();
          int v42 = objc_opt_isKindOfClass() & 1;
          if (v42) {
            v43 = v41;
          }
          else {
            v43 = 0;
          }
          id v44 = v43;

          if (v42)
          {
            uint64_t v45 = [v41 objectID];

            int v38 = 0;
            id v23 = (id)v45;
          }
          else
          {
            v53 = (void *)MEMORY[0x230FBD990]();
            id v54 = v72;
            v55 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v56 = v66 = v53;
              *(_DWORD *)buf = 138543874;
              v79 = v56;
              __int16 v80 = 2114;
              id v81 = v30;
              __int16 v82 = 2112;
              id v83 = v32;
              _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Object value for '%{public}@' is not an object: %@", buf, 0x20u);

              v53 = v66;
            }

            int v38 = 1;
          }
        }
        else
        {
          v49 = (void *)MEMORY[0x230FBD990]();
          id v50 = v72;
          v51 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            v52 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v79 = v52;
            __int16 v80 = 2114;
            id v81 = v30;
            __int16 v82 = 2112;
            id v83 = v32;
            _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Object has no value for '%{public}@': %@", buf, 0x20u);
          }
          int v38 = 1;
        }

        p_cache = (void **)(MKFCKOutgoingInvitation + 16);
        goto LABEL_39;
      }
      v34 = (void *)MEMORY[0x230FBD990]();
      id v46 = v72;
      v47 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v79 = v48;
        __int16 v80 = 2114;
        id v81 = v23;
        _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find object with objectID %{public}@", buf, 0x16u);
      }
    }
    int v38 = 1;
LABEL_39:

    if (v38)
    {
      v57 = 0;
      goto LABEL_42;
    }
  }
  id v23 = v23;
  v57 = v23;
LABEL_42:

  if (v57)
  {
    v58 = [v68 objectForKeyedSubscript:v57];
    v59 = v58;
    v60 = (void *)v70;
    if (v58)
    {
      if ([v58 count]) {
        [v59 addObjectsFromArray:v70];
      }
    }
    else
    {
      v65 = [MEMORY[0x263EFF9C0] setWithArray:v70];
      [v68 setObject:v65 forKeyedSubscript:v57];
    }
  }
  else
  {
    v61 = (void *)MEMORY[0x230FBD990]();
    id v62 = v67;
    v63 = HMFGetOSLogHandle();
    v60 = (void *)v70;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v79 = v64;
      __int16 v80 = 2114;
      id v81 = v69;
      _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find home for model with objectID %{public}@", buf, 0x16u);
    }
  }
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  return 1;
}

@end
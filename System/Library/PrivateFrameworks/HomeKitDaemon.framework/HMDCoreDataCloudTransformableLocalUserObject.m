@interface HMDCoreDataCloudTransformableLocalUserObject
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (void)_addUserForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:;
@end

@implementation HMDCoreDataCloudTransformableLocalUserObject

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (void)_addUserForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  v10 = [v6 entity];
  v11 = +[_MKFUserAccessCode entity];
  int v12 = [v10 isKindOfEntity:v11];

  v93 = v10;
  id v94 = v7;
  if (v12)
  {
    v13 = +[_MKFUser entity];
    v14 = [v13 propertiesByName];
    v15 = [v14 objectForKeyedSubscript:@"accessCode"];
    v99 = v15;
    uint64_t v92 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v99 count:1];
  }
  else
  {
    uint64_t v92 = MEMORY[0x263EFFA68];
  }
  id v16 = v6;
  id v96 = v8;
  v91 = (void *)v9;
  v95 = self;
  v17 = (__CFString *)v16;
  v18 = [(__CFString *)v17 entity];
  v19 = +[_MKFUser entity];
  char v20 = [v18 isKindOfEntity:v19];

  v22 = v17;
  if (v20)
  {
LABEL_5:
    v23 = v22;
    v24 = v23;
    goto LABEL_56;
  }
  *(void *)&long long v21 = 138543618;
  long long v90 = v21;
  v22 = v17;
  while (1)
  {
    v23 = v22;
    id v25 = v96;
    v26 = self;
    id v98 = 0;
    v27 = objc_msgSend(v25, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v23, MEMORY[0x263EFFA68], &v98);
    id v28 = v98;
    if (v28)
    {
      v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = v26;
      v31 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

LABEL_12:
        v36 = 0;
        goto LABEL_13;
      }
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v102 = v32;
      __int16 v103 = 2114;
      v104 = v23;
      __int16 v105 = 2114;
      id v106 = v28;
      v33 = v31;
      v34 = "%{public}@Failed to fetch object with objectID %{public}@: %{public}@";
      uint32_t v35 = 32;
LABEL_10:
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, v34, buf, v35);

      goto LABEL_11;
    }
    if (!v27)
    {
      v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = v26;
      v31 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = v90;
      v102 = v32;
      __int16 v103 = 2114;
      v104 = v23;
      v33 = v31;
      v34 = "%{public}@Couldn't find object with objectID %{public}@";
      uint32_t v35 = 22;
      goto LABEL_10;
    }
    v41 = [v27 entity];
    v42 = +[_MKFUserAccessCode entity];
    int v43 = [v41 isKindOfEntity:v42];

    if (!v43) {
      goto LABEL_12;
    }
    id v44 = v27;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v46 = v44;
    }
    else {
      v46 = 0;
    }
    id v47 = v46;

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_41;
    }
    v48 = [v44 user];

    v36 = @"user";
    if (!v48)
    {
      v49 = [v44 guest];

      v36 = @"guest";
      if (!v49)
      {
LABEL_41:

        goto LABEL_12;
      }
    }

LABEL_13:
    v37 = v36;
    if (!v37)
    {
      uint64_t v38 = [(__CFString *)v23 entity];
      if (v38)
      {
        v39 = (void *)v38;
        do
        {
          v40 = objc_msgSend(v39, "userInfo", v90);
          v37 = [v40 objectForKeyedSubscript:@"parent"];

          if (v37) {
            break;
          }
          v37 = [v39 superentity];

          v39 = v37;
        }
        while (v37);
      }
      else
      {
        v37 = 0;
      }
    }
    v100 = v37;
    v50 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v100, 1, v90);
    id v97 = 0;
    v51 = objc_msgSend(v25, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v23, v50, &v97);
    id v52 = v97;

    if (v52)
    {
      v64 = (void *)MEMORY[0x230FBD990]();
      id v65 = v95;
      v66 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v67 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v102 = v67;
        __int16 v103 = 2114;
        v104 = v23;
        __int16 v105 = 2114;
        id v106 = v52;
        _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);
      }

      v69 = v93;
      v68 = v94;
      v70 = (void *)v92;
      goto LABEL_48;
    }
    if (!v51)
    {
      v71 = (void *)MEMORY[0x230FBD990]();
      id v72 = v95;
      v73 = HMFGetOSLogHandle();
      v69 = v93;
      v68 = v94;
      v70 = (void *)v92;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        v74 = HMFGetLogIdentifier();
        *(_DWORD *)buf = v90;
        v102 = v74;
        __int16 v103 = 2114;
        v104 = v23;
        _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find object with objectID %{public}@", buf, 0x16u);
      }
      id v52 = 0;
LABEL_48:

      v24 = 0;
      goto LABEL_57;
    }
    v53 = [v51 valueForKey:v37];
    if (!v53) {
      break;
    }
    id v54 = v53;
    objc_opt_class();
    int v55 = objc_opt_isKindOfClass() & 1;
    if (v55) {
      v56 = v54;
    }
    else {
      v56 = 0;
    }
    id v57 = v56;

    if (!v55)
    {
      v79 = (void *)MEMORY[0x230FBD990]();
      id v80 = v95;
      v81 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        v82 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v102 = v82;
        __int16 v103 = 2114;
        v104 = v37;
        __int16 v105 = 2112;
        id v106 = v51;
        _os_log_impl(&dword_22F52A000, v81, OS_LOG_TYPE_ERROR, "%{public}@Object value for '%{public}@' is not an object: %@", buf, 0x20u);
      }

      goto LABEL_55;
    }
    v22 = [v54 objectID];

    v58 = [(__CFString *)v17 entity];
    v59 = +[_MKFUserAccessCode entity];
    char v60 = [v58 isKindOfEntity:v59];

    if ((v60 & 1) == 0)
    {
      v61 = [v22 entity];
      v62 = +[_MKFUser entity];
      int v63 = [v61 isKindOfEntity:v62];

      if (!v63) {
        continue;
      }
    }
    goto LABEL_5;
  }
  v75 = (void *)MEMORY[0x230FBD990]();
  id v76 = v95;
  v77 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
  {
    v78 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v102 = v78;
    __int16 v103 = 2114;
    v104 = v37;
    __int16 v105 = 2112;
    id v106 = v51;
    _os_log_impl(&dword_22F52A000, v77, OS_LOG_TYPE_ERROR, "%{public}@Object has no value for '%{public}@': %@", buf, 0x20u);
  }
LABEL_55:

  v24 = 0;
LABEL_56:
  v69 = v93;
  v68 = v94;
  v70 = (void *)v92;
LABEL_57:

  if (v24)
  {
    v83 = [v68 objectForKeyedSubscript:v24];
    v84 = v83;
    if (v83)
    {
      if ([v83 count]) {
        [v84 addObjectsFromArray:v70];
      }
    }
    else
    {
      v89 = [MEMORY[0x263EFF9C0] setWithArray:v70];
      [v68 setObject:v89 forKeyedSubscript:v24];
    }
  }
  else
  {
    v85 = (void *)MEMORY[0x230FBD990]();
    id v86 = v91;
    v87 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v88 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v102 = v88;
      __int16 v103 = 2114;
      v104 = v17;
      _os_log_impl(&dword_22F52A000, v87, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find user for model with objectID %{public}@", buf, 0x16u);
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
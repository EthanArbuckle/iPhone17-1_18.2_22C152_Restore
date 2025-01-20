@interface HMDResidentSyncClientMergePolicy
+ (id)logCategory;
- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4;
- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4;
- (HMDResidentSyncClientMergePolicy)init;
- (HMDResidentSyncClientMergePolicy)initWithFaultLogging:(BOOL)a3;
- (id)logIdentifier;
@end

@implementation HMDResidentSyncClientMergePolicy

- (id)logIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)*MEMORY[0x263EFEFF8];
  id v19 = 0;
  char v8 = [v7 resolveConstraintConflicts:v6 error:&v19];
  id v9 = v19;
  v10 = (void *)MEMORY[0x230FBD990]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v21 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Refusing to merge constraint violations", buf, 0xCu);
  }
  v14 = (void *)MEMORY[0x230FBD990]();
  v15 = v11;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v21 = v17;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);
  }
  if (a4) {
    *a4 = v9;
  }

  return v8;
}

- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  char v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 count];
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Detected %tu merge conflict(s)", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v33 = 1;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __83__HMDResidentSyncClientMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke;
  v27[3] = &unk_264A24898;
  v27[4] = v8;
  v27[5] = buf;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);
  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    v14 = (void *)*MEMORY[0x263EFEFF8];
    id v26 = 0;
    char v13 = [v14 resolveOptimisticLockingVersionConflicts:v6 error:&v26];
    id v12 = v26;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v24.receiver = v8;
  v24.super_class = (Class)HMDResidentSyncClientMergePolicy;
  id v25 = 0;
  unsigned __int8 v11 = [(NSMergePolicy *)&v24 resolveOptimisticLockingVersionConflicts:v6 error:&v25];
  id v12 = v25;
  if (v11)
  {
    char v13 = 1;
    goto LABEL_14;
  }
  v15 = (void *)MEMORY[0x230FBD990]();
  v16 = v8;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)v28 = 138543362;
    v29 = v18;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@NSMergeByPropertyObjectTrumpMergePolicy failed to resolve merge conflicts", v28, 0xCu);
  }
  id v19 = (void *)MEMORY[0x230FBD990]();
  v20 = v16;
  HMFGetOSLogHandle();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    __int16 v22 = HMFGetLogIdentifier();
    *(_DWORD *)v28 = 138543618;
    v29 = v22;
    __int16 v30 = 2112;
    id v31 = v12;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEBUG, "%{public}@%@", v28, 0x16u);
  }
  char v13 = 0;
  if (a4)
  {
LABEL_13:
    id v12 = v12;
    *a4 = v12;
  }
LABEL_14:

  _Block_object_dispose(buf, 8);
  return v13;
}

void __83__HMDResidentSyncClientMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v46 = (void *)MEMORY[0x230FBD990]();
  uint64_t v47 = a1;
  id v6 = *(void **)(a1 + 32);
  id v7 = v5;
  id v49 = v7;
  if (v6)
  {
    v48 = [v7 sourceObject];
    if ([v49 newVersionNumber])
    {
      if (![v48 isDeleted])
      {
        uint64_t v15 = [v49 objectSnapshot];
        uint64_t v16 = [v49 cachedSnapshot];
        v17 = (void *)v16;
        if (v15)
        {
          v18 = (void *)v16;
          v17 = (void *)v15;
        }
        else
        {
          v18 = [v49 persistedSnapshot];
        }
        v45 = [v48 changedValues];
        id v19 = [MEMORY[0x263EFF9A0] dictionary];
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        v66[2] = __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke;
        v66[3] = &unk_264A248C0;
        id v44 = v18;
        id v67 = v44;
        id v20 = v19;
        id v68 = v20;
        [v17 enumerateKeysAndObjectsUsingBlock:v66];
        v21 = HMFGetOSLogHandle();
        LODWORD(v19) = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

        if (v19)
        {
          __int16 v22 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
          v63[0] = MEMORY[0x263EF8330];
          v63[1] = 3221225472;
          v63[2] = __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_2;
          v63[3] = &unk_264A248C0;
          id v64 = v17;
          id v23 = v22;
          id v65 = v23;
          objc_super v24 = (void *)MEMORY[0x230FBD990]([v45 enumerateKeysAndObjectsUsingBlock:v63]);
          id v25 = v6;
          id v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            v27 = HMFGetLogIdentifier();
            v28 = objc_msgSend(v48, "hmd_debugIdentifier");
            *(_DWORD *)buf = 138544386;
            *(void *)&uint8_t buf[4] = v27;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = a3;
            *(_WORD *)&buf[22] = 2112;
            v70 = v28;
            *(_WORD *)v71 = 2112;
            *(void *)&v71[2] = v23;
            *(_WORD *)&v71[10] = 2112;
            *(void *)&v71[12] = v20;
            _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Conflict %tu on %@:\nnew: %@\nconflict: %@", buf, 0x34u);
          }
        }
        v29 = [v48 entity];
        __int16 v30 = [v29 propertiesByName];
        uint64_t v59 = 0;
        v60 = &v59;
        uint64_t v61 = 0x2020000000;
        char v62 = 1;
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_28;
        v70 = &unk_264A248E8;
        id v31 = v20;
        *(void *)v71 = v31;
        *(void *)&v71[8] = v6;
        id v32 = v49;
        *(void *)&v71[16] = v32;
        uint64_t v77 = a3;
        id v33 = v29;
        id v72 = v33;
        id v34 = v30;
        id v73 = v34;
        id v35 = v17;
        id v74 = v35;
        id v36 = v44;
        id v75 = v36;
        v76 = &v59;
        [v45 enumerateKeysAndObjectsUsingBlock:buf];
        v50[0] = MEMORY[0x263EF8330];
        v50[1] = 3221225472;
        v50[2] = __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_2_29;
        v50[3] = &unk_264A24910;
        v50[4] = v6;
        id v51 = v32;
        uint64_t v58 = a3;
        id v37 = v33;
        id v52 = v37;
        id v38 = v34;
        id v53 = v38;
        id v39 = v45;
        id v54 = v39;
        id v40 = v35;
        id v55 = v40;
        id v41 = v36;
        id v56 = v41;
        v57 = &v59;
        [v31 enumerateKeysAndObjectsUsingBlock:v50];
        BOOL v14 = *((unsigned char *)v60 + 24) != 0;

        _Block_object_dispose(&v59, 8);
        goto LABEL_18;
      }
      char v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = v6;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a3;
        *(_WORD *)&buf[22] = 2112;
        v70 = v48;
        *(_WORD *)v71 = 2112;
        *(void *)&v71[2] = v49;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu is on %@ that is being deleted by resident sync, could have merged but refusing instead: %@", buf, 0x2Au);
      }
    }
    else
    {
      char v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = v6;
      v10 = HMFGetOSLogHandle();
      os_log_type_t v12 = v9[32];
      if (os_log_type_enabled(v10, v12))
      {
        char v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = a3;
        *(_WORD *)&buf[22] = 2112;
        v70 = v48;
        *(_WORD *)v71 = 2112;
        *(void *)&v71[2] = v49;
        _os_log_impl(&dword_22F52A000, v10, v12, "%{public}@Conflict %tu is on %@ that was deleted locally: %@", buf, 0x2Au);
      }
    }

    BOOL v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  BOOL v14 = 0;
LABEL_19:

  uint64_t v42 = *(void *)(*(void *)(v47 + 40) + 8);
  if (*(unsigned char *)(v42 + 24)) {
    BOOL v43 = v14;
  }
  else {
    BOOL v43 = 0;
  }
  *(unsigned char *)(v42 + 24) = v43;
}

void __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (([v5 isEqual:v6] & 1) == 0)
  {
    id v7 = [NSString stringWithFormat:@"%@ --> %@", v5, v6];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
  }
}

void __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  id v11 = (id)v8;
  if (v8) {
    [NSString stringWithFormat:@"%@ --> %@", v8, v6];
  }
  else {
  id v9 = [NSString stringWithFormat:@"%@", v6, v10];
  }

  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
}

void __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setObject:0 forKeyedSubscript:v4];
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 96);
  id v7 = *(void **)(a1 + 56);
  uint64_t v8 = *(void **)(a1 + 64);
  id v9 = *(void **)(a1 + 72);
  uint64_t v10 = *(void **)(a1 + 80);
  id v11 = *(id *)(a1 + 48);
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  id v15 = v10;
  id v97 = v4;
  if (!v5) {
    goto LABEL_62;
  }
  uint64_t v16 = +[MKFResidentSyncMetadata entity];
  int v17 = [v12 isEqual:v16];

  if (v17)
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = v5;
    id v20 = HMFGetOSLogHandle();
    os_log_type_t v21 = v19[32];
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      uint64_t v23 = v6;
      id v24 = v11;
      id v25 = v15;
      id v26 = (void *)v22;
      *(_DWORD *)buf = 138544130;
      uint64_t v99 = v22;
      __int16 v100 = 2048;
      uint64_t v101 = v23;
      __int16 v102 = 2114;
      id v103 = v97;
      __int16 v104 = 2112;
      id v105 = v24;
      _os_log_impl(&dword_22F52A000, v20, v21, "%{public}@Conflict %tu on %{public}@ that should only be modified by resident sync, overwriting: %@", buf, 0x2Au);

      id v15 = v25;
      id v11 = v24;
    }

    goto LABEL_6;
  }
  uint64_t v96 = v6;
  id v27 = [v13 objectForKeyedSubscript:v97];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v28 = v27;
  }
  else {
    v28 = 0;
  }
  id v29 = v28;

  if (v29)
  {
    if ([v97 isEqualToString:@"writerTimestamp"])
    {
      v91 = v11;
      __int16 v30 = v15;
      id v31 = (void *)MEMORY[0x230FBD990]();
      id v32 = v5;
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v99 = (uint64_t)v34;
        __int16 v100 = 2048;
        uint64_t v101 = v96;
        __int16 v102 = 2114;
        id v103 = v97;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu on attribute '%{public}@', overwriting", buf, 0x20u);
      }

      goto LABEL_15;
    }
    v95 = v15;
    if (!isAttributeIncludedInResidentSync(v29))
    {
      contexta = (void *)MEMORY[0x230FBD990]();
      uint64_t v61 = v5;
      char v62 = HMFGetOSLogHandle();
      os_log_type_t v63 = v61[32];
      if (os_log_type_enabled(v62, v63))
      {
        HMFGetLogIdentifier();
        id v64 = v94 = v14;
        *(_DWORD *)buf = 138544130;
        uint64_t v99 = (uint64_t)v64;
        __int16 v100 = 2048;
        uint64_t v101 = v96;
        __int16 v102 = 2114;
        id v103 = v97;
        __int16 v104 = 2112;
        id v105 = v11;
        _os_log_impl(&dword_22F52A000, v62, v63, "%{public}@Conflict %tu on attribute '%{public}@' that resident sync should not have modified: %@", buf, 0x2Au);

        id v14 = v94;
      }

      goto LABEL_61;
    }
    v46 = [v14 objectForKeyedSubscript:v97];
    context = [v15 objectForKeyedSubscript:v97];
    v93 = v46;
    LODWORD(v46) = objc_msgSend(v46, "isEqual:");
    v88 = (void *)MEMORY[0x230FBD990]();
    uint64_t v47 = v5;
    v48 = HMFGetOSLogHandle();
    id v49 = v48;
    if (v46)
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v50 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v99 = (uint64_t)v50;
        __int16 v100 = 2048;
        uint64_t v101 = v96;
        __int16 v102 = 2114;
        id v103 = v97;
        id v51 = "%{public}@Conflict %tu on attribute '%{public}@' that is only modified by resident sync, could have safely"
              " resolved but refusing instead";
        id v52 = v49;
        os_log_type_t v53 = OS_LOG_TYPE_INFO;
        uint32_t v54 = 32;
LABEL_47:
        _os_log_impl(&dword_22F52A000, v52, v53, v51, buf, v54);
      }
    }
    else
    {
      int v69 = *((unsigned __int8 *)v47 + 32);
      if (os_log_type_enabled(v48, v47[32]))
      {
        uint64_t v70 = HMFGetLogIdentifier();
        os_log_type_t v53 = v69;
        v50 = (void *)v70;
        *(_DWORD *)buf = 138544130;
        uint64_t v99 = v70;
        __int16 v100 = 2048;
        uint64_t v101 = v96;
        __int16 v102 = 2114;
        id v103 = v97;
        __int16 v104 = 2112;
        id v105 = v11;
        id v51 = "%{public}@Conflict %tu on attribute '%{public}@' that should only be modified by resident sync: %@";
        id v52 = v49;
        uint32_t v54 = 42;
        goto LABEL_47;
      }
    }

LABEL_61:

    id v15 = v95;
LABEL_62:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    return;
  }
  v92 = v14;
  v95 = v15;
  id v35 = v27;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v36 = v35;
  }
  else {
    id v36 = 0;
  }
  id v37 = v36;

  if (!v37)
  {
LABEL_60:

    id v29 = 0;
    id v14 = v92;
    goto LABEL_61;
  }
  v87 = v37;
  if (![v97 isEqualToString:@"residentSyncMetadata"]
    || (+[_MKFHome entity],
        id v38 = objc_claimAutoreleasedReturnValue(),
        int v39 = [v12 isEqual:v38],
        v38,
        !v39))
  {
    int v55 = isRelationshipIncludedInResidentSync(v87);
    int v56 = [v87 isToMany];
    int v57 = v56;
    if (!v55)
    {
      v85 = (void *)MEMORY[0x230FBD990]();
      id v65 = v5;
      v66 = HMFGetOSLogHandle();
      id v67 = v66;
      if (v57)
      {
        id v44 = v87;
        v45 = v66;
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          id v68 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          uint64_t v99 = (uint64_t)v68;
          __int16 v100 = 2048;
          uint64_t v101 = v96;
          __int16 v102 = 2114;
          id v103 = v97;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu is on to-many relationship '%{public}@' that is not included in resident sync, allowing", buf, 0x20u);
        }
        id v14 = v92;
        goto LABEL_43;
      }
      int v80 = *((unsigned __int8 *)v65 + 32);
      if (os_log_type_enabled(v66, v65[32]))
      {
        v81 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v99 = (uint64_t)v81;
        __int16 v100 = 2048;
        uint64_t v101 = v96;
        __int16 v102 = 2114;
        id v103 = v97;
        __int16 v104 = 2112;
        id v105 = v11;
        _os_log_impl(&dword_22F52A000, v67, (os_log_type_t)v80, "%{public}@Conflict %tu on to-one relationship '%{public}@' that is not included in resident sync: %@", buf, 0x2Au);
      }
      goto LABEL_59;
    }
    if (v56)
    {
      uint64_t v58 = (void *)MEMORY[0x230FBD990]();
      id v59 = v5;
      v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v60 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v99 = (uint64_t)v60;
        __int16 v100 = 2048;
        uint64_t v101 = v96;
        __int16 v102 = 2114;
        id v103 = v97;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu is on to-many relationship '%{public}@' that is included in resident sync, allowing", buf, 0x20u);
      }
      id v14 = v92;
      id v44 = v87;
      goto LABEL_44;
    }
    v71 = [v92 objectForKeyedSubscript:v97];
    v84 = [v15 objectForKeyedSubscript:v97];
    v86 = v71;
    LODWORD(v71) = objc_msgSend(v71, "isEqual:");
    v83 = (void *)MEMORY[0x230FBD990]();
    id v72 = v5;
    id v73 = HMFGetOSLogHandle();
    id v74 = v73;
    if (v71)
    {
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        id v75 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v99 = (uint64_t)v75;
        __int16 v100 = 2048;
        uint64_t v101 = v96;
        __int16 v102 = 2114;
        id v103 = v97;
        v76 = "%{public}@Conflict %tu on to-one relationship '%{public}@' that is only modified by resident sync, could h"
              "ave safely resolved but refusing instead";
        uint64_t v77 = v74;
        os_log_type_t v78 = OS_LOG_TYPE_INFO;
        uint32_t v79 = 32;
LABEL_57:
        _os_log_impl(&dword_22F52A000, v77, v78, v76, buf, v79);
      }
    }
    else
    {
      os_log_type_t v82 = v72[32];
      if (os_log_type_enabled(v73, v82))
      {
        id v75 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        uint64_t v99 = (uint64_t)v75;
        __int16 v100 = 2048;
        uint64_t v101 = v96;
        __int16 v102 = 2114;
        id v103 = v97;
        __int16 v104 = 2112;
        id v105 = v11;
        v76 = "%{public}@Conflict %tu on to-one relationship '%{public}@' that should only be modified by resident sync: %@";
        uint64_t v77 = v74;
        os_log_type_t v78 = v82;
        uint32_t v79 = 42;
        goto LABEL_57;
      }
    }

LABEL_59:
    id v37 = v87;
    goto LABEL_60;
  }
  v85 = (void *)MEMORY[0x230FBD990]();
  id v40 = v5;
  id v41 = HMFGetOSLogHandle();
  os_log_type_t v42 = *((unsigned char *)v40 + 32);
  if (os_log_type_enabled(v41, v42))
  {
    BOOL v43 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v99 = (uint64_t)v43;
    __int16 v100 = 2048;
    uint64_t v101 = v96;
    __int16 v102 = 2114;
    id v103 = v97;
    _os_log_impl(&dword_22F52A000, v41, v42, "%{public}@Conflict %tu is on '%{public}@' that should only be modified by resident sync, overwriting", buf, 0x20u);
  }
  id v14 = v92;
  id v44 = v87;
  v45 = v41;
LABEL_43:
  uint64_t v58 = v85;
LABEL_44:

LABEL_6:

LABEL_15:
}

void __72__HMDResidentSyncClientMergePolicy__shouldAllowMergeWithConflict_index___block_invoke_2_29(uint64_t a1, void *a2)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  uint64_t v90 = *(void *)(a1 + 96);
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  id v7 = *(void **)(a1 + 64);
  uint64_t v8 = *(void **)(a1 + 72);
  id v9 = *(void **)(a1 + 80);
  id v91 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  id v15 = a2;
  if (!v4) {
    goto LABEL_47;
  }
  uint64_t v16 = +[MKFResidentSyncMetadata entity];
  int v17 = [v10 isEqual:v16];

  if (v17)
  {
    id v18 = v10;
    id v19 = v15;
    context = v11;
    v87 = v18;
    id v20 = v12;
    os_log_type_t v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = v4;
    uint64_t v23 = HMFGetOSLogHandle();
    os_log_type_t v24 = v22[32];
    id v25 = v91;
    if (os_log_type_enabled(v23, v24))
    {
      id v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v93 = v26;
      __int16 v94 = 2048;
      uint64_t v95 = v90;
      __int16 v96 = 2114;
      id v97 = v19;
      __int16 v98 = 2112;
      id v99 = v91;
      _os_log_impl(&dword_22F52A000, v23, v24, "%{public}@Conflict %tu has local changes on %{public}@ that should only be modified by resident sync, overwriting: %@", buf, 0x2Au);
    }

    goto LABEL_15;
  }
  [v11 objectForKeyedSubscript:v15];
  id v27 = v15;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v29 = v28;
  }
  else {
    id v29 = 0;
  }
  id v30 = v29;

  v88 = v30;
  v89 = v27;
  if (v30)
  {
    if ([v27 isEqualToString:@"writerTimestamp"])
    {
      contexta = v12;
      id v31 = (void *)MEMORY[0x230FBD990]();
      id v32 = v4;
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v93 = v34;
        __int16 v94 = 2048;
        uint64_t v95 = v90;
        __int16 v96 = 2114;
        id v97 = v89;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu has local change on attribute '%{public}@', ignoring", buf, 0x20u);
      }
      id v25 = v91;
LABEL_14:

LABEL_15:
      return;
    }
    os_log_type_t v82 = v13;
    if (![v27 isEqualToString:@"location"]) {
      goto LABEL_35;
    }
    contexta = v12;
    v48 = [v12 objectForKeyedSubscript:v27];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v49 = v48;
    }
    else {
      id v49 = 0;
    }
    id v50 = v49;

    id v51 = [v82 objectForKeyedSubscript:v89];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v52 = v51;
    }
    else {
      id v52 = 0;
    }
    id v53 = v52;

    uint32_t v54 = [v14 objectForKeyedSubscript:v89];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v55 = v54;
    }
    else {
      int v55 = 0;
    }
    id v56 = v55;

    if (v50) {
      goto LABEL_34;
    }
    id v64 = v56;
    id v76 = v53;
    id v65 = v53;
    id v66 = v64;
    id v67 = v65;
    if (v66 == v65)
    {
      id v75 = v66;
    }
    else
    {
      if (!v65 || !v66)
      {

        id v50 = 0;
        id v53 = v76;
        goto LABEL_34;
      }
      id v68 = [v66 jsonObject];
      [v67 jsonObject];
      int v69 = v79 = v67;
      int v74 = [v68 isEqualToDictionary:v69];

      id v67 = v79;
      id v75 = v66;

      id v50 = 0;
      id v53 = v76;
      if (!v74)
      {
LABEL_34:

        id v12 = contexta;
        id v30 = v88;
LABEL_35:
        id v57 = v12;
        int v58 = isAttributeIncludedInResidentSync(v30);
        contextc = (void *)MEMORY[0x230FBD990]();
        id v59 = v4;
        v60 = HMFGetOSLogHandle();
        uint64_t v61 = v60;
        if (v58)
        {
          os_log_type_t v62 = v59[32];
          if (os_log_type_enabled(v60, v62))
          {
            os_log_type_t v78 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138544130;
            v93 = v78;
            __int16 v94 = 2048;
            uint64_t v95 = v90;
            __int16 v96 = 2114;
            id v97 = v89;
            __int16 v98 = 2112;
            id v99 = v91;
            _os_log_impl(&dword_22F52A000, v61, v62, "%{public}@Conflict %tu has local change on attribute '%{public}@' that should only be modified by resident sync: %@", buf, 0x2Au);
          }
        }
        else if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          os_log_type_t v63 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v93 = v63;
          __int16 v94 = 2048;
          uint64_t v95 = v90;
          __int16 v96 = 2114;
          id v97 = v89;
          _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu has local change on attribute '%{public}@' that is not included in resident sync, could have safely resolved but refusing instead", buf, 0x20u);
        }
        id v12 = v57;
        id v13 = v82;
        goto LABEL_46;
      }
    }
    int v80 = v67;
    uint64_t v70 = (void *)MEMORY[0x230FBD990]();
    id v71 = v4;
    id v72 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      id v73 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v93 = v73;
      __int16 v94 = 2048;
      uint64_t v95 = v90;
      __int16 v96 = 2114;
      id v97 = v89;
      _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_INFO, "%{public}@Conflict %tu on attribute '%{public}@', allowing since was not modified by current context and conflicting value is equal to base value", buf, 0x20u);
    }

    id v25 = v91;
    id v13 = v82;
    goto LABEL_14;
  }
  id v35 = v28;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v36 = v35;
  }
  else {
    id v36 = 0;
  }
  id v37 = v36;

  if (v37)
  {
    id v81 = v13;
    contextb = v12;
    int v38 = isRelationshipIncludedInResidentSync(v37);
    uint64_t v77 = (void *)MEMORY[0x230FBD990]();
    int v39 = v4;
    id v40 = HMFGetOSLogHandle();
    id v41 = v40;
    if (v38)
    {
      os_log_type_t v42 = v39[32];
      if (os_log_type_enabled(v40, v42))
      {
        BOOL v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v93 = v43;
        __int16 v94 = 2048;
        uint64_t v95 = v90;
        __int16 v96 = 2114;
        id v97 = v89;
        __int16 v98 = 2112;
        id v99 = v91;
        id v44 = "%{public}@Conflict %tu has local change on to-one relationship '%{public}@' that should only be modified b"
              "y resident sync: %@";
        v45 = v41;
        os_log_type_t v46 = v42;
        uint32_t v47 = 42;
LABEL_43:
        _os_log_impl(&dword_22F52A000, v45, v46, v44, buf, v47);
      }
    }
    else if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      BOOL v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v93 = v43;
      __int16 v94 = 2048;
      uint64_t v95 = v90;
      __int16 v96 = 2114;
      id v97 = v89;
      id v44 = "%{public}@Conflict %tu has local change on to-one relationship '%{public}@' that is not included in resident"
            " sync, could have safely resolved but refusing instead";
      v45 = v41;
      os_log_type_t v46 = OS_LOG_TYPE_INFO;
      uint32_t v47 = 32;
      goto LABEL_43;
    }

    id v13 = v81;
    id v12 = contextb;
  }

LABEL_46:
  id v15 = v89;
LABEL_47:

  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
}

- (HMDResidentSyncClientMergePolicy)initWithFaultLogging:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HMDResidentSyncClientMergePolicy;
  result = [(NSMergePolicy *)&v6 initWithMergeType:2];
  if (result)
  {
    if (v3) {
      unsigned __int8 v5 = 17;
    }
    else {
      unsigned __int8 v5 = 16;
    }
    result->_faultLogType = v5;
  }
  return result;
}

- (HMDResidentSyncClientMergePolicy)init
{
  return [(HMDResidentSyncClientMergePolicy *)self initWithFaultLogging:1];
}

+ (id)logCategory
{
  return +[HMDResidentSyncManager logCategory];
}

@end
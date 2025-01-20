@interface HMDCoreDataCloudTransformableLocalGuestObject
+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5;
+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6;
+ (void)_addGuestForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:;
@end

@implementation HMDCoreDataCloudTransformableLocalGuestObject

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

+ (void)_addGuestForObjectWithID:(void *)a3 additionalUpdates:(void *)a4 context:
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v108 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  v9 = +[_MKFGuest entity];
  v10 = [v9 propertiesByName];
  v11 = [v10 objectForKeyedSubscript:@"accessCode"];
  v113 = v11;
  uint64_t v107 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v113 count:1];

  id v12 = v6;
  id v13 = v7;
  v106 = (void *)v8;
  v14 = self;
  v15 = (__CFString *)v12;
  v16 = [(__CFString *)v15 entity];
  v17 = +[_MKFGuest entity];
  LOBYTE(v8) = [v16 isKindOfEntity:v17];

  v109 = v15;
  if (v8) {
    goto LABEL_2;
  }
  *(void *)&long long v18 = 138543618;
  long long v105 = v18;
  p_cache = (void **)(MKFCKOutgoingInvitation + 16);
  while (1)
  {
    v19 = v15;
    id v24 = v13;
    id v25 = v13;
    v26 = self;
    id v112 = 0;
    objc_msgSend(v25, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v19, MEMORY[0x263EFFA68], &v112);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    id v28 = v112;
    if (v28)
    {
      id v29 = v28;
      v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = v26;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v116 = v33;
        __int16 v117 = 2114;
        v118 = v19;
        __int16 v119 = 2114;
        id v120 = v29;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);
      }
      v34 = 0;
      goto LABEL_8;
    }
    if (v27)
    {
      id v29 = 0;
    }
    else
    {
      v51 = (void *)MEMORY[0x230FBD990]();
      id v52 = v26;
      v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = HMFGetLogIdentifier();
        *(_DWORD *)buf = v105;
        v116 = v54;
        __int16 v117 = 2114;
        v118 = v19;
        _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find object with objectID %{public}@ while searching for its parent", buf, 0x16u);
      }
      id v111 = 0;
      id v27 = [v25 existingObjectWithID:v19 error:&v111];
      id v29 = v111;
      if (!v27)
      {
        v74 = (void *)MEMORY[0x230FBD990]();
        id v75 = v52;
        v76 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          v77 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v105;
          v116 = v77;
          __int16 v117 = 2114;
          v118 = v19;
          _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find object with objectID %{public}@ using existingObjectWithID API", buf, 0x16u);
        }
        id v27 = 0;
        goto LABEL_51;
      }
    }
    v55 = objc_msgSend(v27, "entity", v105);
    v56 = +[_MKFWeekDayScheduleRule entity];
    int v57 = [v55 isKindOfEntity:v56];

    if (v57)
    {
      id v58 = v27;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v59 = v58;
      }
      else {
        v59 = 0;
      }
      id v60 = v59;

      if (v60)
      {
        v61 = [v60 invitation];

        v34 = @"invitation";
        if (v61
          || ([v60 guest],
              v62 = objc_claimAutoreleasedReturnValue(),
              v62,
              v34 = @"guest",
              v62))
        {
LABEL_40:

          id v27 = v58;
LABEL_8:
          p_cache = MKFCKOutgoingInvitation.cache;
          goto LABEL_9;
        }
      }

      p_cache = (void **)(MKFCKOutgoingInvitation + 16);
    }
    v63 = [v27 entity];
    v64 = +[_MKFYearDayScheduleRule entity];
    int v65 = [v63 isKindOfEntity:v64];

    if (v65)
    {
      id v58 = v27;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v66 = v58;
      }
      else {
        v66 = 0;
      }
      id v60 = v66;

      if (v60)
      {
        v67 = [v60 invitation];

        v34 = @"invitation";
        if (v67) {
          goto LABEL_40;
        }
        v68 = [v60 guest];

        v34 = @"guest";
        if (v68) {
          goto LABEL_40;
        }
      }

      p_cache = MKFCKOutgoingInvitation.cache;
    }
    v69 = [v27 entity];
    v70 = [p_cache + 388 entity];
    int v71 = [v69 isKindOfEntity:v70];

    if (v71)
    {
      id v27 = v27;
      objc_opt_class();
      id v72 = (objc_opt_isKindOfClass() & 1) != 0 ? v27 : 0;
      id v73 = v72;

      if (v73)
      {

        v34 = @"home";
        goto LABEL_9;
      }
    }
LABEL_51:
    v34 = 0;
LABEL_9:

    v35 = v34;
    if (!v35)
    {
      v78 = (void *)MEMORY[0x230FBD990]();
      id v79 = v14;
      v80 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v81 = HMFGetLogIdentifier();
        *(_DWORD *)buf = v105;
        v116 = v81;
        __int16 v117 = 2114;
        v118 = v19;
        _os_log_impl(&dword_22F52A000, v80, OS_LOG_TYPE_ERROR, "%{public}@No parent pointer found for the objectID: %{public}@", buf, 0x16u);
      }
      goto LABEL_70;
    }
    v36 = v35;
    v114 = v35;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v114 count:1];
    id v110 = 0;
    v38 = objc_msgSend(v25, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v19, v37, &v110);
    id v39 = v110;

    if (v39)
    {
      v82 = (void *)MEMORY[0x230FBD990]();
      id v83 = v14;
      v84 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v85 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v116 = v85;
        __int16 v117 = 2114;
        v118 = v19;
        __int16 v119 = 2114;
        id v120 = v39;
        _os_log_impl(&dword_22F52A000, v84, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object with objectID %{public}@: %{public}@", buf, 0x20u);
      }

LABEL_61:
LABEL_69:

LABEL_70:
      v20 = 0;
      v22 = (void *)v107;
      v21 = v108;
      id v13 = v24;
      goto LABEL_71;
    }
    if (!v38)
    {
      v86 = (void *)MEMORY[0x230FBD990]();
      id v87 = v14;
      v88 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        v89 = HMFGetLogIdentifier();
        *(_DWORD *)buf = v105;
        v116 = v89;
        __int16 v117 = 2114;
        v118 = v19;
        _os_log_impl(&dword_22F52A000, v88, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find object with objectID %{public}@", buf, 0x16u);
      }
      id v39 = 0;
      goto LABEL_61;
    }
    v40 = [v38 valueForKey:v36];
    if (!v40)
    {
      v90 = (void *)MEMORY[0x230FBD990]();
      id v91 = v14;
      v92 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        v93 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v116 = v93;
        __int16 v117 = 2114;
        v118 = v36;
        __int16 v119 = 2112;
        id v120 = v38;
        _os_log_impl(&dword_22F52A000, v92, OS_LOG_TYPE_ERROR, "%{public}@Object has no value for '%{public}@': %@", buf, 0x20u);
      }
LABEL_68:

      goto LABEL_69;
    }
    id v41 = v40;
    objc_opt_class();
    int v42 = objc_opt_isKindOfClass() & 1;
    if (v42) {
      v43 = v41;
    }
    else {
      v43 = 0;
    }
    id v44 = v43;

    if (!v42)
    {
      v94 = (void *)MEMORY[0x230FBD990]();
      id v95 = v14;
      v96 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v97 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v116 = v97;
        __int16 v117 = 2114;
        v118 = v36;
        __int16 v119 = 2112;
        id v120 = v38;
        _os_log_impl(&dword_22F52A000, v96, OS_LOG_TYPE_ERROR, "%{public}@Object value for '%{public}@' is not an object: %@", buf, 0x20u);
      }

      goto LABEL_68;
    }
    v15 = [v41 objectID];

    v45 = [(__CFString *)v15 entity];
    v46 = [p_cache + 388 entity];
    char v47 = [v45 isKindOfEntity:v46];

    if (v47) {
      break;
    }
    v48 = [(__CFString *)v15 entity];
    v49 = +[_MKFGuest entity];
    int v50 = [v48 isKindOfEntity:v49];

    id v13 = v24;
    if (v50) {
      goto LABEL_2;
    }
  }
  id v13 = v24;
LABEL_2:
  v19 = v15;
  v20 = v19;
  v22 = (void *)v107;
  v21 = v108;
LABEL_71:

  if (v20)
  {
    v98 = [v21 objectForKeyedSubscript:v20];
    v99 = v98;
    if (v98)
    {
      if ([v98 count]) {
        [v99 addObjectsFromArray:v22];
      }
    }
    else
    {
      v104 = [MEMORY[0x263EFF9C0] setWithArray:v22];
      [v21 setObject:v104 forKeyedSubscript:v20];
    }
  }
  else
  {
    v100 = (void *)MEMORY[0x230FBD990]();
    id v101 = v106;
    v102 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      v103 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v116 = v103;
      __int16 v117 = 2114;
      v118 = v109;
      _os_log_impl(&dword_22F52A000, v102, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find guest for model with objectID %{public}@", buf, 0x16u);
    }
  }
}

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  return 1;
}

@end
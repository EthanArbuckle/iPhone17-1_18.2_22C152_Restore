@interface HMDAccessorySettingTransform
+ (id)mergeWithGroupMetadata:(id)a3 group:(id)a4;
+ (id)modelForGroup:(id)a3;
+ (id)modelForSetting:(id)a3;
+ (id)modelForSetting:(id)a3 identifier:(id)a4 parentIdentifier:(id)a5;
+ (id)modelsForChangedConstraints:(id)a3 fromSetting:(id)a4;
+ (id)modelsForGroup:(id)a3;
+ (id)modelsForGroupDiff:(id)a3 fromGroup:(id)a4;
+ (id)modelsForSetting:(id)a3;
+ (id)modelsForSettingDiff:(id)a3 fromSetting:(id)a4;
+ (void)changeAccessorySettingType:(id)a3 home:(id)a4;
@end

@implementation HMDAccessorySettingTransform

+ (id)mergeWithGroupMetadata:(id)a3 group:(id)a4
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  id v95 = a4;
  v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = a1;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v127 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Merging with metadata", buf, 0xCu);
  }
  v97 = [MEMORY[0x1E4F1CA48] array];
  v10 = (void *)MEMORY[0x1E4F1CA60];
  v11 = [v93 settings];
  v12 = objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  v13 = [v93 settings];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v118 objects:v131 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v119;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v119 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v118 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "name", v93);
        [v12 setObject:v18 forKey:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v118 objects:v131 count:16];
    }
    while (v15);
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v20 = [v95 settings];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v114 objects:v130 count:16];
  v96 = v7;
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v115;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v115 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v114 + 1) + 8 * j);
        v26 = objc_msgSend(v12, "allKeys", v93);
        v27 = [v25 name];
        char v28 = [v26 containsObject:v27];

        if (v28)
        {
          v29 = [v25 name];
          [v12 removeObjectForKey:v29];
        }
        else
        {
          v30 = (void *)MEMORY[0x1D9452090]();
          id v31 = v96;
          v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v127 = v33;
            __int16 v128 = 2112;
            v129 = v25;
            _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Removing setting: %@", buf, 0x16u);
          }
          v34 = [HMDAccessorySettingModel alloc];
          v29 = [v25 identifier];
          v35 = [v25 parentIdentifier];
          v36 = [(HMDBackingStoreModelObject *)v34 initWithObjectChangeType:3 uuid:v29 parentUUID:v35];
          [v97 addObject:v36];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v114 objects:v130 count:16];
      id v7 = v96;
    }
    while (v22);
  }

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v37 = [v12 allValues];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v110 objects:v125 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v111;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v111 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v110 + 1) + 8 * k);
        v43 = (void *)MEMORY[0x1D9452090]();
        id v44 = v7;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v127 = v46;
          __int16 v128 = 2112;
          v129 = v42;
          _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Adding setting: %@", buf, 0x16u);
        }
        v47 = [v95 identifier];
        v48 = [v42 modelsWithParentIdentifier:v47];
        [v97 addObjectsFromArray:v48];

        id v7 = v96;
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v110 objects:v125 count:16];
    }
    while (v39);
  }

  v49 = (void *)MEMORY[0x1E4F1CA60];
  v50 = [v93 groups];
  v51 = objc_msgSend(v49, "dictionaryWithCapacity:", objc_msgSend(v50, "count"));

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v52 = [v93 groups];
  uint64_t v53 = [v52 countByEnumeratingWithState:&v106 objects:v124 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v107;
    do
    {
      for (uint64_t m = 0; m != v54; ++m)
      {
        if (*(void *)v107 != v55) {
          objc_enumerationMutation(v52);
        }
        v57 = *(void **)(*((void *)&v106 + 1) + 8 * m);
        v58 = objc_msgSend(v57, "name", v93);
        [v51 setObject:v57 forKey:v58];
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v106 objects:v124 count:16];
    }
    while (v54);
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v59 = [v95 groups];
  uint64_t v60 = [v59 countByEnumeratingWithState:&v102 objects:v123 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v103;
    v94 = v51;
    do
    {
      for (uint64_t n = 0; n != v61; ++n)
      {
        if (*(void *)v103 != v62) {
          objc_enumerationMutation(v59);
        }
        v64 = *(void **)(*((void *)&v102 + 1) + 8 * n);
        v65 = objc_msgSend(v64, "name", v93);
        v66 = [v51 objectForKey:v65];

        if (v66)
        {
          v67 = [v64 name];
          [v51 removeObjectForKey:v67];

          v68 = [v7 mergeWithGroupMetadata:v66 group:v64];
          [v97 addObjectsFromArray:v68];
        }
        else
        {
          v69 = (void *)MEMORY[0x1D9452090]();
          id v70 = v7;
          v71 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            uint64_t v72 = v61;
            uint64_t v73 = v62;
            v75 = v74 = v59;
            *(_DWORD *)buf = 138543618;
            v127 = v75;
            __int16 v128 = 2112;
            v129 = v64;
            _os_log_impl(&dword_1D49D5000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@Removing group: %@", buf, 0x16u);

            v59 = v74;
            uint64_t v62 = v73;
            uint64_t v61 = v72;
            v51 = v94;
          }

          v76 = [HMDAccessorySettingGroupModel alloc];
          v68 = [v64 identifier];
          v77 = [v64 parentIdentifier];
          v78 = [(HMDBackingStoreModelObject *)v76 initWithObjectChangeType:3 uuid:v68 parentUUID:v77];
          [v97 addObject:v78];

          id v7 = v96;
        }
      }
      uint64_t v61 = [v59 countByEnumeratingWithState:&v102 objects:v123 count:16];
    }
    while (v61);
  }

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v79 = [v51 allValues];
  uint64_t v80 = [v79 countByEnumeratingWithState:&v98 objects:v122 count:16];
  if (v80)
  {
    uint64_t v81 = v80;
    uint64_t v82 = *(void *)v99;
    do
    {
      for (iuint64_t i = 0; ii != v81; ++ii)
      {
        if (*(void *)v99 != v82) {
          objc_enumerationMutation(v79);
        }
        v84 = *(void **)(*((void *)&v98 + 1) + 8 * ii);
        v85 = (void *)MEMORY[0x1D9452090]();
        id v86 = v7;
        v87 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          v88 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v127 = v88;
          __int16 v128 = 2112;
          v129 = v84;
          _os_log_impl(&dword_1D49D5000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@Adding group: %@", buf, 0x16u);

          id v7 = v96;
        }

        v89 = [v95 identifier];
        v90 = [v84 modelsWithParentIdentifier:v89];
        [v97 addObjectsFromArray:v90];
      }
      uint64_t v81 = [v79 countByEnumeratingWithState:&v98 objects:v122 count:16];
    }
    while (v81);
  }

  v91 = (void *)[v97 copy];
  return v91;
}

+ (void)changeAccessorySettingType:(id)a3 home:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 type])
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = v5;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v25 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown type, attempting to resolve", buf, 0xCu);
    }
    v11 = [v6 homeManager];
    v12 = [v11 cloudDataSyncManager];
    v13 = [v12 cloudCache];

    if (!v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = v8;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v25 = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot resolve, no cloud cache", buf, 0xCu);
      }
    }
    objc_initWeak((id *)buf, v6);
    v18 = [v6 zoneID];
    v19 = [v18 UUIDString];

    v20 = [v6 ownerName];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__HMDAccessorySettingTransform_changeAccessorySettingType_home___block_invoke;
    v21[3] = &unk_1E6A0A8F0;
    id v22 = v8;
    objc_copyWeak(&v23, (id *)buf);
    [v13 homeZoneWithName:v19 owner:v20 completion:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

void __64__HMDAccessorySettingTransform_changeAccessorySettingType_home___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) identifier];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__HMDAccessorySettingTransform_changeAccessorySettingType_home___block_invoke_9;
    v12[3] = &unk_1E6A0A8C8;
    id v13 = *(id *)(a1 + 32);
    objc_copyWeak(&v14, (id *)(a1 + 40));
    [v5 cloudRecordWithObjectID:v7 completionHandler:v12];

    objc_destroyWeak(&v14);
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot get home zone with error: %@", buf, 0x16u);
    }
  }
}

void __64__HMDAccessorySettingTransform_changeAccessorySettingType_home___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 extractObjectChange];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      v10 = [v9 type];

      if (v10)
      {
        v11 = [v9 type];
        uint64_t v12 = [v11 integerValue];

        id v13 = (void *)MEMORY[0x1D9452090]();
        id v14 = *(id *)(a1 + 32);
        id v15 = HMFGetOSLogHandle();
        uint64_t v16 = v15;
        if (v12)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            __int16 v17 = HMFGetLogIdentifier();
            id v18 = HMAccessorySettingTypeToString();
            int v31 = 138543618;
            v32 = v17;
            __int16 v33 = 2112;
            id v34 = v18;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating type to '%@'", (uint8_t *)&v31, 0x16u);
          }
          [*(id *)(a1 + 32) _setType:v12];
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
          v20 = [[HMDHomeSaveRequest alloc] initWithReason:@"Updating setting type" information:0 saveOptions:0];
          uint64_t v21 = [WeakRetained homeManager];
          [v21 saveWithRequest:v20];

          goto LABEL_21;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v30 = HMFGetLogIdentifier();
          int v31 = 138543362;
          v32 = v30;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cached type is invalid", (uint8_t *)&v31, 0xCu);
        }
LABEL_20:
LABEL_21:

        goto LABEL_22;
      }
      id v13 = (void *)MEMORY[0x1D9452090]();
      id v26 = *(id *)(a1 + 32);
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        char v28 = HMFGetLogIdentifier();
        int v31 = 138543618;
        v32 = v28;
        __int16 v33 = 2112;
        id v34 = v9;
        v29 = "%{public}@Cached model missing type: %@";
        goto LABEL_18;
      }
    }
    else
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      id v26 = *(id *)(a1 + 32);
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        char v28 = HMFGetLogIdentifier();
        int v31 = 138543618;
        v32 = v28;
        __int16 v33 = 2112;
        id v34 = v5;
        v29 = "%{public}@Failed to get backing model for record: %@";
LABEL_18:
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v31, 0x16u);
      }
    }

    goto LABEL_20;
  }
  id v22 = (void *)MEMORY[0x1D9452090]();
  id v23 = *(id *)(a1 + 32);
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = HMFGetLogIdentifier();
    int v31 = 138543618;
    v32 = v25;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@No cached record found with error: %@", (uint8_t *)&v31, 0x16u);
  }
LABEL_22:
}

+ (id)modelsForChangedConstraints:(id)a3 fromSetting:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = [v7 constraints];
  v10 = [v8 setWithArray:v9];
  v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  if ([v10 isEqualToSet:v11])
  {
    char v12 = [v7 isConstraintMergeStrategyReflection];

    if ((v12 & 1) == 0)
    {
      id v13 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = a1;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = HMFGetLogIdentifier();
    int v19 = 138543362;
    v20 = v17;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Constraints are not matching with media system", (uint8_t *)&v19, 0xCu);
  }
  id v13 = [v7 modelsForConstraintsUpdate:v6];
LABEL_8:

  return v13;
}

+ (id)modelForSetting:(id)a3 identifier:(id)a4 parentIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(HMDBackingStoreModelObject *)[HMDAccessorySettingModel alloc] initWithObjectChangeType:0 uuid:v8 parentUUID:v7];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "properties"));
  [(HMDAccessorySettingModel *)v10 setProperties:v11];

  char v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "type"));
  [(HMDAccessorySettingModel *)v10 setType:v12];

  id v13 = [v9 name];
  [(HMDAccessorySettingModel *)v10 setName:v13];

  id v14 = [v9 value];
  id v15 = encodeRootObject();
  [(HMDAccessorySettingModel *)v10 setValue:v15];

  uint64_t v16 = NSNumber;
  uint64_t v17 = [v9 configurationVersion];

  id v18 = [v16 numberWithUnsignedInteger:v17];
  [(HMDAccessorySettingModel *)v10 setConfigurationVersion:v18];

  return v10;
}

+ (id)modelForSetting:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v4 parentIdentifier];
  id v7 = [a1 modelForSetting:v4 identifier:v5 parentIdentifier:v6];

  return v7;
}

+ (id)modelsForSetting:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 constraints];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
  id v7 = [a1 modelForSetting:v4];
  [v7 setObjectChangeType:1];
  [v6 addObject:v7];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = objc_msgSend(v4, "identifier", (void)v18);
        id v15 = [v13 modelWithParentIdentifier:v14];

        [v15 setObjectChangeType:1];
        [v6 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  uint64_t v16 = (void *)[v6 copy];
  return v16;
}

+ (id)modelForGroup:(id)a3
{
  id v3 = a3;
  id v4 = [HMDAccessorySettingGroupModel alloc];
  id v5 = [v3 identifier];
  id v6 = [v3 parentIdentifier];
  id v7 = [(HMDBackingStoreModelObject *)v4 initWithObjectChangeType:1 uuid:v5 parentUUID:v6];

  id v8 = [v3 name];

  [(HMDAccessorySettingGroupModel *)v7 setName:v8];
  return v7;
}

+ (id)modelsForSettingDiff:(id)a3 fromSetting:(id)a4
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [v6 type];
  if (v9 != [v7 type])
  {
    id v86 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_37;
  }
  uint64_t v10 = [v6 type];
  if (v10 == 4)
  {
    v87 = (void *)MEMORY[0x1E4F1CAD0];
    v88 = [v7 constraints];
    v89 = [v87 setWithArray:v88];
    v90 = (void *)MEMORY[0x1E4F1CAD0];
    v91 = [v6 constraints];
    v92 = [v90 setWithArray:v91];
    id v93 = objc_msgSend(v89, "na_setByRemovingObjectsFromSet:", v92);

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v85 = v93;
    uint64_t v94 = [v85 countByEnumeratingWithState:&v106 objects:v110 count:16];
    if (v94)
    {
      uint64_t v95 = v94;
      uint64_t v96 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v95; ++i)
        {
          if (*(void *)v107 != v96) {
            objc_enumerationMutation(v85);
          }
          long long v98 = *(void **)(*((void *)&v106 + 1) + 8 * i);
          long long v99 = objc_msgSend(v6, "identifier", (void)v106);
          long long v100 = [v98 modelWithParentIdentifier:v99];

          [v100 setObjectChangeType:1];
          [v8 addObject:v100];
        }
        uint64_t v95 = [v85 countByEnumeratingWithState:&v106 objects:v110 count:16];
      }
      while (v95);
    }

    long long v101 = (void *)MEMORY[0x1D9452090]();
    id v102 = a1;
    long long v103 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
    {
      long long v104 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v112 = v104;
      __int16 v113 = 2112;
      id v114 = v85;
      __int16 v115 = 2112;
      id v116 = v6;
      _os_log_impl(&dword_1D49D5000, v103, OS_LOG_TYPE_INFO, "%{public}@Adding missing selection constraints %@ to setting %@", buf, 0x20u);
    }
  }
  else
  {
    if (v10 != 2) {
      goto LABEL_36;
    }
    uint64_t v11 = [v6 constraints];
    char v12 = _findConstraintForType(v11, 1);

    id v13 = [v7 constraints];
    id v14 = _findConstraintForType(v13, 1);

    id v15 = [v12 value];
    uint64_t v16 = [v14 value];
    char v17 = [v15 isEqual:v16];

    if ((v17 & 1) == 0)
    {
      long long v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = a1;
      long long v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        long long v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        long long v112 = v21;
        __int16 v113 = 2112;
        id v114 = v14;
        __int16 v115 = 2112;
        id v116 = v12;
        __int16 v117 = 2112;
        id v118 = v6;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Min constraint %@ does not match %@ for %@ changing", buf, 0x2Au);
      }
      id v22 = [HMDAccessorySettingConstraintModel alloc];
      uint64_t v23 = [MEMORY[0x1E4F29128] UUID];
      v24 = [v6 identifier];
      v25 = [(HMDBackingStoreModelObject *)v22 initWithObjectChangeType:1 uuid:v23 parentUUID:v24];

      id v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "type"));
      [(HMDAccessorySettingConstraintModel *)v25 setType:v26];

      v27 = [v14 value];
      char v28 = encodeRootObject();
      [(HMDAccessorySettingConstraintModel *)v25 setValue:v28];

      [v8 addObject:v25];
      v29 = [v12 identifier];

      if (v29)
      {
        v30 = [HMDAccessorySettingConstraintModel alloc];
        int v31 = [v12 identifier];
        v32 = [v6 identifier];
        __int16 v33 = [(HMDBackingStoreModelObject *)v30 initWithObjectChangeType:3 uuid:v31 parentUUID:v32];

        [v8 addObject:v33];
      }
    }
    id v34 = [v6 constraints];
    uint64_t v35 = _findConstraintForType(v34, 2);

    v36 = [v7 constraints];
    v37 = _findConstraintForType(v36, 2);

    uint64_t v38 = [v35 value];
    uint64_t v39 = [v37 value];
    char v40 = [v38 isEqual:v39];

    if ((v40 & 1) == 0)
    {
      v41 = (void *)MEMORY[0x1D9452090]();
      id v42 = a1;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        id v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        long long v112 = v44;
        __int16 v113 = 2112;
        id v114 = v37;
        __int16 v115 = 2112;
        id v116 = v35;
        __int16 v117 = 2112;
        id v118 = v6;
        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Max constraint %@ does not match %@ for %@ changing", buf, 0x2Au);
      }
      v45 = [HMDAccessorySettingConstraintModel alloc];
      v46 = [MEMORY[0x1E4F29128] UUID];
      v47 = [v6 identifier];
      v48 = [(HMDBackingStoreModelObject *)v45 initWithObjectChangeType:1 uuid:v46 parentUUID:v47];

      v49 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v37, "type"));
      [(HMDAccessorySettingConstraintModel *)v48 setType:v49];

      v50 = [v37 value];
      v51 = encodeRootObject();
      [(HMDAccessorySettingConstraintModel *)v48 setValue:v51];

      [v8 addObject:v48];
      v52 = [v35 identifier];

      if (v52)
      {
        uint64_t v53 = [HMDAccessorySettingConstraintModel alloc];
        uint64_t v54 = [v35 identifier];
        uint64_t v55 = [v6 identifier];
        v56 = [(HMDBackingStoreModelObject *)v53 initWithObjectChangeType:3 uuid:v54 parentUUID:v55];

        [v8 addObject:v56];
      }
    }
    v57 = [v6 constraints];
    v58 = _findConstraintForType(v57, 3);

    v59 = [v7 constraints];
    uint64_t v60 = _findConstraintForType(v59, 3);

    uint64_t v61 = [v58 value];
    uint64_t v62 = [v60 value];
    char v63 = [v61 isEqual:v62];

    if ((v63 & 1) == 0)
    {
      v64 = (void *)MEMORY[0x1D9452090]();
      id v65 = a1;
      v66 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        v67 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        long long v112 = v67;
        __int16 v113 = 2112;
        id v114 = v60;
        __int16 v115 = 2112;
        id v116 = v58;
        __int16 v117 = 2112;
        id v118 = v6;
        _os_log_impl(&dword_1D49D5000, v66, OS_LOG_TYPE_INFO, "%{public}@Step constraint %@ does not match %@ for %@ changing", buf, 0x2Au);
      }
      v68 = [HMDAccessorySettingConstraintModel alloc];
      v69 = [MEMORY[0x1E4F29128] UUID];
      id v70 = [v6 identifier];
      v71 = [(HMDBackingStoreModelObject *)v68 initWithObjectChangeType:1 uuid:v69 parentUUID:v70];

      uint64_t v72 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v60, "type"));
      [(HMDAccessorySettingConstraintModel *)v71 setType:v72];

      uint64_t v73 = [v60 value];
      v74 = encodeRootObject();
      [(HMDAccessorySettingConstraintModel *)v71 setValue:v74];

      [v8 addObject:v71];
      v75 = [v58 identifier];

      if (v75)
      {
        v76 = [HMDAccessorySettingConstraintModel alloc];
        v77 = [v58 identifier];
        v78 = [v6 identifier];
        v79 = [(HMDBackingStoreModelObject *)v76 initWithObjectChangeType:3 uuid:v77 parentUUID:v78];

        [v8 addObject:v79];
      }
    }
    uint64_t v80 = [v6 value];
    uint64_t v81 = [v7 value];
    char v82 = HMFEqualObjects();

    if (v82) {
      goto LABEL_36;
    }
    v83 = [v6 identifier];
    v84 = [v6 parentIdentifier];
    id v85 = [a1 modelForSetting:v7 identifier:v83 parentIdentifier:v84];

    [v85 setObjectChangeType:2];
    [v8 addObject:v85];
  }

LABEL_36:
  id v86 = v8;
LABEL_37:

  return v86;
}

+ (id)modelsForGroupDiff:(id)a3 fromGroup:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v26 = [a1 modelsForGroup:v7];
    goto LABEL_26;
  }
  id v30 = a1;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [v7 groups];
  uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v38 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * i);
      id v14 = [v6 groups];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __61__HMDAccessorySettingTransform_modelsForGroupDiff_fromGroup___block_invoke;
      v36[3] = &unk_1E6A14D28;
      v36[4] = v13;
      id v15 = objc_msgSend(v14, "na_firstObjectPassingTest:", v36);

      if (v15)
      {
        if ([v15 compareSettingsTree:v13]) {
          goto LABEL_12;
        }
        uint64_t v16 = +[HMDAccessorySettingTransform modelsForGroupDiff:v15 fromGroup:v13];
      }
      else
      {
        uint64_t v16 = [a1 modelsForGroup:v13];
      }
      char v17 = (void *)v16;
      [v8 addObjectsFromArray:v16];

LABEL_12:
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  }
  while (v10);
LABEL_14:

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obja = [v7 settings];
  uint64_t v18 = [obja countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(obja);
        }
        uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v23 = [v6 settings];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __61__HMDAccessorySettingTransform_modelsForGroupDiff_fromGroup___block_invoke_2;
        v31[3] = &unk_1E6A14D00;
        v31[4] = v22;
        v24 = objc_msgSend(v23, "na_firstObjectPassingTest:", v31);

        if (v24) {
          +[HMDAccessorySettingTransform modelsForSettingDiff:v24 fromSetting:v22];
        }
        else {
        v25 = [v30 modelsForSetting:v22];
        }
        [v8 addObjectsFromArray:v25];
      }
      uint64_t v19 = [obja countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v19);
  }

  id v26 = (void *)[v8 copy];
LABEL_26:

  return v26;
}

uint64_t __61__HMDAccessorySettingTransform_modelsForGroupDiff_fromGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  id v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __61__HMDAccessorySettingTransform_modelsForGroupDiff_fromGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  id v4 = [*(id *)(a1 + 32) name];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

+ (id)modelsForGroup:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [a1 modelForGroup:v4];
  [v5 addObject:v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [v4 settings];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = [a1 modelsForSetting:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v5 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = objc_msgSend(v4, "groups", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [a1 modelsForGroup:*(void *)(*((void *)&v20 + 1) + 8 * j)];
        [v5 addObjectsFromArray:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  return v5;
}

@end
@interface HMDSettingAlgorithm
+ (id)allGroupsFromRootGroup:(id)a3;
+ (id)allSettingsFromRootGroup:(id)a3;
+ (void)findChangedSettingsWithRootGroup:(id)a3 currentGroups:(id)a4 currentSettings:(id)a5 completion:(id)a6;
@end

@implementation HMDSettingAlgorithm

+ (void)findChangedSettingsWithRootGroup:(id)a3 currentGroups:(id)a4 currentSettings:(id)a5 completion:(id)a6
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v64 = a5;
  v55 = (void (**)(id, void *, void *, id, id, id, id))a6;
  context = (void *)MEMORY[0x230FBD990]();
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v14 = v13;
  if (v10)
  {
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __97__HMDSettingAlgorithm_findChangedSettingsWithRootGroup_currentGroups_currentSettings_completion___block_invoke;
    v81[3] = &unk_264A1EC20;
    id v82 = v13;
    id v84 = a1;
    id v83 = v12;
    BFSTraverseGroupWithBlock(v10, v81);
  }
  id v61 = v14;
  v56 = v10;
  v15 = objc_msgSend(MEMORY[0x263F08968], "strongToWeakObjectsMapTable", context);
  v16 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  id v60 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = v12;
  uint64_t v17 = [obj countByEnumeratingWithState:&v77 objects:v88 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v78 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        v22 = [v21 identifier];
        [v15 setObject:v21 forKey:v22];

        uint64_t v23 = [v21 identifier];
        if (v23)
        {
          v24 = (void *)v23;
          v25 = [v21 identifier];
          v26 = [v64 objectForKey:v25];

          if (!v26) {
            [v60 addObject:v21];
          }
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v77 objects:v88 count:16];
    }
    while (v18);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v62 = v61;
  uint64_t v27 = [v62 countByEnumeratingWithState:&v73 objects:v87 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v74 != v29) {
          objc_enumerationMutation(v62);
        }
        v31 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        v32 = [v31 identifier];
        [v16 setObject:v31 forKey:v32];

        uint64_t v33 = [v31 identifier];
        if (v33)
        {
          v34 = (void *)v33;
          v35 = [v31 identifier];
          v36 = [v11 objectForKey:v35];

          if (!v36) {
            [v59 addObject:v31];
          }
        }
      }
      uint64_t v28 = [v62 countByEnumeratingWithState:&v73 objects:v87 count:16];
    }
    while (v28);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v37 = v11;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v69 objects:v86 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v70 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v69 + 1) + 8 * k);
        v43 = [v16 objectForKey:v42];

        if (!v43)
        {
          v44 = [v37 objectForKey:v42];
          if (v44) {
            [v57 addObject:v44];
          }
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v69 objects:v86 count:16];
    }
    while (v39);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v45 = v64;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v65 objects:v85 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v66;
    do
    {
      for (uint64_t m = 0; m != v47; ++m)
      {
        if (*(void *)v66 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = *(void *)(*((void *)&v65 + 1) + 8 * m);
        v51 = [v15 objectForKey:v50];

        if (!v51)
        {
          v52 = [v45 objectForKey:v50];
          if (v52) {
            [v58 addObject:v52];
          }
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v65 objects:v85 count:16];
    }
    while (v47);
  }

  v55[2](v55, v16, v15, v59, v60, v57, v58);
}

uint64_t __97__HMDSettingAlgorithm_findChangedSettingsWithRootGroup_currentGroups_currentSettings_completion___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = a1[4];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __97__HMDSettingAlgorithm_findChangedSettingsWithRootGroup_currentGroups_currentSettings_completion___block_invoke_2;
  v25[3] = &unk_264A1EBF8;
  id v8 = v5;
  id v26 = v8;
  if (objc_msgSend(v7, "na_any:", v25))
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1[6];
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Multiple groups collison", buf, 0xCu);
    }
    id v13 = [[HMDAssertionLogEvent alloc] initWithReason:@"Multiple groups collison"];
    id v14 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v14 submitLogEvent:v13];

    id v15 = v26;
  }
  else
  {

    [a1[4] addObject:v8];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(a1[5], "addObject:", *(void *)(*((void *)&v21 + 1) + 8 * v19++), (void)v21);
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v17);
    }
  }

  return 1;
}

uint64_t __97__HMDSettingAlgorithm_findChangedSettingsWithRootGroup_currentGroups_currentSettings_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 keyPath];
  v4 = [*(id *)(a1 + 32) keyPath];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

+ (id)allGroupsFromRootGroup:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = v4;
  if (v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__HMDSettingAlgorithm_allGroupsFromRootGroup___block_invoke;
    v7[3] = &unk_264A1EBD0;
    id v8 = v4;
    BFSTraverseGroupWithBlock(v3, v7);
  }
  return v5;
}

uint64_t __46__HMDSettingAlgorithm_allGroupsFromRootGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (id)allSettingsFromRootGroup:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = v4;
  if (v3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__HMDSettingAlgorithm_allSettingsFromRootGroup___block_invoke;
    v7[3] = &unk_264A1EBD0;
    id v8 = v4;
    BFSTraverseGroupWithBlock(v3, v7);
  }
  return v5;
}

uint64_t __48__HMDSettingAlgorithm_allSettingsFromRootGroup___block_invoke(uint64_t a1)
{
  return 1;
}

@end
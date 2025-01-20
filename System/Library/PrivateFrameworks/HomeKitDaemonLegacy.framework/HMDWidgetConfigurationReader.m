@interface HMDWidgetConfigurationReader
+ (id)logCategory;
- (HMDWidgetConfigurationReader)init;
- (HMDWidgetConfigurationReader)initWithInterface:(id)a3 bundleIdentifier:(id)a4 lockScreenWidgetKinds:(id)a5;
- (HMDWidgetConfigurationReaderInterface)interface;
- (NSSet)lockScreenWidgetKinds;
- (NSString)bundleIdentifier;
- (id)fetchedHomeWidgets;
- (int64_t)homeWidgetsEnabledCount;
- (void)fetchHomeWidgetsWithCompletion:(id)a3;
@end

@implementation HMDWidgetConfigurationReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenWidgetKinds, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

- (NSSet)lockScreenWidgetKinds
{
  return self->_lockScreenWidgetKinds;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (HMDWidgetConfigurationReaderInterface)interface
{
  return (HMDWidgetConfigurationReaderInterface *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)homeWidgetsEnabledCount
{
  v2 = [(HMDWidgetConfigurationReader *)self fetchedHomeWidgets];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)fetchHomeWidgetsWithCompletion:(id)a3
{
  id v4 = a3;
  if (self)
  {
    v5 = [(HMDWidgetConfigurationReader *)self interface];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__HMDWidgetConfigurationReader_fetchHomeWidgetsWithCompletion___block_invoke;
    v7[3] = &unk_1E6A187D0;
    v7[4] = self;
    id v8 = v4;
    [v5 allConfiguredWidgetsWithCompletion:v7];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

void __63__HMDWidgetConfigurationReader_fetchHomeWidgetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
          v14 = [*(id *)(a1 + 32) bundleIdentifier];
          v15 = [v13 widgetConfigurationsForApplicationContainerBundleIdentifier:v14];

          [v7 addObjectsFromArray:v15];
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v10);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63__HMDWidgetConfigurationReader_fetchHomeWidgetsWithCompletion___block_invoke_2;
    v21[3] = &unk_1E6A187A8;
    v21[4] = *(void *)(a1 + 32);
    v16 = objc_msgSend(v7, "na_map:", v21);
    v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = *(id *)(a1 + 32);
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      __int16 v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetched configured widgets: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

HMDWidget *__63__HMDWidgetConfigurationReader_fetchHomeWidgetsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  if (!v4) {
    goto LABEL_3;
  }
  id v6 = [v4 lockScreenWidgetKinds];
  v7 = [v5 widget];
  id v8 = [v7 kind];
  char v9 = [v6 containsObject:v8];

  if (v9)
  {
LABEL_3:

    uint64_t v10 = 0;
    goto LABEL_64;
  }
  uint64_t v11 = [v5 widget];
  uint64_t v12 = [v11 intent];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (!v14)
  {
    long long v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = v4;
    long long v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      v27 = [v5 widget];
      __int16 v28 = [v27 intent];
      *(_DWORD *)buf = 138543618;
      v89 = v26;
      __int16 v90 = 2112;
      v91 = v28;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Ignoring widget configuration because the intent is not INAppIntent: %@", buf, 0x16u);
    }
    goto LABEL_21;
  }
  char v87 = 0;
  v15 = [v14 serializedParameters];
  int v16 = objc_msgSend(v15, "hmf_BOOLForKey:isPresent:", @"useHomeKitRecommendations", &v87);

  if (!v87)
  {
    long long v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = v4;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      uint64_t v31 = [v14 serializedParameters];
      *(_DWORD *)buf = 138543874;
      v89 = v30;
      __int16 v90 = 2112;
      v91 = @"useHomeKitRecommendations";
      __int16 v92 = 2112;
      v93[0] = v31;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Ignoring widget configuration because %@ key is missing from serialized parameters: %@", buf, 0x20u);
    }
LABEL_21:

    uint64_t v10 = 0;
    goto LABEL_62;
  }
  v17 = [v14 serializedParameters];
  id v18 = [v17 objectForKeyedSubscript:@"accessoriesAndScenes"];

  if (v18) {
    char v19 = 1;
  }
  else {
    char v19 = v16;
  }
  v79 = v18;
  if (v19)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F70C20]);
    v21 = v20;
    int v78 = v16;
    if (v16)
    {
      id v22 = (id)[v20 combineContentsOfPropertyListObject:@"0FD0F71F-DAB9-4D7F-90C4-AB0A0E4724E4"];
    }
    else
    {
      v81 = v20;
      v80 = v4;
      id v77 = v14;
      id v37 = v18;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v38 = v37;
      }
      else {
        v38 = 0;
      }
      id v39 = v38;

      if (v39) {
        goto LABEL_29;
      }
      v57 = (__CFString *)v37;
      objc_opt_class();
      v58 = (objc_opt_isKindOfClass() & 1) != 0 ? v57 : 0;
      v59 = v58;

      if (!v59) {
        goto LABEL_57;
      }
      v60 = (void *)MEMORY[0x1D9452090]();
      id v61 = v4;
      v62 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        v63 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v89 = v63;
        __int16 v90 = 2112;
        v91 = v57;
        _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_DEBUG, "%{public}@Handling single item accessories and scenes entry %@", buf, 0x16u);
      }
      v95[0] = v59;
      id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:1];

      if (v37)
      {
LABEL_29:
        id v76 = v5;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id obj = v37;
        uint64_t v40 = [obj countByEnumeratingWithState:&v83 objects:v94 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v84;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v84 != v42) {
                objc_enumerationMutation(obj);
              }
              v44 = (__CFString *)*(id *)(*((void *)&v83 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v45 = v44;
              }
              else {
                v45 = 0;
              }
              v46 = v45;

              if (v46)
              {
                v47 = [(__CFString *)v44 hmf_stringForKey:@"identifier"];
                if (v47)
                {
                  id v48 = (id)[v81 combineContentsOfPropertyListObject:v47];
                }
                else
                {
                  v53 = (void *)MEMORY[0x1D9452090]();
                  id v54 = v4;
                  v55 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    v56 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    v89 = v56;
                    __int16 v90 = 2112;
                    v91 = v44;
                    _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly missing the identifier in %@", buf, 0x16u);

                    id v4 = v80;
                  }
                }
              }
              else
              {
                v49 = (void *)MEMORY[0x1D9452090]();
                id v50 = v4;
                v51 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  v52 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v89 = v52;
                  __int16 v90 = 2112;
                  v91 = v44;
                  _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@accessoryOrScene is not a dictionary! %@", buf, 0x16u);
                }
              }
            }
            uint64_t v41 = [obj countByEnumeratingWithState:&v83 objects:v94 count:16];
          }
          while (v41);
        }

        id v5 = v76;
        id v14 = v77;
        v21 = v81;
      }
      else
      {
LABEL_57:
        v21 = v81;
        id v64 = (id)[v81 combineContentsOfPropertyListObject:v57];
        id v14 = v77;
      }
    }
    v65 = v21;
    uint64_t v66 = [v21 finalize];
    objc_msgSend(NSString, "stringWithFormat:", @"%llu", v66);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)MEMORY[0x1D9452090]();
    id v68 = v4;
    v69 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
    {
      v70 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v89 = v70;
      __int16 v90 = 2114;
      v91 = v10;
      __int16 v92 = 1024;
      LODWORD(v93[0]) = v78;
      WORD2(v93[0]) = 2112;
      *(void *)((char *)v93 + 6) = v79;
      _os_log_impl(&dword_1D49D5000, v69, OS_LOG_TYPE_DEBUG, "%{public}@IFObjectHasher: computed widget identifier %{public}@ with useHomeKitRecommendations=%{BOOL}d, accessoriesAndScenes=%@", buf, 0x26u);
    }
  }
  else
  {
    v32 = (void *)MEMORY[0x1D9452090]();
    id v33 = v4;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = HMFGetLogIdentifier();
      v36 = [v14 serializedParameters];
      *(_DWORD *)buf = 138543874;
      v89 = v35;
      __int16 v90 = 2112;
      v91 = @"accessoriesAndScenes";
      __int16 v92 = 2112;
      v93[0] = v36;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring widget configuration because %@ key is missing from serialized parameters: %@", buf, 0x20u);
    }
    uint64_t v10 = 0;
  }

LABEL_62:
  if (v10)
  {
    v71 = [HMDWidget alloc];
    v72 = [v5 widget];
    v73 = [v72 kind];
    v74 = [(HMDWidget *)v71 initWithIdentifier:v10 kind:v73];

    goto LABEL_65;
  }
LABEL_64:
  v74 = 0;
LABEL_65:

  return v74;
}

- (id)fetchedHomeWidgets
{
  if (self)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__183423;
    int v16 = __Block_byref_object_dispose__183424;
    id v17 = [MEMORY[0x1E4F1CA48] array];
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    id v4 = [(HMDWidgetConfigurationReader *)self interface];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__HMDWidgetConfigurationReader_fetchedHomeWidgets__block_invoke;
    v9[3] = &unk_1E6A18780;
    v9[4] = self;
    uint64_t v11 = &v12;
    id v5 = v3;
    uint64_t v10 = v5;
    [v4 allConfiguredWidgetsWithCompletion:v9];

    dispatch_time_t v6 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v5, v6);
    v7 = (void *)[(id)v13[5] copy];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

void __50__HMDWidgetConfigurationReader_fetchedHomeWidgets__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  dispatch_time_t v6 = v5;
  if (!a3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
          uint64_t v12 = [*(id *)(a1 + 32) bundleIdentifier];
          v13 = [v11 widgetConfigurationsForApplicationContainerBundleIdentifier:v12];

          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v13];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

- (HMDWidgetConfigurationReader)initWithInterface:(id)a3 bundleIdentifier:(id)a4 lockScreenWidgetKinds:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDWidgetConfigurationReader;
  uint64_t v12 = [(HMDWidgetConfigurationReader *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_interface, a3);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v13->_lockScreenWidgetKinds, a5);
  }

  return v13;
}

- (HMDWidgetConfigurationReader)init
{
  dispatch_semaphore_t v3 = +[HMDWidgetFetchSpecification allHomeLockScreenWidgetKinds];
  uint64_t v4 = *MEMORY[0x1E4F2D1C8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F58DF0]);
  dispatch_time_t v6 = [(HMDWidgetConfigurationReader *)self initWithInterface:v5 bundleIdentifier:v4 lockScreenWidgetKinds:v3];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_183432 != -1) {
    dispatch_once(&logCategory__hmf_once_t12_183432, &__block_literal_global_183433);
  }
  v2 = (void *)logCategory__hmf_once_v13_183434;
  return v2;
}

uint64_t __43__HMDWidgetConfigurationReader_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v13_183434;
  logCategory__hmf_once_v13_183434 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
@interface HMDFetchedSettingsDriverPreferences
+ (id)logCategory;
- (HMDFetchedSettingsDriverDelegate)delegate;
- (HMDFetchedSettingsDriverPreferences)initWithQueue:(id)a3 userDefaults:(id)a4 prefix:(id)a5 defaultValues:(id)a6;
- (void)fetchSettingsForKeyPaths:(id)a3 completion:(id)a4;
- (void)languageValueListWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateSettingWithKeyPath:(id)a3 BOOLSettingValue:(id)a4 completion:(id)a5;
- (void)updateSettingWithKeyPath:(id)a3 integerSettingValue:(id)a4 completion:(id)a5;
- (void)updateSettingWithKeyPath:(id)a3 languageSettingValue:(id)a4 completion:(id)a5;
- (void)updateSettingWithKeyPath:(id)a3 primaryUserInfo:(id)a4 completion:(id)a5;
@end

@implementation HMDFetchedSettingsDriverPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (HMDFetchedSettingsDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDFetchedSettingsDriverDelegate *)WeakRetained;
}

- (void)updateSettingWithKeyPath:(id)a3 primaryUserInfo:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    v17 = v14;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Primary user info is not supported for keyPath: %@", (uint8_t *)&v16, 0x16u);
  }
  v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  v10[2](v10, v15);
}

- (void)languageValueListWithCompletion:(id)a3
{
}

- (void)updateSettingWithKeyPath:(id)a3 languageSettingValue:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    v17 = v14;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Only BOOL settings are supported keyPath: %@", (uint8_t *)&v16, 0x16u);
  }
  v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  v10[2](v10, v15);
}

- (void)updateSettingWithKeyPath:(id)a3 integerSettingValue:(id)a4 completion:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v11 = (void (**)(id, void))a5;
  if (self) {
    Property = objc_getProperty(self, v10, 16, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  char v13 = [MEMORY[0x1E4F2E5F8] isKeyPathForConstrainedNumberSettingType:v8];
  v14 = (void *)MEMORY[0x1D9452090]();
  v15 = self;
  int v16 = HMFGetOSLogHandle();
  v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v57 = v18;
      __int16 v58 = 2114;
      id v59 = v8;
      __int16 v60 = 2112;
      id v61 = v9;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating %{public}@ to %@", buf, 0x20u);
    }
    if (self) {
      id v20 = objc_getProperty(v15, v19, 32, 1);
    }
    else {
      id v20 = 0;
    }
    v22 = [v20 stringByAppendingString:v8];
    if (self) {
      id v23 = objc_getProperty(v15, v21, 24, 1);
    }
    else {
      id v23 = 0;
    }
    v24 = [v23 objectForKey:v22];
    v25 = v24;
    if (v24 && (uint64_t v26 = [v24 integerValue], v26 == objc_msgSend(v9, "integerValue")))
    {
      v11[2](v11, 0);
    }
    else
    {
      id v54 = v8;
      v28 = (void *)MEMORY[0x1D9452090]();
      v29 = v15;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v31 = v29;
        v32 = v25;
        v34 = id v33 = v9;
        *(_DWORD *)buf = 138543874;
        v57 = v34;
        __int16 v58 = 2114;
        id v59 = v54;
        __int16 v60 = 2112;
        id v61 = v33;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Changing %{public}@ to %@", buf, 0x20u);

        id v9 = v33;
        v25 = v32;
        v29 = v31;
      }

      if (self) {
        id v36 = objc_getProperty(v29, v35, 24, 1);
      }
      else {
        id v36 = 0;
      }
      id v8 = v54;
      id v37 = v36;
      objc_msgSend(v37, "setInteger:forKey:", objc_msgSend(v9, "integerValue"), v22);

      v11[2](v11, 0);
      v38 = [MEMORY[0x1E4F2E5F8] defaultSettingsConstraintsForKeyPath:v54];
      if (v38)
      {
        id v52 = objc_alloc(MEMORY[0x1E4F2E688]);
        uint64_t v51 = [v9 integerValue];
        v39 = [v38 objectAtIndexedSubscript:1];
        uint64_t v40 = [v39 integerValue];
        [v38 objectAtIndexedSubscript:0];
        v41 = v53 = v25;
        uint64_t v42 = [v41 integerValue];
        [v38 objectAtIndexedSubscript:3];
        v43 = v29;
        v44 = v11;
        v46 = id v45 = v9;
        v47 = objc_msgSend(v52, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v54, 0, v51, v40, v42, objc_msgSend(v46, "integerValue"));

        id v9 = v45;
        v11 = v44;

        v48 = [(HMDFetchedSettingsDriverPreferences *)v43 delegate];
        v55 = v47;
        v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
        v50 = v43;
        id v8 = v54;
        [v48 driver:v50 didUpdateSettings:v49];

        v25 = v53;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v57 = v27;
      __int16 v58 = 2114;
      id v59 = v8;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Key %{public}@ not part of expected integer keys", buf, 0x16u);
    }
    v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(id, void *))v11)[2](v11, v22);
  }
}

- (void)updateSettingWithKeyPath:(id)a3 BOOLSettingValue:(id)a4 completion:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v11 = (void (**)(id, void))a5;
  if (self) {
    Property = objc_getProperty(self, v10, 16, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  char v13 = [MEMORY[0x1E4F2E5F8] isKeyPathForBooleanSettingType:v8];
  v14 = (void *)MEMORY[0x1D9452090]();
  v15 = self;
  int v16 = HMFGetOSLogHandle();
  v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v18;
      __int16 v41 = 2114;
      id v42 = v8;
      __int16 v43 = 2112;
      id v44 = v9;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating %{public}@ to %@", buf, 0x20u);
    }
    if (self) {
      id v20 = objc_getProperty(v15, v19, 32, 1);
    }
    else {
      id v20 = 0;
    }
    v22 = [v20 stringByAppendingString:v8];
    if (self) {
      id v23 = objc_getProperty(v15, v21, 24, 1);
    }
    else {
      id v23 = 0;
    }
    v24 = [v23 objectForKey:v22];
    v25 = v24;
    if (v24 && (int v26 = [v24 BOOLValue], v26 == objc_msgSend(v9, "BOOLValue")))
    {
      v11[2](v11, 0);
    }
    else
    {
      v27 = (void *)MEMORY[0x1D9452090]();
      v28 = v15;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v40 = v30;
        __int16 v41 = 2114;
        id v42 = v8;
        __int16 v43 = 2112;
        id v44 = v9;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Changing %{public}@ to %@", buf, 0x20u);
      }
      if (self) {
        id v32 = objc_getProperty(v28, v31, 24, 1);
      }
      else {
        id v32 = 0;
      }
      id v33 = v32;
      objc_msgSend(v33, "setBool:forKey:", objc_msgSend(v9, "BOOLValue"), v22);

      v11[2](v11, 0);
      v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2E680]), "initWithKeyPath:readOnly:BOOLValue:", v8, 0, objc_msgSend(v9, "BOOLValue"));
      v35 = [(HMDFetchedSettingsDriverPreferences *)v28 delegate];
      v38 = v34;
      id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      [v35 driver:v28 didUpdateSettings:v36];
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v37;
      __int16 v41 = 2114;
      id v42 = v8;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Key %{public}@ not part of expected BOOL keys", buf, 0x16u);
    }
    v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(id, void *))v11)[2](v11, v22);
  }
}

- (void)fetchSettingsForKeyPaths:(id)a3 completion:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v67 = (void (**)(id, void *, void *))a4;
  if (self) {
    Property = objc_getProperty(self, v7, 16, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  id v9 = (void *)MEMORY[0x1D9452090]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v82 = v12;
    __int16 v83 = 2114;
    id v84 = v6;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Got fetch request for keyPaths:%{public}@", buf, 0x16u);
  }
  v71 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v6;
  uint64_t v75 = [obj countByEnumeratingWithState:&v76 objects:v80 count:16];
  if (!v75)
  {
    v15 = 0;
    goto LABEL_57;
  }
  uint64_t v74 = *(void *)v77;
  unint64_t v14 = 0x1E4F2E000uLL;
  v15 = 0;
  v68 = self;
  v72 = v10;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v77 != v74) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v76 + 1) + 8 * v16);
      if (self) {
        id v18 = objc_getProperty(v10, v13, 32, 1);
      }
      else {
        id v18 = 0;
      }
      id v20 = objc_msgSend(v18, "stringByAppendingString:", v17, v67);
      if (self) {
        id v21 = objc_getProperty(v10, v19, 24, 1);
      }
      else {
        id v21 = 0;
      }
      v22 = [v21 objectForKey:v20];

      if (!v22)
      {
        id v32 = (void *)MEMORY[0x1D9452090]();
        id v33 = v10;
        v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v36 = v35 = v15;
          *(_DWORD *)buf = 138543618;
          v82 = v36;
          __int16 v83 = 2114;
          id v84 = v17;
          _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Key %{public}@ not found", buf, 0x16u);

          v15 = v35;
          unint64_t v14 = 0x1E4F2E000;
        }

        id v37 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v38 = 2;
        goto LABEL_36;
      }
      if ([*(id *)(v14 + 1528) isKeyPathForBooleanSettingType:v17])
      {
        if (self) {
          id v24 = objc_getProperty(v10, v23, 24, 1);
        }
        else {
          id v24 = 0;
        }
        uint64_t v25 = [v24 BOOLForKey:v20];
        int v26 = (void *)[objc_alloc(MEMORY[0x1E4F2E680]) initWithKeyPath:v17 readOnly:0 BOOLValue:v25];
        v27 = (void *)MEMORY[0x1D9452090]();
        v28 = v10;
        v29 = HMFGetOSLogHandle();
        v30 = v29;
        if (v26)
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v82 = v31;
            __int16 v83 = 2114;
            id v84 = v17;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@BOOL %{public}@", buf, 0x16u);

            v10 = v72;
          }

          [v71 addObject:v26];
        }
        else
        {
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            __int16 v58 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v82 = v58;
            __int16 v83 = 2114;
            id v84 = v17;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Boolean data type for Key %{public}@ had no integer setting", buf, 0x16u);
          }
          uint64_t v59 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];

          int v26 = 0;
          v15 = (void *)v59;
        }
      }
      else
      {
        if (![*(id *)(v14 + 1528) isKeyPathForConstrainedNumberSettingType:v17])
        {
          v53 = (void *)MEMORY[0x1D9452090]();
          id v54 = v10;
          v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v57 = v56 = v15;
            *(_DWORD *)buf = 138543618;
            v82 = v57;
            __int16 v83 = 2114;
            id v84 = v17;
            _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_ERROR, "%{public}@Data type of key %{public}@ is neither a BOOL nor a number", buf, 0x16u);

            v15 = v56;
            unint64_t v14 = 0x1E4F2E000;
          }

          id v37 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v38 = 48;
LABEL_36:
          [v37 hmErrorWithCode:v38];
          v15 = int v26 = v15;
          goto LABEL_48;
        }
        int v26 = [*(id *)(v14 + 1528) defaultSettingsConstraintsForKeyPath:v17];
        if (v26)
        {
          v70 = v15;
          if (self) {
            id v40 = objc_getProperty(v10, v39, 24, 1);
          }
          else {
            id v40 = 0;
          }
          uint64_t v69 = [v40 integerForKey:v20];
          id v41 = objc_alloc(MEMORY[0x1E4F2E688]);
          id v42 = [v26 objectAtIndexedSubscript:1];
          uint64_t v43 = [v42 integerValue];
          id v44 = [v26 objectAtIndexedSubscript:0];
          uint64_t v45 = [v44 integerValue];
          v46 = [v26 objectAtIndexedSubscript:3];
          v47 = objc_msgSend(v41, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v17, 0, v69, v43, v45, objc_msgSend(v46, "integerValue"));

          v48 = (void *)MEMORY[0x1D9452090]();
          v49 = v72;
          v50 = HMFGetOSLogHandle();
          uint64_t v51 = v50;
          if (v47)
          {
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              id v52 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v82 = v52;
              __int16 v83 = 2114;
              id v84 = v17;
              _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@int %{public}@", buf, 0x16u);
            }
            [v71 addObject:v47];
            self = v68;
            v15 = v70;
          }
          else
          {
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              v64 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v82 = v64;
              __int16 v83 = 2114;
              id v84 = v17;
              _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Integer data type for Key %{public}@ had no integer setting", buf, 0x16u);
            }
            uint64_t v65 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];

            v47 = 0;
            v15 = (void *)v65;
            self = v68;
          }
        }
        else
        {
          __int16 v60 = (void *)MEMORY[0x1D9452090]();
          id v61 = v10;
          uint64_t v62 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v63 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v82 = v63;
            __int16 v83 = 2114;
            id v84 = v17;
            _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@Default settings constraints for Key %{public}@ not found", buf, 0x16u);
          }
          [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          v15 = v47 = v15;
        }

        v10 = v72;
      }
      unint64_t v14 = 0x1E4F2E000;
LABEL_48:

      ++v16;
    }
    while (v75 != v16);
    uint64_t v66 = [obj countByEnumeratingWithState:&v76 objects:v80 count:16];
    uint64_t v75 = v66;
  }
  while (v66);
LABEL_57:

  v67[2](v67, v71, v15);
}

- (HMDFetchedSettingsDriverPreferences)initWithQueue:(id)a3 userDefaults:(id)a4 prefix:(id)a5 defaultValues:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v54.receiver = self;
  v54.super_class = (Class)HMDFetchedSettingsDriverPreferences;
  v15 = [(HMDFetchedSettingsDriverPreferences *)&v54 init];
  uint64_t v16 = v15;
  if (v15)
  {
    id v44 = v12;
    id v45 = v11;
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_userDefaults, a4);
    objc_storeStrong((id *)&v16->_prefix, a5);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v14;
    uint64_t v17 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    if (!v17) {
      goto LABEL_23;
    }
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v51;
    unint64_t v20 = 0x1E4F2E000uLL;
    id v46 = v13;
    uint64_t v47 = *(void *)v51;
    id v48 = v14;
    while (1)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v23 = objc_msgSend(v13, "stringByAppendingString:", v22, v44, v45);
        uint64_t v25 = objc_msgSend(objc_getProperty(v16, v24, 24, 1), "objectForKey:", v23);

        if (!v25)
        {
          if ([*(id *)(v20 + 1528) isKeyPathForBooleanSettingType:v22])
          {
            int v26 = (void *)MEMORY[0x1D9452090]();
            v27 = v16;
            v28 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = HMFGetLogIdentifier();
              v30 = [obj objectForKeyedSubscript:v22];
              *(_DWORD *)buf = 138543874;
              v56 = v29;
              __int16 v57 = 2112;
              __int16 v58 = v30;
              __int16 v59 = 2114;
              __int16 v60 = v22;
              _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Setting default BOOL value %@ for Key: %{public}@", buf, 0x20u);

              id v13 = v46;
            }

            id v32 = objc_getProperty(v27, v31, 24, 1);
            id v33 = [obj objectForKeyedSubscript:v22];
            objc_msgSend(v32, "setBool:forKey:", objc_msgSend(v33, "BOOLValue"), v23);
            goto LABEL_16;
          }
          int v34 = [*(id *)(v20 + 1528) isKeyPathForConstrainedNumberSettingType:v22];
          v35 = (void *)MEMORY[0x1D9452090]();
          id v36 = v16;
          id v37 = HMFGetOSLogHandle();
          uint64_t v38 = v37;
          if (v34)
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v39 = HMFGetLogIdentifier();
              id v40 = [obj objectForKeyedSubscript:v22];
              *(_DWORD *)buf = 138543874;
              v56 = v39;
              __int16 v57 = 2112;
              __int16 v58 = v40;
              __int16 v59 = 2114;
              __int16 v60 = v22;
              _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Setting default integer value %@ for Key: %{public}@", buf, 0x20u);

              id v13 = v46;
            }

            id v32 = objc_getProperty(v36, v41, 24, 1);
            id v33 = [obj objectForKeyedSubscript:v22];
            objc_msgSend(v32, "setInteger:forKey:", objc_msgSend(v33, "integerValue"), v23);
LABEL_16:
          }
          else
          {
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              id v42 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v56 = v42;
              __int16 v57 = 2114;
              __int16 v58 = v22;
              _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Data type for Key %{public}@ not supported", buf, 0x16u);
            }
          }
          uint64_t v19 = v47;
          id v14 = v48;
          unint64_t v20 = 0x1E4F2E000;
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
      if (!v18)
      {
LABEL_23:

        id v12 = v44;
        id v11 = v45;
        break;
      }
    }
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_138170 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_138170, &__block_literal_global_138171);
  }
  v2 = (void *)logCategory__hmf_once_v4_138172;
  return v2;
}

uint64_t __50__HMDFetchedSettingsDriverPreferences_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_138172;
  logCategory__hmf_once_v4_138172 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
@interface HMAccessoryCollectionSetting
+ (id)itemValueClassesForKeyPath:(id)a3;
+ (void)removeItemValueClassesForKeyPath:(id)a3;
+ (void)setItemValueClass:(Class)a3 forKeyPath:(id)a4;
+ (void)setItemValueClasses:(id)a3 forKeyPath:(id)a4;
- (Class)valueClass;
- (HMAccessoryCollectionSetting)initWithInternal:(id)a3;
- (HMAccessoryCollectionSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5;
- (NSSet)itemValueClasses;
- (id)value;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_setting:(id)a3 didAddConstraint:(id)a4;
- (void)_setting:(id)a3 didRemoveConstraint:(id)a4;
- (void)addItem:(id)a3 completionHandler:(id)a4;
- (void)removeItem:(id)a3 completionHandler:(id)a4;
- (void)replaceItem:(id)a3 withItem:(id)a4 completionHandler:(id)a5;
- (void)replaceItems:(id)a3 withItems:(id)a4 completionHandler:(id)a5;
- (void)setItemValueClass:(Class)a3;
- (void)setItemValueClasses:(id)a3;
- (void)updateValue:(id)a3 completionHandler:(id)a4;
@end

@implementation HMAccessoryCollectionSetting

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = [(HMAccessoryCollectionSetting *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  unint64_t v11 = [v10 countByEnumeratingWithState:a3 objects:a4 count:a5];
  return v11;
}

- (void)_setting:(id)a3 didRemoveConstraint:(id)a4
{
  id v5 = [(HMAccessorySetting *)self internal];
  [(HMAccessorySetting *)self _settingDidUpdateValue:v5];
}

- (void)_setting:(id)a3 didAddConstraint:(id)a4
{
  id v5 = objc_msgSend(a4, "value", a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  [v7 setSetting:self];
  id v8 = [(HMAccessorySetting *)self internal];
  [(HMAccessorySetting *)self _settingDidUpdateValue:v8];
}

- (void)updateValue:(id)a3 completionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v11 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if ((objc_msgSend(v10, "hmf_objectsAreKindOfClass:", objc_opt_class()) & 1) == 0) {
LABEL_25:
  }
    _HMFPreconditionFailure();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v15 setSetting:self];
        id v36 = 0;
        char v16 = __validateItem(self, v15, &v36);
        id v17 = v36;
        v18 = v17;
        if ((v16 & 1) == 0)
        {
          v19 = (void *)MEMORY[0x19F3A64A0]();
          v20 = self;
          v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v42 = v22;
            __int16 v43 = 2112;
            id v44 = v15;
            _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid item: %@", buf, 0x16u);
          }
          v23 = [(HMAccessorySetting *)v20 internal];
          v24 = [v23 context];
          v25 = [v24 delegateCaller];
          [v25 callCompletion:v7 error:v18];

          goto LABEL_23;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

LABEL_20:
  v26 = (void *)MEMORY[0x19F3A64A0]();
  v27 = self;
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v42 = v29;
    __int16 v43 = 2112;
    id v44 = v11;
    _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Updating with items: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v27);
  v30 = __constraintsForItems(v27, v11);
  v31 = [(HMAccessorySetting *)v27 internal];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __62__HMAccessoryCollectionSetting_updateValue_completionHandler___block_invoke;
  v32[3] = &unk_1E5944AE0;
  objc_copyWeak(&v35, (id *)buf);
  id v11 = v11;
  id v33 = v11;
  id v34 = v7;
  [v31 updateConstraints:v30 completionHandler:v32];

  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);
LABEL_23:
}

void __62__HMAccessoryCollectionSetting_updateValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    v9 = HMFGetLogIdentifier();
    uint64_t v10 = *(void *)(a1 + 32);
    int v17 = 138543874;
    v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = v3;
    id v11 = "%{public}@Failed to update items, %@, with error: %@";
    uint64_t v12 = v8;
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    uint32_t v14 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    v9 = HMFGetLogIdentifier();
    uint64_t v15 = *(void *)(a1 + 32);
    int v17 = 138543618;
    v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v15;
    id v11 = "%{public}@Updated item: %@";
    uint64_t v12 = v8;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v12, v13, v11, (uint8_t *)&v17, v14);

LABEL_7:
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v3);
  }
}

- (id)value
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(HMAccessorySetting *)self internal];
  id v3 = [v2 constraints];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v16) == 4)
        {
          id v11 = [v10 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v12 = v11;
          }
          else {
            uint64_t v12 = 0;
          }
          id v13 = v12;

          if (v13) {
            [v4 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint32_t v14 = [v4 array];

  return v14;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)replaceItems:(id)a3 withItems:(id)a4 completionHandler:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v52 = a5;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_44;
  }
  if (!v8)
  {
LABEL_44:
    _HMFPreconditionFailure();
    goto LABEL_45;
  }
  v50 = v7;
  v9 = (void *)[v7 mutableCopy];
  v51 = v8;
  v53 = (void *)[v8 mutableCopy];
  uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
  id v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v53];
  [v10 intersectSet:v11];

  if ([v10 count])
  {
    uint64_t v12 = (void *)MEMORY[0x19F3A64A0]();
    id v13 = self;
    uint32_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v79 = v15;
      __int16 v80 = 2112;
      id v81 = v10;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Ignoring common items: %@", buf, 0x16u);
    }
    long long v16 = [v10 allObjects];
    [v9 removeObjectsInArray:v16];

    long long v17 = [v10 allObjects];
    [v53 removeObjectsInArray:v17];
  }
  v56 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v18 = [(HMAccessorySetting *)self internal];
  v58 = [v18 constraints];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obuint64_t j = v9;
  uint64_t v59 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (v59)
  {
    uint64_t v57 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v75 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v21 = v58;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v70 objects:v85 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v71;
          while (2)
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v71 != v23) {
                objc_enumerationMutation(v21);
              }
              v25 = *(void **)(*((void *)&v70 + 1) + 8 * j);
              v26 = [v25 value];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v27 = v26;
              }
              else {
                v27 = 0;
              }
              id v28 = v27;

              if ([v20 isEqual:v28])
              {
                [v56 addObject:v25];

                goto LABEL_25;
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v70 objects:v85 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }
LABEL_25:
      }
      uint64_t v59 = [obj countByEnumeratingWithState:&v74 objects:v86 count:16];
    }
    while (v59);
  }

  if ((objc_msgSend(v53, "hmf_objectsAreKindOfClass:", objc_opt_class()) & 1) == 0)
  {
LABEL_45:
    _HMFPreconditionFailure();
    __break(1u);
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v29 = v53;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v66 objects:v84 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v67;
    while (2)
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v67 != v31) {
          objc_enumerationMutation(v29);
        }
        id v33 = *(void **)(*((void *)&v66 + 1) + 8 * k);
        [v33 setSetting:self];
        id v65 = 0;
        char v34 = __validateItem(self, v33, &v65);
        id v35 = v65;
        id v36 = v35;
        if ((v34 & 1) == 0)
        {
          __int16 v43 = (void *)MEMORY[0x19F3A64A0]();
          id v44 = self;
          v45 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v46 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v79 = v46;
            __int16 v80 = 2112;
            id v81 = v33;
            _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid item: %@", buf, 0x16u);
          }
          v47 = [(HMAccessorySetting *)v44 internal];
          v48 = [v47 context];
          v49 = [v48 delegateCaller];
          [v49 callCompletion:v52 error:v36];

          long long v37 = v29;
          goto LABEL_42;
        }
      }
      uint64_t v30 = [v29 countByEnumeratingWithState:&v66 objects:v84 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }

  long long v37 = __constraintsForItems(self, v29);
  long long v38 = (void *)MEMORY[0x19F3A64A0]();
  long long v39 = self;
  long long v40 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v79 = v41;
    __int16 v80 = 2112;
    id v81 = obj;
    __int16 v82 = 2112;
    id v83 = v29;
    _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Replacing items, %@, with items, %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, v39);
  v42 = [(HMAccessorySetting *)v39 internal];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __73__HMAccessoryCollectionSetting_replaceItems_withItems_completionHandler___block_invoke;
  v60[3] = &unk_1E5944AB8;
  objc_copyWeak(&v64, (id *)buf);
  id v61 = obj;
  id v62 = v29;
  id v63 = v52;
  [v42 replaceConstraints:v56 withConstraints:v37 completionHandler:v60];

  objc_destroyWeak(&v64);
  objc_destroyWeak((id *)buf);
LABEL_42:
}

void __73__HMAccessoryCollectionSetting_replaceItems_withItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v27 = v9;
      __int16 v28 = 2112;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      uint64_t v31 = v11;
      __int16 v32 = 2112;
      id v33 = v3;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to replace items, %@, with items, %@, with error: %@", buf, 0x2Au);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      __int16 v30 = 2112;
      uint64_t v31 = v14;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Replaced items, %@, with items, %@", buf, 0x20u);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v19++), "setSetting:", 0, (void)v21);
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v17);
    }
  }
  uint64_t v20 = *(void *)(a1 + 48);
  if (v20) {
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v3);
  }
}

- (void)replaceItem:(id)a3 withItem:(id)a4 completionHandler:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_5:
    _HMFPreconditionFailure();
  }
  if (!v9) {
    goto LABEL_5;
  }
  uint64_t v11 = v10;
  v15[0] = v8;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v14 = v9;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [(HMAccessoryCollectionSetting *)self replaceItems:v12 withItems:v13 completionHandler:v11];
}

- (void)removeItem:(id)a3 completionHandler:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v26 = a4;
  if (v6)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = [(HMAccessorySetting *)self internal];
    id v8 = [v7 constraints];

    id v9 = (id)[v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "value", v26);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v14 = v13;
          }
          else {
            id v14 = 0;
          }
          id v15 = v14;

          if ([v6 isEqual:v15])
          {
            id v9 = v12;

            goto LABEL_15;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v38 = v19;
      __int16 v39 = 2112;
      id v40 = v6;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Removing item: %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v17);
    objc_initWeak(&location, v6);
    uint64_t v20 = [(HMAccessorySetting *)v17 internal];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __61__HMAccessoryCollectionSetting_removeItem_completionHandler___block_invoke;
    v27[3] = &unk_1E5944A90;
    objc_copyWeak(&v30, (id *)buf);
    id v28 = v6;
    objc_copyWeak(&v31, &location);
    id v29 = v26;
    [v20 removeConstraint:v9 completionHandler:v27];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);

    long long v21 = v26;
  }
  else
  {
    long long v22 = [(HMAccessorySetting *)self internal];
    long long v23 = [v22 context];
    long long v24 = [v23 delegateCaller];
    v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    long long v21 = v26;
    [v24 callCompletion:v26 error:v25];
  }
}

void __61__HMAccessoryCollectionSetting_removeItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v15 = 138543874;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to remove item, %@, with error: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed item: %@", (uint8_t *)&v15, 0x16u);
    }
    id v13 = objc_loadWeakRetained((id *)(a1 + 56));
    [v13 setSetting:0];
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);
  }
}

- (void)addItem:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]([v6 setSetting:self]);
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v33 = v11;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Adding item: %@", buf, 0x16u);
    }
    id v31 = 0;
    char v12 = __validateItem(v9, v6, &v31);
    id v13 = v31;
    if (v12)
    {
      uint64_t v14 = [[HMAccessorySettingConstraint alloc] initWithType:4 value:v6];
      objc_initWeak((id *)buf, v9);
      objc_initWeak(&location, v6);
      int v15 = [(HMAccessorySetting *)v9 internal];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __58__HMAccessoryCollectionSetting_addItem_completionHandler___block_invoke;
      v26[3] = &unk_1E5944A40;
      objc_copyWeak(&v28, (id *)buf);
      objc_copyWeak(&v29, &location);
      id v27 = v7;
      [v15 addConstraint:v14 completionHandler:v26];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v20 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v21 = v9;
      long long v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        long long v33 = v23;
        __int16 v34 = 2112;
        id v35 = v6;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid item: %@", buf, 0x16u);
      }
      uint64_t v14 = [(HMAccessorySetting *)v21 internal];
      long long v24 = [(HMAccessorySettingConstraint *)v14 context];
      v25 = [v24 delegateCaller];
      [v25 callCompletion:v7 error:v13];
    }
  }
  else
  {
    uint64_t v16 = [(HMAccessorySetting *)self internal];
    __int16 v17 = [v16 context];
    uint64_t v18 = [v17 delegateCaller];
    __int16 v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v18 callCompletion:v7 error:v19];
  }
}

void __58__HMAccessoryCollectionSetting_addItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = (void *)MEMORY[0x19F3A64A0]();
  id v7 = WeakRetained;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v3)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v10 = HMFGetLogIdentifier();
    int v16 = 138543874;
    __int16 v17 = v10;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v3;
    uint64_t v11 = "%{public}@Failed to add item, %@, with error: %@";
    char v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    uint64_t v10 = HMFGetLogIdentifier();
    int v16 = 138543618;
    __int16 v17 = v10;
    __int16 v18 = 2112;
    id v19 = v5;
    uint64_t v11 = "%{public}@Added item: %@";
    char v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 22;
  }
  _os_log_impl(&dword_19D1A8000, v12, v13, v11, (uint8_t *)&v16, v14);

LABEL_7:
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);
  }
}

- (void)setItemValueClasses:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessorySetting *)self keyPath];
  +[HMAccessoryCollectionSetting setItemValueClasses:v4 forKeyPath:v5];
}

- (void)setItemValueClass:(Class)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  [(HMAccessoryCollectionSetting *)self setItemValueClasses:v4];
}

- (NSSet)itemValueClasses
{
  v2 = [(HMAccessorySetting *)self keyPath];
  id v3 = +[HMAccessoryCollectionSetting itemValueClassesForKeyPath:v2];

  return (NSSet *)v3;
}

- (HMAccessoryCollectionSetting)initWithInternal:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMAccessoryCollectionSetting;
  id v5 = [(HMAccessorySetting *)&v19 initWithInternal:v4];
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = objc_msgSend(v4, "constraints", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            char v12 = v11;
          }
          else {
            char v12 = 0;
          }
          id v13 = v12;

          [v13 setSetting:v5];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (HMAccessoryCollectionSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (objc_msgSend(v12, "hmf_objectsAreKindOfClass:", objc_opt_class())) {
      goto LABEL_9;
    }
    _HMFPreconditionFailure();
LABEL_8:
    id v12 = 0;
LABEL_9:
    id v13 = __constraintsForItems(self, v12);
    uint32_t v14 = [[_HMAccessorySetting alloc] initWithType:5 properties:a4 name:v8 constraints:v13];
    long long v15 = [(HMAccessoryCollectionSetting *)self initWithInternal:v14];

    return v15;
  }
  long long v17 = (void *)_HMFPreconditionFailure();
  +[HMAccessoryCollectionSetting removeItemValueClassesForKeyPath:v19];
  return result;
}

+ (void)removeItemValueClassesForKeyPath:(id)a3
{
  id v3 = a3;
  id v4 = +[_HMAccessoryCollectionSettingItemClassManager sharedManager];
  [v4 removeItemValueClassesForKeyPath:v3];
}

+ (void)setItemValueClasses:(id)a3 forKeyPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[_HMAccessoryCollectionSettingItemClassManager sharedManager];
  [v7 setItemValueClasses:v6 forKeyPath:v5];
}

+ (void)setItemValueClass:(Class)a3 forKeyPath:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = [v6 setWithObject:a3];
  [a1 setItemValueClasses:v8 forKeyPath:v7];
}

+ (id)itemValueClassesForKeyPath:(id)a3
{
  id v3 = a3;
  id v4 = +[_HMAccessoryCollectionSettingItemClassManager sharedManager];
  id v5 = [v4 itemValueClassesForKeyPath:v3];

  return v5;
}

@end
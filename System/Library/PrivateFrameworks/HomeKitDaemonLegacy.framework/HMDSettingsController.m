@interface HMDSettingsController
+ (id)logCategory;
- (HMDSettingGroup)_cloneGroupFilteringKeyPath:(void *)a1;
- (HMDSettingsController)initWithDependency:(id)a3 delegate:(id)a4;
- (NSArray)allObjectIdentifiers;
- (NSUUID)userUUID;
- (id)_flattenedSettingControllerRoot:(void *)a3 withCurrentPath:(void *)a4 andReturnDictionary:;
- (id)_keyPathsFromGroup:(void *)a1 currentPath:(void *)a2;
- (id)_keyPathsToModelInModelIDToModelLookup:(void *)a1 parentIDToModelIDsLookup:(void *)a2 currentID:(void *)a3 currentPath:(void *)a4;
- (id)_prunedSettingsGroupByRemovingKeyPathsFromGroup:(id)a3;
- (id)_settingForKeyPathWithGroups:(void *)a3 settings:(void *)a4 keyPath:;
- (id)delegate;
- (id)logIdentifier;
- (id)migrateSettingsTransactionWithTransaction:(id)a3 error:(id *)a4;
- (id)modelsToMakeSettings;
- (id)modelsToMigrateSettings;
- (id)settingForIdentifier:(id)a1;
- (id)settingForKeyPath:(id)a3;
- (id)settingGroupForIdentifier:(id)a1;
- (id)settingValuesByKeyPathWithPrefix:(id)a3;
- (void)_handleAddedConstraintModel:(void *)a1 shouldNotify:(void *)a2 completion:(void *)a3;
- (void)_handleAddedGroupModel:(int)a3 shouldNotify:(void *)a4 completion:;
- (void)_handleAddedSettingModel:(int)a3 shouldNotify:(void *)a4 completion:;
- (void)configure;
- (void)encodeWithCoder:(id)a3;
- (void)loadWithModels:(id)a3;
- (void)settingsHierarchyDidChange;
- (void)transactionSettingConstraintModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
- (void)transactionSettingGroupModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
- (void)transactionSettingModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5;
- (void)updateRootGroup:(id)a3;
- (void)updateWithEncodedValue:(id)a3 onSettingKeyPath:(id)a4 completion:(id)a5;
- (void)updateWithValue:(id)a3 onSetting:(id)a4 completion:(id)a5;
@end

@implementation HMDSettingsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsMap, 0);
  objc_storeStrong((id *)&self->_groupsMap, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dependency, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)transactionSettingConstraintModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  if (self)
  {
    id v10 = a3;
    id v7 = a5;
    os_unfair_lock_lock_with_options();
    BOOL isInitialized = self->_isInitialized;
    os_unfair_lock_unlock(&self->_lock);
    if (isInitialized)
    {
      -[HMDSettingsController _handleAddedConstraintModel:shouldNotify:completion:](self, v10, v7);
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F69E30]);
      (*((void (**)(id, id))v7 + 2))(v7, v9);
    }
  }
}

- (void)_handleAddedConstraintModel:(void *)a1 shouldNotify:(void *)a2 completion:(void *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    id v7 = [(HMDSettingConstraint *)v5 hmbParentModelID];
    v8 = -[HMDSettingsController settingForIdentifier:](a1, v7);

    if (v8)
    {
      id v9 = [HMDSettingConstraint alloc];
      id v10 = [(HMDSettingConstraint *)v5 hmbModelID];
      v11 = [(HMDSettingConstraint *)v5 hmbParentModelID];
      v12 = [(HMDSettingConstraint *)v5 type];
      v13 = [(HMDSettingConstraint *)v5 numberValue];
      v14 = [(HMDSettingConstraint *)v5 dataValue];
      v15 = [(HMDSettingConstraint *)v9 initWithIdentifier:v10 parentIdentifier:v11 type:v12 numberValue:v13 dataValue:v14];

      if (v15)
      {
        v16 = (void *)MEMORY[0x1D9452090]([v8 addConstraint:v15]);
        id v17 = a1;
        v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = HMFGetLogIdentifier();
          int v41 = 138543874;
          v42 = v19;
          __int16 v43 = 2112;
          v44 = v15;
          __int16 v45 = 2112;
          v46 = v8;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Added settings constraint %@ to %@", (uint8_t *)&v41, 0x20u);
        }
        v20 = (void *)MEMORY[0x1D9452090]();
        id v21 = v17;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = HMFGetLogIdentifier();
          v24 = [(HMDSettingConstraint *)v15 identifier];
          v25 = [v8 name];
          int v41 = 138543874;
          v42 = v23;
          __int16 v43 = 2112;
          v44 = v24;
          __int16 v45 = 2112;
          v46 = v25;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Added settings constraint %@ to %@", (uint8_t *)&v41, 0x20u);
        }
        [(HMDSettingsController *)v21 settingsHierarchyDidChange];
      }
      else
      {
        v36 = (void *)MEMORY[0x1D9452090]();
        id v37 = a1;
        v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = HMFGetLogIdentifier();
          int v41 = 138543618;
          v42 = v39;
          __int16 v43 = 2112;
          v44 = v5;
          _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode value for received constraint model %@", (uint8_t *)&v41, 0x16u);
        }
      }
      id v40 = objc_alloc_init(MEMORY[0x1E4F69E30]);
      v6[2](v6, v40);
    }
    else
    {
      v27 = (void *)MEMORY[0x1D9452090]();
      id v28 = a1;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v30 = HMFGetLogIdentifier();
        v31 = [(HMDSettingConstraint *)v5 hmbParentModelID];
        int v41 = 138543874;
        v42 = v30;
        __int16 v43 = 2112;
        v44 = v5;
        __int16 v45 = 2112;
        v46 = v31;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Couldn't find setting for received constraint model %@, parent %@", (uint8_t *)&v41, 0x20u);
      }
      v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = v28;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        int v41 = 138543362;
        v42 = v35;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find setting for received constraint model", (uint8_t *)&v41, 0xCu);
      }
      v15 = (HMDSettingConstraint *)objc_alloc_init(MEMORY[0x1E4F69E30]);
      v6[2](v6, v15);
    }
  }
}

- (id)settingForIdentifier:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    objc_msgSend(objc_getProperty(v2, v4, 64, 1), "objectForKey:", v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)settingsHierarchyDidChange
{
  if (a1)
  {
    id v3 = objc_getProperty(a1, a2, 48, 1);
    v5 = objc_msgSend(objc_getProperty(a1, v4, 56, 1), "copy");
    id v7 = objc_msgSend(objc_getProperty(a1, v6, 64, 1), "copy");
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__HMDSettingsController_settingsHierarchyDidChange__block_invoke;
    v8[3] = &unk_1E6A0D518;
    v8[4] = a1;
    +[HMDSettingAlgorithm findChangedSettingsWithRootGroup:v3 currentGroups:v5 currentSettings:v7 completion:v8];
  }
}

void __51__HMDSettingsController_settingsHierarchyDidChange__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if ([v15 count]
    || [v16 count]
    || [v17 count]
    || [v18 count])
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = *(id *)(a1 + 32);
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      id v36 = v18;
      id v37 = v13;
      v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
      v23 = id v35 = v16;
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
      v24 = id v33 = v20;
      v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
      id v34 = v17;
      v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
      v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      *(_DWORD *)buf = 138544898;
      v39 = v32;
      __int16 v40 = 2112;
      int v41 = v31;
      __int16 v42 = 2112;
      __int16 v43 = v23;
      __int16 v44 = 2112;
      __int16 v45 = v24;
      __int16 v46 = 2112;
      uint64_t v47 = v25;
      __int16 v48 = 2112;
      v49 = v26;
      __int16 v50 = 2112;
      v51 = v27;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Added %@ groups and %@ settings. Removed %@ groups and %@ settings. Currently have %@ groups and %@ settings", buf, 0x48u);

      id v13 = v37;
      id v17 = v34;

      id v18 = v36;
      v20 = v33;

      id v16 = v35;
    }
  }
  id v28 = *(void **)(a1 + 32);
  if (v28)
  {
    objc_setProperty_atomic(v28, v19, v14, 64);
    v30 = *(void **)(a1 + 32);
    if (v30) {
      objc_setProperty_atomic(v30, v29, v13, 56);
    }
  }
}

- (void)transactionSettingModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 hmbModelID];
  v12 = -[HMDSettingsController settingForIdentifier:](self, v11);

  if (v12)
  {
    id v50 = v9;
    id v13 = self;
    id v14 = v12;
    id v15 = v8;
    id v16 = (void (**)(id, id))v10;
    id v17 = v14;
    id v18 = v15;
    v19 = [v17 type];
    uint64_t v20 = [v19 integerValue];

    id v21 = 0;
    switch(v20)
    {
      case 1:
        v22 = [v18 dataValue];

        if (!v22) {
          goto LABEL_18;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F2EAB8]);
        v24 = [v18 dataValue];
        uint64_t v25 = [v23 initDataSettingWithValue:v24];
        goto LABEL_14;
      case 2:
        v30 = [v18 numberValue];

        if (!v30) {
          goto LABEL_18;
        }
        id v31 = objc_alloc(MEMORY[0x1E4F2EAB8]);
        v24 = [v18 numberValue];
        uint64_t v25 = [v31 initNumberSettingWithValue:v24];
        goto LABEL_14;
      case 3:
        v32 = [v18 stringValue];

        if (!v32) {
          goto LABEL_18;
        }
        id v33 = objc_alloc(MEMORY[0x1E4F2EAB8]);
        v24 = [v18 stringValue];
        uint64_t v25 = [v33 initStringSettingWithValue:v24];
LABEL_14:
        id v21 = (void *)v25;

        break;
      case 4:
        uint64_t v34 = [v18 selectionIdentifier];
        if (!v34) {
          goto LABEL_18;
        }
        id v35 = (void *)v34;
        id v36 = [v18 selectionValue];

        if (!v36) {
          goto LABEL_18;
        }
        id v47 = objc_alloc(MEMORY[0x1E4F2EAB8]);
        __int16 v48 = [v17 type];
        uint64_t v37 = [v48 integerValue];
        v38 = [v18 selectionIdentifier];
        v39 = [v18 selectionValue];
        id v21 = (void *)[v47 initWithType:v37 stringValue:0 numberValue:0 dataValue:0 selectionIdentifier:v38 selectionValue:v39];

        break;
      case 5:
        break;
      default:
LABEL_18:
        __int16 v40 = (void *)MEMORY[0x1D9452090]();
        int v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          __int16 v42 = HMFGetLogIdentifier();
          [v17 type];
          id v49 = v10;
          v44 = __int16 v43 = v13;
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v44;
          _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Unknown setting type %@ will not attempt to decode value in transaction", buf, 0x16u);

          id v13 = v43;
          id v10 = v49;
        }
        id v21 = 0;
        break;
    }

    id v45 = objc_alloc_init(MEMORY[0x1E4F69EC0]);
    if (v21 && [v17 updateWithSettingValue:v21])
    {
      __int16 v46 = -[HMDSettingsController delegate]((id *)&v13->super.super.isa);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ____transactionSettingUpdated_block_invoke;
      uint64_t v52 = &unk_1E6A197F0;
      v53 = v13;
      [v46 settingsController:v53 didUpdateWithCompletion:buf];

      [v45 setShouldUpdateClients:1];
    }
    v16[2](v16, v45);

    id v9 = v50;
  }
  else if (self)
  {
    id v26 = v8;
    id v27 = v10;
    os_unfair_lock_lock_with_options();
    BOOL isInitialized = self->_isInitialized;
    os_unfair_lock_unlock(&self->_lock);
    if (isInitialized)
    {
      -[HMDSettingsController _handleAddedSettingModel:shouldNotify:completion:](self, v26, 1, v27);
    }
    else
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F69E30]);
      (*((void (**)(id, id))v27 + 2))(v27, v29);
    }
  }
}

- (id)delegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 5);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)_handleAddedSettingModel:(int)a3 shouldNotify:(void *)a4 completion:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id v9 = [[HMDSetting alloc] initWithModel:v7];
    if (v9)
    {
      id v10 = [v7 hmbParentModelID];
      v11 = -[HMDSettingsController settingGroupForIdentifier:](a1, v10);
      v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = a1;
      id v14 = HMFGetOSLogHandle();
      id v15 = v14;
      if (v11)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v16 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v27 = v16;
          __int16 v28 = 2112;
          id v29 = v9;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Added setting %@", buf, 0x16u);
        }
        [v11 addSetting:v9];
        [(HMDSettingsController *)v13 settingsHierarchyDidChange];
        if (a3)
        {
          id WeakRetained = objc_loadWeakRetained(v13 + 5);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __74__HMDSettingsController__handleAddedSettingModel_shouldNotify_completion___block_invoke;
          v25[3] = &unk_1E6A197F0;
          v25[4] = v13;
          [WeakRetained settingsController:v13 didUpdateWithCompletion:v25];
        }
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v27 = v23;
          __int16 v28 = 2112;
          id v29 = v10;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Parent group not found to add setting in transaction for identifier %@", buf, 0x16u);
        }
      }
      id v24 = objc_alloc_init(MEMORY[0x1E4F69E30]);
      v8[2](v8, v24);
    }
    else
    {
      v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = a1;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v27 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Unable to decode setting in transaction payload", buf, 0xCu);
      }
      id v10 = (HMDSetting *)objc_alloc_init(MEMORY[0x1E4F69E30]);
      v8[2](v8, v10);
    }
  }
}

- (id)settingGroupForIdentifier:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    objc_msgSend(objc_getProperty(v2, v4, 56, 1), "objectForKey:", v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void __74__HMDSettingsController__handleAddedSettingModel_shouldNotify_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  SEL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  SEL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Sent setting added notification. Error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)transactionSettingGroupModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v7 = (void (**)(id, id))a5;
  int v8 = [v14 hmbModelID];
  id v9 = -[HMDSettingsController settingGroupForIdentifier:](self, v8);

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F69E30]);
    v7[2](v7, v10);
  }
  else
  {
    if (!self) {
      goto LABEL_9;
    }
    id v10 = v14;
    id v11 = v7;
    os_unfair_lock_lock_with_options();
    BOOL isInitialized = self->_isInitialized;
    os_unfair_lock_unlock(&self->_lock);
    if (isInitialized)
    {
      -[HMDSettingsController _handleAddedGroupModel:shouldNotify:completion:](self, v10, 1, v11);
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F69E30]);
      v11[2](v11, v13);
    }
  }

LABEL_9:
}

- (void)_handleAddedGroupModel:(int)a3 shouldNotify:(void *)a4 completion:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  int v8 = a4;
  if (a1)
  {
    id v9 = [[HMDSettingGroup alloc] initWithModel:v7];
    id v10 = v9;
    if (v9)
    {
      id v11 = [(HMDSettingGroup *)v9 parentIdentifier];
      id v13 = objc_msgSend(objc_getProperty(a1, v12, 32, 1), "parentIdentifier");
      int v14 = objc_msgSend(v11, "hmf_isEqualToUUID:", v13);

      if (v14)
      {
        id v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = a1;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v51 = v18;
          __int16 v52 = 2112;
          v53 = v7;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Root group added to owner %@", buf, 0x16u);
        }
        v19 = v10;
        if (objc_getProperty(v16, v20, 48, 1))
        {
          v22 = objc_msgSend(objc_getProperty(v16, v21, 48, 1), "identifier");
          id v23 = [(HMDSettingGroup *)v19 identifier];
          char v24 = objc_msgSend(v22, "hmf_isEqualToUUID:", v23);

          if ((v24 & 1) == 0)
          {
            uint64_t v25 = (void *)MEMORY[0x1D9452090]();
            id v26 = v16;
            id v27 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              __int16 v28 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v51 = v28;
              _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@We have a colliding root group", buf, 0xCu);
            }
          }
        }
        else
        {
          int v41 = (void *)MEMORY[0x1D9452090]();
          id v42 = v16;
          __int16 v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            __int16 v44 = HMFGetLogIdentifier();
            __int16 v46 = objc_msgSend(objc_getProperty(v42, v45, 32, 1), "parentIdentifier");
            *(_DWORD *)buf = 138543874;
            v51 = v44;
            __int16 v52 = 2112;
            v53 = v19;
            __int16 v54 = 2112;
            v55 = v46;
            _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Adding root group %@ for user %@", buf, 0x20u);
          }
          [v42 updateRootGroup:v19];
        }
      }
      else
      {
        v19 = [(HMDSettingGroup *)v7 hmbParentModelID];
        id v33 = -[HMDSettingsController settingGroupForIdentifier:](a1, v19);
        uint64_t v34 = (void *)MEMORY[0x1D9452090]();
        id v35 = a1;
        id v36 = HMFGetOSLogHandle();
        uint64_t v37 = v36;
        if (!v33)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            id v47 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v51 = v47;
            __int16 v52 = 2112;
            v53 = v19;
            _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Parent group not found to add group in transaction for identifier %@", buf, 0x16u);
          }
          id v48 = objc_alloc_init(MEMORY[0x1E4F69E30]);
          v8[2](v8, v48);

          goto LABEL_25;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v38 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v51 = v38;
          __int16 v52 = 2112;
          v53 = v10;
          _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Added group %@", buf, 0x16u);
        }
        [v33 addGroup:v10];
        [(HMDSettingsController *)v35 settingsHierarchyDidChange];
        if (a3)
        {
          id WeakRetained = objc_loadWeakRetained(v35 + 5);
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __72__HMDSettingsController__handleAddedGroupModel_shouldNotify_completion___block_invoke;
          v49[3] = &unk_1E6A197F0;
          v49[4] = v35;
          [WeakRetained settingsController:v35 didUpdateWithCompletion:v49];
        }
      }
    }
    else
    {
      id v29 = (void *)MEMORY[0x1D9452090]();
      id v30 = a1;
      id v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v51 = v32;
        __int16 v52 = 2112;
        v53 = v7;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode setting group in transaction payload %@", buf, 0x16u);
      }
    }
    v19 = (HMDSettingGroup *)objc_alloc_init(MEMORY[0x1E4F69E30]);
    v8[2](v8, v19);
LABEL_25:
  }
}

void __72__HMDSettingsController__handleAddedGroupModel_shouldNotify_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  SEL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  SEL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Sent group added notification. Error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)loadWithModels:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x1D9452090]();
        id v10 = v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }
        id v12 = v11;

        id v13 = v10;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v14 = v13;
        }
        else {
          int v14 = 0;
        }
        id v15 = v14;

        id v16 = v13;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v17 = v16;
        }
        else {
          id v17 = 0;
        }
        id v18 = v17;

        if (v12)
        {
          -[HMDSettingsController _handleAddedGroupModel:shouldNotify:completion:](self, v12, 0, &__block_literal_global_175);
        }
        else if (v15)
        {
          -[HMDSettingsController _handleAddedSettingModel:shouldNotify:completion:](self, v15, 0, &__block_literal_global_177_79760);
        }
        else if (v18)
        {
          -[HMDSettingsController _handleAddedConstraintModel:shouldNotify:completion:](self, v18, &__block_literal_global_179);
        }
        else
        {
          context = (void *)MEMORY[0x1D9452090]();
          v22 = self;
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            SEL v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v29 = v20;
            __int16 v30 = 2112;
            id v31 = v16;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Unrecognized model type %@", buf, 0x16u);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (self
    && objc_getProperty(self, v4, 48, 1)
    && objc_msgSend(v9, "hmd_isForXPCTransport")
    && objc_msgSend(v9, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    id v7 = [(HMDSettingsController *)self _prunedSettingsGroupByRemovingKeyPathsFromGroup:objc_getProperty(self, v5, 48, 1)];
    if (v7)
    {
      int v8 = objc_msgSend(objc_getProperty(self, v6, 32, 1), "codingKey");
      [v9 encodeObject:v7 forKey:v8];
    }
  }
}

- (id)_prunedSettingsGroupByRemovingKeyPathsFromGroup:(id)a3
{
  return -[HMDSettingsController _cloneGroupFilteringKeyPath:](self, a3);
}

- (HMDSettingGroup)_cloneGroupFilteringKeyPath:(void *)a1
{
  id v4 = a2;
  if (!a1) {
    goto LABEL_4;
  }
  uint64_t v5 = objc_msgSend(objc_getProperty(a1, v3, 32, 1), "keyPathsToPrune");
  uint64_t v6 = [v5 count];

  if (v6)
  {
    int v8 = objc_msgSend(objc_getProperty(a1, v7, 32, 1), "keyPathsToPrune");
    id v9 = [v4 keyPath];
    char v10 = [v8 containsObject:v9];

    if (v10)
    {
LABEL_4:
      id v11 = 0;
      goto LABEL_7;
    }
    id v12 = [MEMORY[0x1E4F1CA48] array];
    id v13 = [MEMORY[0x1E4F1CA48] array];
    int v14 = [v4 groups];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __53__HMDSettingsController__cloneGroupFilteringKeyPath___block_invoke;
    v31[3] = &unk_1E6A0D540;
    v31[4] = a1;
    id v32 = v12;
    id v15 = v12;
    objc_msgSend(v14, "na_each:", v31);

    id v16 = [v4 settings];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    long long v27 = __53__HMDSettingsController__cloneGroupFilteringKeyPath___block_invoke_2;
    __int16 v28 = &unk_1E6A0D568;
    id v29 = a1;
    id v30 = v13;
    id v17 = v13;
    objc_msgSend(v16, "na_each:", &v25);

    id v18 = [HMDSettingGroup alloc];
    v19 = objc_msgSend(v4, "identifier", v25, v26, v27, v28, v29);
    SEL v20 = [v4 parentIdentifier];
    id v21 = [v4 name];
    v22 = (void *)[v15 copy];
    id v23 = (void *)[v17 copy];
    id v11 = [(HMDSettingGroup *)v18 initWithIdentifier:v19 parentIdentifier:v20 name:v21 groups:v22 settings:v23];
  }
  else
  {
    id v11 = (HMDSettingGroup *)v4;
  }
LABEL_7:

  return v11;
}

uint64_t __53__HMDSettingsController__cloneGroupFilteringKeyPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[HMDSettingsController _cloneGroupFilteringKeyPath:](*(void *)(a1 + 32));
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v2 = [*(id *)(a1 + 40) addObject:v2];
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F41817F8](v2, v3);
}

void __53__HMDSettingsController__cloneGroupFilteringKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  if (v3
    && (objc_msgSend(objc_getProperty(v3, v4, 32, 1), "keyPathsToPrune"),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v5 keyPath],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v6 containsObject:v7],
        v7,
        v6,
        !v8))
  {
    id v10 = v5;

    id v9 = v10;
    if (v10)
    {
      [*(id *)(a1 + 40) addObject:v10];
      id v9 = v10;
    }
  }
  else
  {

    id v9 = 0;
  }
}

- (id)migrateSettingsTransactionWithTransaction:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self) {
    id Property = objc_getProperty(self, v6, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  id v12 = v11;
  if (Property)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v51 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Getting Migrating Setting models", buf, 0xCu);
    }
    id v15 = [(HMDSettingsController *)v10 modelsToMigrateSettings];
    if (self) {
      id v16 = objc_getProperty(v10, v14, 48, 1);
    }
    else {
      id v16 = 0;
    }
    uint64_t v44 = [v16 identifier];
    if (self) {
      id v18 = objc_getProperty(v10, v17, 48, 1);
    }
    else {
      id v18 = 0;
    }
    v19 = [v18 parentIdentifier];
    [(HMDSettingsController *)v10 updateRootGroup:0];
    uint64_t v20 = [v15 count];
    id v21 = (void *)MEMORY[0x1D9452090]();
    v22 = v10;
    id v23 = HMFGetOSLogHandle();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v24)
      {
        uint64_t v25 = HMFGetLogIdentifier();
        uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        *(_DWORD *)buf = 138543618;
        v51 = v25;
        __int16 v52 = 2112;
        v53 = v26;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Migrating settings with %@ models", buf, 0x16u);
      }
      if (self) {
        id v28 = objc_getProperty(v22, v27, 32, 1);
      }
      else {
        id v28 = 0;
      }
      id v29 = (void *)v44;
      id v30 = [v28 migrationProvider];
      [v30 applyConditionalValueUpdateToModels:v15];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v31 = v15;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v46 != v34) {
              objc_enumerationMutation(v31);
            }
            [v7 addSettingModel:*(void *)(*((void *)&v45 + 1) + 8 * i)];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v33);
      }

      id v36 = [[HMDSettingRootGroupModel alloc] initWithModelID:v44 parentModelID:v19];
      [v7 addSettingModel:v36];
      id v37 = v7;
    }
    else
    {
      if (v24)
      {
        int v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v51 = v41;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@No new models for settings to migrate", buf, 0xCu);
      }
      if (a4) {
        *a4 = 0;
      }
      id v42 = v7;
      id v29 = (void *)v44;
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v51 = v38;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to migrate settings", buf, 0xCu);
    }
    v39 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    id v15 = v39;
    if (v39) {
      *a4 = v39;
    }
    id v40 = v7;
  }

  return v7;
}

- (id)modelsToMigrateSettings
{
  uint64_t v2 = self;
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (HMDSettingsController *)objc_getProperty(self, a2, 32, 1);
  }
  id v4 = [(HMDSettingsController *)self loadMetadata];
  if (v4)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v3, 32, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v6 = [Property metadataParser];
    id v7 = [v6 modelsFromMetadata:v4];

    if (v7)
    {
      if (v2) {
        id v9 = objc_getProperty(v2, v8, 48, 1);
      }
      else {
        id v9 = 0;
      }
      id v10 = (void *)MEMORY[0x1D9452090]();
      selfa = v2;
      id v11 = HMFGetOSLogHandle();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v12)
        {
          id v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v116 = v13;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Getting new models in metadata for migration", buf, 0xCu);
        }
        v98 = v4;

        v97 = v7;
        id v14 = v7;
        id v15 = v14;
        v96 = v2;
        if (v2)
        {
          id v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v14, "count"));
          id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          id v18 = v15;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v110 objects:buf count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v111;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v111 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(void **)(*((void *)&v110 + 1) + 8 * i);
                BOOL v24 = [v23 hmbModelID];
                [v16 setObject:v23 forKey:v24];

                uint64_t v25 = [v23 hmbParentModelID];
                id v26 = [v17 objectForKey:v25];

                if (!v26)
                {
                  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  long long v27 = [v23 hmbParentModelID];
                  [v17 setObject:v26 forKey:v27];
                }
                id v28 = [v23 hmbModelID];
                [v26 addObject:v28];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v110 objects:buf count:16];
            }
            while (v20);
          }

          p_isa = (id *)&selfa->super.super.isa;
          id v31 = objc_msgSend(objc_getProperty(selfa, v30, 48, 1), "parentIdentifier");
          uint64_t v32 = [v17 objectForKey:v31];
          uint64_t v33 = [v32 allObjects];
          uint64_t v34 = [v33 objectAtIndexedSubscript:0];

          v104 = -[HMDSettingsController _keyPathsToModelInModelIDToModelLookup:parentIDToModelIDsLookup:currentID:currentPath:](v16, v17, v34, &stru_1F2C9F1A8);

          id v36 = objc_getProperty(selfa, v35, 48, 1);
          v95 = -[HMDSettingsController _keyPathsFromGroup:currentPath:](v36, &stru_1F2C9F1A8);
        }
        else
        {

          v104 = 0;
          v95 = 0;
          p_isa = (id *)&selfa->super.super.isa;
        }
        id v37 = -[HMDSettingsController delegate](p_isa);
        v38 = [v37 settingsControllerFollowerKeyPaths:p_isa];

        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        id v39 = v38;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v106 objects:v114 count:16];
        v101 = v39;
        if (v40)
        {
          uint64_t v41 = v40;
          id obj = *(id *)v107;
          do
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(id *)v107 != obj) {
                objc_enumerationMutation(v39);
              }
              uint64_t v43 = *(void *)(*((void *)&v106 + 1) + 8 * j);
              uint64_t v44 = objc_msgSend(@".", "stringByAppendingString:", v43, v95);
              long long v45 = [v104 objectForKeyedSubscript:v44];

              id v46 = v45;
              if ([v46 conformsToProtocol:&unk_1F2E1EA10]) {
                long long v47 = v46;
              }
              else {
                long long v47 = 0;
              }
              id v48 = v47;

              id v49 = [v39 objectForKeyedSubscript:v43];
              id v50 = [p_isa settingForKeyPath:v49];

              if (v48) {
                BOOL v51 = v50 == 0;
              }
              else {
                BOOL v51 = 1;
              }
              if (!v51)
              {
                __int16 v52 = [v50 internalValue];
                uint64_t v53 = [v52 type];
                uint64_t v54 = [v48 type];
                uint64_t v55 = [v54 integerValue];

                id v39 = v101;
                if (v53 == v55)
                {
                  uint64_t v56 = [v48 type];
                  uint64_t v57 = [v56 integerValue];

                  if (v57 == 2)
                  {
                    v58 = (void *)MEMORY[0x1D9452090]();
                    v59 = p_isa;
                    v60 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                    {
                      HMFGetLogIdentifier();
                      v61 = v100 = v58;
                      v62 = [v48 name];
                      v63 = [v50 internalValue];
                      *(_DWORD *)buf = 138543874;
                      v116 = v61;
                      __int16 v117 = 2112;
                      v118 = v62;
                      __int16 v119 = 2112;
                      v120 = v63;
                      _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@Will migrate value of %@ as %@", buf, 0x20u);

                      id v39 = v101;
                      p_isa = (id *)&selfa->super.super.isa;

                      v58 = v100;
                    }

                    v64 = [v50 internalValue];
                    v65 = [v64 numberValue];
                    [v48 setNumberValue:v65];
                  }
                }
              }
            }
            uint64_t v41 = [v39 countByEnumeratingWithState:&v106 objects:v114 count:16];
          }
          while (v41);
        }

        v66 = [v95 allKeys];
        [v104 removeObjectsForKeys:v66];

        id v67 = v104;
        id v105 = v95;
        if (v96)
        {
          v68 = [v67 allKeys];
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          id obja = v68;
          uint64_t v69 = [v68 countByEnumeratingWithState:&v110 objects:buf count:16];
          if (v69)
          {
            uint64_t v70 = v69;
            uint64_t v71 = *(void *)v111;
            do
            {
              for (uint64_t k = 0; k != v70; ++k)
              {
                if (*(void *)v111 != v71) {
                  objc_enumerationMutation(obja);
                }
                v73 = *(void **)(*((void *)&v110 + 1) + 8 * k);
                v74 = objc_msgSend(v67, "valueForKey:", v73, v95);
                v75 = objc_msgSend(v73, "substringToIndex:", objc_msgSend(v73, "rangeOfString:options:", @".", 4));
                v76 = [v105 valueForKey:v75];
                v77 = v76;
                if (v76)
                {
                  v78 = [v76 identifier];
                  uint64_t v79 = [v74 copyWithNewParentModelID:v78];

                  [v67 setValue:v79 forKey:v73];
                  v74 = (void *)v79;
                }
              }
              uint64_t v70 = [obja countByEnumeratingWithState:&v110 objects:buf count:16];
            }
            while (v70);
          }
        }
        v80 = (void *)MEMORY[0x1D9452090]();
        v81 = selfa;
        v82 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          v83 = HMFGetLogIdentifier();
          v84 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "count"));
          *(_DWORD *)buf = 138543618;
          v116 = v83;
          __int16 v117 = 2112;
          v118 = v84;
          _os_log_impl(&dword_1D49D5000, v82, OS_LOG_TYPE_INFO, "%{public}@Found %@ new models in metadata for migration", buf, 0x16u);
        }
        v85 = [v67 allValues];

        id v7 = v97;
        id v4 = v98;
        goto LABEL_66;
      }
      if (v12)
      {
        v93 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v116 = v93;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Settings controller does not have a rootGroup for migration", buf, 0xCu);
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      v90 = v2;
      v91 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        v92 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v116 = v92;
        _os_log_impl(&dword_1D49D5000, v91, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve setting models from parser", buf, 0xCu);
      }
    }
    v85 = 0;
LABEL_66:

    goto LABEL_67;
  }
  v86 = (void *)MEMORY[0x1D9452090]();
  v87 = v2;
  v88 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
  {
    v89 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v116 = v89;
    _os_log_impl(&dword_1D49D5000, v88, OS_LOG_TYPE_ERROR, "%{public}@Unable to load settings metadata from dependency", buf, 0xCu);
  }
  v85 = 0;
LABEL_67:

  return v85;
}

- (id)_keyPathsFromGroup:(void *)a1 currentPath:(void *)a2
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = NSString;
  id v7 = [v3 name];
  int v8 = [v6 stringWithFormat:@"%@.%@", v4, v7];

  [v5 setValue:v3 forKey:v8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v28 = v3;
  id v9 = [v3 settings];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v15 = NSString;
        id v16 = [v14 name];
        id v17 = [v15 stringWithFormat:@"%@.%@", v8, v16];

        [v5 setValue:v14 forKey:v17];
        id v18 = [v14 constraintsByKeyPathWithCurrentKeyPath:v17];
        [v5 addEntriesFromDictionary:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v19 = [v28 groups];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        uint64_t v25 = (void *)[v8 copy];
        id v26 = -[HMDSettingsController _keyPathsFromGroup:currentPath:](v24, v25);
        [v5 addEntriesFromDictionary:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v21);
  }

  return v5;
}

- (id)_keyPathsToModelInModelIDToModelLookup:(void *)a1 parentIDToModelIDsLookup:(void *)a2 currentID:(void *)a3 currentPath:(void *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = [v7 objectForKey:v9];
  id v13 = NSString;
  id v14 = [v12 nameForKeyPath];
  id v15 = [v13 stringWithFormat:@"%@.%@", v10, v14];

  uint64_t v25 = v12;
  [v11 setObject:v12 forKey:v15];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v26 = v9;
  id v16 = [v8 objectForKey:v9];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v22 = (void *)[v15 copy];
        id v23 = -[HMDSettingsController _keyPathsToModelInModelIDToModelLookup:parentIDToModelIDsLookup:currentID:currentPath:](v7, v8, v21, v22);
        [v11 addEntriesFromDictionary:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }

  return v11;
}

- (id)modelsToMakeSettings
{
  uint64_t v2 = self;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (HMDSettingsController *)objc_getProperty(self, a2, 32, 1);
  }
  id v3 = [(HMDSettingsController *)self loadMetadata];
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = v2;
  uint64_t v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating settings models using metadata", (uint8_t *)&v15, 0xCu);
    }
    if (v2) {
      id Property = objc_getProperty(v5, v9, 32, 1);
    }
    else {
      id Property = 0;
    }
    id v11 = [Property metadataParser];
    uint64_t v12 = [v11 modelsFromMetadata:v3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      id v16 = v13;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Could not load any metadata to make settings", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)updateRootGroup:(id)a3
{
  if (self)
  {
    objc_setProperty_atomic(self, a2, a3, 48);
    [(HMDSettingsController *)self settingsHierarchyDidChange];
  }
}

- (id)settingValuesByKeyPathWithPrefix:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = Property;
  id v9 = [v7 dictionary];
  id v10 = -[HMDSettingsController _flattenedSettingControllerRoot:withCurrentPath:andReturnDictionary:](self, v8, v5, v9);

  return v10;
}

- (id)_flattenedSettingControllerRoot:(void *)a3 withCurrentPath:(void *)a4 andReturnDictionary:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (v7)
    {
      if ([v8 length])
      {
        uint64_t v10 = [v8 stringByAppendingString:@"."];

        id v8 = (id)v10;
      }
      id v11 = v8;
      uint64_t v12 = [v7 name];
      id v8 = [v8 stringByAppendingString:v12];

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v13 = [v7 groups];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = (id)-[HMDSettingsController _flattenedSettingControllerRoot:withCurrentPath:andReturnDictionary:](a1, *(void *)(*((void *)&v36 + 1) + 8 * i), v8, v9);
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v15);
      }

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v31 = v7;
      uint64_t v19 = [v7 settings];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            uint64_t v25 = [v24 name];

            if (v25)
            {
              id v26 = [v8 stringByAppendingString:@"."];
              long long v27 = [v24 name];
              long long v28 = [v26 stringByAppendingString:v27];

              long long v29 = [v24 value];
              [v9 setObject:v29 forKeyedSubscript:v28];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v21);
      }

      id v7 = v31;
    }
    a1 = v9;
  }

  return a1;
}

- (void)updateWithValue:(id)a3 onSetting:(id)a4 completion:(id)a5
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  id v109 = 0;
  LODWORD(a5) = [v9 isValidValue:v8 error:&v109];
  id v93 = v109;
  if (!a5)
  {
    v77 = (void *)MEMORY[0x1D9452090]();
    v78 = self;
    uint64_t v79 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      v80 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v113 = v80;
      __int16 v114 = 2112;
      id v115 = v8;
      __int16 v116 = 2112;
      id v117 = v9;
      _os_log_impl(&dword_1D49D5000, v79, OS_LOG_TYPE_ERROR, "%{public}@Received value %@ is not valid for setting %@", buf, 0x20u);
    }
    v81 = v93;
    if (!v93)
    {
      v83 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      v10[2](v10, v83);

      goto LABEL_63;
    }
    v10[2](v10, v93);
    goto LABEL_64;
  }
  int v11 = [v9 wouldValueUpdate:v8];
  uint64_t v12 = (void *)MEMORY[0x1D9452090]();
  id v97 = v9;
  id v13 = HMFGetOSLogHandle();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (v14)
    {
      v82 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v113 = v82;
      __int16 v114 = 2112;
      id v115 = v97;
      __int16 v116 = 2112;
      id v117 = v8;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Skipping update due to setting: %@ matching update setting value: %@", buf, 0x20u);
    }
    v10[2](v10, 0);
    goto LABEL_63;
  }
  if (v14)
  {
    uint64_t v15 = HMFGetLogIdentifier();
    uint64_t v16 = [v97 value];
    *(_DWORD *)buf = 138543874;
    long long v113 = v15;
    __int16 v114 = 2112;
    id v115 = v16;
    __int16 v116 = 2112;
    id v117 = v8;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating value on message from %@ to %@", buf, 0x20u);
  }
  if (self) {
    id Property = objc_getProperty(self, v17, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v19 = Property;
  uint64_t v20 = [v97 identifier];
  uint64_t v21 = [v97 parentIdentifier];
  uint64_t v22 = [v19 settingModelForUpdateWithIdentifier:v20 parentIdentifier:v21 value:v8];

  v91 = (void *)v22;
  if (!v22)
  {
    v84 = (void *)MEMORY[0x1D9452090]();
    v85 = self;
    v86 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      v87 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v113 = v87;
      __int16 v114 = 2112;
      id v115 = v8;
      __int16 v116 = 2112;
      id v117 = v97;
      _os_log_impl(&dword_1D49D5000, v86, OS_LOG_TYPE_ERROR, "%{public}@Failed to create model to update value %@ on setting %@", buf, 0x20u);
    }
    v76 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Created model is nil" reason:@"Unable to create update model" suggestion:0];
    v10[2](v10, v76);
    goto LABEL_62;
  }
  id v23 = -[HMDSettingsController delegate]((id *)&self->super.super.isa);
  uint64_t v24 = [v97 keyPath];
  v92 = [v23 settingsController:self willUpdateSettingAtKeyPath:v24 withValue:v8];

  if (self) {
    id v26 = objc_getProperty(self, v25, 32, 1);
  }
  else {
    id v26 = 0;
  }
  long long v27 = [v26 backingStoreController];
  long long v28 = [v27 settingTransactionWithName:@"Update Setting Value"];

  v96 = v28;
  [v28 addSettingModel:v22];
  if (!v92) {
    goto LABEL_48;
  }
  v88 = v10;
  id v89 = v9;
  id v90 = v8;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v30 = [v92 settingsToUpdate];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v105 objects:v111 count:16];
  v94 = self;
  if (!v31) {
    goto LABEL_38;
  }
  uint64_t v32 = v31;
  uint64_t v95 = *(void *)v106;
  do
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v106 != v95) {
        objc_enumerationMutation(v30);
      }
      long long v34 = *(void **)(*((void *)&v105 + 1) + 8 * v33);
      long long v35 = [v34 keyPath];
      long long v36 = [(HMDSettingsController *)self settingForKeyPath:v35];

      if (!v36)
      {
        BOOL v51 = (void *)MEMORY[0x1D9452090]();
        __int16 v52 = self;
        uint64_t v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          uint64_t v54 = HMFGetLogIdentifier();
          uint64_t v55 = [v34 keyPath];
          *(_DWORD *)buf = 138543874;
          long long v113 = v54;
          __int16 v114 = 2112;
          id v115 = v55;
          __int16 v116 = 2112;
          id v117 = v97;
          uint64_t v56 = v53;
          uint64_t v57 = "%{public}@Failed to find related constrained setting at keyPath %@ on setting update for %@";
          goto LABEL_28;
        }
LABEL_29:

        goto LABEL_34;
      }
      long long v37 = [v34 settingValue];
      char v38 = [v36 isValidValue:v37 error:0];

      if ((v38 & 1) == 0)
      {
        BOOL v51 = (void *)MEMORY[0x1D9452090]();
        __int16 v52 = self;
        uint64_t v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          uint64_t v54 = HMFGetLogIdentifier();
          uint64_t v55 = [v34 settingValue];
          *(_DWORD *)buf = 138543874;
          long long v113 = v54;
          __int16 v114 = 2112;
          id v115 = v55;
          __int16 v116 = 2112;
          id v117 = v36;
          uint64_t v56 = v53;
          uint64_t v57 = "%{public}@Provided setting value %@ is not valid for constrained setting %@";
LABEL_28:
          _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_ERROR, v57, buf, 0x20u);
        }
        goto LABEL_29;
      }
      if (self) {
        id v40 = objc_getProperty(self, v39, 32, 1);
      }
      else {
        id v40 = 0;
      }
      id v41 = v40;
      uint64_t v42 = [v36 identifier];
      uint64_t v43 = [v36 parentIdentifier];
      uint64_t v44 = [v34 settingValue];
      long long v45 = [v41 settingModelForUpdateWithIdentifier:v42 parentIdentifier:v43 value:v44];

      id v46 = (void *)MEMORY[0x1D9452090]();
      if (v45)
      {
        id v47 = v97;
        id v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          id v49 = HMFGetLogIdentifier();
          id v50 = [v34 settingValue];
          *(_DWORD *)buf = 138543874;
          long long v113 = v49;
          __int16 v114 = 2112;
          id v115 = v45;
          __int16 v116 = 2112;
          id v117 = v50;
          _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@Added additional setting model %@ update with value %@", buf, 0x20u);
        }
        [v96 addSettingModel:v45];
      }
      else
      {
        v58 = v94;
        v59 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = HMFGetLogIdentifier();
          v61 = [v34 settingValue];
          *(_DWORD *)buf = 138543874;
          long long v113 = v60;
          __int16 v114 = 2112;
          id v115 = v61;
          __int16 v116 = 2112;
          id v117 = 0;
          _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to create model to update value %@ on constrained setting %@", buf, 0x20u);
        }
      }

      self = v94;
LABEL_34:

      ++v33;
    }
    while (v32 != v33);
    uint64_t v62 = [v30 countByEnumeratingWithState:&v105 objects:v111 count:16];
    uint64_t v32 = v62;
  }
  while (v62);
LABEL_38:

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v63 = [v92 modelsToUpdate];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v101 objects:v110 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v102 != v66) {
          objc_enumerationMutation(v63);
        }
        v68 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        uint64_t v69 = (void *)MEMORY[0x1D9452090]();
        id v70 = v97;
        uint64_t v71 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          v72 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          long long v113 = v72;
          __int16 v114 = 2112;
          id v115 = v68;
          __int16 v116 = 2112;
          id v117 = v97;
          _os_log_impl(&dword_1D49D5000, v71, OS_LOG_TYPE_INFO, "%{public}@Added additional model %@ to update when updating setting %@", buf, 0x20u);
        }
        [v96 addModel:v68];
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v101 objects:v110 count:16];
    }
    while (v65);
  }

  id v9 = v89;
  id v8 = v90;
  uint64_t v10 = v88;
  self = v94;
LABEL_48:
  if (self) {
    id v73 = objc_getProperty(self, v29, 32, 1);
  }
  else {
    id v73 = 0;
  }
  v74 = [v73 backingStoreController];
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __62__HMDSettingsController_updateWithValue_onSetting_completion___block_invoke;
  v98[3] = &unk_1E6A17D78;
  id v99 = v92;
  v100 = v10;
  id v75 = v92;
  v76 = v96;
  [v74 runSettingTransaction:v96 completion:v98];

LABEL_62:
LABEL_63:
  v81 = v93;
LABEL_64:
}

void __62__HMDSettingsController_updateWithValue_onSetting_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!v5)
  {
    id v3 = [*(id *)(a1 + 32) onCommitCompletion];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) onCommitCompletion];
      v4[2]();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateWithEncodedValue:(id)a3 onSettingKeyPath:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  int v11 = [(HMDSettingsController *)self settingForKeyPath:v9];
  uint64_t v12 = v11;
  if (!v11)
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    uint64_t v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v22;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", buf, 0x16u);
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 2;
    goto LABEL_9;
  }
  if ([v11 isReadOnly])
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    BOOL v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v16;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Setting is read only as we do not understand it %@", buf, 0x16u);
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 5;
LABEL_9:
    id v23 = [v17 hmfErrorWithCode:v18];
    v10[2](v10, v23);
    goto LABEL_16;
  }
  id v30 = 0;
  uint64_t v24 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v30];
  id v23 = v30;
  if (v24)
  {
    [(HMDSettingsController *)self updateWithValue:v24 onSetting:v12 completion:v10];
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x1D9452090]();
    id v26 = self;
    long long v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v28;
      __int16 v33 = 2112;
      id v34 = v23;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive setting value from encoded value: %@", buf, 0x16u);
    }
    long long v29 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    v10[2](v10, v29);
  }
LABEL_16:
}

- (id)settingForKeyPath:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v8 = [Property groups];
  if (self) {
    id v9 = objc_getProperty(self, v7, 48, 1);
  }
  else {
    id v9 = 0;
  }
  uint64_t v10 = [v9 settings];
  int v11 = -[HMDSettingsController _settingForKeyPathWithGroups:settings:keyPath:](self, v8, v10, v5);

  return v11;
}

- (id)_settingForKeyPathWithGroups:(void *)a3 settings:(void *)a4 keyPath:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v15 = [v14 keyPath];
          char v16 = [v15 isEqualToString:v8];

          if (v16)
          {
            a1 = v14;
            goto LABEL_21;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v27;
    uint64_t v17 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v9);
          }
          uint64_t v21 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          uint64_t v22 = [v21 keyPath];
          char v23 = [v8 containsString:v22];

          if (v23)
          {
            uint64_t v24 = [v21 groups];
            uint64_t v25 = [v21 settings];
            -[HMDSettingsController _settingForKeyPathWithGroups:settings:keyPath:](a1, v24, v25, v8);
            a1 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_21;
          }
        }
        uint64_t v18 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    a1 = 0;
LABEL_21:
  }
  return a1;
}

- (NSArray)allObjectIdentifiers
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self)
  {
    id v5 = objc_msgSend(objc_getProperty(self, v3, 56, 1), "keyEnumerator");
    uint64_t v6 = [v5 allObjects];
    [v4 addObjectsFromArray:v6];

    id Property = objc_getProperty(self, v7, 64, 1);
  }
  else
  {
    id v13 = [0 keyEnumerator];
    BOOL v14 = [v13 allObjects];
    [v4 addObjectsFromArray:v14];

    id Property = 0;
  }
  id v9 = [Property keyEnumerator];
  uint64_t v10 = [v9 allObjects];
  [v4 addObjectsFromArray:v10];

  uint64_t v11 = (void *)[v4 copy];
  return (NSArray *)v11;
}

- (void)configure
{
  uint64_t v2 = self;
  if (self)
  {
    os_unfair_lock_lock_with_options();
    v2->_BOOL isInitialized = 1;
    os_unfair_lock_unlock(&v2->_lock);
    self = (HMDSettingsController *)objc_getProperty(v2, v3, 32, 1);
  }
  id v4 = [(HMDSettingsController *)self backingStoreController];
  [v4 registerForSettingsTransactions:v2];

  id v5 = -[HMDSettingsController delegate]((id *)&v2->super.super.isa);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__HMDSettingsController_configure__block_invoke;
  v6[3] = &unk_1E6A197F0;
  v6[4] = v2;
  [v5 settingsController:v2 didUpdateWithCompletion:v6];
}

void __34__HMDSettingsController_configure__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    SEL v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Updated settings on configure.", (uint8_t *)&v8, 0xCu);
  }
}

- (id)logIdentifier
{
  if (self)
  {
    self = (HMDSettingsController *)objc_getProperty(self, a2, 32, 1);
    uint64_t v2 = vars8;
  }
  return [(HMDSettingsController *)self logIdentifier];
}

- (HMDSettingsController)initWithDependency:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDSettingsController;
  id v9 = [(HMDSettingsController *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_dependency, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    uint64_t v11 = [v7 messageHandler];
    messageHandler = v10->_messageHandler;
    v10->_messageHandler = (HMDSettingsMessageHandlerProtocol *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    groupsMap = v10->_groupsMap;
    v10->_groupsMap = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    settingsMap = v10->_settingsMap;
    v10->_settingsMap = (NSMapTable *)v15;

    [v7 setTransactionReceiver:v10];
    uint64_t v17 = [v7 parentIdentifier];
    userUUID = v10->_userUUID;
    v10->_userUUID = (NSUUID *)v17;
  }
  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_79820 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_79820, &__block_literal_global_79821);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_79822;
  return v2;
}

uint64_t __36__HMDSettingsController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_79822;
  logCategory__hmf_once_v1_79822 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
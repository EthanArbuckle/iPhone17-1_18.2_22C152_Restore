@interface HMDCompositeSettingsController
+ (id)logCategory;
- (BOOL)configured;
- (HMDCompositeSettingsController)initWithDatabaseAdapter:(id)a3 model:(Class)a4 homeUUID:(id)a5 ownerUUID:(id)a6 logEventSubmitter:(id)a7 settingKeyPathBlockList:(id)a8;
- (HMDCompositeSettingsController)initWithDatabaseAdapter:(id)a3 model:(Class)a4 homeUUID:(id)a5 ownerUUID:(id)a6 settingKeyPathBlockList:(id)a7;
- (HMDCompositeSettingsControllerDelegate)delegate;
- (HMDCompositeSettingsZoneManager)zoneManager;
- (NSUUID)homeUUID;
- (NSUUID)uuid;
- (id)_metricSubmittingSingleFetchCompletionFromCompletion:(void *)a1;
- (id)_metricSubmittingSingleUpdateCompletionFromCompletion:(void *)a1;
- (id)_migrateUpdatedSettings:(void *)a1;
- (id)_settingFromSetting:(id)a3 value:(id)a4 error:(id *)a5;
- (id)emptyModelForTransaction;
- (id)fetchSynchronousSettingsForKeyPaths:(id)a3 callerVersion:(id)a4 callerPrivilege:(unint64_t)a5;
- (id)logIdentifier;
- (void)_createSettingsFromModel:(id)a3;
- (void)_fetchSettingForKeyPath:(void *)a3 callerVersion:(uint64_t)a4 callerPrivilege:(void *)a5 completion:;
- (void)_handleModelCreationOrUpdate:(void *)a1;
- (void)database:(id)a3 didConfigureWithError:(id)a4;
- (void)database:(id)a3 didProcessCreationForModel:(id)a4;
- (void)database:(id)a3 didProcessDeletionForModel:(id)a4;
- (void)database:(id)a3 didProcessUpdateForModel:(id)a4;
- (void)fetchSettingForKeyPath:(id)a3 callerVersion:(id)a4 callerPrivilege:(unint64_t)a5 completion:(id)a6;
- (void)fetchSettingsForKeyPaths:(id)a3 callerVersion:(id)a4 callerPrivilege:(unint64_t)a5 completion:(id)a6;
- (void)setConfigured:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setZoneManager:(id)a3;
- (void)start;
- (void)updateSettingForKeyPath:(id)a3 value:(id)a4 callerVersion:(id)a5 completion:(id)a6;
- (void)updateSettingsForKeyPaths:(id)a3 callerVersion:(id)a4 completion:(id)a5;
@end

@implementation HMDCompositeSettingsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_zoneManager);
  objc_storeStrong((id *)&self->_databaseAdapter, 0);
  objc_storeStrong((id *)&self->_settingKeyPathBlockList, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)setZoneManager:(id)a3
{
}

- (HMDCompositeSettingsZoneManager)zoneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoneManager);
  return (HMDCompositeSettingsZoneManager *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMDCompositeSettingsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCompositeSettingsControllerDelegate *)WeakRetained;
}

- (void)database:(id)a3 didConfigureWithError:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)v32 = 138543618;
      *(void *)&v32[4] = v12;
      *(_WORD *)&v32[12] = 2112;
      *(void *)&v32[14] = v8;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error configuring database adapter: %@", v32, 0x16u);
    }
  }
  else
  {
    if (self)
    {
      id v14 = objc_getProperty(self, v7, 64, 1);
      if (v14)
      {
        v15 = objc_msgSend(objc_getProperty(self, v13, 64, 1), "queue");
        dispatch_assert_queue_V2(v15);

        id v17 = objc_getProperty(self, v16, 64, 1);
        v18 = [(HMDCompositeSettingsController *)self uuid];
        v19 = [v17 fetchModelWithID:v18];

        if (!v19)
        {
          v19 = [(HMDCompositeSettingsController *)self emptyModelForTransaction];
        }
        v21 = -[HMDCompositeSettingsController _migrateUpdatedSettings:](self, v19);
        *(void *)v32 = MEMORY[0x1E4F143A8];
        *(void *)&v32[8] = 3221225472;
        *(void *)&v32[16] = __59__HMDCompositeSettingsController__migrateAndCreateSettings__block_invoke;
        v33 = &unk_1E6A19730;
        v34 = self;
        id v35 = v19;
        id v22 = v19;
        v23 = [v21 addSuccessBlock:v32];
      }
      else
      {
        v24 = (void *)MEMORY[0x1D9452090]();
        v25 = self;
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v37 = v27;
          _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Nil database adapter (_migrateAndCreateSettings)", buf, 0xCu);
        }
        v23 = 0;
      }

      id Property = objc_getProperty(self, v28, 64, 1);
    }
    else
    {
      id Property = 0;
    }
    id v30 = Property;
    v31 = [(HMDCompositeSettingsController *)self uuid];
    [v30 startObservingModelWithID:v31];
  }
}

- (id)emptyModelForTransaction
{
  id v3 = objc_getProperty(a1, a2, 64, 1);
  v4 = [a1 uuid];
  v5 = [a1 uuid];
  v7 = objc_msgSend(v3, "emptyModelWithID:parentModelID:modelClass:", v4, v5, objc_getProperty(a1, v6, 40, 1));

  return v7;
}

- (id)_migrateUpdatedSettings:(void *)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v6 = objc_getProperty(a1, v4, 64, 1);
  if (v6)
  {
    v7 = objc_msgSend(objc_getProperty(a1, v5, 64, 1), "queue");
    dispatch_assert_queue_V2(v7);

    id v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    v9 = [v3 keyPathsToSettingsForMigration];
    v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = a1;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v32 = v13;
      __int16 v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Settings to migrate: %@", buf, 0x16u);
    }
    if ([v9 count])
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke;
      v28[3] = &unk_1E6A0D600;
      id v14 = v3;
      id v29 = v14;
      id v30 = v11;
      objc_msgSend(v9, "na_each:", v28);
      v15 = (void *)MEMORY[0x1E4F7A0D8];
      uint64_t v26 = MEMORY[0x1E4F143A8];
      id v27 = v14;
      SEL v16 = (void *)MEMORY[0x1E4F7A0F0];
      v18 = objc_msgSend(objc_getProperty(v11, v17, 64, 1), "queue", v26, 3221225472, __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke_31, &unk_1E6A15F48, v11);
      v19 = [v16 schedulerWithDispatchQueue:v18];
      id v20 = [v15 futureWithBlock:&v26 scheduler:v19];
    }
    else
    {
      id v20 = v8;
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = a1;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Nil database adapter (_migrateUpdatedSettings)", buf, 0xCu);
    }
    id v20 = 0;
  }

  return v20;
}

uint64_t __59__HMDCompositeSettingsController__migrateAndCreateSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createSettingsFromModel:*(void *)(a1 + 40)];
}

void __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  id v14 = 0;
  [v7 setSetting:v6 forKeyPath:v5 withError:&v14];
  id v8 = v14;
  v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = *(id *)(a1 + 40);
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    SEL v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating setting on model: %@, setting: %@", buf, 0x20u);
  }
}

void __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke_31(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    id Property = objc_getProperty(v5, v3, 64, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke_2;
  v9[3] = &unk_1E6A197F0;
  id v10 = v4;
  id v8 = v4;
  [Property addModel:v7 withOptionsLabel:@"HMDCompositeSettingController Migrate UninitializedSettings" completion:v9];
}

void __58__HMDCompositeSettingsController__migrateUpdatedSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 finishWithError:a2];
  }
  else
  {
    NAEmptyResult();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v2 finishWithResult:v4];
  }
}

- (void)database:(id)a3 didProcessDeletionForModel:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self)
  {
    id v7 = objc_getProperty(self, v5, 64, 1);
    id v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    id v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        v12 = HMFGetLogIdentifier();
        int v20 = 138543618;
        uint64_t v21 = v12;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Processing  model deletion, model:%@", (uint8_t *)&v20, 0x16u);
      }
      id v14 = objc_getProperty(v9, v13, 64, 1);
      v15 = [(HMDCompositeSettingsController *)v9 uuid];
      [v14 stopObservingModelWithID:v15];

      SEL v16 = (void *)MEMORY[0x1E4F1CC08];
      objc_setProperty_atomic_copy(v9, v17, MEMORY[0x1E4F1CC08], 24);
      objc_setProperty_atomic_copy(v9, v18, v16, 32);
    }
    else
    {
      if (v11)
      {
        __int16 v19 = HMFGetLogIdentifier();
        int v20 = 138543362;
        uint64_t v21 = v19;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Nil database adapter (_handleModelDeletion)", (uint8_t *)&v20, 0xCu);
      }
    }
  }
}

- (void)database:(id)a3 didProcessUpdateForModel:(id)a4
{
}

- (void)_handleModelCreationOrUpdate:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id v5 = objc_msgSend(objc_getProperty(a1, v3, 64, 1), "rawDatabase");
    if (v5)
    {
      id v6 = -[HMDCompositeSettingsController _migrateUpdatedSettings:](a1, v4);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63__HMDCompositeSettingsController__handleModelCreationOrUpdate___block_invoke;
      v12[3] = &unk_1E6A12A80;
      v12[4] = a1;
      id v13 = v4;
      id v7 = (id)[v6 addCompletionBlock:v12];
    }
    else
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = a1;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        BOOL v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v15 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Nil database (_handleModelCreationOrUpdate)", buf, 0xCu);
      }
    }
  }
}

uint64_t __63__HMDCompositeSettingsController__handleModelCreationOrUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createSettingsFromModel:*(void *)(a1 + 40)];
}

- (void)database:(id)a3 didProcessCreationForModel:(id)a4
{
}

- (id)_settingFromSetting:(id)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (!v11)
  {
    v140 = a5;
    id v143 = v9;
    id v22 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
    id v24 = v23;

    id v146 = v24;
    if (v24)
    {
      id v25 = v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 0;
      }
      id v27 = v26;

      if (v27)
      {
        SEL v28 = [HMDCompositeStringSetting alloc];
        id v29 = [v27 stringValue];
        id v30 = [v146 readVersion];
        v31 = [v30 versionString];
        [v146 writeVersion];
        __int16 v33 = v32 = v8;
        v34 = [v33 versionString];
        self = [(HMDCompositeStringSetting *)v28 initWithValue:v29 readVersion:v31 writeVersion:v34];

        id v8 = v32;
        id v11 = 0;

        id v13 = 0;
        id v35 = v27;
      }
      else
      {
        id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:19, @"Invalid string setting value", 0, @"Setting type is String, please pass a String value" description reason suggestion];
        v65 = (void *)MEMORY[0x1D9452090]();
        v66 = self;
        v67 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          v68 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v148 = v68;
          __int16 v149 = 2112;
          id v150 = v13;
          _os_log_impl(&dword_1D49D5000, v67, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
        }
        if (v140)
        {
          id v13 = v13;
          id v35 = 0;
          self = 0;
          id *v140 = v13;
        }
        else
        {
          id v35 = 0;
          self = 0;
        }
      }
    }
    else
    {
      id v41 = v22;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v42 = v41;
      }
      else {
        v42 = 0;
      }
      id v43 = v42;

      if (v43)
      {
        id v44 = v9;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v45 = v44;
        }
        else {
          v45 = 0;
        }
        id v46 = v45;

        if (v46)
        {
          v47 = [HMDCompositeBoolSetting alloc];
          uint64_t v48 = [v46 BOOLValue];
          id v49 = v43;
          v50 = [v43 readVersion];
          v51 = [v50 versionString];
          [v43 writeVersion];
          v53 = id v52 = v8;
          v54 = [v53 versionString];
          uint64_t v55 = v48;
          id v35 = v49;
          self = [(HMDCompositeBoolSetting *)v47 initWithValue:v55 readVersion:v51 writeVersion:v54];

          id v8 = v52;
          id v11 = 0;

          id v13 = 0;
        }
        else
        {
          id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:19, @"Invalid BOOL setting value", 0, @"Setting type is Bool, please pass a Bool value" description reason suggestion];
          v91 = (void *)MEMORY[0x1D9452090]();
          v92 = self;
          v93 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            v94 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v148 = v94;
            __int16 v149 = 2112;
            id v150 = v13;
            _os_log_impl(&dword_1D49D5000, v93, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
          }
          id v35 = v43;
          if (v140)
          {
            id v13 = v13;
            id v46 = 0;
            self = 0;
            id *v140 = v13;
          }
          else
          {
            id v46 = 0;
            self = 0;
          }
        }
      }
      else
      {
        id v69 = v41;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v70 = v69;
        }
        else {
          v70 = 0;
        }
        id v71 = v70;

        v135 = v71;
        if (v71)
        {
          id v72 = v9;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v73 = v72;
          }
          else {
            v73 = 0;
          }
          id v74 = v73;

          id v13 = 0;
          if (!v74)
          {
            id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:19, @"Invalid Number setting value", 0, @"Setting type is Number, please pass a Number value" description reason suggestion];
            v75 = (void *)MEMORY[0x1D9452090]();
            v76 = self;
            v77 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              v78 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v148 = v78;
              __int16 v149 = 2112;
              id v150 = v13;
              _os_log_impl(&dword_1D49D5000, v77, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
            }
            if (v140)
            {
              id v13 = v13;
              id *v140 = v13;
            }
          }
          v79 = [HMDCompositeNumberSetting alloc];
          v80 = [v74 numberValue];
          v81 = [v135 readVersion];
          v82 = [v81 versionString];
          [v135 writeVersion];
          v84 = id v83 = v8;
          v85 = [v84 versionString];
          self = [(HMDCompositeNumberSetting *)v79 initWithValue:v80 readVersion:v82 writeVersion:v85];

          id v8 = v83;
          id v11 = 0;
          id v9 = v143;
        }
        else
        {
          id v95 = v69;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v96 = v95;
          }
          else {
            v96 = 0;
          }
          id v97 = v96;

          if (v97)
          {
            v137 = v97;
            id v145 = v8;
            id v98 = v9;
            if ([v98 conformsToProtocol:&unk_1F2E11838]) {
              v99 = v98;
            }
            else {
              v99 = 0;
            }
            id v100 = v99;

            id v13 = 0;
            if (!v100)
            {
              id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:19, @"Invalid Language setting value", 0, @"Setting type is Language, please pass a Language value" description reason suggestion];
              v101 = (void *)MEMORY[0x1D9452090]();
              v102 = self;
              v103 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              {
                v104 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v148 = v104;
                __int16 v149 = 2112;
                id v150 = v13;
                _os_log_impl(&dword_1D49D5000, v103, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
              }
              if (v140)
              {
                id v13 = v13;
                id *v140 = v13;
              }
            }
            v131 = [HMDCompositeLanguageSetting alloc];
            v141 = [v100 inputLanguageCode];
            v129 = [v100 outputVoiceLanguageCode];
            v105 = [v100 outputVoiceGenderCode];
            uint64_t v106 = [v100 voiceName];
            v130 = [v137 readVersion];
            [v130 versionString];
            v107 = v132 = v100;
            v108 = [v137 writeVersion];
            v109 = [v108 versionString];
            v110 = (void *)v106;
            self = [(HMDCompositeLanguageSetting *)v131 initWithInputLanguage:v141 outputVoiceLanguageCode:v129 outputVoiceGenderCode:v105 voiceName:v106 readVersion:v107 writeVersion:v109];

            id v74 = v137;
            id v8 = v145;
          }
          else
          {
            id v118 = v8;
            id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:19 description:@"trying to create an invalid setting from value" reason:0 suggestion:0];
            v119 = (void *)MEMORY[0x1D9452090]();
            v120 = self;
            v121 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
            {
              v122 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v148 = v122;
              __int16 v149 = 2112;
              id v150 = v13;
              _os_log_impl(&dword_1D49D5000, v121, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
            }
            if (v140)
            {
              id v13 = v13;
              id v74 = 0;
              self = 0;
              id *v140 = v13;
            }
            else
            {
              id v74 = 0;
              self = 0;
            }
            id v8 = v118;
          }
        }

        id v35 = 0;
        id v46 = v135;
      }
    }
    goto LABEL_106;
  }
  id v144 = v8;
  id v146 = v8;
  id v12 = v11;
  id v13 = v12;
  if (self)
  {
    uint64_t v14 = [v12 type];
    if ((unint64_t)(v14 - 1) >= 2)
    {
      id v35 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Unable to derived setting" reason:@"unknown version type" suggestion:0];
      v36 = (void *)MEMORY[0x1D9452090]();
      v37 = self;
      uint64_t v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = HMFGetLogIdentifier();
        v40 = HMSettingVersionValueTypeAsString();
        *(_DWORD *)buf = 138543874;
        v148 = v39;
        __int16 v149 = 2112;
        id v150 = v40;
        __int16 v151 = 2112;
        id v152 = v35;
        _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive setting due to unknown version value type: %@ error: %@", buf, 0x20u);
      }
      if (a5)
      {
        id v35 = v35;
        self = 0;
        *a5 = v35;
      }
      else
      {
        self = 0;
      }
      goto LABEL_105;
    }
    v139 = a5;
    v15 = [v146 readVersion];
    uint64_t v16 = [v15 versionString];

    SEL v17 = [v146 writeVersion];
    SEL v18 = [v17 versionString];

    if (v14 == 2)
    {
      __int16 v19 = [v13 version];
      uint64_t v56 = [v19 versionString];
      uint64_t v21 = v18;
      SEL v18 = (void *)v56;
    }
    else
    {
      if (v14 != 1)
      {
        v138 = (void *)v16;
        goto LABEL_36;
      }
      __int16 v19 = [v13 version];
      uint64_t v20 = [v19 versionString];
      uint64_t v21 = (void *)v16;
      uint64_t v16 = v20;
    }
    v138 = (void *)v16;

LABEL_36:
    id v57 = v146;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v58 = v57;
    }
    else {
      v58 = 0;
    }
    id v59 = v58;

    if (v59)
    {
      v60 = [HMDCompositeStringSetting alloc];
      v61 = [v59 stringValue];
      id v35 = v138;
      self = [(HMDCompositeStringSetting *)v60 initWithValue:v61 readVersion:v138 writeVersion:v18];
    }
    else
    {
      id v62 = v57;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v63 = v62;
      }
      else {
        v63 = 0;
      }
      id v64 = v63;

      if (v64)
      {
        id v35 = v138;
        self = -[HMDCompositeBoolSetting initWithValue:readVersion:writeVersion:]([HMDCompositeBoolSetting alloc], "initWithValue:readVersion:writeVersion:", [v64 BOOLValue], v138, v18);
      }
      else
      {
        id v86 = v62;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v87 = v86;
        }
        else {
          v87 = 0;
        }
        id v88 = v87;

        if (v88)
        {
          v89 = [HMDCompositeNumberSetting alloc];
          v90 = [v88 numberValue];
          id v35 = v138;
          self = [(HMDCompositeNumberSetting *)v89 initWithValue:v90 readVersion:v138 writeVersion:v18];
        }
        else
        {
          id v111 = v86;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v112 = v111;
          }
          else {
            v112 = 0;
          }
          id v113 = v112;

          if (v113)
          {
            v136 = [HMDCompositeLanguageSetting alloc];
            v142 = [v113 inputLanguageCode];
            v133 = [v113 outputVoiceLanguageCode];
            v114 = [v113 outputVoiceGenderCode];
            [v113 voiceName];
            v116 = id v115 = v113;
            id v35 = v138;
            self = [(HMDCompositeLanguageSetting *)v136 initWithInputLanguage:v142 outputVoiceLanguageCode:v133 outputVoiceGenderCode:v114 voiceName:v116 readVersion:v138 writeVersion:v18];

            v117 = v115;
            id v88 = 0;
          }
          else
          {
            id v134 = v111;
            v123 = [MEMORY[0x1E4F28C58] hmErrorWithCode:19 description:@"Unable to derived setting" reason:@"unknown setting type" suggestion:0];
            v124 = (void *)MEMORY[0x1D9452090]();
            v125 = self;
            v126 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
            {
              v127 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v148 = v127;
              __int16 v149 = 2112;
              id v150 = v134;
              __int16 v151 = 2112;
              id v152 = v123;
              _os_log_impl(&dword_1D49D5000, v126, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive setting due to unknown setting object type: %@ error: %@", buf, 0x20u);
            }
            id v35 = v138;
            if (v139) {
              id *v139 = v123;
            }

            self = 0;
            v117 = 0;
            id v88 = 0;
          }
        }
        id v64 = 0;
      }
    }
LABEL_105:
    id v8 = v144;
LABEL_106:
  }
  return self;
}

- (void)updateSettingsForKeyPaths:(id)a3 callerVersion:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[HMDCompositeSettingsController _metricSubmittingSingleUpdateCompletionFromCompletion:](self, v10);
  id v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  if ([v8 count])
  {
    if (self) {
      id Property = objc_getProperty(self, v12, 64, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v14 = [Property rawDatabase];
    if (v14)
    {
      uint64_t v16 = (HMDCompositeSettingOperationResult *)v14;
      if (self) {
        id v17 = objc_getProperty(self, v15, 64, 1);
      }
      else {
        id v17 = 0;
      }
      SEL v18 = [v17 queue];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __85__HMDCompositeSettingsController_updateSettingsForKeyPaths_callerVersion_completion___block_invoke;
      v29[3] = &unk_1E6A18398;
      v29[4] = self;
      id v30 = v8;
      id v31 = v9;
      id v32 = v11;
      dispatch_async(v18, v29);
    }
    else
    {
      id v23 = (void *)MEMORY[0x1D9452090]();
      id v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v34 = v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Nil database (updateSettingsForKeyPaths)", buf, 0xCu);
      }
      id v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      SEL v28 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:@"onboardingSettings" setting:0 metadata:0 error:v27];
      ((void (**)(void, HMDCompositeSettingOperationResult *))v11)[2](v11, v28);

      uint64_t v16 = 0;
    }
  }
  else
  {
    __int16 v19 = (void *)MEMORY[0x1D9452090]();
    uint64_t v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v34 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@settings is empty", buf, 0xCu);
    }
    uint64_t v16 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:@"onboardingSettings" setting:0 metadata:0 error:0];
    ((void (**)(void, HMDCompositeSettingOperationResult *))v11)[2](v11, v16);
  }
}

- (id)_metricSubmittingSingleUpdateCompletionFromCompletion:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x1E4F6A278] currentTime];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__HMDCompositeSettingsController__metricSubmittingSingleUpdateCompletionFromCompletion___block_invoke;
    aBlock[3] = &unk_1E6A13A60;
    aBlock[4] = a1;
    uint64_t v8 = v4;
    id v7 = v3;
    a1 = _Block_copy(aBlock);
  }
  return a1;
}

void __85__HMDCompositeSettingsController_updateSettingsForKeyPaths_callerVersion_completion___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  id v54 = *(id *)(a1 + 40);
  id v58 = v2;
  v60 = v3;
  if (!v1) {
    goto LABEL_47;
  }
  id v5 = objc_msgSend(objc_getProperty(v1, v4, 64, 1), "queue");
  dispatch_assert_queue_V2(v5);

  if (!v54)
  {
    _HMFPreconditionFailure();
    goto LABEL_49;
  }
  if (!v58)
  {
LABEL_49:
    _HMFPreconditionFailure();
LABEL_50:
    _HMFPreconditionFailure();
  }
  if (!v60) {
    goto LABEL_50;
  }
  v53 = objc_msgSend(objc_getProperty(v1, v6, 64, 1), "rawDatabase");
  if (v53)
  {
    uint64_t v55 = [(HMDCompositeSettingsController *)v1 emptyModelForTransaction];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = v54;
    uint64_t v59 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (!v59)
    {
      id v8 = 0;
      goto LABEL_40;
    }
    id v8 = 0;
    uint64_t v57 = *(void *)v66;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v66 != v57) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v65 + 1) + 8 * v9);
        id v11 = [v10 keyPath];
        id v13 = objc_msgSend(objc_getProperty(v1, v12, 24, 1), "objectForKeyedSubscript:", v11);
        if (!v13)
        {
          id v44 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21 description:@"Setting has not been configured yet (no current setting)" reason:0 suggestion:0];

          uint64_t v48 = (void *)MEMORY[0x1D9452090]();
          id v49 = v1;
          v50 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v51 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v51;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v44;
            _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);
          }
          id v52 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v11 setting:0 metadata:0 error:v44];
          v60[2](v60, v52);

          goto LABEL_45;
        }
        uint64_t v14 = [v10 value];
        id v64 = v8;
        v15 = [v1 _settingFromSetting:v13 value:v14 error:&v64];
        id v16 = v64;

        if (v15)
        {
          id v17 = [v13 writeVersion];
          int v18 = [v17 isGreaterThanVersion:v58];

          if (v18)
          {
            id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10 description:@"Write version does not meet the minimum" reason:0 suggestion:0];

            uint64_t v20 = (void *)MEMORY[0x1D9452090]();
            id v21 = v1;
            id v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              id v23 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v23;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v8;
              _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);
            }
            id v24 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v11 setting:0 metadata:0 error:v8];
            v60[2](v60, v24);
            goto LABEL_29;
          }
          objc_msgSend(objc_getProperty(v1, v19, 32, 1), "objectForKeyedSubscript:", v11);
          id v30 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
          id v24 = v30;
          if (v30)
          {
            id v31 = [(HMDCompositeSettingOperationResult *)v30 constraint];
            id v32 = [v10 value];
            id v63 = v16;
            [v31 isValidValue:v32 error:&v63];
            id v8 = v63;

            if (v8)
            {
              __int16 v33 = (void *)MEMORY[0x1D9452090]();
              id v34 = v1;
              uint64_t v35 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
LABEL_27:
                v37 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v37;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v8;
                _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);
              }
LABEL_28:

              uint64_t v38 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v11 setting:0 metadata:0 error:v8];
              v60[2](v60, v38);

LABEL_29:
              int v29 = 0;
              goto LABEL_30;
            }
            id v16 = 0;
          }
          id v62 = v16;
          [(HMDCompositeSettingOperationResult *)v55 setSetting:v15 forKeyPath:v11 withError:&v62];
          id v8 = v62;

          if (v8)
          {
            __int16 v33 = (void *)MEMORY[0x1D9452090]();
            id v36 = v1;
            uint64_t v35 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              goto LABEL_27;
            }
            goto LABEL_28;
          }
          int v29 = 1;
        }
        else
        {
          id v25 = (void *)MEMORY[0x1D9452090]();
          id v26 = v1;
          id v27 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            SEL v28 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v28;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v16;
            _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);
          }
          id v24 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v11 setting:0 metadata:0 error:v16];
          v60[2](v60, v24);
          int v29 = 0;
          id v8 = v16;
        }
LABEL_30:

        if (!v29)
        {
          id v44 = v8;
LABEL_45:

          goto LABEL_46;
        }
        ++v9;
      }
      while (v59 != v9);
      uint64_t v39 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
      uint64_t v59 = v39;
      if (!v39)
      {
LABEL_40:

        objc_initWeak(&location, v1);
        id v46 = objc_getProperty(v1, v45, 64, 1);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __86__HMDCompositeSettingsController__updateSettingsForKeyPaths_callerVersion_completion___block_invoke;
        v70 = &unk_1E6A18500;
        objc_copyWeak(v73, &location);
        v47 = v55;
        id v71 = v47;
        id v72 = v60;
        uint64_t v55 = v47;
        [v46 addModel:v47 withOptionsLabel:@"HMDCompositeSettingController updating settings" completion:buf];

        objc_destroyWeak(v73);
        objc_destroyWeak(&location);
        id v44 = v8;
        goto LABEL_46;
      }
    }
  }
  v40 = (void *)MEMORY[0x1D9452090]();
  id v41 = v1;
  v42 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    id v43 = HMFGetLogIdentifier();
    *(_DWORD *)id v74 = 138543362;
    v75 = v43;
    _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Nil database (_updateSettingsForKeyPaths)", v74, 0xCu);
  }
  id v44 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
  uint64_t v55 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:@"onboardingSettings" setting:0 metadata:0 error:v44];
  v60[2](v60, v55);
LABEL_46:

LABEL_47:
}

void __86__HMDCompositeSettingsController__updateSettingsForKeyPaths_callerVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Finished updating models:%@ error:%@", buf, 0x20u);
    }
    id v10 = (void *)MEMORY[0x1E4F7A0D8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__HMDCompositeSettingsController__updateSettingsForKeyPaths_callerVersion_completion___block_invoke_92;
    v16[3] = &unk_1E6A0D6A0;
    id v17 = v3;
    id v18 = *(id *)(a1 + 40);
    id v11 = (void *)MEMORY[0x1E4F7A0F0];
    id v13 = objc_msgSend(objc_getProperty(v6, v12, 64, 1), "queue", v16[0], 3221225472, __86__HMDCompositeSettingsController__updateSettingsForKeyPaths_callerVersion_completion___block_invoke_92, &unk_1E6A0D6A0);
    uint64_t v14 = [v11 schedulerWithDispatchQueue:v13];
    id v15 = (id)[v10 futureWithBlock:v16 scheduler:v14];
  }
}

void __86__HMDCompositeSettingsController__updateSettingsForKeyPaths_callerVersion_completion___block_invoke_92(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:@"nil" setting:0 metadata:0 error:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [v3 finishWithNoResult];
}

void __88__HMDCompositeSettingsController__metricSubmittingSingleUpdateCompletionFromCompletion___block_invoke(double *a1, void *a2)
{
  id v11 = a2;
  id Property = (id)*((void *)a1 + 4);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 48, 1);
  }
  id v5 = Property;
  id v6 = [HMDCompositeSettingsControllerUpdateLogEvent alloc];
  double v7 = a1[6];
  id v8 = [v11 keyPath];
  uint64_t v9 = [(HMDCompositeSettingsControllerUpdateLogEvent *)v6 initWithStartTime:v8 keyPath:v7];
  id v10 = [v11 error];
  [v5 submitLogEvent:v9 error:v10];

  (*(void (**)(void))(*((void *)a1 + 5) + 16))();
}

- (void)updateSettingForKeyPath:(id)a3 value:(id)a4 callerVersion:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  -[HMDCompositeSettingsController _metricSubmittingSingleUpdateCompletionFromCompletion:](self, v13);
  id v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  if (self) {
    id Property = objc_getProperty(self, v14, 64, 1);
  }
  else {
    id Property = 0;
  }
  id v18 = [Property rawDatabase];
  if (v18)
  {
    if (self) {
      id v19 = objc_getProperty(self, v17, 64, 1);
    }
    else {
      id v19 = 0;
    }
    uint64_t v20 = [v19 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__HMDCompositeSettingsController_updateSettingForKeyPath_value_callerVersion_completion___block_invoke;
    block[3] = &unk_1E6A18488;
    block[4] = self;
    id v28 = v10;
    id v29 = v11;
    id v30 = v12;
    id v31 = v15;
    dispatch_async(v20, block);
  }
  else
  {
    __int16 v21 = (void *)MEMORY[0x1D9452090]();
    uint64_t v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v33 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Nil database (updateSettingForKeyPath)", buf, 0xCu);
    }
    uint64_t v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
    id v26 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v10 setting:0 metadata:0 error:v25];
    ((void (**)(void, HMDCompositeSettingOperationResult *))v15)[2](v15, v26);
  }
}

void __89__HMDCompositeSettingsController_updateSettingForKeyPath_value_callerVersion_completion___block_invoke(uint64_t a1)
{
  v60[1] = *(id *)MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(void **)(a1 + 56);
  uint64_t v4 = *(void **)(a1 + 64);
  id v5 = *(id *)(a1 + 40);
  id v47 = v2;
  id v48 = v3;
  double v7 = v4;
  if (v1)
  {
    uint64_t v9 = objc_msgSend(objc_getProperty(v1, v6, 64, 1), "rawDatabase");
    if (!v9)
    {
      uint64_t v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = v1;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v25;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Nil database (_updateSettingForKeyPath)", buf, 0xCu);
      }
      id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      id v12 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v5 setting:0 metadata:0 error:v16];
      v7[2](v7, v12);
      goto LABEL_34;
    }
    id v10 = objc_msgSend(objc_getProperty(v1, v8, 64, 1), "queue");
    dispatch_assert_queue_V2(v10);

    if (v5)
    {
      if (v47)
      {
        if (v48)
        {
          if (v7)
          {
            objc_msgSend(objc_getProperty(v1, v11, 24, 1), "objectForKeyedSubscript:", v5);
            id v12 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
            id v46 = objc_msgSend(objc_getProperty(v1, v13, 32, 1), "objectForKeyedSubscript:", v5);
            if (!v12)
            {
              id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21 description:@"Setting has not been configured yet (no current setting)" reason:0 suggestion:0];
              id v26 = (void *)MEMORY[0x1D9452090]();
              id v27 = v1;
              id v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                id v29 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v29;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v16;
                _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);
              }
              id v17 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v5 setting:0 metadata:0 error:v16];
              v7[2](v7, v17);
              goto LABEL_33;
            }
            uint64_t v14 = [(HMDCompositeSettingOperationResult *)v12 writeVersion];
            int v15 = [v14 isGreaterThanVersion:v48];

            if (v15)
            {
              id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10 description:@"Write version does not meet the minimum" reason:0 suggestion:0];
              id v17 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v5 setting:0 metadata:0 error:v16];
              id v18 = (void *)MEMORY[0x1D9452090]();
              id v19 = v1;
              uint64_t v20 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                __int16 v21 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v21;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v16;
                _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);
              }
              v7[2](v7, v17);
              goto LABEL_33;
            }
            id v52 = 0;
            id v17 = [v1 _settingFromSetting:v12 value:v47 error:&v52];
            id v16 = v52;
            if (!v17)
            {
              v37 = (void *)MEMORY[0x1D9452090]();
              id v38 = v1;
              uint64_t v39 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                v40 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v40;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v16;
                _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);
              }
              __int16 v33 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v5 setting:0 metadata:0 error:v16];
              v7[2](v7, v33);
              goto LABEL_32;
            }
            if (v46)
            {
              id v31 = [v46 constraint];
              id v51 = v16;
              [v31 isValidValue:v47 error:&v51];
              id v32 = v51;

              if (v32)
              {
                __int16 v33 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v5 setting:0 metadata:0 error:v32];
                context = (void *)MEMORY[0x1D9452090]();
                id v34 = v1;
                uint64_t v35 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  id v36 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v36;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v32;
                  _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Error: %@", buf, 0x16u);
                }
                v7[2](v7, v33);
                id v16 = v32;
                goto LABEL_32;
              }
              id v41 = 0;
            }
            else
            {
              id v41 = v16;
            }
            __int16 v33 = [(HMDCompositeSettingsController *)v1 emptyModelForTransaction];
            id v50 = v41;
            [(HMDCompositeSettingOperationResult *)v33 setSetting:v17 forKeyPath:v5 withError:&v50];
            id v16 = v50;

            if (v16)
            {
              v42 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v5 setting:0 metadata:0 error:v16];
              v7[2](v7, v42);
            }
            else
            {
              objc_initWeak(&location, v1);
              id v44 = objc_getProperty(v1, v43, 64, 1);
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __90__HMDCompositeSettingsController__updateSettingForKeyPath_value_callerVersion_completion___block_invoke;
              id v54 = &unk_1E6A11AB8;
              objc_copyWeak(v60, &location);
              uint64_t v55 = v12;
              uint64_t v56 = v17;
              id v57 = v5;
              id v58 = v46;
              uint64_t v59 = v7;
              [v44 addModel:v33 withOptionsLabel:@"HMDCompositeSettingController updating setting" completion:buf];

              objc_destroyWeak(v60);
              objc_destroyWeak(&location);
              id v16 = 0;
            }
LABEL_32:

LABEL_33:
LABEL_34:

            goto LABEL_35;
          }
LABEL_39:
          _HMFPreconditionFailure();
        }
LABEL_38:
        _HMFPreconditionFailure();
        goto LABEL_39;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
    goto LABEL_38;
  }
LABEL_35:
}

void __90__HMDCompositeSettingsController__updateSettingForKeyPath_value_callerVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    double v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      id v24 = v8;
      __int16 v25 = 2112;
      uint64_t v26 = v9;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      __int16 v29 = 2112;
      id v30 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@updating current setting:%@, new setting:%@ error:%@", buf, 0x2Au);
    }
    id v11 = (void *)MEMORY[0x1E4F7A0D8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__HMDCompositeSettingsController__updateSettingForKeyPath_value_callerVersion_completion___block_invoke_82;
    v17[3] = &unk_1E6A0D678;
    v17[4] = v6;
    id v18 = *(id *)(a1 + 40);
    id v19 = v3;
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 64);
    id v12 = (void *)MEMORY[0x1E4F7A0F0];
    uint64_t v14 = objc_msgSend(objc_getProperty(v6, v13, 64, 1), "queue", v17[0], 3221225472, __90__HMDCompositeSettingsController__updateSettingForKeyPath_value_callerVersion_completion___block_invoke_82, &unk_1E6A0D678, v6);
    int v15 = [v12 schedulerWithDispatchQueue:v14];
    id v16 = (id)[v11 futureWithBlock:v17 scheduler:v15];
  }
}

void __90__HMDCompositeSettingsController__updateSettingForKeyPath_value_callerVersion_completion___block_invoke_82(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@updating setting:%@, error:%@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v10 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:*(void *)(a1 + 56) setting:*(void *)(a1 + 40) metadata:*(void *)(a1 + 64) error:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  [v3 finishWithNoResult];
}

- (id)fetchSynchronousSettingsForKeyPaths:(id)a3 callerVersion:(id)a4 callerPrivilege:(unint64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v11 = [MEMORY[0x1E4F1CA48] array];
  if (self) {
    id Property = objc_getProperty(self, v10, 64, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v14 = [Property rawDatabase];
  if (v14)
  {
    if (self) {
      id v15 = objc_getProperty(self, v13, 64, 1);
    }
    else {
      id v15 = 0;
    }
    uint64_t v16 = [v15 queue];
    dispatch_assert_queue_V2(v16);

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke_2;
    v27[3] = &unk_1E6A0D650;
    v27[4] = self;
    id v28 = v9;
    unint64_t v30 = a5;
    id v17 = v11;
    id v29 = v17;
    objc_msgSend(v8, "na_each:", v27);
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v34 = v21;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Nil database (fetchSynchronousSettingsForKeyPaths)", buf, 0xCu);
    }
    id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke;
    v31[3] = &unk_1E6A16F58;
    id v32 = v22;
    id v23 = v22;
    id v24 = objc_msgSend(v8, "na_map:", v31);
    id v17 = (id)[v24 mutableCopy];
  }
  __int16 v25 = (void *)[v17 copy];

  return v25;
}

HMDCompositeSettingOperationResult *__100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v3 setting:0 metadata:0 error:*(void *)(a1 + 32)];

  return v4;
}

void __100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke_3;
  v8[3] = &unk_1E6A0D628;
  uint64_t v5 = *(void *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v6 = a2;
  double v7 = -[HMDCompositeSettingsController _metricSubmittingSingleFetchCompletionFromCompletion:](v3, v8);
  -[HMDCompositeSettingsController _fetchSettingForKeyPath:callerVersion:callerPrivilege:completion:](v3, v6, v4, v5, v7);
}

uint64_t __100__HMDCompositeSettingsController_fetchSynchronousSettingsForKeyPaths_callerVersion_callerPrivilege___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_metricSubmittingSingleFetchCompletionFromCompletion:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x1E4F6A278] currentTime];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__HMDCompositeSettingsController__metricSubmittingSingleFetchCompletionFromCompletion___block_invoke;
    aBlock[3] = &unk_1E6A13A60;
    aBlock[4] = a1;
    uint64_t v8 = v4;
    id v7 = v3;
    a1 = _Block_copy(aBlock);
  }
  return a1;
}

- (void)_fetchSettingForKeyPath:(void *)a3 callerVersion:(uint64_t)a4 callerPrivilege:(void *)a5 completion:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  __int16 v13 = (void (**)(void, void))v11;
  if (a1 && v11)
  {
    if (objc_msgSend(objc_getProperty(a1, v12, 56, 1), "containsObject:", v9))
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = a1;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v51 = v18;
        __int16 v52 = 2112;
        id v53 = v9;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Blocked fetch setting with key path: %@", buf, 0x16u);
      }
      id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
      id v20 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v9 setting:0 metadata:0 error:v19];
      ((void (**)(void, HMDCompositeSettingOperationResult *))v13)[2](v13, v20);
      goto LABEL_26;
    }
    id v19 = objc_msgSend(objc_getProperty(a1, v14, 64, 1), "rawDatabase");
    if (!v19)
    {
      v37 = (void *)MEMORY[0x1D9452090]();
      id v38 = a1;
      uint64_t v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v51 = v40;
        _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Nil database (_fetchSettingForKeyPath)", buf, 0xCu);
      }
      id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      uint64_t v26 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v9 setting:0 metadata:0 error:v20];
      ((void (**)(void, HMDCompositeSettingOperationResult *))v13)[2](v13, v26);
      goto LABEL_25;
    }
    id v22 = objc_msgSend(objc_getProperty(a1, v21, 64, 1), "queue");
    dispatch_assert_queue_V2(v22);

    objc_msgSend(objc_getProperty(a1, v23, 24, 1), "objectForKeyedSubscript:", v9);
    id v20 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_getProperty(a1, v24, 32, 1), "objectForKeyedSubscript:", v9);
    __int16 v25 = (HMDCompositeSettingOperationResult *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = v25;
    if (!v20)
    {
      v42 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21 description:@"Setting has not been configured yet (no setting)" reason:0 suggestion:0];
      SEL v43 = (void *)MEMORY[0x1D9452090]();
      id v44 = a1;
      SEL v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        id v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v51 = v46;
        __int16 v52 = 2112;
        id v53 = v42;
        _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@_fetchSettingForKeyPath Error: %@", buf, 0x16u);
      }
      id v47 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v9 setting:0 metadata:0 error:v42];
      ((void (**)(void, HMDCompositeSettingOperationResult *))v13)[2](v13, v47);

      id v20 = 0;
      goto LABEL_25;
    }
    if (!v25
      || ([(HMDCompositeSettingOperationResult *)v25 privileges],
          __int16 v27 = objc_claimAutoreleasedReturnValue(),
          uint64_t v28 = HMDUserPrivilegeCompare(a4, [v27 minReadUserPrivilege]),
          v27,
          v28 == -1))
    {
      uint64_t v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:17 description:@"Insufficient User read Privilege or missing Metadata" reason:0 suggestion:0];
      id v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = a1;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v35 = v49 = v32;
        *(_DWORD *)buf = 138543618;
        id v51 = v35;
        __int16 v52 = 2112;
        id v53 = v31;
        id v36 = "%{public}@_fetchSettingForKeyPath failed, Error: %@";
        goto LABEL_19;
      }
    }
    else
    {
      id v29 = [(HMDCompositeSettingOperationResult *)v20 readVersion];
      int v30 = [v29 isGreaterThanVersion:v10];

      if (!v30)
      {
        id v48 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v9 setting:v20 metadata:v26 error:0];
        ((void (**)(void, HMDCompositeSettingOperationResult *))v13)[2](v13, v48);

        goto LABEL_25;
      }
      uint64_t v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10 description:@"Read version does not meet the minimum" reason:0 suggestion:0];
      id v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = a1;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v35 = v49 = v32;
        *(_DWORD *)buf = 138543618;
        id v51 = v35;
        __int16 v52 = 2112;
        id v53 = v31;
        id v36 = "%{public}@_fetchSettingForKeyPath Error: %@";
LABEL_19:
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, v36, buf, 0x16u);

        id v32 = v49;
      }
    }

    id v41 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v9 setting:0 metadata:0 error:v31];
    ((void (**)(void, HMDCompositeSettingOperationResult *))v13)[2](v13, v41);

LABEL_25:
LABEL_26:
  }
}

void __87__HMDCompositeSettingsController__metricSubmittingSingleFetchCompletionFromCompletion___block_invoke(double *a1, void *a2)
{
  id v11 = a2;
  id Property = (id)*((void *)a1 + 4);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 48, 1);
  }
  id v5 = Property;
  id v6 = [HMDCompositeSettingsControllerFetchLogEvent alloc];
  double v7 = a1[6];
  uint64_t v8 = [v11 keyPath];
  id v9 = [(HMDCompositeSettingsControllerFetchLogEvent *)v6 initWithStartTime:v8 keyPath:v7];
  id v10 = [v11 error];
  [v5 submitLogEvent:v9 error:v10];

  (*(void (**)(void))(*((void *)a1 + 5) + 16))();
}

- (void)fetchSettingsForKeyPaths:(id)a3 callerVersion:(id)a4 callerPrivilege:(unint64_t)a5 completion:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v13 = a6;
  if (self) {
    id Property = objc_getProperty(self, v12, 64, 1);
  }
  else {
    id Property = 0;
  }
  id v15 = [Property rawDatabase];
  id v16 = v13;
  if (self)
  {
    [MEMORY[0x1E4F6A278] currentTime];
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 3221225472;
    SEL v43 = __89__HMDCompositeSettingsController__metricSubmittingMultipleFetchCompletionFromCompletion___block_invoke;
    id v44 = &unk_1E6A0D5D8;
    SEL v45 = self;
    uint64_t v47 = v17;
    id v46 = v16;
    id v18 = (void (**)(void *, void))_Block_copy(&aBlock);
  }
  else
  {
    id v18 = 0;
  }

  if (v15)
  {
    if (![v10 count])
    {
      id v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = id v33 = v20;
        LODWORD(aBlock) = 138543362;
        *(void *)((char *)&aBlock + 4) = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Empty keypaths array", (uint8_t *)&aBlock, 0xCu);

        id v20 = v33;
      }

      v18[2](v18, MEMORY[0x1E4F1CBF0]);
    }
    if (self) {
      id v24 = objc_getProperty(self, v19, 64, 1);
    }
    else {
      id v24 = 0;
    }
    __int16 v25 = [v24 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_49;
    block[3] = &unk_1E6A14940;
    id v35 = v10;
    id v36 = self;
    id v37 = v11;
    unint64_t v39 = a5;
    id v38 = v18;
    dispatch_async(v25, block);

    id v26 = v35;
  }
  else
  {
    __int16 v27 = (void *)MEMORY[0x1D9452090]();
    uint64_t v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      int v30 = HMFGetLogIdentifier();
      LODWORD(aBlock) = 138543362;
      *(void *)((char *)&aBlock + 4) = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Nil database (fetchSettingsForKeyPaths)", (uint8_t *)&aBlock, 0xCu);
    }
    uint64_t v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke;
    v40[3] = &unk_1E6A16F58;
    id v41 = v31;
    id v26 = v31;
    id v32 = objc_msgSend(v10, "na_map:", v40);
    ((void (**)(void *, void *))v18)[2](v18, v32);
  }
}

HMDCompositeSettingOperationResult *__100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v3 setting:0 metadata:0 error:*(void *)(a1 + 32)];

  return v4;
}

void __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_49(void *a1)
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_2;
  v11[3] = &unk_1E6A0D650;
  id v3 = (void *)a1[4];
  uint64_t v4 = (void *)a1[6];
  v11[4] = a1[5];
  id v5 = v4;
  uint64_t v6 = a1[8];
  id v13 = v2;
  uint64_t v14 = v6;
  id v12 = v5;
  id v7 = v2;
  objc_msgSend(v3, "na_each:", v11);
  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t))(a1[7] + 16))(a1[7], v7, v8, v9, v10);
}

void __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_3;
  v6[3] = &unk_1E6A0D628;
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  -[HMDCompositeSettingsController _fetchSettingForKeyPath:callerVersion:callerPrivilege:completion:](v3, a2, v4, v5, v6);
}

uint64_t __100__HMDCompositeSettingsController_fetchSettingsForKeyPaths_callerVersion_callerPrivilege_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __89__HMDCompositeSettingsController__metricSubmittingMultipleFetchCompletionFromCompletion___block_invoke(void *a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__HMDCompositeSettingsController__metricSubmittingMultipleFetchCompletionFromCompletion___block_invoke_2;
  v8[3] = &unk_1E6A0D5B0;
  void v8[4] = a1[4];
  v8[5] = a1[6];
  id v3 = a2;
  objc_msgSend(v3, "na_each:", v8);
  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v3, v4, v5, v6, v7);
}

void __89__HMDCompositeSettingsController__metricSubmittingMultipleFetchCompletionFromCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 48, 1);
  }
  id v5 = Property;
  uint64_t v6 = [HMDCompositeSettingsControllerFetchLogEvent alloc];
  double v7 = *(double *)(a1 + 40);
  uint64_t v8 = [v11 keyPath];
  uint64_t v9 = [(HMDCompositeSettingsControllerFetchLogEvent *)v6 initWithStartTime:v8 keyPath:v7];
  uint64_t v10 = [v11 error];
  [v5 submitLogEvent:v9 error:v10];
}

- (void)fetchSettingForKeyPath:(id)a3 callerVersion:(id)a4 callerPrivilege:(unint64_t)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  -[HMDCompositeSettingsController _metricSubmittingSingleFetchCompletionFromCompletion:](self, v12);
  uint64_t v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  if (self) {
    id Property = objc_getProperty(self, v13, 64, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v17 = [Property rawDatabase];
  if (v17)
  {
    if (self) {
      id v18 = objc_getProperty(self, v16, 64, 1);
    }
    else {
      id v18 = 0;
    }
    id v19 = [v18 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__HMDCompositeSettingsController_fetchSettingForKeyPath_callerVersion_callerPrivilege_completion___block_invoke;
    block[3] = &unk_1E6A14940;
    void block[4] = self;
    id v27 = v10;
    id v28 = v11;
    unint64_t v30 = a5;
    id v29 = v14;
    dispatch_async(v19, block);
  }
  else
  {
    id v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      SEL v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v32 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Nil database (fetchSettingForKeyPath)", buf, 0xCu);
    }
    id v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
    __int16 v25 = [[HMDCompositeSettingOperationResult alloc] initWithKeyPath:v10 setting:0 metadata:0 error:v24];
    ((void (**)(void, HMDCompositeSettingOperationResult *))v14)[2](v14, v25);
  }
}

void __98__HMDCompositeSettingsController_fetchSettingForKeyPath_callerVersion_callerPrivilege_completion___block_invoke(uint64_t a1)
{
}

- (id)logIdentifier
{
  id v3 = NSString;
  uint64_t v4 = [(HMDCompositeSettingsController *)self homeUUID];
  id v5 = [(HMDCompositeSettingsController *)self uuid];
  uint64_t v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];

  return v6;
}

- (void)_createSettingsFromModel:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 64, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v55 = [Property rawDatabase];
  if (v55)
  {
    if (self)
    {
      double v7 = objc_msgSend(objc_getProperty(self, v6, 64, 1), "queue");
      dispatch_assert_queue_V2(v7);

      id v9 = objc_getProperty(self, v8, 24, 1);
    }
    else
    {
      uint64_t v54 = [0 queue];
      dispatch_assert_queue_V2(v54);

      id v9 = 0;
    }
    id v10 = v9;
    id v11 = [v56 keyPathsToSettings];
    id v12 = v10;
    id v13 = v11;
    uint64_t v14 = v13;
    if (self)
    {
      id v15 = (void *)[v13 mutableCopy];
      *(void *)id v58 = MEMORY[0x1E4F143A8];
      *(void *)&v58[8] = 3221225472;
      *(void *)&v58[16] = __74__HMDCompositeSettingsController__addedOrUpdatedSettingsFrom_newSettings___block_invoke;
      uint64_t v59 = &unk_1E6A0D600;
      id v60 = v12;
      id v16 = v15;
      v61 = v16;
      uint64_t v17 = (void *)MEMORY[0x1D9452090](objc_msgSend(v14, "na_each:", v58));
      id v18 = self;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Settings changed %@", buf, 0x16u);
      }
      id v21 = (void *)[(HMDCompositeSettingsController *)v16 copy];
    }
    else
    {
      id v21 = 0;
    }

    id v22 = (void *)MEMORY[0x1D9452090]();
    SEL v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = HMFGetLogIdentifier();
      *(_DWORD *)id v58 = 138543618;
      *(void *)&v58[4] = v25;
      *(_WORD *)&v58[12] = 2112;
      *(void *)&v58[14] = v21;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Updated Settings %@", v58, 0x16u);
    }
    if ([v21 count])
    {
      id v26 = v21;
      id v27 = v26;
      if (self)
      {
        id v28 = (void *)[v26 mutableCopy];
        id v30 = objc_getProperty(v23, v29, 56, 1);
        *(void *)id v58 = MEMORY[0x1E4F143A8];
        *(void *)&v58[8] = 3221225472;
        *(void *)&v58[16] = __62__HMDCompositeSettingsController_filteredSettingsForSettings___block_invoke;
        uint64_t v59 = &unk_1E6A16928;
        id v31 = v28;
        id v60 = v31;
        v61 = v23;
        objc_msgSend(v30, "na_each:", v58);
        id v32 = v31;

        if ([v32 count])
        {
          uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
          long long v63 = 0u;
          long long v64 = 0u;
          memset(buf, 0, sizeof(buf));
          id v27 = v32;
          uint64_t v35 = [v27 countByEnumeratingWithState:buf objects:v58 count:16];
          if (v35)
          {
            uint64_t v36 = **(void **)&buf[16];
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (**(void **)&buf[16] != v36) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v38 = *(void *)(*(void *)&buf[8] + 8 * i);
                unint64_t v39 = objc_msgSend(objc_getProperty(v23, v34, 32, 1), "objectForKeyedSubscript:", v38);
                [v33 setObject:v39 forKeyedSubscript:v38];
              }
              uint64_t v35 = [v27 countByEnumeratingWithState:buf objects:v58 count:16];
            }
            while (v35);
          }

          v40 = [(HMDCompositeSettingsController *)v23 delegate];
          id v41 = (void *)[v33 copy];
          [v40 settingsController:v23 didUpdateSettings:v27 metadata:v41];
        }
        else
        {
          id v27 = v32;
        }
      }
    }
    uint64_t v47 = [v56 keyPathsToSettings];
    if (self) {
      objc_setProperty_atomic_copy(v23, v46, v47, 24);
    }
    BOOL v48 = self == 0;

    id v50 = [v56 keyPathsToSettingMetadata];
    if (!v48) {
      objc_setProperty_atomic_copy(v23, v49, v50, 32);
    }

    os_unfair_lock_lock_with_options();
    if (!v23->_configured)
    {
      v23->_configured = 1;
      id v52 = objc_getProperty(v23, v51, 64, 1);
      id v53 = [v52 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__HMDCompositeSettingsController__createSettingsFromModel___block_invoke;
      block[3] = &unk_1E6A19B30;
      void block[4] = v23;
      dispatch_async(v53, block);
    }
    os_unfair_lock_unlock(&v23->_lock);
  }
  else
  {
    v42 = (void *)MEMORY[0x1D9452090]();
    SEL v43 = self;
    id v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      SEL v45 = HMFGetLogIdentifier();
      *(_DWORD *)id v58 = 138543362;
      *(void *)&v58[4] = v45;
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_INFO, "%{public}@Nil database (_createSettingsFromModel)", v58, 0xCu);
    }
  }
}

void __59__HMDCompositeSettingsController__createSettingsFromModel___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"HMDCompositeSettingControllerOwnerUUIDNotificationKey";
  v2 = [*(id *)(a1 + 32) uuid];
  v9[1] = @"HMDCompositeSettingControllerHomeUUIDNotificationKey";
  v10[0] = v2;
  id v3 = [*(id *)(a1 + 32) homeUUID];
  v10[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v7 = @"HMDHomeUUIDOwnerUUIDKey";
  SEL v8 = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v5 postNotificationName:@"HMDCompositeSettingsControllerDidConfigureNotification" object:0 userInfo:v6];
}

void __62__HMDCompositeSettingsController_filteredSettingsForSettings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:v3];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 40);
    double v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      SEL v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Filtering setting with blocked key path: %@", (uint8_t *)&v9, 0x16u);
    }
    [*(id *)(a1 + 32) removeObjectForKey:v3];
  }
}

void __74__HMDCompositeSettingsController__addedOrUpdatedSettingsFrom_newSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];

  if (v6)
  {
    double v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    int v8 = [v7 isEqual:v5];

    if (v8) {
      [*(id *)(a1 + 40) removeObjectForKey:v9];
    }
  }
}

- (void)setConfigured:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_configured = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)configured
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_configured;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)start
{
  v2 = self;
  if (self) {
    self = (HMDCompositeSettingsController *)objc_getProperty(self, a2, 64, 1);
  }
  [(HMDCompositeSettingsController *)self startWithDelegate:v2];
}

- (HMDCompositeSettingsController)initWithDatabaseAdapter:(id)a3 model:(Class)a4 homeUUID:(id)a5 ownerUUID:(id)a6 logEventSubmitter:(id)a7 settingKeyPathBlockList:(id)a8
{
  id v22 = a3;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDCompositeSettingsController;
  id v18 = [(HMDCompositeSettingsController *)&v23 init];
  id v19 = v18;
  if (v18)
  {
    v18->_lock._os_unfair_lock_opaque = 0;
    v18->_configured = 0;
    objc_storeStrong((id *)&v18->_modelClass, a4);
    objc_storeStrong((id *)&v19->_databaseAdapter, a3);
    objc_storeStrong((id *)&v19->_uuid, a6);
    objc_storeStrong((id *)&v19->_homeUUID, a5);
    objc_storeStrong((id *)&v19->_logEventSubmitter, a7);
    objc_storeStrong((id *)&v19->_settingKeyPathBlockList, a8);
  }

  return v19;
}

- (HMDCompositeSettingsController)initWithDatabaseAdapter:(id)a3 model:(Class)a4 homeUUID:(id)a5 ownerUUID:(id)a6 settingKeyPathBlockList:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = +[HMDMetricsManager sharedLogEventSubmitter];
  id v17 = [(HMDCompositeSettingsController *)self initWithDatabaseAdapter:v15 model:a4 homeUUID:v14 ownerUUID:v13 logEventSubmitter:v16 settingKeyPathBlockList:v12];

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_80824 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_80824, &__block_literal_global_80825);
  }
  v2 = (void *)logCategory__hmf_once_v14_80826;
  return v2;
}

uint64_t __45__HMDCompositeSettingsController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v14_80826;
  logCategory__hmf_once_v14_80826 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
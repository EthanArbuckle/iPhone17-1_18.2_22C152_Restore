@interface HMDSharedUserPrivateSettingsManager
+ (id)logCategory;
- (HMDSharedUserPrivateSettingsManager)initWithCoreData:(id)a3 cloudTransform:(id)a4 homeManager:(id)a5;
- (id)authorizationDataForCharacteristicWithInstanceID:(id)a3 accessoryUUID:(id)a4 homeModelID:(id)a5;
- (id)settingsForHome:(id)a3 ofType:(int64_t)a4;
- (id)updateAuthorizationDataForCharacteristicWithInstanceID:(id)a3 accessoryUUID:(id)a4 homeModelID:(id)a5 authorizationData:(id)a6 context:(id)a7;
- (id)updateSettingsForHome:(id)a3 ofType:(int64_t)a4 withValues:(id)a5 context:(id)a6;
- (void)_populateSettings:(void *)a3 fromEntity:(void *)a4 context:;
- (void)didInsertOrUpdateModel:(id)a3 changedProperties:(id)a4;
- (void)willStartListeningWithContext:(id)a3;
@end

@implementation HMDSharedUserPrivateSettingsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicAuthorizationDataByHomeModelID, 0);
  objc_storeStrong((id *)&self->_sharedSettingsByHome, 0);
  objc_storeStrong((id *)&self->_privateSettingsByHome, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_cloudTransform, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
}

- (void)didInsertOrUpdateModel:(id)a3 changedProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  os_unfair_lock_lock_with_options();
  v8 = [v6 entity];
  v9 = +[MKFCKSharedUserPrivateRoot entity];
  char v10 = [v8 isKindOfEntity:v9];

  if (v10)
  {
    uint64_t v11 = 40;
  }
  else
  {
    v12 = [v6 entity];
    uint64_t v13 = +[MKFCKSharedUserDataRoot entity];

    int v14 = [v12 isKindOfEntity:v13];
    if (!v14)
    {
      int v20 = 1;
      v9 = (void *)v13;
      goto LABEL_20;
    }
    uint64_t v11 = 48;
    v9 = (void *)v13;
  }
  id v15 = *(id *)((char *)&self->super.isa + v11);
  v16 = [v6 homeModelID];
  if (v16)
  {
    v32 = v7;
    v17 = [v15 objectForKeyedSubscript:v16];
    v18 = v17;
    if (v17) {
      id v19 = v17;
    }
    else {
      id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    v21 = v19;

    v22 = objc_msgSend(v9, "hmd_attributesBySettingsPath");
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __80__HMDSharedUserPrivateSettingsManager_didInsertOrUpdateModel_changedProperties___block_invoke;
    v37[3] = &unk_264A241E8;
    id v23 = v32;
    id v38 = v23;
    id v24 = v21;
    id v39 = v24;
    id v25 = v6;
    id v40 = v25;
    v41 = &v46;
    [v22 enumerateKeysAndObjectsUsingBlock:v37];

    if (*((unsigned char *)v47 + 24)) {
      [v15 setObject:v24 forKeyedSubscript:v16];
    }
    id v26 = v25;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    id v28 = v27;

    if (v28)
    {
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __80__HMDSharedUserPrivateSettingsManager_didInsertOrUpdateModel_changedProperties___block_invoke_2;
      v33[3] = &unk_264A24210;
      v33[4] = self;
      id v34 = v16;
      id v35 = v28;
      v36 = &v42;
      objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);
    }
    int v20 = 0;
    id v7 = v32;
  }
  else
  {
    int v20 = 1;
  }

LABEL_20:
  os_unfair_lock_unlock(&self->_lock);
  if (!v20)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
    if (*((unsigned char *)v47 + 24))
    {
      v30 = [v6 modelID];
      [WeakRetained notifyClientsOfUserSettingsChangeWithReason:@"User Settings updated (Cloud)" sourceUUID:v30];
    }
    if (*((unsigned char *)v43 + 24))
    {
      v31 = [v6 modelID];
      [WeakRetained updateGenerationCounterWithReason:@"Authorization Data Changed" sourceUUID:v31 shouldNotifyClients:1];
    }
  }
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

void __80__HMDSharedUserPrivateSettingsManager_didInsertOrUpdateModel_changedProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v6 || [v6 containsObject:v5])
  {
    id v7 = *(void **)(a1 + 48);
    v8 = [v5 name];
    v9 = [v7 valueForKey:v8];
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v10];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __80__HMDSharedUserPrivateSettingsManager_didInsertOrUpdateModel_changedProperties___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 name];
  int v7 = [v6 isEqualToString:@"characteristicAuthorizationData"];

  if (v7)
  {
    v8 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
    v9 = [*(id *)(a1 + 48) characteristicAuthorizationData];
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 40);
      int v16 = 138544130;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating characteristic authorization data %@ -> %@ for home uuid: %@", (uint8_t *)&v16, 0x2Au);
    }
    id v15 = [*(id *)(a1 + 48) characteristicAuthorizationData];
    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v15 forKeyedSubscript:*(void *)(a1 + 40)];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)willStartListeningWithContext:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  privateSettingsByHome = self->_privateSettingsByHome;
  self->_privateSettingsByHome = v6;

  v8 = self->_privateSettingsByHome;
  v9 = +[MKFCKSharedUserPrivateRoot entity];
  -[HMDSharedUserPrivateSettingsManager _populateSettings:fromEntity:context:](self, v8, v9, v4);

  id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  sharedSettingsByHome = self->_sharedSettingsByHome;
  self->_sharedSettingsByHome = v10;

  v12 = self->_sharedSettingsByHome;
  uint64_t v13 = +[MKFCKSharedUserDataRoot entity];
  -[HMDSharedUserPrivateSettingsManager _populateSettings:fromEntity:context:](self, v12, v13, v4);

  uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  characteristicAuthorizationDataByHomeModelID = self->_characteristicAuthorizationDataByHomeModelID;
  self->_characteristicAuthorizationDataByHomeModelID = v14;

  int v16 = self->_characteristicAuthorizationDataByHomeModelID;
  id v29 = v4;
  v17 = +[MKFCKSharedUserPrivateRoot entity];
  __int16 v18 = [v17 name];

  id v19 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:v18];
  __int16 v20 = objc_msgSend(v29, "hmd_coreData");
  v21 = [v20 cloudPrivateStore];
  v34[0] = v21;
  __int16 v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  [v19 setAffectedStores:v22];

  id v30 = 0;
  uint64_t v23 = [v29 executeFetchRequest:v19 error:&v30];
  id v24 = v30;
  if (v23)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __88__HMDSharedUserPrivateSettingsManager__populateCharacteristicAuthorizationData_context___block_invoke;
    v32 = &unk_264A24170;
    v33 = v16;
    objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
  }
  else
  {
    id v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      v32 = v24;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch private %@: %@", buf, 0x20u);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_populateSettings:(void *)a3 fromEntity:(void *)a4 context:
{
  v36[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF260]);
    id v11 = [v8 name];
    v12 = (void *)[v10 initWithEntityName:v11];

    uint64_t v13 = objc_msgSend(v9, "hmd_coreData");
    uint64_t v14 = [v13 cloudPrivateStore];
    v36[0] = v14;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
    [v12 setAffectedStores:v15];

    id v29 = 0;
    int v16 = [v9 executeFetchRequest:v12 error:&v29];
    id v17 = v29;
    if (v16)
    {
      __int16 v18 = objc_msgSend(v8, "hmd_attributesBySettingsPath");
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __76__HMDSharedUserPrivateSettingsManager__populateSettings_fromEntity_context___block_invoke;
      v26[3] = &unk_264A241C0;
      id v27 = v7;
      id v28 = v18;
      id v19 = v18;
      objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v26);
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = a1;
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        [v8 name];
        id v24 = v25 = v20;
        *(_DWORD *)buf = 138543874;
        v31 = v23;
        __int16 v32 = 2112;
        v33 = v24;
        __int16 v34 = 2112;
        id v35 = v17;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch private %@: %@", buf, 0x20u);

        __int16 v20 = v25;
      }
    }
  }
}

void __88__HMDSharedUserPrivateSettingsManager__populateCharacteristicAuthorizationData_context___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 homeModelID];
  if (v3)
  {
    id v4 = [v5 characteristicAuthorizationData];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
}

void __76__HMDSharedUserPrivateSettingsManager__populateSettings_fromEntity_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 homeModelID];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
    id v6 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __76__HMDSharedUserPrivateSettingsManager__populateSettings_fromEntity_context___block_invoke_2;
    v8[3] = &unk_264A24198;
    id v9 = v5;
    id v10 = v3;
    id v7 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __76__HMDSharedUserPrivateSettingsManager__populateSettings_fromEntity_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v8 = [a3 name];
  id v7 = [v5 valueForKey:v8];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)updateAuthorizationDataForCharacteristicWithInstanceID:(id)a3 accessoryUUID:(id)a4 homeModelID:(id)a5 authorizationData:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)MEMORY[0x263F42538];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __146__HMDSharedUserPrivateSettingsManager_updateAuthorizationDataForCharacteristicWithInstanceID_accessoryUUID_homeModelID_authorizationData_context___block_invoke;
  v25[3] = &unk_264A24148;
  v25[4] = self;
  id v26 = v14;
  id v27 = v16;
  id v28 = v13;
  id v29 = v15;
  id v30 = v12;
  id v18 = v12;
  id v19 = v15;
  id v20 = v13;
  id v21 = v16;
  id v22 = v14;
  uint64_t v23 = [v17 inContext:v21 perform:v25];

  return v23;
}

uint64_t __146__HMDSharedUserPrivateSettingsManager_updateAuthorizationDataForCharacteristicWithInstanceID_accessoryUUID_homeModelID_authorizationData_context___block_invoke(uint64_t a1)
{
  v89[1] = *MEMORY[0x263EF8340];
  lock = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  id v2 = objc_alloc(MEMORY[0x263EFF260]);
  id v3 = +[MKFCKSharedUserPrivateRoot entity];
  id v4 = [v3 name];
  v70 = (void *)[v2 initWithEntityName:v4];

  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", *(void *)(a1 + 40)];
  [v70 setPredicate:v5];

  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) cloudPrivateStore];
  v89[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:1];
  [v70 setAffectedStores:v7];

  [v70 setFetchLimit:1];
  id v8 = *(void **)(a1 + 48);
  id v77 = 0;
  id v9 = [v8 executeFetchRequest:v70 error:&v77];
  id v67 = v77;
  v68 = [v9 firstObject];

  if (v68)
  {
    id v10 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v11 = [v10 mutableCopy];

    id v12 = (void *)v11;
    if (!v11)
    {
      id v12 = [MEMORY[0x263EFF9A0] dictionary];
    }
    v71 = v12;
    id v13 = [v12 objectForKeyedSubscript:*(void *)(a1 + 56)];
    v69 = (void *)[v13 mutableCopy];

    if (!v69)
    {
      v69 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      id v19 = *(void **)(a1 + 64);
      uint64_t v18 = *(void *)(a1 + 72);
      uint64_t v20 = *(void *)(a1 + 56);
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544386;
      v80 = v17;
      __int16 v81 = 2112;
      id v82 = v19;
      __int16 v83 = 2112;
      uint64_t v84 = v18;
      __int16 v85 = 2112;
      uint64_t v86 = v20;
      __int16 v87 = 2112;
      uint64_t v88 = v21;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating authorization data: %@ for characteristic with instance ID: %@ with accessory uuid:%@ home uuid: %@ ", buf, 0x34u);
    }
    id v22 = [v69 objectForKeyedSubscript:*(void *)(a1 + 72)];
    int v23 = [v22 isEqualToData:*(void *)(a1 + 64)];

    if (v23)
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = HMFGetLogIdentifier();
        uint64_t v29 = *(void *)(a1 + 64);
        id v28 = *(void **)(a1 + 72);
        uint64_t v30 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138544130;
        v80 = v27;
        __int16 v81 = 2112;
        id v82 = v28;
        __int16 v83 = 2112;
        uint64_t v84 = v30;
        __int16 v85 = 2112;
        uint64_t v86 = v29;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Authorization data for characteristic with instance ID: %@ of accessory with uuid: %@ is already set to: %@", buf, 0x2Au);
      }
      int v31 = 1;
      uint64_t v32 = 1;
    }
    else
    {
      [v69 setObject:*(void *)(a1 + 64) forKeyedSubscript:*(void *)(a1 + 72)];
      id v40 = (void *)[v69 copy];
      [v71 setObject:v40 forKeyedSubscript:*(void *)(a1 + 56)];

      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      v41 = [v71 allKeys];
      uint64_t v42 = [v41 countByEnumeratingWithState:&v73 objects:v78 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v74 != v43) {
              objc_enumerationMutation(v41);
            }
            char v45 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
            v47 = [WeakRetained accessoryWithUUID:v45];
            BOOL v48 = v47 == 0;

            if (v48)
            {
              char v49 = (void *)MEMORY[0x230FBD990]();
              id v50 = *(id *)(a1 + 32);
              HMFGetOSLogHandle();
              v51 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                v52 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v80 = v52;
                __int16 v81 = 2112;
                id v82 = v45;
                _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Removing characteristic authorization data for removed accessory: %@", buf, 0x16u);
              }
              [v71 setObject:0 forKeyedSubscript:v45];
            }
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v73 objects:v78 count:16];
        }
        while (v42);
      }

      uint64_t v53 = [v71 copy];
      [v68 setCharacteristicAuthorizationData:v53];

      v54 = *(void **)(a1 + 48);
      id v72 = 0;
      LOBYTE(v53) = [v54 save:&v72];
      id v55 = v72;
      uint64_t v56 = [*(id *)(a1 + 48) reset];
      if (v53)
      {
        v57 = (void *)[v71 copy];
        [*(id *)(*(void *)(a1 + 32) + 56) setObject:v57 forKeyedSubscript:*(void *)(a1 + 40)];
        int v31 = 0;
      }
      else
      {
        v58 = (void *)MEMORY[0x230FBD990](v56);
        id v59 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v60 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v61 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v80 = v61;
          __int16 v81 = 2112;
          id v82 = v55;
          _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to save authorization data:%@", buf, 0x16u);
        }
        id v62 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
        v57 = v62;
        if (v62)
        {
          id v63 = v62;
        }
        else
        {
          [MEMORY[0x263F087E8] hmfUnspecifiedError];
          objc_claimAutoreleasedReturnValue();
        }

        int v31 = 1;
      }

      uint64_t v32 = 2;
    }
  }
  else
  {
    v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v80 = v36;
      __int16 v81 = 2112;
      id v82 = v67;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to update authorization data, unable to fetch user settings container: %@", buf, 0x16u);
    }
    id v37 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    id v38 = v37;
    if (v37)
    {
      id v39 = v37;
    }
    else
    {
      [MEMORY[0x263F087E8] hmfUnspecifiedError];
      objc_claimAutoreleasedReturnValue();
    }
    v71 = v38;

    int v31 = 1;
    uint64_t v32 = 2;
  }

  if (v31) {
    uint64_t v64 = v32;
  }
  else {
    uint64_t v64 = 1;
  }
  os_unfair_lock_unlock(lock);
  return v64;
}

- (id)authorizationDataForCharacteristicWithInstanceID:(id)a3 accessoryUUID:(id)a4 homeModelID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v12 = [(NSMutableDictionary *)self->_characteristicAuthorizationDataByHomeModelID objectForKeyedSubscript:v10];
  id v13 = [v12 objectForKeyedSubscript:v9];
  id v14 = [v13 objectForKeyedSubscript:v8];

  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (id)updateSettingsForHome:(id)a3 ofType:(int64_t)a4 withValues:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v11 count];
  id v14 = (void *)MEMORY[0x263F42538];
  if (v13)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __87__HMDSharedUserPrivateSettingsManager_updateSettingsForHome_ofType_withValues_context___block_invoke;
    v17[3] = &unk_264A2A880;
    v17[4] = self;
    int64_t v21 = a4;
    id v18 = v10;
    id v19 = v12;
    id v20 = v11;
    id v15 = [v14 inContext:v19 perform:v17];
  }
  else
  {
    id v15 = [MEMORY[0x263F42538] futureWithNoValue];
  }

  return v15;
}

uint64_t __87__HMDSharedUserPrivateSettingsManager_updateSettingsForHome_ofType_withValues_context___block_invoke(uint64_t a1)
{
  v67[1] = *MEMORY[0x263EF8340];
  id v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3 == 2)
  {
    id v4 = *(id *)(*(void *)(a1 + 32) + 48);
    uint64_t v5 = +[MKFCKSharedUserDataRoot entity];
LABEL_5:
    id v6 = (void *)v5;
    id v7 = objc_alloc(MEMORY[0x263EFF260]);
    id v8 = [v6 name];
    id v9 = (void *)[v7 initWithEntityName:v8];

    id v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", *(void *)(a1 + 40)];
    [v9 setPredicate:v10];

    id v11 = [*(id *)(*(void *)(a1 + 32) + 16) cloudPrivateStore];
    v67[0] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:1];
    [v9 setAffectedStores:v12];

    [v9 setFetchLimit:1];
    uint64_t v13 = *(void **)(a1 + 48);
    id v58 = 0;
    id v14 = [v13 executeFetchRequest:v9 error:&v58];
    id v15 = v58;
    id v16 = [v14 firstObject];

    if (!v16)
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch user settings container: %@", buf, 0x16u);
      }
      id v30 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      int v31 = v30;
      if (v30)
      {
        id v32 = v30;
      }
      else
      {
        [MEMORY[0x263F087E8] hmfUnspecifiedError];
        objc_claimAutoreleasedReturnValue();
      }

      int v39 = 1;
      goto LABEL_31;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v64 = __Block_byref_object_copy__181071;
    v65 = __Block_byref_object_dispose__181072;
    id v66 = 0;
    id v17 = objc_msgSend(v6, "hmd_attributesBySettingsPath");
    id v18 = *(void **)(a1 + 56);
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __87__HMDSharedUserPrivateSettingsManager_updateSettingsForHome_ofType_withValues_context___block_invoke_10;
    v51[3] = &unk_264A24120;
    id v19 = v17;
    uint64_t v20 = *(void *)(a1 + 32);
    id v52 = v19;
    uint64_t v53 = v20;
    id v54 = v6;
    v57 = buf;
    id v55 = *(id *)(a1 + 40);
    id v56 = v16;
    [v18 enumerateKeysAndObjectsUsingBlock:v51];
    id v22 = (id *)(*(void *)&buf[8] + 40);
    int64_t v21 = *(void **)(*(void *)&buf[8] + 40);
    if (v21)
    {
      v21;
    }
    else
    {
      v33 = *(void **)(a1 + 48);
      id obj = 0;
      char v34 = [v33 save:&obj];
      objc_storeStrong(v22, obj);
      uint64_t v35 = [*(id *)(a1 + 48) reset];
      if (v34)
      {
        v36 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
        id v37 = v36;
        if (v36)
        {
          [v36 addEntriesFromDictionary:*(void *)(a1 + 56)];
        }
        else
        {
          v47 = (void *)[*(id *)(a1 + 56) mutableCopy];
          [v4 setObject:v47 forKeyedSubscript:*(void *)(a1 + 40)];
        }
        int v39 = 0;
        goto LABEL_30;
      }
      context = (void *)MEMORY[0x230FBD990](v35);
      id v40 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v41 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = HMFGetLogIdentifier();
        uint64_t v43 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)id v59 = 138543618;
        v60 = v42;
        __int16 v61 = 2112;
        uint64_t v62 = v43;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to save: %@", v59, 0x16u);
      }
      id v44 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      char v45 = v44;
      if (v44)
      {
        id v46 = v44;
      }
      else
      {
        [MEMORY[0x263F087E8] hmfUnspecifiedError];
        objc_claimAutoreleasedReturnValue();
      }
    }
    int v39 = 1;
LABEL_30:

    _Block_object_dispose(buf, 8);
LABEL_31:

    if (v39) {
      uint64_t v38 = 2;
    }
    else {
      uint64_t v38 = 1;
    }
    goto LABEL_34;
  }
  if (v3 == 1)
  {
    id v4 = *(id *)(*(void *)(a1 + 32) + 40);
    uint64_t v5 = +[MKFCKSharedUserPrivateRoot entity];
    goto LABEL_5;
  }
  id v23 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  id v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    [MEMORY[0x263F087E8] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  uint64_t v38 = 2;
LABEL_34:
  os_unfair_lock_unlock(v2);
  return v38;
}

void __87__HMDSharedUserPrivateSettingsManager_updateSettingsForHome_ofType_withValues_context___block_invoke_10(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 40);
  id v12 = HMFGetOSLogHandle();
  uint64_t v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v14 = v27 = v7;
      id v15 = v8;
      id v16 = v10;
      id v17 = *(void **)(a1 + 56);
      id v18 = [*(id *)(a1 + 48) name];
      id v19 = [v9 name];
      *(_DWORD *)buf = 138544642;
      uint64_t v29 = v14;
      __int16 v30 = 2112;
      int v31 = v17;
      id v10 = v16;
      id v8 = v15;
      __int16 v32 = 2112;
      id v33 = v27;
      __int16 v34 = 2112;
      uint64_t v35 = v18;
      __int16 v36 = 2112;
      id v37 = v19;
      __int16 v38 = 2112;
      id v39 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating shared user setting %@/%@ (%@.%@) = %@", buf, 0x3Eu);

      id v7 = v27;
    }

    uint64_t v20 = *(void **)(a1 + 64);
    int64_t v21 = [v9 name];
    [v20 setValue:v8 forKey:v21];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      id v23 = [*(id *)(a1 + 48) name];
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      int v31 = v23;
      __int16 v32 = 2112;
      id v33 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Invalid settings key path for %@: %@", buf, 0x20u);
    }
    uint64_t v24 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    *a4 = 1;
  }
}

- (id)settingsForHome:(id)a3 ofType:(int64_t)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (a4 == 1)
  {
    uint64_t v8 = 40;
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    uint64_t v8 = 48;
LABEL_5:
    id v9 = *(id *)((char *)&self->super.isa + v8);
    id v10 = [v9 objectForKeyedSubscript:v6];

    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (HMDSharedUserPrivateSettingsManager)initWithCoreData:(id)a3 cloudTransform:(id)a4 homeManager:(id)a5
{
  v19[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDSharedUserPrivateSettingsManager;
  id v12 = [(HMDSharedUserPrivateSettingsManager *)&v18 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coreData, a3);
    objc_storeStrong((id *)&v13->_cloudTransform, a4);
    objc_storeWeak((id *)&v13->_homeManager, v11);
    id v14 = +[MKFCKSharedUserDataRoot entity];
    v19[0] = v14;
    id v15 = +[MKFCKSharedUserPrivateRoot entity];
    v19[1] = v15;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    [v10 registerCloudChangeListener:v13 forEntities:v16];
  }
  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_181084 != -1) {
    dispatch_once(&logCategory__hmf_once_t19_181084, &__block_literal_global_181085);
  }
  id v2 = (void *)logCategory__hmf_once_v20_181086;
  return v2;
}

void __50__HMDSharedUserPrivateSettingsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v20_181086;
  logCategory__hmf_once_v20_181086 = v0;
}

@end
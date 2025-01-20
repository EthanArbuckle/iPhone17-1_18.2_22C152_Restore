@interface HMDSharedUserAccessorySettingsDataController
- (BOOL)assistantAccessControlActivityNotificationsEnabledForPersonalRequests;
- (HMDSharedUserAccessorySettingsDataController)initWithUserModelID:(id)a3 homeModelID:(id)a4 privateStore:(id)a5 managedObjectContext:(id)a6;
- (NSArray)assistantAccessControlAccessoriesToEncode;
- (NSArray)mediaContentProfileAccessControlAccessoriesToEncode;
- (NSArray)userListeningHistoryUpdateControlModelAccessoriesToEncode;
- (id)_fetchDataRootWithError:(id *)a3;
- (void)_addMissingAccessorySettingsFromAccessoryModelIDs:(id)a3 dataRoot:(id)a4;
- (void)enableUserListeningHistoryForAccessory:(id)a3;
- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 activityNotificationsEnabledForPersonalRequests:(BOOL)a4 completion:(id)a5;
- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4;
- (void)handleRemovedAccessoryWithModelID:(id)a3;
- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4;
@end

@implementation HMDSharedUserAccessorySettingsDataController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_privateStore, 0);
  objc_storeStrong((id *)&self->_homeModelID, 0);
  objc_storeStrong((id *)&self->_userModelID, 0);
}

- (void)_addMissingAccessorySettingsFromAccessoryModelIDs:(id)a3 dataRoot:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 accessorySettings];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x263EFFA08] set];
  }
  v11 = v10;

  v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_72);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __107__HMDSharedUserAccessorySettingsDataController__addMissingAccessorySettingsFromAccessoryModelIDs_dataRoot___block_invoke_2;
  v25[3] = &unk_264A2F348;
  id v13 = v12;
  id v26 = v13;
  v20 = v6;
  v14 = objc_msgSend(v6, "na_filter:", v25);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = +[MKFCKSharedUserAccessorySettings createWithHomeModelID:self->_homeModelID accessoryModelID:*(void *)(*((void *)&v21 + 1) + 8 * i) persistentStore:self->_privateStore context:self->_moc];
        [v19 setRoot:v7];
        [v7 addAccessorySettingsObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v16);
  }
}

uint64_t __107__HMDSharedUserAccessorySettingsDataController__addMissingAccessorySettingsFromAccessoryModelIDs_dataRoot___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __107__HMDSharedUserAccessorySettingsDataController__addMissingAccessorySettingsFromAccessoryModelIDs_dataRoot___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessoryModelID];
}

- (id)_fetchDataRootWithError:(id *)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  v5 = +[MKFCKSharedUserDataRoot fetchRequest];
  id v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"homeModelID", self->_homeModelID];
  [v5 setPredicate:v6];

  v21[0] = self->_privateStore;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  [v5 setAffectedStores:v7];

  v8 = [(HMDManagedObjectContext *)self->_moc executeFetchRequest:v5 error:a3];
  v9 = v8;
  if (!v8)
  {
LABEL_5:
    id v10 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "hmf_isEmpty"))
  {
    if (a3)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:2];
      id v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_5;
  }
  if ((unint64_t)[v9 count] >= 2)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      homeModelID = self->_homeModelID;
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = homeModelID;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@More than one shared data root with home modelID %@ is found, using the first one", buf, 0x16u);
    }
  }
  id v10 = [v9 firstObject];
LABEL_11:

  return v10;
}

- (void)handleRemovedAccessoryWithModelID:(id)a3
{
  id v4 = a3;
  moc = self->_moc;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__HMDSharedUserAccessorySettingsDataController_handleRemovedAccessoryWithModelID___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HMDManagedObjectContext *)moc performBlock:v7];
}

void __82__HMDSharedUserAccessorySettingsDataController_handleRemovedAccessoryWithModelID___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v30 = 0;
  v3 = [v2 _fetchDataRootWithError:&v30];
  id v4 = v30;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v5 = [v3 accessorySettings];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v11 = [v10 accessoryModelID];
          int v12 = [v11 isEqual:*(void *)(a1 + 40)];

          if (v12) {
            [*(id *)(*(void *)(a1 + 32) + 32) deleteObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
      }
      while (v7);
    }

    id v13 = *(void **)(*(void *)(a1 + 32) + 32);
    id v25 = v4;
    [v13 save:&v25];
    id v14 = v25;

    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v32 = v18;
        __int16 v33 = 2112;
        uint64_t v34 = v19;
        __int16 v35 = 2112;
        id v36 = v14;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Deleting shared user accessory setting with modelID %@ failed with %@", buf, 0x20u);
      }
      HMDSanitizeCoreDataError(v14);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 32) reset];
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v23 = HMFGetLogIdentifier();
      uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      __int16 v33 = 2112;
      uint64_t v34 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);
    }
    if (!v4)
    {
      id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
  }
}

- (void)enableUserListeningHistoryForAccessory:(id)a3
{
  id v4 = a3;
  moc = self->_moc;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87__HMDSharedUserAccessorySettingsDataController_enableUserListeningHistoryForAccessory___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HMDManagedObjectContext *)moc performBlock:v7];
}

void __87__HMDSharedUserAccessorySettingsDataController_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v34 = 0;
  v3 = [v2 _fetchDataRootWithError:&v34];
  id v4 = v34;
  id v5 = v4;
  if (!v3)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = HMFGetLogIdentifier();
      id v13 = *(void **)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v12;
      __int16 v39 = 2112;
      id v40 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Enabling ULH failed with no shared data root for home %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (v4)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v9;
      __int16 v39 = 2112;
      id v40 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Enabling ULH for shared user failed with %@", buf, 0x16u);
    }
LABEL_9:
    goto LABEL_24;
  }
  id v14 = *(void **)(a1 + 32);
  uint64_t v36 = *(void *)(a1 + 40);
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  [v14 _addMissingAccessorySettingsFromAccessoryModelIDs:v15 dataRoot:v3];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = [v3 accessorySettings];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v22 = *(void **)(a1 + 40);
        long long v23 = [v21 accessoryModelID];
        LODWORD(v22) = objc_msgSend(v22, "hmf_isEqualToUUID:", v23);

        if (v22) {
          [v21 setListeningHistoryEnabled:1];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v18);
  }

  uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 32);
  id v29 = 0;
  [v24 save:&v29];
  id v5 = v29;
  if (v5)
  {
    id v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = *(id *)(a1 + 32);
    long long v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v28;
      __int16 v39 = 2112;
      id v40 = v5;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Enabling ULH for shared user failed with %@", buf, 0x16u);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 32) reset];
LABEL_24:
}

- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  moc = self->_moc;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __120__HMDSharedUserAccessorySettingsDataController_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs_completion___block_invoke;
  v11[3] = &unk_264A2EE80;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(HMDManagedObjectContext *)moc performBlock:v11];
}

void __120__HMDSharedUserAccessorySettingsDataController_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v34 = 0;
  v3 = [v2 _fetchDataRootWithError:&v34];
  id v4 = v34;
  if (v3)
  {
    [*(id *)(a1 + 32) _addMissingAccessorySettingsFromAccessoryModelIDs:*(void *)(a1 + 40) dataRoot:v3];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = [v3 accessorySettings];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v11 = *(void **)(a1 + 40);
          id v12 = [v10 accessoryModelID];
          uint64_t v13 = [v11 containsObject:v12];

          [v10 setListeningHistoryEnabled:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    id v14 = *(void **)(*(void *)(a1 + 32) + 32);
    id v29 = v4;
    [v14 save:&v29];
    id v15 = v29;

    if (v15)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v19;
        __int16 v38 = 2112;
        id v39 = v15;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Saving updated user listening history access control failed with %@", buf, 0x16u);
      }
      HMDSanitizeCoreDataError(v15);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 32) reset];
    long long v27 = _Block_copy(*(const void **)(a1 + 48));
    id v26 = (void (**)(void, void))v27;
    if (v27) {
      (*((void (**)(void *, id))v27 + 2))(v27, v4);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v23 = HMFGetLogIdentifier();
      uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      __int16 v38 = 2112;
      id v39 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);
    }
    id v25 = _Block_copy(*(const void **)(a1 + 48));
    id v26 = (void (**)(void, void))v25;
    if (v25)
    {
      if (v4)
      {
        (*((void (**)(void *, id))v25 + 2))(v25, v4);
      }
      else
      {
        long long v28 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        ((void (**)(void, void *))v26)[2](v26, v28);

        id v4 = 0;
      }
    }
  }
}

- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  moc = self->_moc;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __119__HMDSharedUserAccessorySettingsDataController_handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs_completion___block_invoke;
  v11[3] = &unk_264A2EE80;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(HMDManagedObjectContext *)moc performBlock:v11];
}

void __119__HMDSharedUserAccessorySettingsDataController_handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v34 = 0;
  v3 = [v2 _fetchDataRootWithError:&v34];
  id v4 = v34;
  if (v3)
  {
    [*(id *)(a1 + 32) _addMissingAccessorySettingsFromAccessoryModelIDs:*(void *)(a1 + 40) dataRoot:v3];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = [v3 accessorySettings];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v11 = *(void **)(a1 + 40);
          id v12 = [v10 accessoryModelID];
          uint64_t v13 = [v11 containsObject:v12];

          [v10 setMediaContentProfileEnabled:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    id v14 = *(void **)(*(void *)(a1 + 32) + 32);
    id v29 = v4;
    [v14 save:&v29];
    id v15 = v29;

    if (v15)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v19;
        __int16 v38 = 2112;
        id v39 = v15;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Saving updated media content profile access control failed with %@", buf, 0x16u);
      }
      HMDSanitizeCoreDataError(v15);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 32) reset];
    long long v27 = _Block_copy(*(const void **)(a1 + 48));
    id v26 = (void (**)(void, void))v27;
    if (v27) {
      (*((void (**)(void *, id))v27 + 2))(v27, v4);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v23 = HMFGetLogIdentifier();
      uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      __int16 v38 = 2112;
      id v39 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);
    }
    id v25 = _Block_copy(*(const void **)(a1 + 48));
    id v26 = (void (**)(void, void))v25;
    if (v25)
    {
      if (v4)
      {
        (*((void (**)(void *, id))v25 + 2))(v25, v4);
      }
      else
      {
        long long v28 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        ((void (**)(void, void *))v26)[2](v26, v28);

        id v4 = 0;
      }
    }
  }
}

- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 activityNotificationsEnabledForPersonalRequests:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  moc = self->_moc;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __157__HMDSharedUserAccessorySettingsDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_activityNotificationsEnabledForPersonalRequests_completion___block_invoke;
  v13[3] = &unk_264A2B340;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a4;
  v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  [(HMDManagedObjectContext *)moc performBlock:v13];
}

void __157__HMDSharedUserAccessorySettingsDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_activityNotificationsEnabledForPersonalRequests_completion___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v34 = 0;
  v3 = [v2 _fetchDataRootWithError:&v34];
  id v4 = v34;
  if (v3)
  {
    [v3 setActivityNotificationsEnabledForPersonalRequests:*(unsigned __int8 *)(a1 + 56)];
    [*(id *)(a1 + 32) _addMissingAccessorySettingsFromAccessoryModelIDs:*(void *)(a1 + 40) dataRoot:v3];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = [v3 accessorySettings];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v11 = *(void **)(a1 + 40);
          id v12 = [v10 accessoryModelID];
          uint64_t v13 = [v11 containsObject:v12];

          [v10 setPersonalRequestsEnabled:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    id v14 = *(void **)(*(void *)(a1 + 32) + 32);
    id v29 = v4;
    [v14 save:&v29];
    id v15 = v29;

    if (v15)
    {
      BOOL v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v19;
        __int16 v38 = 2112;
        id v39 = v15;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Saving personal requests access control failed with %@", buf, 0x16u);
      }
      HMDSanitizeCoreDataError(v15);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 32) reset];
    long long v27 = _Block_copy(*(const void **)(a1 + 48));
    id v26 = (void (**)(void, void))v27;
    if (v27) {
      (*((void (**)(void *, id))v27 + 2))(v27, v4);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    long long v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      long long v23 = HMFGetLogIdentifier();
      uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      __int16 v38 = 2112;
      id v39 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);
    }
    id v25 = _Block_copy(*(const void **)(a1 + 48));
    id v26 = (void (**)(void, void))v25;
    if (v25)
    {
      if (v4)
      {
        (*((void (**)(void *, id))v25 + 2))(v25, v4);
      }
      else
      {
        long long v28 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
        ((void (**)(void, void *))v26)[2](v26, v28);

        id v4 = 0;
      }
    }
  }
}

- (NSArray)userListeningHistoryUpdateControlModelAccessoriesToEncode
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__126917;
  id v12 = __Block_byref_object_dispose__126918;
  id v13 = 0;
  moc = self->_moc;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __105__HMDSharedUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke;
  v7[3] = &unk_264A2F0A0;
  v7[4] = self;
  void v7[5] = &v8;
  [(HMDManagedObjectContext *)moc performBlockAndWait:v7];
  v3 = (void *)v9[5];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF8C0] array];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __105__HMDSharedUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v15 = 0;
  v3 = [v2 _fetchDataRootWithError:&v15];
  id v4 = v15;
  if (v3)
  {
    id v5 = [v3 accessorySettings];
    uint64_t v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_64_126971);
    uint64_t v7 = [v6 allObjects];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);
    }
    if (!v4)
    {
      id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
  }
}

id __105__HMDSharedUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke_62(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 listeningHistoryEnabled])
  {
    v3 = [v2 accessoryModelID];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSArray)mediaContentProfileAccessControlAccessoriesToEncode
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__126917;
  id v12 = __Block_byref_object_dispose__126918;
  id v13 = 0;
  moc = self->_moc;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __99__HMDSharedUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke;
  v7[3] = &unk_264A2F0A0;
  v7[4] = self;
  void v7[5] = &v8;
  [(HMDManagedObjectContext *)moc performBlockAndWait:v7];
  v3 = (void *)v9[5];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF8C0] array];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __99__HMDSharedUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  id v15 = 0;
  v3 = [v2 _fetchDataRootWithError:&v15];
  id v4 = v15;
  if (v3)
  {
    id v5 = [v3 accessorySettings];
    uint64_t v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_61);
    uint64_t v7 = [v6 allObjects];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);
    }
    if (!v4)
    {
      id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
  }
}

id __99__HMDSharedUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke_59(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 mediaContentProfileEnabled])
  {
    v3 = [v2 accessoryModelID];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSArray)assistantAccessControlAccessoriesToEncode
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__126917;
  id v12 = __Block_byref_object_dispose__126918;
  id v13 = 0;
  moc = self->_moc;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__HMDSharedUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke;
  v7[3] = &unk_264A2F0A0;
  v7[4] = self;
  void v7[5] = &v8;
  [(HMDManagedObjectContext *)moc performBlockAndWait:v7];
  v3 = (void *)v9[5];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF8C0] array];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __89__HMDSharedUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  id v15 = 0;
  v3 = [v2 _fetchDataRootWithError:&v15];
  id v4 = v15;
  if (v3)
  {
    id v5 = [v3 accessorySettings];
    uint64_t v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_58_126975);
    uint64_t v7 = [v6 allObjects];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);
    }
    if (!v4)
    {
      id v4 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
  }
}

id __89__HMDSharedUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke_55(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 personalRequestsEnabled])
  {
    v3 = [v2 accessoryModelID];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)assistantAccessControlActivityNotificationsEnabledForPersonalRequests
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  moc = self->_moc;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __117__HMDSharedUserAccessorySettingsDataController_assistantAccessControlActivityNotificationsEnabledForPersonalRequests__block_invoke;
  v5[3] = &unk_264A2F0A0;
  v5[4] = self;
  v5[5] = &v6;
  [(HMDManagedObjectContext *)moc performBlockAndWait:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __117__HMDSharedUserAccessorySettingsDataController_assistantAccessControlActivityNotificationsEnabledForPersonalRequests__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  id v10 = 0;
  char v3 = [v2 _fetchDataRootWithError:&v10];
  id v4 = v10;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 activityNotificationsEnabledForPersonalRequests];
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      id v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);
    }
  }
}

- (HMDSharedUserAccessorySettingsDataController)initWithUserModelID:(id)a3 homeModelID:(id)a4 privateStore:(id)a5 managedObjectContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDSharedUserAccessorySettingsDataController;
  uint64_t v15 = [(HMDSharedUserAccessorySettingsDataController *)&v18 init];
  BOOL v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_userModelID, a3);
    objc_storeStrong((id *)&v16->_homeModelID, a4);
    objc_storeStrong((id *)&v16->_privateStore, a5);
    objc_storeStrong((id *)&v16->_moc, a6);
  }

  return v16;
}

@end
@interface HMDUserAccessorySettingsDataController
- (BOOL)assistantAccessControlActivityNotificationsEnabledForPersonalRequests;
- (HMDUserAccessorySettingsDataController)initWithUserModelID:(id)a3 managedObjectContext:(id)a4;
- (NSArray)assistantAccessControlAccessoriesToEncode;
- (NSArray)mediaContentProfileAccessControlAccessoriesToEncode;
- (NSArray)userListeningHistoryUpdateControlModelAccessoriesToEncode;
- (id)_updatedAccessorySetFromAccessoryUUIDs:(id)a3 currentAccessories:(id)a4 error:(id *)a5;
- (void)enableUserListeningHistoryForAccessory:(id)a3;
- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 activityNotificationsEnabledForPersonalRequests:(BOOL)a4 completion:(id)a5;
- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4;
- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4;
@end

@implementation HMDUserAccessorySettingsDataController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userModelID, 0);
}

- (id)_updatedAccessorySetFromAccessoryUUIDs:(id)a3 currentAccessories:(id)a4 error:(id *)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_15_126897);
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __106__HMDUserAccessorySettingsDataController__updatedAccessorySetFromAccessoryUUIDs_currentAccessories_error___block_invoke_2;
  v46[3] = &unk_264A2F348;
  id v35 = v9;
  id v47 = v35;
  v10 = objc_msgSend(v7, "na_filter:", v46);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __106__HMDUserAccessorySettingsDataController__updatedAccessorySetFromAccessoryUUIDs_currentAccessories_error___block_invoke_3;
  v44[3] = &unk_264A20340;
  id v34 = v7;
  id v45 = v34;
  v11 = objc_msgSend(v8, "na_filter:", v44);
  v12 = (void *)[v11 mutableCopy];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v33 = a5;
    id v16 = 0;
    uint64_t v17 = *(void *)v41;
    id obj = v13;
    while (2)
    {
      uint64_t v18 = 0;
      v19 = v16;
      do
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * v18);
        v21 = [(HMCContext *)self->_context managedObjectContext];
        id v39 = v19;
        v22 = +[_MKFModel modelWithModelID:v20 context:v21 error:&v39];
        id v16 = v39;

        if (!v22)
        {
          if (!v16)
          {
            v23 = (void *)MEMORY[0x263F087E8];
            v24 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2020];
            id v16 = [v23 hmErrorWithCode:2 description:0 reason:0 suggestion:0 underlyingError:v24];
          }
          v25 = (void *)MEMORY[0x230FBD990]();
          v26 = self;
          v27 = HMFGetOSLogHandle();
          v28 = v35;
          v29 = v34;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = v38 = v25;
            *(_DWORD *)buf = 138543874;
            v49 = v30;
            __int16 v50 = 2112;
            uint64_t v51 = v20;
            __int16 v52 = 2112;
            id v53 = v16;
            _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Fetching accessory with modelID %@ failed with %@", buf, 0x20u);

            v25 = v38;
          }

          if (v33) {
            id *v33 = v16;
          }
          id v13 = obj;

          v31 = 0;
          goto LABEL_19;
        }
        [v12 addObject:v22];

        ++v18;
        v19 = v16;
      }
      while (v15 != v18);
      id v13 = obj;
      uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v16 = 0;
  }

  v31 = (void *)[v12 copy];
  v28 = v35;
  v29 = v34;
LABEL_19:

  return v31;
}

uint64_t __106__HMDUserAccessorySettingsDataController__updatedAccessorySetFromAccessoryUUIDs_currentAccessories_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __106__HMDUserAccessorySettingsDataController__updatedAccessorySetFromAccessoryUUIDs_currentAccessories_error___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 modelID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __106__HMDUserAccessorySettingsDataController__updatedAccessorySetFromAccessoryUUIDs_currentAccessories_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 modelID];
}

- (void)enableUserListeningHistoryForAccessory:(id)a3
{
  id v4 = a3;
  v5 = self->_userModelID;
  v6 = [(HMCContext *)self->_context managedObjectContext];
  context = self->_context;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__HMDUserAccessorySettingsDataController_enableUserListeningHistoryForAccessory___block_invoke;
  v11[3] = &unk_264A2E610;
  v12 = v5;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v4;
  id v8 = v4;
  id v9 = v6;
  v10 = v5;
  [(HMCContext *)context performBlock:v11];
}

void __81__HMDUserAccessorySettingsDataController_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v30 = 0;
  id v4 = +[_MKFModel modelWithModelID:v2 context:v3 error:&v30];
  id v5 = v30;
  if (v4)
  {
    v6 = (void *)MEMORY[0x263EFF9C0];
    id v7 = [v4 accessoriesWithListeningHistoryEnabled];
    if (v7)
    {
      id v8 = [v6 setWithSet:v7];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263EFFA08] set];
      id v8 = [v6 setWithSet:v14];
    }
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 40);
    id v29 = v5;
    uint64_t v17 = +[_MKFModel modelWithModelID:v15 context:v16 error:&v29];
    id v18 = v29;

    if ([v8 containsObject:v17])
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 48);
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        v23 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        __int16 v33 = 2112;
        id v34 = v23;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ ULH is already enabled", buf, 0x16u);
      }
    }
    else
    {
      [v8 addObject:v17];
      v24 = (void *)[v8 copy];
      objc_msgSend(v4, "setAccessoriesWithListeningHistoryEnabled_:", v24);

      v25 = *(void **)(*(void *)(a1 + 48) + 16);
      id v28 = v18;
      [v25 save:&v28];
      id v26 = v28;

      if (!v26)
      {
        id v18 = 0;
        goto LABEL_16;
      }
      v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 48);
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v32 = v27;
        __int16 v33 = 2112;
        id v34 = v26;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Saving user listening history access control failed with %@", buf, 0x16u);
      }
      id v18 = v26;
    }

LABEL_16:

    id v5 = v18;
    goto LABEL_17;
  }
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 48);
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = HMFGetLogIdentifier();
    id v13 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v32 = v12;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v5;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@ when enabling ULH", buf, 0x20u);
  }
LABEL_17:
}

- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_userModelID;
  id v9 = [(HMCContext *)self->_context managedObjectContext];
  context = self->_context;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __114__HMDUserAccessorySettingsDataController_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs_completion___block_invoke;
  v15[3] = &unk_264A2DDC0;
  uint64_t v16 = v8;
  id v17 = v9;
  id v19 = v6;
  id v20 = v7;
  id v18 = self;
  id v11 = v6;
  id v12 = v7;
  id v13 = v9;
  uint64_t v14 = v8;
  [(HMCContext *)context performBlock:v15];
}

void __114__HMDUserAccessorySettingsDataController_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v31 = 0;
  id v4 = +[_MKFModel modelWithModelID:v2 context:v3 error:&v31];
  id v5 = v31;
  if (v4)
  {
    id v6 = [v4 accessoriesWithListeningHistoryEnabled];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x263EFFA08] set];
    }
    uint64_t v15 = v8;

    uint64_t v16 = *(void **)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    id v30 = v5;
    id v18 = [v16 _updatedAccessorySetFromAccessoryUUIDs:v17 currentAccessories:v15 error:&v30];
    id v19 = v30;

    if (v18)
    {
      id v20 = (void *)[v18 copy];
      objc_msgSend(v4, "setAccessoriesWithListeningHistoryEnabled_:", v20);

      v21 = *(void **)(*(void *)(a1 + 48) + 16);
      id v29 = v19;
      [v21 save:&v29];
      id v22 = v29;

      if (v22)
      {
        v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = *(id *)(a1 + 48);
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          id v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v33 = v26;
          __int16 v34 = 2112;
          id v35 = v22;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Saving user listening history access control failed with %@", buf, 0x16u);
        }
        HMDSanitizeCoreDataError(v22);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = 0;
      }
    }
    v27 = _Block_copy(*(const void **)(a1 + 64));
    id v28 = v27;
    if (v27) {
      (*((void (**)(void *, id))v27 + 2))(v27, v19);
    }

    id v5 = v19;
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 48);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      __int16 v33 = v12;
      __int16 v34 = 2112;
      id v35 = v13;
      __int16 v36 = 2112;
      id v37 = v5;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);
    }
    uint64_t v14 = _Block_copy(*(const void **)(a1 + 64));
    uint64_t v15 = v14;
    if (v14) {
      (*((void (**)(void *, id))v14 + 2))(v14, v5);
    }
  }
}

- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_userModelID;
  id v9 = [(HMCContext *)self->_context managedObjectContext];
  context = self->_context;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __113__HMDUserAccessorySettingsDataController_handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs_completion___block_invoke;
  v15[3] = &unk_264A2DDC0;
  uint64_t v16 = v8;
  id v17 = v9;
  id v19 = v6;
  id v20 = v7;
  id v18 = self;
  id v11 = v6;
  id v12 = v7;
  id v13 = v9;
  uint64_t v14 = v8;
  [(HMCContext *)context performBlock:v15];
}

void __113__HMDUserAccessorySettingsDataController_handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v31 = 0;
  id v4 = +[_MKFModel modelWithModelID:v2 context:v3 error:&v31];
  id v5 = v31;
  if (v4)
  {
    id v6 = [v4 accessoriesWithMediaContentProfileEnabled];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x263EFFA08] set];
    }
    uint64_t v15 = v8;

    uint64_t v16 = *(void **)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    id v30 = v5;
    id v18 = [v16 _updatedAccessorySetFromAccessoryUUIDs:v17 currentAccessories:v15 error:&v30];
    id v19 = v30;

    if (v18)
    {
      id v20 = (void *)[v18 copy];
      objc_msgSend(v4, "setAccessoriesWithMediaContentProfileEnabled_:", v20);

      v21 = *(void **)(*(void *)(a1 + 48) + 16);
      id v29 = v19;
      [v21 save:&v29];
      id v22 = v29;

      if (v22)
      {
        v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = *(id *)(a1 + 48);
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          id v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v33 = v26;
          __int16 v34 = 2112;
          id v35 = v22;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Saving updated media content profile access control failed with %@", buf, 0x16u);
        }
        HMDSanitizeCoreDataError(v22);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = 0;
      }
    }
    v27 = _Block_copy(*(const void **)(a1 + 64));
    id v28 = v27;
    if (v27) {
      (*((void (**)(void *, id))v27 + 2))(v27, v19);
    }

    id v5 = v19;
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 48);
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      __int16 v33 = v12;
      __int16 v34 = 2112;
      id v35 = v13;
      __int16 v36 = 2112;
      id v37 = v5;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);
    }
    uint64_t v14 = _Block_copy(*(const void **)(a1 + 64));
    uint64_t v15 = v14;
    if (v14) {
      (*((void (**)(void *, id))v14 + 2))(v14, v5);
    }
  }
}

- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 activityNotificationsEnabledForPersonalRequests:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = self->_userModelID;
  id v11 = [(HMCContext *)self->_context managedObjectContext];
  context = self->_context;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __151__HMDUserAccessorySettingsDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_activityNotificationsEnabledForPersonalRequests_completion___block_invoke;
  v17[3] = &unk_264A20318;
  id v18 = v10;
  id v19 = v11;
  id v21 = v8;
  id v22 = v9;
  BOOL v23 = a4;
  id v20 = self;
  id v13 = v8;
  id v14 = v9;
  id v15 = v11;
  uint64_t v16 = v10;
  [(HMCContext *)context performBlock:v17];
}

void __151__HMDUserAccessorySettingsDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_activityNotificationsEnabledForPersonalRequests_completion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v32 = 0;
  id v4 = +[_MKFModel modelWithModelID:v2 context:v3 error:&v32];
  id v5 = v32;
  if (v4)
  {
    id v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
    [v4 setActivityNotificationsEnabledForPersonalRequests:v6];

    id v7 = [v4 accessoriesWithPersonalRequestsEnabled];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x263EFFA08] set];
    }
    uint64_t v16 = v9;

    uint64_t v17 = *(void **)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    id v31 = v5;
    id v19 = [v17 _updatedAccessorySetFromAccessoryUUIDs:v18 currentAccessories:v16 error:&v31];
    id v20 = v31;

    if (v19)
    {
      id v21 = (void *)[v19 copy];
      objc_msgSend(v4, "setAccessoriesWithPersonalRequestsEnabled_:", v21);

      id v22 = *(void **)(*(void *)(a1 + 48) + 16);
      id v30 = v20;
      [v22 save:&v30];
      id v23 = v30;

      if (v23)
      {
        id v24 = (void *)MEMORY[0x230FBD990]();
        id v25 = *(id *)(a1 + 48);
        id v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v34 = v27;
          __int16 v35 = 2112;
          id v36 = v23;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Saving personal requests access control failed with %@", buf, 0x16u);
        }
        HMDSanitizeCoreDataError(v23);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v20 = 0;
      }
    }
    id v28 = _Block_copy(*(const void **)(a1 + 64));
    id v29 = v28;
    if (v28) {
      (*((void (**)(void *, id))v28 + 2))(v28, v20);
    }

    id v5 = v20;
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 48);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      __int16 v34 = v13;
      __int16 v35 = 2112;
      id v36 = v14;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);
    }
    id v15 = _Block_copy(*(const void **)(a1 + 64));
    uint64_t v16 = v15;
    if (v15) {
      (*((void (**)(void *, id))v15 + 2))(v15, v5);
    }
  }
}

- (NSArray)userListeningHistoryUpdateControlModelAccessoriesToEncode
{
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__126917;
  id v24 = __Block_byref_object_dispose__126918;
  id v25 = 0;
  uint64_t v3 = self->_userModelID;
  id v4 = [(HMCContext *)self->_context managedObjectContext];
  context = self->_context;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __99__HMDUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke;
  id v15 = &unk_264A2F000;
  id v6 = v3;
  uint64_t v16 = v6;
  id v7 = v4;
  id v17 = v7;
  uint64_t v18 = self;
  id v19 = &v20;
  [(HMCContext *)context unsafeSynchronousBlock:&v12];
  id v8 = (void *)v21[5];
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF8C0], "array", v12, v13, v14, v15, v16);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v10 = v9;

  _Block_object_dispose(&v20, 8);
  return (NSArray *)v10;
}

void __99__HMDUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  id v4 = +[_MKFModel modelWithModelID:v2 context:v3 error:&v16];
  id v5 = v16;
  if (v4)
  {
    id v6 = [v4 accessoriesWithListeningHistoryEnabled];
    id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_9_126921);
    uint64_t v8 = [v7 allObjects];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);
    }
  }
}

uint64_t __99__HMDUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 modelID];
}

- (NSArray)mediaContentProfileAccessControlAccessoriesToEncode
{
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__126917;
  id v24 = __Block_byref_object_dispose__126918;
  id v25 = 0;
  uint64_t v3 = self->_userModelID;
  id v4 = [(HMCContext *)self->_context managedObjectContext];
  context = self->_context;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __93__HMDUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke;
  uint64_t v15 = &unk_264A2F000;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  id v17 = v7;
  uint64_t v18 = self;
  __int16 v19 = &v20;
  [(HMCContext *)context unsafeSynchronousBlock:&v12];
  uint64_t v8 = (void *)v21[5];
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF8C0], "array", v12, v13, v14, v15, v16);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v10 = v9;

  _Block_object_dispose(&v20, 8);
  return (NSArray *)v10;
}

void __93__HMDUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  id v4 = +[_MKFModel modelWithModelID:v2 context:v3 error:&v16];
  id v5 = v16;
  if (v4)
  {
    id v6 = [v4 accessoriesWithMediaContentProfileEnabled];
    id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_6_126924);
    uint64_t v8 = [v7 allObjects];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);
    }
  }
}

uint64_t __93__HMDUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 modelID];
}

- (NSArray)assistantAccessControlAccessoriesToEncode
{
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__126917;
  id v24 = __Block_byref_object_dispose__126918;
  id v25 = 0;
  uint64_t v3 = self->_userModelID;
  id v4 = [(HMCContext *)self->_context managedObjectContext];
  context = self->_context;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __83__HMDUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke;
  uint64_t v15 = &unk_264A2F000;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  id v17 = v7;
  uint64_t v18 = self;
  __int16 v19 = &v20;
  [(HMCContext *)context unsafeSynchronousBlock:&v12];
  uint64_t v8 = (void *)v21[5];
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF8C0], "array", v12, v13, v14, v15, v16);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v10 = v9;

  _Block_object_dispose(&v20, 8);
  return (NSArray *)v10;
}

void __83__HMDUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  id v4 = +[_MKFModel modelWithModelID:v2 context:v3 error:&v16];
  id v5 = v16;
  if (v4)
  {
    id v6 = [v4 accessoriesWithPersonalRequestsEnabled];
    id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_126927);
    uint64_t v8 = [v7 allObjects];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);
    }
  }
}

uint64_t __83__HMDUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke_1(uint64_t a1, void *a2)
{
  return [a2 modelID];
}

- (BOOL)assistantAccessControlActivityNotificationsEnabledForPersonalRequests
{
  uint64_t v2 = self;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v3 = self->_userModelID;
  id v4 = [(HMCContext *)v2->_context managedObjectContext];
  context = v2->_context;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __111__HMDUserAccessorySettingsDataController_assistantAccessControlActivityNotificationsEnabledForPersonalRequests__block_invoke;
  v9[3] = &unk_264A2F000;
  id v6 = v3;
  id v10 = v6;
  id v7 = v4;
  id v11 = v7;
  id v12 = v2;
  uint64_t v13 = &v14;
  [(HMCContext *)context unsafeSynchronousBlock:v9];
  LOBYTE(v2) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v2;
}

void __111__HMDUserAccessorySettingsDataController_assistantAccessControlActivityNotificationsEnabledForPersonalRequests__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v12 = 0;
  id v4 = +[_MKFModel modelWithModelID:v2 context:v3 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v6 = [v4 activityNotificationsEnabledForPersonalRequests];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v6 BOOLValue];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);
    }
  }
}

- (HMDUserAccessorySettingsDataController)initWithUserModelID:(id)a3 managedObjectContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDUserAccessorySettingsDataController;
  uint64_t v9 = [(HMDUserAccessorySettingsDataController *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userModelID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

@end
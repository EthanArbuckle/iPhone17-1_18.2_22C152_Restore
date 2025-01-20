@interface HMDPersonResidentSyncManager
+ (id)logCategory;
- (HMDPersonResidentSyncManager)initWithUUID:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5 residentSyncManager:(id)a6;
- (HMDPersonResidentSyncManagerDelegate)delegate;
- (HMDResidentSyncManager)residentSyncManager;
- (HMFMessageDispatcher)messageDispatcher;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (id)addOrUpdatePersons:(id)a3;
- (id)addOrUpdatePersons:(id)a3 andRemovePersonsWithUUIDs:(id)a4;
- (id)logIdentifier;
- (id)removeAllAssociatedData;
- (id)removePersonsWithUUIDs:(id)a3;
- (void)configureWithHome:(id)a3 delegate:(id)a4;
- (void)handleModifyPersonsMessage:(id)a3;
- (void)handleRemoveAllAssociatedDataMessage:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMDPersonResidentSyncManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentSyncManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMDResidentSyncManager)residentSyncManager
{
  return (HMDResidentSyncManager *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDPersonResidentSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDPersonResidentSyncManagerDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDPersonResidentSyncManager *)self UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleRemoveAllAssociatedDataMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDPersonResidentSyncManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remove all associated data message: %@", buf, 0x16u);
  }
  v11 = [(HMDPersonResidentSyncManager *)v7 residentSyncManager];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__HMDPersonResidentSyncManager_handleRemoveAllAssociatedDataMessage___block_invoke;
  v12[3] = &unk_264A2F558;
  v12[4] = v7;
  [v11 interceptRemoteResidentRequest:v4 proceed:v12];
}

void __69__HMDPersonResidentSyncManager_handleRemoveAllAssociatedDataMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  v5 = [v4 removeAllAssociatedData];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__HMDPersonResidentSyncManager_handleRemoveAllAssociatedDataMessage___block_invoke_2;
  v8[3] = &unk_264A2D1D0;
  id v9 = v3;
  id v6 = v3;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

uint64_t __69__HMDPersonResidentSyncManager_handleRemoveAllAssociatedDataMessage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handleModifyPersonsMessage:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDPersonResidentSyncManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    v10 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    v35 = v9;
    __int16 v36 = 2112;
    v37 = v10;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling modify persons message: %@", buf, 0x16u);
  }
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  v12 = [v4 unarchivedObjectForKey:@"HMDPRSM.mk.personsToAddOrUpdate" ofClasses:v11];

  if (v12)
  {
    v13 = [v4 arrayForKey:@"HMDPRSM.mk.personUUIDsToRemove"];
    v14 = v13;
    if (v13)
    {
      __int16 v15 = (void *)MEMORY[0x263EFFA08];
      v16 = objc_msgSend(v13, "na_map:", &__block_literal_global_56_100319);
      uint64_t v17 = [v15 setWithArray:v16];

      v18 = [(HMDPersonResidentSyncManager *)v7 residentSyncManager];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __59__HMDPersonResidentSyncManager_handleModifyPersonsMessage___block_invoke_2;
      v30[3] = &unk_264A1E508;
      v30[4] = v7;
      id v31 = v12;
      id v32 = v17;
      id v19 = v17;
      [v18 interceptRemoteResidentRequest:v4 proceed:v30];
    }
    else
    {
      v25 = (void *)MEMORY[0x230FBD990]();
      v26 = v7;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        v29 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v35 = v28;
        __int16 v36 = 2112;
        v37 = v29;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find person UUID strings in message payload: %@", buf, 0x16u);
      }
      id v19 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      [v4 respondWithError:v19];
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = v7;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      __int16 v36 = 2112;
      v37 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find persons in message payload: %@", buf, 0x16u);
    }
    v14 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v4 respondWithError:v14];
  }
}

void __59__HMDPersonResidentSyncManager_handleModifyPersonsMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  v5 = [v4 addOrUpdatePersons:*(void *)(a1 + 40) andRemovePersonsWithUUIDs:*(void *)(a1 + 48)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__HMDPersonResidentSyncManager_handleModifyPersonsMessage___block_invoke_3;
  v8[3] = &unk_264A2D1D0;
  id v9 = v3;
  id v6 = v3;
  id v7 = (id)[v5 addCompletionBlock:v8];
}

uint64_t __59__HMDPersonResidentSyncManager_handleModifyPersonsMessage___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

id __59__HMDPersonResidentSyncManager_handleModifyPersonsMessage___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F08C38];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (id)removeAllAssociatedData
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Remove all associated data"];
  id v4 = (void *)MEMORY[0x230FBD990]();
  v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    v8 = [v3 identifier];
    id v9 = [v8 shortDescription];
    *(_DWORD *)buf = 138543618;
    v29 = v7;
    __int16 v30 = 2114;
    id v31 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing all associated data", buf, 0x16u);
  }
  id v10 = objc_alloc_init(MEMORY[0x263F58190]);
  v11 = (void *)MEMORY[0x263F581B8];
  v12 = [(HMDPersonResidentSyncManager *)v5 workQueue];
  v13 = [v11 schedulerWithDispatchQueue:v12];
  v14 = [v10 reschedule:v13];

  id v15 = objc_alloc(MEMORY[0x263F42570]);
  v16 = [(HMDPersonResidentSyncManager *)v5 UUID];
  uint64_t v17 = (void *)[v15 initWithTarget:v16];

  v18 = [MEMORY[0x263F42590] messageWithName:@"HMDPRSM.m.removeAllAssociatedData" destination:v17 payload:0];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __55__HMDPersonResidentSyncManager_removeAllAssociatedData__block_invoke;
  v25[3] = &unk_264A2AEE8;
  v25[4] = v5;
  id v26 = v3;
  id v19 = v14;
  id v27 = v19;
  id v20 = v3;
  [v18 setResponseHandler:v25];
  v21 = [(HMDPersonResidentSyncManager *)v5 residentSyncManager];
  [v21 performResidentRequest:v18 options:0];

  v22 = v27;
  id v23 = v19;

  return v23;
}

void __55__HMDPersonResidentSyncManager_removeAllAssociatedData__block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = a1[4];
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [a1[5] identifier];
      v13 = [v12 shortDescription];
      int v17 = 138543874;
      v18 = v11;
      __int16 v19 = 2114;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to remove all associated data: %@", (uint8_t *)&v17, 0x20u);
    }
    [a1[6] finishWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      id v15 = [a1[5] identifier];
      v16 = [v15 shortDescription];
      int v17 = 138543618;
      v18 = v14;
      __int16 v19 = 2114;
      id v20 = v16;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully removed all associated data", (uint8_t *)&v17, 0x16u);
    }
    [a1[6] finishWithNoResult];
  }
}

- (id)addOrUpdatePersons:(id)a3 andRemovePersonsWithUUIDs:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  id v10 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Modifying persons"];
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    id v15 = [v10 identifier];
    v16 = [v15 shortDescription];
    *(_DWORD *)buf = 138544130;
    v56 = v14;
    __int16 v57 = 2114;
    v58 = v16;
    __int16 v59 = 2112;
    id v60 = v8;
    __int16 v61 = 2112;
    id v62 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding/updating persons: %@, removing persons with UUIDs: %@", buf, 0x2Au);
  }
  id v52 = 0;
  int v17 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v52];
  id v48 = v52;
  if (v17)
  {
    id v18 = objc_alloc_init(MEMORY[0x263F58190]);
    __int16 v19 = (void *)MEMORY[0x263F581B8];
    id v20 = [(HMDPersonResidentSyncManager *)v12 workQueue];
    __int16 v21 = [v19 schedulerWithDispatchQueue:v20];
    v46 = [v18 reschedule:v21];

    id v22 = [v9 allObjects];
    uint64_t v23 = objc_msgSend(v22, "na_map:", &__block_literal_global_48);

    v53[0] = @"HMDPRSM.mk.personsToAddOrUpdate";
    v53[1] = @"HMDPRSM.mk.personUUIDsToRemove";
    v54[0] = v17;
    v54[1] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
    id v25 = objc_alloc(MEMORY[0x263F42570]);
    [(HMDPersonResidentSyncManager *)v12 UUID];
    id v26 = v8;
    v28 = id v27 = v10;
    v29 = (void *)[v25 initWithTarget:v28];

    __int16 v30 = [MEMORY[0x263F42590] messageWithName:@"HMDPRSM.m.modifyPersons" destination:v29 payload:v24];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __77__HMDPersonResidentSyncManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke_2;
    v49[3] = &unk_264A2AEE8;
    v49[4] = v12;
    v47 = v27;
    id v31 = v27;
    id v8 = v26;
    id v50 = v31;
    id v32 = v46;
    id v51 = v32;
    [v30 setResponseHandler:v49];
    v33 = [(HMDPersonResidentSyncManager *)v12 residentSyncManager];
    [v33 performResidentRequest:v30 options:0];

    if ([v8 count])
    {
      id v34 = [(HMDPersonResidentSyncManager *)v12 addOrUpdatePersons:v8];
    }
    else if ([v9 count])
    {
      id v43 = [(HMDPersonResidentSyncManager *)v12 removePersonsWithUUIDs:v9];
    }
    v44 = v51;
    id v42 = v32;

    id v10 = v47;
  }
  else
  {
    v35 = (void *)MEMORY[0x230FBD990]();
    __int16 v36 = v12;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = HMFGetLogIdentifier();
      v39 = [v10 identifier];
      v40 = [v39 shortDescription];
      *(_DWORD *)buf = 138543874;
      v56 = v38;
      __int16 v57 = 2114;
      v58 = v40;
      __int16 v59 = 2112;
      id v60 = v48;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to serialize persons: %@", buf, 0x20u);
    }
    v41 = (void *)MEMORY[0x263F58190];
    uint64_t v23 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    id v42 = [v41 futureWithError:v23];
  }

  return v42;
}

void __77__HMDPersonResidentSyncManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = a1[4];
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [a1[5] identifier];
      v13 = [v12 shortDescription];
      int v17 = 138543874;
      id v18 = v11;
      __int16 v19 = 2114;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to modify persons: %@", (uint8_t *)&v17, 0x20u);
    }
    [a1[6] finishWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      id v15 = [a1[5] identifier];
      v16 = [v15 shortDescription];
      int v17 = 138543618;
      id v18 = v14;
      __int16 v19 = 2114;
      id v20 = v16;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully modified persons", (uint8_t *)&v17, 0x16u);
    }
    [a1[6] finishWithNoResult];
  }
}

uint64_t __77__HMDPersonResidentSyncManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (id)removePersonsWithUUIDs:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Remove persons"];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543874;
    id v42 = v9;
    __int16 v43 = 2114;
    v44 = v11;
    __int16 v45 = 2112;
    id v46 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing persons with UUIDs from persons data set: %@", buf, 0x20u);
  }
  id v12 = objc_alloc_init(MEMORY[0x263F58190]);
  v13 = (void *)MEMORY[0x263F581B8];
  v14 = [(HMDPersonResidentSyncManager *)v7 workQueue];
  id v15 = [v13 schedulerWithDispatchQueue:v14];
  v16 = [v12 reschedule:v15];

  int v17 = [v4 allObjects];
  id v18 = objc_msgSend(v17, "na_map:", &__block_literal_global_100354);

  v39 = @"HMDPRSM.mk.personUUIDs";
  v40 = v18;
  __int16 v19 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  id v20 = objc_alloc(MEMORY[0x263F42570]);
  __int16 v21 = [(HMDPersonResidentSyncManager *)v7 UUID];
  id v22 = (void *)[v20 initWithTarget:v21];

  uint64_t v23 = [MEMORY[0x263F42590] messageWithName:@"HMDPRSM.m.removePersons" destination:v22 payload:v19];
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  v33 = __55__HMDPersonResidentSyncManager_removePersonsWithUUIDs___block_invoke_2;
  id v34 = &unk_264A245C8;
  v35 = v7;
  id v36 = v5;
  id v24 = v16;
  id v37 = v24;
  id v38 = v4;
  id v25 = v4;
  id v26 = v5;
  [v23 setResponseHandler:&v31];
  id v27 = [(HMDPersonResidentSyncManager *)v7 residentSyncManager];
  [v27 performResidentRequest:v23 options:0];

  v28 = v38;
  id v29 = v24;

  return v29;
}

void __55__HMDPersonResidentSyncManager_removePersonsWithUUIDs___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = a1[4];
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] identifier];
      v13 = [v12 shortDescription];
      int v18 = 138543874;
      __int16 v19 = v11;
      __int16 v20 = 2114;
      __int16 v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = (uint64_t)v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to remove persons: %@", (uint8_t *)&v18, 0x20u);
    }
    [a1[6] finishWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = HMFGetLogIdentifier();
      id v15 = [a1[5] identifier];
      v16 = [v15 shortDescription];
      uint64_t v17 = [a1[7] count];
      int v18 = 138543874;
      __int16 v19 = v14;
      __int16 v20 = 2114;
      __int16 v21 = v16;
      __int16 v22 = 2048;
      uint64_t v23 = v17;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully removed %lu persons", (uint8_t *)&v18, 0x20u);
    }
    [a1[6] finishWithNoResult];
  }
}

uint64_t __55__HMDPersonResidentSyncManager_removePersonsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (id)addOrUpdatePersons:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F424F0]) initWithName:@"Add persons"];
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [v5 identifier];
    v11 = [v10 shortDescription];
    *(_DWORD *)buf = 138543874;
    v44 = v9;
    __int16 v45 = 2114;
    id v46 = v11;
    __int16 v47 = 2112;
    id v48 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding/updating persons: %@", buf, 0x20u);
  }
  id v40 = 0;
  id v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v40];
  id v13 = v40;
  if (v12)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F58190]);
    id v15 = (void *)MEMORY[0x263F581B8];
    v16 = [(HMDPersonResidentSyncManager *)v7 workQueue];
    uint64_t v17 = [v15 schedulerWithDispatchQueue:v16];
    int v18 = [v14 reschedule:v17];

    v41 = @"HMDPRSM.mk.persons";
    id v42 = v12;
    __int16 v19 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v20 = objc_alloc(MEMORY[0x263F42570]);
    __int16 v21 = [(HMDPersonResidentSyncManager *)v7 UUID];
    __int16 v22 = (void *)[v20 initWithTarget:v21];

    uint64_t v23 = [MEMORY[0x263F42590] messageWithName:@"HMDPRSM.m.addOrUpdatePersons" destination:v22 payload:v19];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __51__HMDPersonResidentSyncManager_addOrUpdatePersons___block_invoke;
    v36[3] = &unk_264A245C8;
    v36[4] = v7;
    id v37 = v5;
    id v24 = v18;
    id v38 = v24;
    id v39 = v4;
    [v23 setResponseHandler:v36];
    id v25 = [(HMDPersonResidentSyncManager *)v7 residentSyncManager];
    [v25 performResidentRequest:v23 options:0];

    id v26 = v39;
    id v27 = v24;
  }
  else
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = v7;
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      uint64_t v32 = [v5 identifier];
      v33 = [v32 shortDescription];
      *(_DWORD *)buf = 138543874;
      v44 = v31;
      __int16 v45 = 2114;
      id v46 = v33;
      __int16 v47 = 2112;
      id v48 = v13;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to serialize persons: %@", buf, 0x20u);
    }
    id v34 = (void *)MEMORY[0x263F58190];
    __int16 v19 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    id v27 = [v34 futureWithError:v19];
  }

  return v27;
}

void __51__HMDPersonResidentSyncManager_addOrUpdatePersons___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = a1[4];
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      id v12 = [a1[5] identifier];
      id v13 = [v12 shortDescription];
      int v18 = 138543874;
      __int16 v19 = v11;
      __int16 v20 = 2114;
      __int16 v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = (uint64_t)v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add/update persons: %@", (uint8_t *)&v18, 0x20u);
    }
    [a1[6] finishWithError:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [a1[5] identifier];
      v16 = [v15 shortDescription];
      uint64_t v17 = [a1[7] count];
      int v18 = 138543874;
      __int16 v19 = v14;
      __int16 v20 = 2114;
      __int16 v21 = v16;
      __int16 v22 = 2048;
      uint64_t v23 = v17;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully added/updated %lu persons", (uint8_t *)&v18, 0x20u);
    }
    [a1[6] finishWithNoResult];
  }
}

- (void)configureWithHome:(id)a3 delegate:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(HMDPersonResidentSyncManager *)self setDelegate:a4];
  id v7 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:0 remoteAccessRequired:0];

  id v8 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v8, "setRoles:", objc_msgSend(v8, "roles") | 4);
  id v9 = [(HMDPersonResidentSyncManager *)self messageDispatcher];
  v14[0] = v7;
  v14[1] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  [v9 registerForMessage:@"HMDPRSM.m.modifyPersons" receiver:self policies:v10 selector:sel_handleModifyPersonsMessage_];

  v11 = [(HMDPersonResidentSyncManager *)self messageDispatcher];
  v13[0] = v7;
  v13[1] = v8;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  [v11 registerForMessage:@"HMDPRSM.m.removeAllAssociatedData" receiver:self policies:v12 selector:sel_handleRemoveAllAssociatedDataMessage_];
}

- (HMDPersonResidentSyncManager)initWithUUID:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5 residentSyncManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDPersonResidentSyncManager;
  id v14 = [(HMDPersonResidentSyncManager *)&v19 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_workQueue, a5);
    uint64_t v16 = [v10 copy];
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v16;

    objc_storeStrong((id *)&v15->_messageDispatcher, a4);
    objc_storeStrong((id *)&v15->_residentSyncManager, a6);
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_100377 != -1) {
    dispatch_once(&logCategory__hmf_once_t18_100377, &__block_literal_global_62_100378);
  }
  v2 = (void *)logCategory__hmf_once_v19_100379;
  return v2;
}

void __43__HMDPersonResidentSyncManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v19_100379;
  logCategory__hmf_once_v19_100379 = v0;
}

@end
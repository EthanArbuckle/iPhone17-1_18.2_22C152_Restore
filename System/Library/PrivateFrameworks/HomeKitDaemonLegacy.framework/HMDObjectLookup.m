@interface HMDObjectLookup
+ (id)logCategory;
- (HMDObjectLookup)initWithWorkQueue:(id)a3;
- (NSMapTable)uuidToObjectMapping;
- (OS_dispatch_queue)workQueue;
- (id)_lookUpObjectWithUUID:(id)a3 applyObjectChange:(id)a4 previous:(id)a5 result:(id)a6 completionHandler:(id)a7;
- (void)applyChange:(id)a3 previous:(id)a4 onObject:(id)a5 result:(id)a6 completionHandler:(id)a7;
- (void)lookUpAndApplyObjectChange:(id)a3 previous:(id)a4 result:(id)a5 completionHandler:(id)a6;
- (void)resetObjects;
@end

@implementation HMDObjectLookup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uuidToObjectMapping, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMapTable)uuidToObjectMapping
{
  return self->_uuidToObjectMapping;
}

- (void)applyChange:(id)a3 previous:(id)a4 onObject:(id)a5 result:(id)a6 completionHandler:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v41 = a4;
  id v13 = a5;
  id v42 = a6;
  id v14 = a7;
  id v15 = v13;
  if ([v15 conformsToProtocol:&unk_1F2DD2CF0]) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  v18 = (void *)MEMORY[0x1D9452090]();
  v19 = self;
  v20 = HMFGetOSLogHandle();
  v21 = v20;
  if (v17)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      v23 = [v12 change];
      v24 = [v23 uuid];
      *(_DWORD *)buf = 138543618;
      v50 = v22;
      __int16 v51 = 2112;
      v52 = v24;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Applying object change with UUID %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v19);
    v25 = [v12 message];
    v26 = v25;
    if (v25)
    {
      if (!v14)
      {
LABEL_20:
        v38 = objc_msgSend(v12, "change", v41);
        BOOL v39 = [v38 objectChangeType] == 3;

        v40 = [v12 change];
        if (v39) {
          [v17 transactionObjectRemoved:v40 message:v26];
        }
        else {
          [v17 transactionObjectUpdated:v41 newValues:v40 message:v26];
        }

        objc_destroyWeak((id *)buf);
        goto LABEL_24;
      }
      v27 = (void *)[v25 mutableCopy];
      v28 = [v26 responseHandler];
      [v27 setTransactionResult:v42];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke_2;
      v43[3] = &unk_1E6A0D1E0;
      id v29 = v28;
      id v44 = v29;
      id v45 = v14;
      [v27 setResponseHandler:v43];
      uint64_t v30 = [v27 copy];

      v26 = (void *)v30;
    }
    else
    {
      v36 = (void *)MEMORY[0x1E4F654B0];
      v37 = [MEMORY[0x1E4F65488] allMessageDestinations];
      v27 = [v36 messageWithName:@"kTransactionUpdate" destination:v37 payload:0];

      [v27 setTransactionResult:v42];
      [v27 setRemote:1];
      if (v14)
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke;
        v46[3] = &unk_1E6A193F8;
        objc_copyWeak(&v48, (id *)buf);
        id v47 = v14;
        [v27 setResponseHandler:v46];

        objc_destroyWeak(&v48);
      }
      else
      {
        [v27 setResponseHandler:&__block_literal_global_55];
      }
      v26 = objc_msgSend(v27, "copy", v41);
    }

    goto LABEL_20;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v31 = HMFGetLogIdentifier();
    v32 = [v12 change];
    v33 = [v32 uuid];
    *(_DWORD *)buf = 138543618;
    v50 = v31;
    __int16 v51 = 2112;
    v52 = v33;
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Object does not implement backing store protocol, cannot apply transaction for object-change: %@", buf, 0x16u);
  }
  v34 = (void (**)(void *, void *))_Block_copy(v14);
  if (v34)
  {
    v35 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v34[2](v34, v35);
  }
LABEL_24:
}

void __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Calling completion handler for transaction applied", (uint8_t *)&v12, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = v5;
  if (v6) {
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resetObjects
{
  id v2 = [(HMDObjectLookup *)self uuidToObjectMapping];
  [v2 removeAllObjects];
}

- (id)_lookUpObjectWithUUID:(id)a3 applyObjectChange:(id)a4 previous:(id)a5 result:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(HMDObjectLookup *)self uuidToObjectMapping];
  v18 = [v17 objectForKey:v12];

  if (v18)
  {
    [(HMDObjectLookup *)self applyChange:v13 previous:v14 onObject:v18 result:v15 completionHandler:v16];
    v19 = 0;
  }
  else
  {
    [(HMDObjectLookup *)self scanObjects];
    v20 = [(HMDObjectLookup *)self uuidToObjectMapping];
    v21 = [v20 objectForKey:v12];

    if (v21)
    {
      [(HMDObjectLookup *)self applyChange:v13 previous:v14 onObject:v21 result:v15 completionHandler:v16];
      v19 = 0;
    }
    else
    {
      v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    }
  }
  return v19;
}

- (void)lookUpAndApplyObjectChange:(id)a3 previous:(id)a4 result:(id)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 change];
  uint64_t v15 = [v14 objectChangeType];

  id v16 = [v10 change];
  id v17 = v16;
  if (v15 == 3)
  {
    v18 = [v16 parentUUID];
    v19 = [(HMDObjectLookup *)self _lookUpObjectWithUUID:v18 applyObjectChange:v10 previous:v11 result:v12 completionHandler:v13];

    v20 = [(HMDObjectLookup *)self uuidToObjectMapping];
    v21 = [v10 change];
    v22 = [v21 uuid];
    [v20 removeObjectForKey:v22];
  }
  else
  {
    v23 = [v16 uuid];
    v22 = [(HMDObjectLookup *)self _lookUpObjectWithUUID:v23 applyObjectChange:v10 previous:v11 result:v12 completionHandler:v13];

    if (!v22) {
      goto LABEL_11;
    }
    v20 = [v10 change];
    v21 = [v20 parentUUID];
    v19 = [(HMDObjectLookup *)self _lookUpObjectWithUUID:v21 applyObjectChange:v10 previous:v11 result:v12 completionHandler:v13];
  }

  if (v19)
  {
    v24 = (void *)MEMORY[0x1D9452090]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      v28 = [v10 change];
      [v28 uuid];
      id v29 = v32 = v24;
      *(_DWORD *)buf = 138543874;
      v34 = v27;
      __int16 v35 = 2112;
      v36 = v29;
      __int16 v37 = 2112;
      v38 = v19;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Could not look up and apply object change for %@: %@", buf, 0x20u);

      v24 = v32;
    }

    uint64_t v30 = _Block_copy(v13);
    v31 = v30;
    if (v30) {
      (*((void (**)(void *, void *))v30 + 2))(v30, v19);
    }
  }
LABEL_11:
}

- (HMDObjectLookup)initWithWorkQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDObjectLookup;
  uint64_t v6 = [(HMDObjectLookup *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uuidToObjectMapping = v6->_uuidToObjectMapping;
    v6->_uuidToObjectMapping = (NSMapTable *)v7;

    objc_storeStrong((id *)&v6->_workQueue, a3);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_78055 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_78055, &__block_literal_global_78056);
  }
  id v2 = (void *)logCategory__hmf_once_v1_78057;
  return v2;
}

uint64_t __30__HMDObjectLookup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_78057;
  logCategory__hmf_once_v1_78057 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end
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
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v45 = a4;
  id v13 = a5;
  id v14 = a6;
  id aBlock = a7;
  id v15 = v13;
  if ([v15 conformsToProtocol:&unk_26E481F80]) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  v46 = v14;
  if (v17)
  {
    v18 = [v14 label];
    char v19 = HMFEqualObjects();

    if ((v19 & 1) == 0)
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = HMFGetLogIdentifier();
        v24 = [v12 change];
        v25 = [v24 uuid];
        *(_DWORD *)buf = 138543618;
        v55 = v23;
        __int16 v56 = 2112;
        v57 = v25;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Applying object change with UUID %@", buf, 0x16u);
      }
    }
    objc_initWeak((id *)buf, self);
    v26 = [v12 message];
    v27 = v26;
    if (v26)
    {
      if (!aBlock)
      {
LABEL_22:
        v42 = [v12 change];
        BOOL v43 = [v42 objectChangeType] == 3;

        v44 = [v12 change];
        if (v43) {
          [v17 transactionObjectRemoved:v44 message:v27];
        }
        else {
          [v17 transactionObjectUpdated:v45 newValues:v44 message:v27];
        }

        objc_destroyWeak((id *)buf);
        goto LABEL_26;
      }
      v28 = (void *)[v26 mutableCopy];
      v29 = [v27 responseHandler];
      [v28 setTransactionResult:v46];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke_2;
      v48[3] = &unk_264A1F020;
      id v30 = v29;
      id v49 = v30;
      id v50 = aBlock;
      [v28 setResponseHandler:v48];
      uint64_t v31 = [v28 copy];

      v27 = (void *)v31;
    }
    else
    {
      v40 = (void *)MEMORY[0x263F42590];
      v41 = [MEMORY[0x263F42570] allMessageDestinations];
      v28 = [v40 messageWithName:@"kTransactionUpdate" destination:v41 payload:0];

      [v28 setTransactionResult:v46];
      [v28 setRemote:1];
      if (aBlock)
      {
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke;
        v51[3] = &unk_264A2EAE0;
        objc_copyWeak(&v53, (id *)buf);
        id v52 = aBlock;
        [v28 setResponseHandler:v51];

        objc_destroyWeak(&v53);
      }
      else
      {
        [v28 setResponseHandler:&__block_literal_global_55];
      }
      v27 = (void *)[v28 copy];
    }

    goto LABEL_22;
  }
  v32 = (void *)MEMORY[0x230FBD990]();
  v33 = self;
  v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v35 = HMFGetLogIdentifier();
    v36 = [v12 change];
    v37 = [v36 uuid];
    *(_DWORD *)buf = 138543618;
    v55 = v35;
    __int16 v56 = 2112;
    v57 = v37;
    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Object does not implement backing store protocol, cannot apply transaction for object-change: %@", buf, 0x16u);
  }
  v38 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v38)
  {
    v39 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    v38[2](v38, v39);
  }
LABEL_26:
}

void __74__HMDObjectLookup_applyChange_previous_onObject_result_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = WeakRetained;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    id v13 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Calling completion handler for transaction applied", (uint8_t *)&v12, 0xCu);
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
    char v19 = 0;
  }
  else
  {
    [(HMDObjectLookup *)self scanObjects];
    v20 = [(HMDObjectLookup *)self uuidToObjectMapping];
    v21 = [v20 objectForKey:v12];

    if (v21)
    {
      [(HMDObjectLookup *)self applyChange:v13 previous:v14 onObject:v21 result:v15 completionHandler:v16];
      char v19 = 0;
    }
    else
    {
      char v19 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    }
  }
  return v19;
}

- (void)lookUpAndApplyObjectChange:(id)a3 previous:(id)a4 result:(id)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
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
    char v19 = [(HMDObjectLookup *)self _lookUpObjectWithUUID:v18 applyObjectChange:v10 previous:v11 result:v12 completionHandler:v13];

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
    char v19 = [(HMDObjectLookup *)self _lookUpObjectWithUUID:v21 applyObjectChange:v10 previous:v11 result:v12 completionHandler:v13];
  }

  if (v19)
  {
    v24 = (void *)MEMORY[0x230FBD990]();
    v25 = self;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      v28 = [v10 change];
      [v28 uuid];
      v29 = v32 = v24;
      *(_DWORD *)buf = 138543874;
      v34 = v27;
      __int16 v35 = 2112;
      v36 = v29;
      __int16 v37 = 2112;
      v38 = v19;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Could not look up and apply object change for %@: %@", buf, 0x20u);

      v24 = v32;
    }

    id v30 = _Block_copy(v13);
    uint64_t v31 = v30;
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
    uint64_t v7 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    uuidToObjectMapping = v6->_uuidToObjectMapping;
    v6->_uuidToObjectMapping = (NSMapTable *)v7;

    objc_storeStrong((id *)&v6->_workQueue, a3);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_114662 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_114662, &__block_literal_global_114663);
  }
  id v2 = (void *)logCategory__hmf_once_v1_114664;
  return v2;
}

void __30__HMDObjectLookup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_114664;
  logCategory__hmf_once_v1_114664 = v0;
}

@end